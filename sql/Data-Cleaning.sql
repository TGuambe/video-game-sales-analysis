CREATE TABLE game_sales (name TEXT,platform TEXT,year_of_release TEXT,genre TEXT,publisher TEXT,na_sales TEXT,eu_sales TEXT,
jp_sales TEXT,other_sales TEXT,global_sales TEXT,critic_score TEXT,critic_count TEXT,user_Score TEXT,user_count TEXT,developer TEXT,rating TEXT);

SELECT * FROM game_sales;

--Identifying Duplicates
WITH duplicates AS(
SELECT *, ROW_NUMBER() OVER (PARTITION BY name,platform,year_of_release,genre,publisher,na_sales,eu_sales,
jp_sales,other_sales,global_sales,critic_score,critic_count,user_Score,user_count,developer,rating
) AS row_num FROM game_sales
)SELECT * FROM duplicates 
WHERE row_num > 1;

-- No duplicates identified

-- Created new table to preserve the original dataset
CREATE TABLE game_sales2 (name TEXT,platform TEXT,year_of_release TEXT,genre TEXT,publisher TEXT,na_sales TEXT,eu_sales TEXT,
jp_sales TEXT,other_sales TEXT,global_sales TEXT,critic_score TEXT,critic_count TEXT,user_Score TEXT,user_count TEXT,developer TEXT,rating TEXT);

INSERT INTO game_sales2 
SELECT * FROM game_sales;

--Stanardisation
SELECT * FROM game_sales2;

UPDATE game_sales2
SET name = TRIM(name);

UPDATE game_sales2
SET platform = TRIM(platform);

UPDATE game_sales2
SET year_of_release = TRIM(year_of_release);

SELECT DISTINCT(year_of_release) FROM game_sales2;

SELECT * FROM game_sales2
WHERE year_of_release = 'N/A';

UPDATE game_sales2
SET year_of_release = NULL
WHERE year_of_release = 'N/A';

SELECT * FROM game_sales ORDER BY na_sales ASC;

ALTER TABLE game_sales2 
ALTER COLUMN year_of_release TYPE INT USING year_of_release::INT;

UPDATE game_sales2
SET genre = TRIM(genre);

SELECT * FROM game_sales2
WHERE publisher = 'N/A';

UPDATE game_sales2
SET publisher = NULL
WHERE publisher = 'N/A';

UPDATE game_sales2
SET publisher = TRIM(publisher);

UPDATE game_sales2
SET na_sales = TRIM(na_sales);

ALTER TABLE game_sales2 
ALTER COLUMN na_sales TYPE NUMERIC(4,2) USING na_sales::NUMERIC(4,2);

UPDATE game_sales2
SET eu_sales = TRIM(eu_sales);

ALTER TABLE game_sales2 
ALTER COLUMN eu_sales TYPE NUMERIC(4,2) USING eu_sales::NUMERIC(4,2);

UPDATE game_sales2
SET jp_sales = TRIM(jp_sales);

ALTER TABLE game_sales2 
ALTER COLUMN jp_sales TYPE NUMERIC(4,2) USING jp_sales::NUMERIC(4,2);

UPDATE game_sales2
SET other_sales = TRIM(other_sales);

ALTER TABLE game_sales2 
ALTER COLUMN other_sales TYPE NUMERIC(4,2) USING other_sales::NUMERIC(4,2);

UPDATE game_sales2
SET global_sales = TRIM(global_sales);

ALTER TABLE game_sales2 
ALTER COLUMN global_sales TYPE NUMERIC(4,2) USING global_sales::NUMERIC(4,2);

UPDATE game_sales2
SET critic_score = TRIM(critic_score);

ALTER TABLE game_sales2 
ALTER COLUMN critic_score TYPE INT USING critic_score::INT;

UPDATE game_sales2
SET critic_count = TRIM(critic_count);

ALTER TABLE game_sales2 
ALTER COLUMN critic_count TYPE INT USING critic_count::INT;

UPDATE game_sales2
SET user_score = TRIM(user_score);

SELECT * FROM game_sales2
WHERE user_score = 'tbd';

UPDATE game_sales2
SET user_score = NULL
WHERE user_score = 'tbd';

ALTER TABLE game_sales2 
ALTER COLUMN user_score TYPE NUMERIC(4,2) USING user_score::NUMERIC(4,2);

SELECT * FROM game_sales2;

UPDATE game_sales2
SET developer = TRIM(developer);

UPDATE game_sales2
SET rating = TRIM(rating);

SELECT * FROM game_sales2;
