# Blockbuster Risk Analysis — Project Journal

This journal documents my decisions, questions, challenges, and progress while building the Blockbuster Risk Analysis project.

---

## Project Goal

Analyze whether the modern blockbuster movie model is becoming financially riskier.

The blockbuster model includes:

* Large production budgets
* Major marketing campaigns
* Established intellectual property
* Franchise films, sequels, remakes, and adaptations
* Global theatrical releases
* Reliance on international and secondary markets

The project will use Python, Microsoft SQL Server, and dashboarding tools to explore which factors are associated with blockbuster success or failure.

---

## Research Questions

1. Are blockbuster production budgets increasing over time?
2. Are worldwide grosses keeping pace with rising budgets?
3. Are sequels and established franchises safer than original films?
4. Which studios, genres, and IP types have the highest hit rates?
5. Are modern blockbusters becoming more dependent on international audiences?
6. Can a model predict whether a blockbuster will be a hit, borderline result, or miss?

---

## Data Definitions

### Blockbuster

For the first version of the project, a blockbuster is defined as a movie with a production budget of at least $100 million.

### Profitability Ratio

```text
profitability_ratio = worldwide_gross / (production_budget × 2.5)
```

The 2.5 multiplier is being used as an estimated break-even threshold because the production budget does not include all marketing and distribution costs, and studios do not receive the full box-office gross.

### Hit Status

Initial classification:

* Hit: profitability ratio of at least 1.20
* Borderline: profitability ratio from 0.90 to 1.19
* Miss: profitability ratio below 0.90

These thresholds may be revised after exploring the data and researching industry assumptions.

---

# Journal Entries

## Entry 1 — Project Setup

**Date:** [Enter date]

### What I worked on

* Defined the main project idea.
* Created a TMDB account.
* Requested a TMDB API Read Access Token.
* Created a local project folder.
* Created a `.env` file to store the private token.
* Created a `.gitignore` file to prevent the token from being uploaded to GitHub.
* Created a Jupyter Notebook using Anaconda.

### What I learned

An API allows a program to request structured data directly from a service. TMDB returns movie information in JSON format, which Python can convert into dictionaries, lists, and pandas DataFrames.

The `.env` file stores private information outside the notebook. The `.gitignore` file tells Git not to upload the `.env` file.

### Challenges

The notebook initially could not find the `.env` file because it was not located in the correct project folder. I used Python path checks to find the issue.

```python
import os

print(os.getcwd())
print(os.path.exists("../.env"))
```

### Result

The token successfully loaded, and the first TMDB request returned:

```text
200
Avengers: Endgame
```

A status code of `200` means that the API request was successful.

### Next step

Use the TMDB API to collect multiple movie records and convert them into a pandas DataFrame.

---

## Entry 2 — Initial Data Collection

**Date:** [Enter date]

### What I worked on

[Describe what you completed.]

### Important decisions

[Explain choices such as the date range, budget threshold, columns selected, or movies excluded.]

### What I learned

[Explain new Python, SQL, API, or business concepts.]

### Problems encountered

[Record errors, missing values, inconsistent data, or confusing decisions.]

### How I solved them

[Document the fix so you can remember it later.]

### Results or observations

[Write down early patterns, even if they are not final conclusions.]

### Next step

[State the next concrete task.]

---

## Entry 3 — IP and Franchise Classification

**Date:** [Enter date]

### What I worked on

Classified movies using the following consistent `ip_type` categories:

* Original
* Sequel
* Prequel
* Remake
* Reboot
* Adaptation
* Spin-off

Used `None` in the `franchise` column when a movie was not part of a franchise.

### Classification examples

| Movie             | IP Type    | Franchise                 |
| ----------------- | ---------- | ------------------------- |
| Avengers: Endgame | Sequel     | Marvel Cinematic Universe |
| Barbie            | Adaptation | Barbie                    |
| Oppenheimer       | Adaptation | None                      |
| Top Gun: Maverick | Sequel     | Top Gun                   |

### Important decision

Each movie receives one primary `ip_type`, even when more than one category might reasonably apply. This keeps the categories consistent for SQL grouping and dashboard analysis.

### Questions to revisit

* Should comic-book films be classified as adaptations, sequels, or reboots based on the individual movie?
* Should cinematic universes be treated as franchises?
* Should a movie based on a real person or event count as an adaptation only when it is based on a specific published work?

### Next step

Review ambiguous classifications before importing the final table into PostgreSQL.

---

# Decision Log

| Date   | Decision                                         | Reason                                                         |
| ------ | ------------------------------------------------ | -------------------------------------------------------------- |
| [Date] | Use movies with budgets of at least $100 million | Creates a consistent initial definition of a blockbuster       |
| [Date] | Calculate profitability in SQL                   | Keeps the source data separate from calculated analysis fields |
| [Date] | Use one primary IP category per movie            | Makes grouping and comparison more consistent                  |
| [Date] | Use `None` for non-franchise movies              | Avoids blank values and creates a clear analytical category    |

---

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

