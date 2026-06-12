#!/usr/bin/env bash
#
# Regenerate per-unit requirements files from pyproject.toml.
#
# Two responsibilities:
#   1. RESOLVE GATE — dry-run-resolve each non-empty unit extra with `uv export`.
#      If an extra has no consistent solution (e.g. a floor conflict), exit
#      non-zero so a broken set is never published.
#   2. SLIM WRITE — emit ONLY each unit's direct optional-dependency lines from
#      pyproject.toml (floors as written). NOT `uv export`'s full pinned tree:
#      that would pin numpy/pandas/scipy/jupyter and force-reinstall Colab's core
#      scientific stack, leaving a half-loaded, ABI-inconsistent numpy
#      (`cannot import name '_center' from 'numpy._core.umath'`).
#
# The resulting `requirements/unit-N.txt` files are what `setup_colab.py`
# fetches at notebook runtime on Colab. They are committed to the repo.
#
# Local reproducibility is unaffected: `uv sync --extra <unit>` + `uv.lock`
# still give exact pins on laptops. The slim file is the Colab install list only.
#
# Usage:
#     bash scripts/export-requirements.sh
#
set -euo pipefail

cd "$(dirname "$0")/.."

mkdir -p requirements
PYVER="3.12"   # match Colab's interpreter for the resolve check

# tomllib (used to read pyproject.toml below) needs Python 3.11+. Use the system
# python3 if it has it; otherwise fall back to uv's managed interpreter — uv is
# already a hard requirement of the resolve gate, so this adds no new dependency.
if python3 -c 'import tomllib' 2>/dev/null; then
    PYBIN=(python3)
else
    PYBIN=(uv run --no-project --python "${PYVER}" python3)
fi

# Scratch file for the resolve gate. `uv export` writes atomically via a temp
# file in the OUTPUT's directory, so `-o /dev/null` fails (`/dev` isn't writable);
# point it at a real temp path and discard.
RESOLVE_TMP="$(mktemp)"
trap 'rm -f "$RESOLVE_TMP"' EXIT

for UNIT in unit-1 unit-2 unit-3 unit-4 unit-5; do
    OUT="requirements/${UNIT}.txt"

    NDEPS=$("${PYBIN[@]}" - "$UNIT" <<'PY'
import sys, tomllib
u = sys.argv[1]
d = tomllib.load(open("pyproject.toml", "rb"))
print(len(d["project"].get("optional-dependencies", {}).get(u, [])))
PY
)

    # 1) RESOLVE GATE — fail fast on an unsolvable / conflicting extra.
    if [ "$NDEPS" -gt 0 ]; then
        echo "=> resolving ${UNIT} (dry run, py${PYVER})…"
        if ! uv export --extra "${UNIT}" --no-emit-project --no-hashes \
                 --python "${PYVER}" -q -o "$RESOLVE_TMP"; then
            echo "ERROR: '${UNIT}' did not resolve — fix pyproject.toml before publishing." >&2
            exit 1
        fi
    fi

    # 2) SLIM WRITE — only this unit's direct deps (floors), no full tree.
    "${PYBIN[@]}" - "$UNIT" "$OUT" <<'PY'
import sys, tomllib
unit, out = sys.argv[1], sys.argv[2]
deps = tomllib.load(open("pyproject.toml", "rb"))["project"].get("optional-dependencies", {}).get(unit, [])
hdr = [
    f"# AUTO-GENERATED direct deps for {unit} — do NOT hand-edit.",
    "# Regenerate: bash scripts/export-requirements.sh",
    "# Colab-slim: ONLY this unit's direct libraries (floors). Colab keeps its",
    "# own numpy/pandas/scipy — we never repin the core stack (avoids ABI breaks).",
]
open(out, "w").write("\n".join(hdr + (deps or [f"# {unit} has no dependencies yet."])) + "\n")
print(f"   wrote {out} ({len(deps)} direct deps)")
PY
done

echo
echo "done. review + commit requirements/."
