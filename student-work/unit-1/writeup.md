# Unit 1 Homework — Track 2: Stress-Testing the Green Line Baseline

Michael Applbaum · Jerusalem · (drafted with my course agent from my decision-log entries; the arguments are mine)

**What I chose and why.** In class I modeled the Jerusalem Green Line (under
construction) as a strong barrier removal on the ITM-projected (EPSG:2039),
LCC primal graph of Jerusalem, ranking street segments by unweighted (hop)
edge betweenness. For homework I pressure-tested that conclusion with two
metrics I had not used: metre-weighted edge betweenness and closeness (hop
and metre variants). I also tried a composite of my own — metre-weighted
betweenness rise × endpoint closeness — looking for segments that both carry
rerouted paths and sit near everything.

**What happened.** The "streets to worry about" were not stable across
metrics: the top-10 riser lists shared only 1 of 10 segments (only Herzog by
name; Spearman ρ = 0.27 across all 11,599 common segments). The sharpest case
is Begin highway. In class, hop-counting demoted it after the removal (−20%
under both weak and strong removal); under metre-weighting its Silverstein
Tunnel became the #1 riser city-wide (+0.125). My reading in planning terms:
Begin was built to compensate for something the city lacked — short routes
that avoid the center — so when the Green Line corridor is taken from cars,
the metre-metric shows the designed bypass activating. Hop-closeness also
placed Jerusalem's "center" on Begin, but that is a metric artifact
(expressways have few, long segments, so they are hop-cheap). Metre-weighted
closeness puts the accessibility core where history put it: a tight ~5 km²
around King George / King David / Agron — consistent with my hypothesis that
the modern city grew outward from Jaffa St while the center kept its
importance. My related claim about near-isolated neighborhoods (Gilo, Pisgat
Ze'ev) turned out to be untestable here: both sit outside the bounding box,
and box-clipping fakes isolation, so I state it as an assumption, not a finding.

**What surprised me.** Jaffa Street itself barely appears in the drivable
core — its parallel streets HaNevi'im and Agrippas dominate it. My
explanation: the Red Line's 2011 pedestrianization already removed Jaffa from
the car network — the very intervention I have been simulating for the Green
Line.

**The honest limit.** Every betweenness number here is a structural
prediction, not measured flow. Tchernichovsky St makes this concrete: all 14
of its segments rose, but with tiny magnitude (street rank 136/1353), while
in reality it is visibly loaded since construction began. Shortest-path
betweenness assigns all flow to the single best route and cannot see
congestion spillover onto parallels. To confirm the real effect I would need
measured traffic counts and congestion-aware flow assignment — arriving in
Unit 3 (measured flow) and Unit 4 (time-varying weights).

**Open question I did not have time to answer.** Would this model, run on the
pre-2011 network, have predicted HaNevi'im and Agrippas as the absorbers of
Jaffa's closure? The same before/after methodology, run against fifteen years
of lived outcome — a natural experiment on the method itself.

Maps: `metric_sensitivity_map.html`, `closeness_cores_map.html`,
`green_line_stress_test_map.html`. Data © OpenStreetMap contributors (ODbL).
Reference: Crucitti, Latora & Porta 2006, https://arxiv.org/abs/physics/0504163.
