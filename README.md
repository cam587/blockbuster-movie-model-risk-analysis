# blockbuster-movie-model-risk-analysis
# Blockbuster Risk Analysis Data Dictionary

## Dataset

Primary dataset:

`data/cleaned/blockbuster_movies_cleaned.csv`

Raw TMDB dataset:

`data/raw/tmdb_blockbusters_2015_2025.csv`

## Columns

| Column | Description |
|---|---|
| movie_id | Unique TMDB movie ID. |
| title | Movie title from TMDB. |
| release_date | Primary release date from TMDB. |
| release_year | Year extracted from release_date. |
| release_month | Month extracted from release_date. |
| studio | Production company names from TMDB, combined into one text field. |
| genre | Genre names from TMDB, combined into one text field. |
| ip_type | Manually assigned IP category, such as Original, Sequel, Reboot, Remake, Adaptation, or Spin-off. |
| franchise | Manually assigned franchise or universe name. Use None if not part of a franchise. |
| production_budget | TMDB reported production budget in USD. |
| worldwide_gross | TMDB reported worldwide revenue in USD. |
| runtime | Runtime in minutes from TMDB. |
| audience_score | TMDB vote average. |
| vote_count | Number of TMDB user votes. |
| popularity | TMDB popularity score. |

## Notes

- Blockbuster is currently defined as a movie with a production budget of at least $100 million.
- Budgets are nominal, not inflation-adjusted.
- TMDB budget and revenue fields may be incomplete or occasionally inaccurate.
- Advertising costs are not included directly. Later SQL analysis will estimate break-even using `production_budget * 2.5`.
- `ip_type` and `franchise` are manually added fields.
