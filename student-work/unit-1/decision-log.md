# Decision Log — Michael Applbaum, Unit 1

---

## Cycle 1

- **What I asked** (in my own words): I asked the agent to focus on two metrics - metre weighted-betweenness for edges and hop-closeness for nodes. the idea is that the combination of a meter weighted metric of edges and a node metric will find the truely most significant segments. i was wondering if the design of Jerusalem creates those kinds of routes. funneling traffic to specific segments
- **What the agent did**:after warning me about the choice he compared between the class hop-metric top-10 risers and the metre-weighted top-10 and found that only 1/10 segments shared, only Herzog among named streets; Spearman ρ = 0.27 across all 11,599 segments
- **What I understood from the result**: i really need to coose wisely the metrics i use, and think throughly where each one will shine in the topological setting. a geographic weight might give more attention to long highway segments like Begin st.
- **My next question / follow-up**: understaning my mistake i moved to analyze the Begin st story. i thought that the green line is blocking access to begin so i asked the agent to check that

## Cycle 2

- **What I asked**: i asked to diagnose the metrics on Begin st - strong and weak assumptions - a total blocking or a weak that allows crossing
- **What the agent did**: Silverstein Tunnel became the #1 riser city-wide (+0.125) while hop-counting had demoted Begin - Begin falls −20% either way, meaning the blocking hypothesis was wrong
- **What I understood from the result**:in hindsight I thought that maybe from a pure topological stance highways are design to have high betweeness and closeness.
- **My next question / follow-up**: a complementary analysis is to understand the connection between city center to the outskirts, this rose when i under stood that Begin is by design compensating on something the city propably lacked and that is the routes that are short and not through city center - so i needed to check that idea

## Cycle 3

- **What I asked**: I assumed that the structure of the network is due to historical and geographic aspects. with the modern city starting from jaffa street outwards but keeping its siginficance, so that was what i wanted to check
- **What the agent did**: He tested my hyposthesis about city center being close in the topologically meter weighted sense - metre-weighted closeness core = 5 km² hull centred on Agron/King David/King George (downtown), vs. the 37 km² hop-core artifact on Begin
- **What I understood from the result**: that my idea was confirmed but i couldnt test it in the sense i wanted - because Gilo and Pisgat zeev are off bound.
- **My next question / follow-up**:still need to check why jaffa street doesnt dominate the core nodes. in the agents words:"would this model, run on the pre-2011 network, have predicted HaNevi'im and Agrippas?" i believe he is eluding to the fact that the area is for pedestrians since the red line rail was finally operational - Red Line 2011 pedestrianization

## Cycle 4

- **What I asked**: i asked the agent to check the information effect also on Tchernichovsky street under the impression we would see the effect also there but it was minor
- **What the agent did**: he found that the segments all rose (14 total) but with tiny magnitude (rank 136/1353) he pointed out that topology alone cant uncover the real effect
- **What I understood from the result**: i understood that i will need to also combine real traffic measures to see how the spillover happens
- **My next question / follow-up**: in next units will need to check this also -measured traffic counts / congestion-aware flow assignment to capture spillover onto parallel routes when the primary saturates — arriving in Unit 3 (statistical baselines on measured flow) and Unit 4 (time-varying edge weights).

---

## End-of-session rubric check

- [√] DIRECT — phrased requests using unit vocabulary, specified inputs precisely
- [√] INTERPRET — explained results in own words, noticed surprises
- [√] EXTEND — at least one follow-up grounded in a result

## One thing that surprised me today

The thing that surprised me was that my intuition about jaffa street was in the right direction, feels like i'm getting some understanding about network theory.
