# Decision Log — Michael Applbaum, Unit N

Copy this template into your unit's `student-work/decision-log.md`. Add one
entry per direct → interpret → extend cycle during the supervised-practice
hour. Push to your fork before asking for async help — your reasoning matters
as much as your code.

---

## Cycle 1

- **What I asked** (in my own words):אני ביקשתי מהסוכן שיבצע את המשימה כשהוא מתמקד במשולב בשתי מטריקות : האחד betweeness ממושקל לאורך במטרים כלומר מה הדרך שדרכה עוברות הכי הרבה דרכים קצרות טופולוגית אבל עם משקול לא טופולוגי אלא מרחק גאוגרפי במטרים
  המדד השני הוא קרבה ברמת הnode
  כאשר ההשוואה היא ברמת הסגנמטים הכי קצרים, ציפיתי שמקטעים יהיו חשובים לטופולוגיה רק כאשר הם מחוברים לקצוות המהוות נקודות קרובות כך שהחיבור ביניהם מצביע על הנקודה כנקודה מרכזית
  השאלה המנחה שלי היתה האם ירושלים תוכננה טיפולוגית בצורה כזו מתעלת את התנועה לנקודות הללו
- **What the agent did**:
  הוא עשה את מה שביקשתי אבל הוא הזהיר שהשילוב בין המטריקות הללו לא היה בהכרח רעיון טוב. הוא חישב את המטריקות בנפרד ואז הצליב ביניהם ומצא שרק המקטע של רחוב הרצוג מופיע ב10 המקטעים החשובים בשני המטריקות ושדווקא מקומות מסוימים שלא תאמו לכיוון הכללי בלטו
- **What I understood from the result**: אני הבנתי שאני צריך להיות הרבה יותר מדויק בבחירת המטריקות, להתאים למשל את המשקול , משקל מבוסס מרחק גאוגרפי נתן השפעה גדולה לבגין למשל כאשר במקרה של בחירה טיפולוגית טהורה יכול להיות שזה היה שונה
- **My next question / follow-up**: אני הבנתי את השגיאה לגבי המשקול ואני עברתי באמת לבחון את הנושא של בגין, להבנתי אפילו ברמה הטיפולוגית הטהורה בגין כמו כביש מהיר מעוצב כדי להיות ציר שנותן ערך גבוה עבור מטריקות של קירבה וbetweeness

## Cycle 2

- **What I asked**:למעשה כתבתי את זה לעיל אז אני לא אחזור על זה שוב בהרחבה, בקצרה - ערבוב לא מדויק מדגיש צדדים שונים בטיפולוגיה ולכן יכול להשפיע בעצם על התמונה שמבקשים להוציא מהניתוח
- **What the agent did**: הסוכן הסביר את זה, והדגיש שוב את העניין של כביש מהיר
- **What I understood from the result**:אני גם הבנתי שאם יש לי טענה לגבי הדאטה אני צריך לבדוק שהטענה רלוונטית לדאטה הזה, אפרט בשלב 3
- **My next question / follow-up**:

## Cycle 3

- **What I asked**: I assumed that the structure of the network is due to historical and geographic aspects. with the modern city starting from jaffa street outwards but keeping its siginficance, so that was what i wanted to check
- **What the agent did**: he tested my hyposthesis about city center being close in the topologically meter weighted sense
- **What I understood from the result**: that my idea wasnt rejected
- **My next question / follow-up**: closing questions: still need to check why jaffa street doesnt dominate the core nodes. in the agents words:"would this model, run on the pre-2011 network, have predicted HaNevi'im and Agrippas?" eluding to the fact that the area is for pedestrians since the red line rail was finally operational

---

## End-of-session rubric check

- [ ] DIRECT — phrased requests using unit vocabulary, specified inputs precisely
- [ ] INTERPRET — explained results in own words, noticed surprises
- [ ] EXTEND — at least one follow-up grounded in a result

## One thing that surprised me today

Was insightful, learned that choosing the right metric is crucial, learned that an agent can help think about second order insights, without it i wouldve probably waste most of the time on the first cycle
