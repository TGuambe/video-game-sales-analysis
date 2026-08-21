# Video Game Sales — Exploratory Data Analysis

## 📌Overview
This project is an Exploratory Data Analysis (EDA) practice project using a historical video game sales dataset.

The objective is to clean and prepare the dataset in PostgreSQL, investigate sales patterns across regions, and explore how sales vary by release year, genre, platform, publisher, and critical/user reception.

## Dataset
Downloaded from Kaggle, this dataset contains game name, platform, release year, genre, publisher, developer, regional sales, global sales, critic/user scores and review counts, and ratings.

Sales are measured in millions of units. For example, `43.30` represents approximately 43.3 million units.

## Tools
- PostgreSQL
- pgAdmin
- SQL
- GitHub

## Data Cleaning
The original imported table was preserved as the raw dataset, while `game_sales2` was created as the working dataset.

Cleaning included:
1. Inspecting the raw data.
2. Checking for exact duplicate records.
3. Trimming whitespace from text fields.
4. Converting special missing-value representations such as `N/A` and `tbd` to `NULL` where appropriate.
5. Converting release year to `INTEGER`.
6. Converting sales fields to numeric values.
7. Converting critic scores/counts to integers.
8. Converting user scores to numeric values.

A key principle was not to treat missing information as zero. For example, `tbd` is not equivalent to a user score of zero.

## Exploratory Analysis
The project investigates:
- Highest and lowest recorded global sales
- Highest recorded regional sales
- Regional sales patterns and averages
- Dominant regional markets for individual games
- Highest-sales release years globally and by region
- Games, genres and platforms associated with the highest-sales year
- Highest-selling genres
- Critic ratings and critical attention
- Platform performance

## Key Findings
- Nintendo titles are heavily represented among the highest-selling games in the dataset.
- 2008 recorded the highest total global sales at approximately **671.9 million units**.
- Regional markets did not all reach their highest recorded sales in the same year.
- North America and Other regions peaked in 2008, Japan peaked in 2006, and Europe peaked in 2009.
- Action, Sports and Shooter were among the strongest-selling genres by total recorded global sales.
- When a region was the dominant regional market for a game, the average sales differed substantially between regions.
- The relatively high average for Other regions should be interpreted cautiously because a small number of high-performing games can influence the mean.

## Limitations
This dataset contains sales, not profit. It does not provide development costs, marketing costs, retail prices, revenue or profit, so publisher "profit" cannot be determined from this data.

The dataset also contains missing values for several fields. Where appropriate, these are retained as `NULL` rather than being artificially replaced.

## Future Improvements
- Compare mean and median sales.
- Investigate outliers affecting regional averages.
- Measure top-game contributions to yearly totals.
- Compare platform total sales with average sales per game.
- Compare sales against critic and user scores.
- Add visualisations to complement the SQL analysis.

## Author
**Thando Given Guambe**

This project was created as an EDA practice project to demonstrate practical SQL, data-cleaning and analytical skills.
