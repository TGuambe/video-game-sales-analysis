SELECT * FROM game_sales2;

-- Which games had the highest recorded global sales?
SELECT name, platform, genre, publisher, global_sales FROM game_sales2
ORDER BY global_sales DESC;

-- Which games had the lowest recorded global sales?
SELECT name, platform, genre, publisher, global_sales FROM game_sales2
ORDER BY global_sales ASC;

-- Which games had the highest recorded sales in Europe?
SELECT name, platform, genre, publisher, eu_sales FROM game_sales2
ORDER BY eu_sales DESC;

-- Which games had the lowest recorded sales in Europe?
SELECT name, platform, genre, publisher, eu_sales FROM game_sales2
ORDER BY eu_sales ASC;

-- Which games had the highest recorded sales in Japan?
SELECT name, platform, genre, publisher, jp_sales FROM game_sales2
ORDER BY jp_sales DESC;

-- Which games had the highest recorded sales in North America?
SELECT name, platform, genre, publisher, na_sales FROM game_sales2
ORDER BY na_sales DESC;

-- Which games had the highest recorded sales in Other parts of the world?
SELECT name, platform, genre, publisher, other_sales FROM game_sales2
ORDER BY other_sales DESC;

-- Comparing game sales per region?
SELECT name, platform, genre, publisher, developer, eu_sales, na_sales, jp_sales, other_sales, global_sales FROM game_sales2
ORDER BY global_sales DESC;

-- Region driving the most sales on average
SELECT 
ROUND(AVG(na_sales),2) AS na_average_sales,
ROUND(AVG(jp_sales),2) AS jp_average_sales,
ROUND(AVG(eu_sales),2) AS eu_average_sales,
ROUND(AVG(other_sales),2) AS other_average_sales
FROM game_sales2;

-- When a region is the biggest-selling region for a game, what is the average sales in that region? 
WITH na_average AS(
SELECT name, publisher, platform, na_sales, global_sales FROM game_sales2
WHERE na_sales > eu_sales
AND na_sales > jp_sales
AND na_sales > other_sales
ORDER BY global_sales DESC
) 
SELECT ROUND(AVG(na_sales),2) AS average_sales FROM na_average;

WITH eu_average AS(
SELECT name, publisher, platform, eu_sales, global_sales FROM game_sales2
WHERE eu_sales > na_sales
AND eu_sales > jp_sales
AND eu_sales > other_sales
ORDER BY global_sales DESC
) 
SELECT ROUND(AVG(eu_sales),2) AS average_sales FROM eu_average;

WITH jp_average AS(
SELECT name, publisher, platform, jp_sales, global_sales FROM game_sales2
WHERE jp_sales > na_sales
AND jp_sales > eu_sales
AND jp_sales > other_sales
ORDER BY global_sales DESC
) 
SELECT ROUND(AVG(jp_sales),2) AS average_sales FROM jp_average;

WITH other_average AS(
SELECT name, publisher, platform, other_sales, global_sales FROM game_sales2
WHERE other_sales > na_sales
AND other_sales > eu_sales
AND other_sales > jp_sales
ORDER BY global_sales DESC
) 
SELECT ROUND(AVG(other_sales),2) AS average_sales FROM other_average;

SELECT * FROM game_sales2;

-- Which release year generated the greatest total sales?
WITH highest_year AS(
SELECT DISTINCT(year_of_release), SUM (global_sales) AS year FROM game_sales2
GROUP BY year_of_release
)
SELECT * FROM highest_year
ORDER BY year DESC;

-- Which release year generated the highest sales per region?
WITH highest_year AS(
SELECT DISTINCT(year_of_release), SUM (na_sales) AS year FROM game_sales2
GROUP BY year_of_release
)
SELECT * FROM highest_year
ORDER BY year DESC;


WITH highest_year AS(
SELECT DISTINCT(year_of_release), SUM (jp_sales) AS year FROM game_sales2
GROUP BY year_of_release
)
SELECT * FROM highest_year
ORDER BY year DESC;


WITH highest_year AS(
SELECT DISTINCT(year_of_release), SUM (eu_sales) AS year FROM game_sales2
GROUP BY year_of_release
)
SELECT * FROM highest_year
ORDER BY year DESC;

WITH highest_year AS(
SELECT DISTINCT(year_of_release), SUM (other_sales) AS year FROM game_sales2
GROUP BY year_of_release
)
SELECT * FROM highest_year
ORDER BY year DESC;


-- Why did 2008 see such a high number of sales?
WITH the_2k AS (
SELECT name, genre, year_of_release, platform, publisher, developer, global_sales AS global_sales_of_game FROM game_sales2
WHERE year_of_release = 2008
ORDER BY global_sales DESC
)
SELECT name, genre, year_of_release, platform, publisher, developer, global_sales_of_game FROM the_2k
WHERE year_of_release = 2008
GROUP BY name, genre, year_of_release, platform, publisher, developer, global_sales_of_game
ORDER BY global_sales_of_game DESC;


SELECT name, publisher, platform, genre, other_sales, na_sales, eu_sales, jp_sales, global_sales FROM game_sales2
WHERE other_sales > na_sales
AND other_sales > eu_sales
AND other_sales > jp_sales
ORDER BY global_sales DESC;

SELECT platform, SUM(other_sales) AS total_other_sales
FROM game_sales2
GROUP BY platform
ORDER BY total_other_sales DESC;


-- Which genre recorded the highest number of sales
SELECT genre, SUM(global_sales) AS global_sales_per_genre FROM game_sales2
GROUP BY genre
ORDER BY SUM(global_sales) DESC;


-- Which games were most highly rated by critics, and which received the most critical attention?
SELECT * FROM game_sales2;

SELECT name, critic_score, critic_count FROM game_sales2
WHERE critic_score > 90
ORDER BY critic_score DESC;

SELECT name, critic_score, critic_count FROM game_sales2
WHERE critic_count > 90
ORDER BY critic_count DESC;

SELECT name, critic_score, critic_count FROM game_sales2
WHERE critic_score > 90
AND critic_count > 90;

-- Highest-selling individual game platform each year
WITH console AS (
SELECT year_of_release, platform, MAX(global_sales) AS highest_selling FROM game_sales2
WHERE year_of_release IS NOT NULL 
GROUP BY year_of_release, platform
)
SELECT DISTINCT ON(year_of_release)year_of_release, platform, highest_selling FROM console
ORDER BY year_of_release, highest_selling DESC;

-- Platform with the highest total sales in each year
WITH console AS (
SELECT year_of_release, platform, SUM(global_sales) AS highest_selling FROM game_sales2
WHERE year_of_release IS NOT NULL 
GROUP BY year_of_release, platform
)
SELECT DISTINCT ON(year_of_release)year_of_release, platform, highest_selling FROM console
ORDER BY year_of_release, highest_selling DESC;
