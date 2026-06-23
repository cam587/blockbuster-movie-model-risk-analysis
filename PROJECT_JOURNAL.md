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

## Research Questions

The analysis is organized into four business categories: financial risk, content and IP strategy, genre and audience preferences, and release timing. These questions are designed to evaluate the financial reliability of modern blockbusters and identify patterns that may help premium-format exhibitors such as IMAX assess the strength of the theatrical content pipeline.

---

### Financial Risk

#### 1. Are blockbuster production budgets increasing faster than worldwide grosses over time?

* **Why is this important to IMAX?**
  This question tests whether the blockbuster model is becoming less financially sustainable. IMAX depends on studios continuing to produce large-scale theatrical releases that audiences are willing to experience in premium formats. If production costs rise faster than worldwide box-office revenue, studios may reduce the number of expensive theatrical releases, shorten theatrical windows, or become more selective about blockbuster investment. That could weaken the future supply of films available for IMAX screens.

* **Data used:**
  `release_year`, `production_budget`, and `worldwide_gross`

* **SQL approach:**
  Calculate average production budget and average worldwide gross by release year, then compare their year-over-year percentage changes.

---

#### 2. Are mega-budget movies more likely to be major hits, hits, break-even results, or misses?

* **Why is this important to IMAX?**
  Mega-budget movies are often designed as global theatrical events and are therefore especially important to premium exhibitors. Even when a movie does not meet a studio's estimated profitability target, it may still generate substantial worldwide ticket sales from which IMAX can earn revenue. However, if mega-budget films increasingly fail to attract large audiences, IMAX may face weaker box-office participation and more difficulty filling premium screens with high-demand content.

* **Data used:**
  `budget_tier` and `hit_status`

* **SQL approach:**
  Filter for the mega-budget tier and count the number of movies within each performance classification.

---

#### 3. Has the average profitability ratio changed over time?

* **Why is this important to IMAX?**
  This question measures whether blockbusters are becoming more or less financially efficient. A declining profitability ratio may indicate that studios are spending more without receiving proportional box-office returns. Although IMAX does not directly absorb a movie's full production loss, continued studio underperformance could reduce future investment in large theatrical releases and weaken IMAX's long-term content pipeline.

* **Data used:**
  `release_year` and `profitability_ratio`

* **SQL approach:**
  Calculate the average profitability ratio for each release year from 2015 through 2025.

---

### Content and IP Strategy

#### 1. Which IP types have the highest average profitability ratios?

* **Why is this important to IMAX?**
  This question compares the financial efficiency of originals, sequels, prequels, remakes, reboots, adaptations, and spin-offs. It helps determine whether established intellectual property actually produces stronger returns relative to production cost. IMAX can use this as one signal when evaluating which types of releases are most likely to support premium screen demand.

* **Data used:**
  `ip_type` and `profitability_ratio`

* **SQL approach:**
  Group movies by IP type and calculate the average profitability ratio for each category.

---

#### 2. Which IP types have the highest hit rates and lowest miss rates?

* **Why is this important to IMAX?**
  Average profitability may be influenced by a small number of unusually successful movies. Hit and miss rates provide a better measure of consistency. IP categories that repeatedly produce successful theatrical releases may offer IMAX a more dependable content pipeline than categories with occasional large successes but frequent failures.

* **Data used:**
  `ip_type` and `hit_status`

* **SQL approach:**
  Count major hits, hits, and misses within each IP category, then divide those counts by the total number of movies in that category.

---

#### 3. Are established forms of intellectual property more reliable than original films?

* **Why is this important to IMAX?**
  Sequels, adaptations, reboots, and other established properties enter the market with existing audience awareness. This may reduce marketing risk and increase opening-weekend demand, both of which are valuable for IMAX because premium screens often earn a large portion of their revenue early in a film's theatrical run. Comparing these categories with original films helps test whether brand recognition creates more dependable theatrical performance.

* **Data used:**
  `ip_type`, `profitability_ratio`, and `hit_status`

* **SQL approach:**
  Compare the average profitability ratio and performance distribution of original movies with the combined results of established-IP categories.

---

### Genre and Audience Preferences

#### 1. Which genres have the highest average profitability ratios?

* **Why is this important to IMAX?**
  Certain genres may provide stronger financial returns relative to their budgets. Action, science fiction, fantasy, and adventure films may also be particularly suited to premium screens because of their visual scale and sound design. Identifying the most financially efficient genres can help evaluate which types of films offer the strongest combination of box-office reliability and IMAX suitability.

* **Data used:**
  `genre` and `profitability_ratio`

* **SQL approach:**
  Group films by genre and calculate the average profitability ratio for each genre.

---

#### 2. Which genres perform best at different production-budget levels?

* **Why is this important to IMAX?**
  A genre may perform efficiently at one budget level but become riskier when production spending increases. This question helps identify whether certain genres can support mega-budget investment or whether they perform better as lower-cost blockbusters. For IMAX, this can help distinguish genres with genuine event-film potential from genres that may be receiving budgets too large for their likely audience demand.

* **Data used:**
  `genre`, `budget_tier`, and `profitability_ratio`

* **SQL approach:**
  Calculate the average profitability ratio for each genre and budget-tier combination.

---

#### 3. How are audience score, popularity, and runtime related to blockbuster performance?

* **Why is this important to IMAX?**
  Audience score and popularity may indicate audience awareness, satisfaction, and word-of-mouth strength. These factors can influence whether a movie maintains demand after opening weekend and remains on premium screens for a longer period. Runtime may also affect the number of daily screenings a theater can schedule. Understanding these relationships can help determine which audience and movie characteristics are associated with stronger financial results.

* **Data used:**
  `audience_score`, `popularity`, `runtime`, `profitability_ratio`, and `hit_status`

* **SQL approach:**
  Compare average audience score, popularity, and runtime across performance categories and evaluate their relationships with profitability.

---

### Release Timing and Seasonality

#### 1. Do movies released in certain months have higher profitability ratios?

* **Why is this important to IMAX?**
  IMAX has limited premium-screen capacity, so the timing of major releases matters. Identifying months associated with stronger financial performance can help explain when audience demand is highest and when IMAX screens may generate the most box-office-related revenue.

* **Data used:**
  `release_date` and `profitability_ratio`

* **SQL approach:**
  Extract the release month from each movie's release date and calculate the average profitability ratio by month.

---

#### 2. Which release seasons produce the strongest average profitability?

* **Why is this important to IMAX?**
  Studios traditionally concentrate blockbusters in summer and holiday periods, but those windows also contain more competition. Comparing winter, spring, summer, and fall can determine whether traditional blockbuster seasons still offer the strongest performance or whether less crowded periods create better financial opportunities.

* **Data used:**
  `release_date`, calculated `release_season`, and `profitability_ratio`

* **SQL approach:**
  Assign each release month to a season and calculate the average profitability ratio for each season.

---

#### 3. Do particular genres perform better during specific release seasons?

* **Why is this important to IMAX?**
  The most effective release window may differ by genre. For example, a science-fiction film may perform differently in summer than during the holiday season. Understanding the interaction between genre and timing may help premium exhibitors anticipate which releases deserve greater screen priority during different parts of the year.

* **Data used:**
  `genre`, `release_date`, `release_season`, and `profitability_ratio`

* **SQL approach:**
  Group movies by genre and release season, then compare average profitability ratios and movie counts.

---

# Working Criteria and Key Learnings

## Blockbuster Definition

For this project, a blockbuster is defined as a movie with a production budget of at least **$100 million**.

The dataset includes movies released from **2015 through 2025**.

---

## Budget Tiers

Movies are grouped into three budget categories:

* **Standard Blockbuster:** $100 million to $149 million
* **High Budget:** $150 million to $249 million
* **Mega Budget:** $250 million or more

These categories make it possible to compare whether larger production budgets are associated with stronger financial performance or greater financial risk.

---

## Estimated Break-Even Point

Because reported production budgets do not include all marketing and distribution expenses, and studios do not keep the full worldwide box-office gross, I estimated each movie’s break-even point using:

```python
estimated_break_even = production_budget * 2.5
```

The 2.5 multiplier is an industry-style estimate rather than an exact measure of studio profit. It provides a consistent benchmark for comparing movies across the dataset.

---

## Profitability Ratio

The profitability ratio compares a movie’s worldwide gross with its estimated break-even point:

```python
profitability_ratio = worldwide_gross / estimated_break_even
```

This can also be written as:

```python
profitability_ratio = worldwide_gross / (production_budget * 2.5)
```

A ratio of `1.00` means the movie earned worldwide box-office revenue equal to its estimated break-even point.

Examples:

* `0.80` means the movie earned approximately 80% of its estimated break-even requirement.
* `1.00` means the movie approximately reached estimated break-even.
* `1.50` means the movie earned approximately 1.5 times its estimated break-even requirement.
* `2.00` means the movie earned approximately twice its estimated break-even requirement.

---

## Hit Status

Movies with complete budget and revenue information are classified into four performance categories:

* **Major Hit:** Profitability ratio of `1.60` or higher
* **Hit:** Profitability ratio from `1.20` to below `1.60`
* **Break Even:** Profitability ratio from `1.00` to below `1.20`
* **Miss:** Profitability ratio below `1.00`

Movies without usable production-budget or worldwide-gross information are classified as:

* **Unknown:** Financial performance could not be calculated because required data was missing.

These categories allow the project to compare both financial efficiency and the consistency of success across budget tiers, studios, genres, release periods, and IP types.

---

## Financial Data Availability

The `has_financial_data` field identifies whether a movie has the information required to calculate estimated break-even, profitability ratio, and hit status.

* `True`: Both production budget and worldwide gross are available and usable.
* `False`: One or both financial fields are missing or unusable.

Movies marked `False` are assigned an `Unknown` hit status and should be excluded from profitability-based calculations unless missing data is later added.

---

## Release Eras

Movies are grouped into three release periods:

* **Pre-COVID:** 2015–2019
* **COVID Era:** 2020–2021
* **Post-COVID:** 2022–2025

This classification makes it possible to compare blockbuster performance before, during, and after the major theatrical disruption caused by the COVID-19 pandemic.

---

## IP Type Classification

Each movie receives one primary intellectual-property category:

* Original
* Sequel
* Prequel
* Remake
* Reboot
* Adaptation
* Spin-off

Only one primary category is assigned to each movie, even when multiple classifications could reasonably apply. This creates consistent groups for SQL analysis and dashboard comparisons.

---

## Franchise Classification

Movies that belong to an established franchise are assigned the franchise’s name.

Examples:

* `Avengers: Endgame` → Marvel Cinematic Universe
* `Top Gun: Maverick` → Top Gun
* `Barbie` → Barbie

Movies that are not part of a continuing franchise use:

```text
None
```

This allows the analysis to compare franchise and non-franchise films without leaving blank values.

---

## Genre Handling

Some movies contain multiple genres in the same field. Genre analysis therefore requires careful interpretation because a movie may appear under a combined label such as:

```text
Action, Adventure, Science Fiction
```

For the initial SQL analysis, genres can be filtered using `LIKE` statements. A future version of the project may separate genres into a bridge table so each movie can be analyzed across multiple individual genres.

---

## Key Technical Learnings

During this project, I learned how to:

* Connect to the TMDB API using an API access token
* Send API requests with Python’s `requests` library
* Work with JSON responses
* Convert API data into pandas DataFrames
* Export cleaned data into CSV files
* Protect API credentials using a `.env` file
* Prevent private files from being uploaded using `.gitignore`
* Import cleaned movie data into Microsoft SQL Server
* Use SQL aggregations, CTEs, `CASE` statements, window functions, and `LAG`
* Calculate year-over-year changes
* Create reusable financial classifications
* Build SQL outputs for dashboard analysis



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
* [x] Classified IP types and franchises in Excel
* [x] Validate and clean movie data
* [x] Import data into PostgreSQL
* [x] Write SQL analysis queries
* [x] Create SQL dashboard views
* [x] Build dashboard
* [ ] Document findings and recommendations
* [ ] Build optional prediction model

