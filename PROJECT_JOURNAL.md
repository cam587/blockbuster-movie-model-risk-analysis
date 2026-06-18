# Blockbuster Risk Analysis — Project Journal

This journal documents my decisions, questions, challenges, and progress while building the Blockbuster Risk Analysis project that will analyze the financial reliability of modern blockbusters.

---

## Project Goal

Analyze whether the modern blockbuster movie model is becoming financially riskier,  and identify film characteristics that could help premium-format exhibitors such as IMAX evaluate content risk, prioritize screen allocation, and understand which genres, franchises, studios, and release periods offer the strongest potential.

IMAX earns meaningful revenue from:
- **Box-office-related revenue -- ticket-related arrangements**: IMAX works with studios to convert or optimize movies for the IMAX format and distribute those movies across its theater network. Depending on the arrangement, IMAX earns fees or a share connected to IMAX's box-office performance.
- **Content Solutions -- Digital Media Remastering**: IMAX uses its patented DMR (Digital Media Remastering) process to enhance the picture and sound quality of Hollywood blockbusters, local-language films, and live events (like concerts) specifically for its large screens. For this service, IMAX earns a percentage of the box-office gross from every ticket sold globally for that engagement.
- **Theatre technology -- joint revenue-sharing arrangements**: IMAX’s margins are more than double those of cinema chains such as AMC and Regal, because it does not bear the costs of owning theatres or employing ushers. It makes its money by selling or licensing its screens and other technology to cinema operators, and by taking a cut of their box-office receipts. When a film bombs, IMAX simply misses out on a percentage of ticket sales without absorbing the empty seats or the venue's maintenance costs, unlike AMC or Regal.

Those revenues depend partly on having films that audiences are willing to experience at a premium price. My project evaluates which types of blockbusters are financially reliable and best suited to premium theatrical exhibition. The analysis could help inform film prioritization, release scheduling, studio partnerships, international strategy, and screen investment.

The project will use Python, Microsoft SQL Server, and dashboarding tools to explore which factors are associated with blockbuster success or failure.

---
This helps determine whether spending more money actually reduces risk or creates larger financial exposure.
## Research Questions

**Financial Risk**
1. **Are blockbuster production budgets increasing faster than worldwide grosses over time?**
   - **Why is this important to IMAX?** While this may prove that the blockbuster model may be becoming less sustainable, as           studios invest more to create massive, unmissable spectacles, they increasingly rely on IMAX’s immersive premium              experience to drive up per-screen averages and justify higher ticket prices. This benefits IMAX by keeping their              premium screens in high demand, but also places immense pressure on the company to secure enough marquee                      blockbuster releases to fill their schedule.

2. **Are mega-budget movies more likely to be hits, borderline results, or misses?**
   - **Why is this important to IMAX?** Traditional studios are crippled by a movie that grosses $400 million on a $200                 million budget. IMAX Corporation is not. IMAX generates its revenue by taking a percentage of the gross box office            receipts from its screens, alongside digital remastering fees (DMR). If a mega-budget film misses its studio profit           targets but still drives hundreds of millions of dollars in ticket sales worldwide, IMAX wins financially                     regardless of the studio's net loss. As studios realize that mega-budget films are risky gambles, they lean on the            premium branding of IMAX to "eventize" their releases. IMAX's premium large format screens pull in a                          disproportionately large percentage of box office receipts (often hitting 10% to 20% of opening weekends for major            releases while only occupying 1% of total theaters across the country).
3. **Has the average profitability ratio changed over time?**
   - **Why is this important to IMAX?** This helps determine whether modern blockbusters are becoming more or less efficient            financially. A declining ratio could signal that studios are spending more without receiving proportional returns.

1. Are blockbuster production budgets increasing over time?
2. Are worldwide grosses keeping pace with rising budgets?
3. Are sequels and established franchises safer than original films?
4. Which franchises, genres, and IP types have the highest hit rates?
5. Are modern blockbusters becoming more dependent on international audiences?
6. Can a model predict whether a blockbuster will be a major hit, hit, break even, or miss?
7. How have worldwide grosses changed from pre-COVID to post-COVID?
8. What year was the best for blockbusters? The worst?
9. Which Studios have the highest rate?
10. Which budget category has the highest hit rates? The lowest?
11. How does popularity, audience core, or runtime correlate to hit status?

---

# Working Criteria and Key Learnings
- I defined a blockbuster as a movie with a production budget of at least $100 million.
- To estimate profitability, I used:
  ```python
  profitability_ratio = worldwide_gross / (production_budget × 2.5)
  ```
  The 2.5 multiplier is being used as an estimated break-even threshold because the production budget does not include all      marketing and distribution costs, and studios do not receive the full box-office gross.
- Movies are classified as:
  - Hit: 1.20 or higher
  - Borderline: 0.90–1.19
  - Miss: Below 0.90

- For IP analysis, each movie receives one primary category:
  - Original, Sequel, Prequel, Remake, Reboot, Adaptation, or Spin-off.

- Movies outside a franchise use None in the franchise column. These consistent categories will make SQL grouping and           dashboard analysis easier.
- I also learned how to use the TMDB API, work with JSON data, and protect private API credentials using a .env file and        .gitignore.


# Questions and Assumptions to Revisit

* Is $100 million the best blockbuster threshold?
* Is the 2.5× budget break-even assumption appropriate for every film?
* How should streaming releases and pandemic-era films be treated?
* Should inflation-adjusted budgets and grosses be added?
* Can reliable marketing-budget estimates be collected?
* Can domestic and international gross data be added consistently?
* Should audience scores be used to explain performance or predict it?
* Would opening-weekend data create information leakage in a prediction model?

---

# Current Project Status

* [x] Created project idea
* [x] Created TMDB account and API token
* [x] Connected Jupyter Notebook to TMDB
* [x] Tested first API request
* [x] Created initial movie dataset
* [x] Classified IP types and franchises
* [ ] Validate and clean movie data
* [ ] Import data into PostgreSQL
* [ ] Write SQL analysis queries
* [ ] Create SQL dashboard views
* [ ] Build dashboard
* [ ] Document findings and recommendations
* [ ] Build optional prediction model

