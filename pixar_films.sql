--CREATING A NEW DATABASE FOR PIXAR FILMS
CREATE DATABASE Pixar_Films;
select 
*
from
box_office;

--DETERMING IF HIGHER BUDGET ENCOURAGES TO HIGHER EARNINGS WITH TOP 5 BUDGET AND BOX OFFICE WORLDWIDE.
CREATE VIEW BUGDET_VS_BOXOFFICEWORLDWIDE AS 
SELECT 
top 5
    film,
    budget,
    box_office_worldwide,
    (box_office_worldwide - budget) AS profit,
    (CAST(box_office_worldwide AS FLOAT) / budget) AS roi
FROM 
    box_office
WHERE 
    budget IS NOT NULL AND box_office_worldwide IS NOT NULL;

---Which genres or subgenres tend to perform best at the box office and with critics?

--Create a derived table with unique film ID
CREATE VIEW  BEST_GENRES_AT_BOX_OFFICE AS
WITH film_ids AS (
    SELECT film,
	number
    FROM pixar_filmss
) 

--Use film_ids to bridge all other tables
SELECT 
    pf.number,
    pf.film,
    g.category,
    g.value AS genre,
    bo.box_office_worldwide,
    pr.rotten_tomatoes_score,
    pr.imdb_score
FROM film_ids pf
LEFT JOIN genres g ON pf.film = g.film
LEFT JOIN box_office bo ON pf.film = bo.film
LEFT JOIN public_response pr ON pf.film = pr.film
WHERE bo.box_office_worldwide IS NOT NULL;

-- Which creators (e.g., directors, screenwriters) are most associated with critical and commercial success?

--Create a film ID reference
CREATE VIEW POPULAR_CREATORS AS
WITH film_ids AS (
    SELECT film, number
    FROM pixar_filmss
),
--Joining creators with film data
creator_stats AS (
    SELECT 
        pp.name,
        pp.role_type,
        AVG(CAST(pr.imdb_score AS FLOAT)) AS avg_imdb_score,
        AVG(CAST(bo.box_office_worldwide AS FLOAT)) AS avg_worldwide_earnings,
        COUNT(DISTINCT pp.film) AS film_count
    FROM pixar_people pp
    INNER JOIN film_ids fi ON pp.film = fi.film
    INNER JOIN public_response pr ON pp.film = pr.film
    INNER JOIN box_office bo ON pp.film = bo.film
    WHERE pr.imdb_score IS NOT NULL AND bo.box_office_worldwide IS NOT NULL
    GROUP BY pp.name, pp.role_type
)
-- Select top 5 creators by IMDb score
SELECT TOP 5  
    name,
    role_type,
    avg_imdb_score,
    avg_worldwide_earnings,
    film_count
FROM creator_stats
ORDER BY avg_imdb_score DESC;

--Has Pixar’s film quality or popularity improved or declined over time?

--Create a film-year reference
CREATE VIEW POPULARITY_OVER_TIME AS
WITH film_years AS (
    SELECT 
        film, 
        YEAR(release_date) AS release_year
    FROM pixar_filmss
),

--Joining all relevant tables and aggregate by year
yearly_stats AS (
    SELECT 
        fy.release_year,
        COUNT(DISTINCT fy.film) AS film_count,
        AVG(CAST(pr.imdb_score AS FLOAT)) AS avg_imdb_score,
        AVG(CAST(pr.rotten_tomatoes_score AS FLOAT)) AS avg_rotten_score,
        AVG(CAST(bo.box_office_worldwide AS FLOAT)) AS avg_worldwide_earnings
    FROM film_years fy
    INNER JOIN public_response pr ON fy.film = pr.film
    INNER JOIN box_office bo ON fy.film = bo.film
    WHERE pr.imdb_score IS NOT NULL 
      AND pr.rotten_tomatoes_score IS NOT NULL
      AND bo.box_office_worldwide IS NOT NULL
    GROUP BY fy.release_year
)
-- Output the trends over time
SELECT *
FROM yearly_stats
ORDER BY release_year;

-- Retreiving which genres are most common in Pixar films, and how do those genres perform in terms of ratings and earnings?

--Build a film-to-genre reference
CREATE VIEW POPULARGENRES_IN_PIXARFILMS AS 
-- Step 1: Create a film list with Oscar-winning status
WITH film_awards AS (
    SELECT 
        film,
        MAX(CASE WHEN status = 'won' THEN 1 ELSE 0 END) AS won_oscar
    FROM academy
    GROUP BY film
),

-- Step 2: Combine with film data
film_factors AS (
    SELECT 
        pf.film,
        COALESCE(fa.won_oscar, 0) AS won_oscar,
        pf.run_time,
        pr.imdb_score,
        pr.rotten_tomatoes_score,
        pr.cinema_score,
        bo.box_office_worldwide
    FROM pixar_filmss pf
    LEFT JOIN film_awards fa ON pf.film = fa.film
    LEFT JOIN public_response pr ON pf.film = pr.film
    LEFT JOIN box_office bo ON pf.film = bo.film
    WHERE pr.imdb_score IS NOT NULL 
      AND pr.rotten_tomatoes_score IS NOT NULL
      AND bo.box_office_worldwide IS NOT NULL
),

-- Step 3: Aggregate core metrics by Oscar status
core_stats AS (
    SELECT 
        won_oscar,
        COUNT(*) AS film_count,
        AVG(CAST(run_time AS FLOAT)) AS avg_run_time,
        AVG(CAST(imdb_score AS FLOAT)) AS avg_imdb,
        AVG(CAST(rotten_tomatoes_score AS FLOAT)) AS avg_rt_score,
        AVG(CAST(box_office_worldwide AS FLOAT)) AS avg_worldwide
    FROM film_factors
    GROUP BY won_oscar
),

-- Step 4: Prepare cinema score strings separately
cinema_scores_grouped AS (
    SELECT 
        won_oscar,
        STRING_AGG(cinema_score, ', ') AS cinema_scores
    FROM (
        SELECT DISTINCT won_oscar, cinema_score
        FROM film_factors
        WHERE cinema_score IS NOT NULL
    ) AS distinct_scores
    GROUP BY won_oscar
)

-- Step 5: Combine stats and scores
SELECT 
    CASE WHEN cs.won_oscar = 1 THEN 'Won Oscar' ELSE 'No Oscar' END AS oscar_status,
    cs.film_count,
    cs.avg_run_time,
    cs.avg_imdb,
	fil
    cs.avg_rt_score,
    cs.avg_worldwide,
    sg.cinema_scores
FROM core_stats cs
LEFT JOIN cinema_scores_grouped sg ON cs.won_oscar = sg.won_oscar;


--What are the top 5 longest Pixar movies by run time?
CREATE VIEW TOP5_LONGEST_MOVIES_BY_RUNTIME AS
SELECT
TOP 5
 film,
run_time,
film_rating
FROM
pixar_filmss
ORDER BY 
run_time DESC;

 -- How many Pixar movies are rated G, PG?
 CREATE VIEW 
 MOVIE_RATED_G_PG AS
 SELECT DISTINCT
  film_rating, 
  COUNT (*) AS MOVIE_RATING
 FROM
 pixar_filmss
 GROUP BY film_rating;

 -- Which Pixar movie has the highest IMDb score?
 CREATE 
 VIEW
 VW_MOVIE_WITH_HIGHEST_IMDB  AS 
 SELECT TOP 5
 film,
 cinema_score,
 imdb_score
 FROM
 public_response;
 
 


--views