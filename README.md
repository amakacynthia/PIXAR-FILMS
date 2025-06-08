# <h1 align="center"> Pixar Films

![pixar](https://github.com/amakacynthia/PixarFilms/blob/main/PixarPhoto.jpg)

## 💁‍♀️TABLE OF CONTENT
* [Project Overview](#project-overview)
* [Data Dictionary](#data-dictionary)
* [Data Source](#data-source)
* [Problem Statement(EDA)](Problem-statement-(eda))
* [Tools](#tools)
* [Key performance indicator](#key-performance-indicator)
* [Data Analysis](#data-analysis)
* [Descriptive Analysis 1](#descriptive-analysis-1)
* [Descriptive Analysis 2](#descriptive-analysis-2)
* [General Dashboard](#general-dashboard)
* [Predictive Analysis](#predictive-analysis)
* [Challenges Encountered](challenges-encountered)
* [Recommendations](#recommendations)
* [Appreciation](#appreciation)


## PROJECT OVERVIEW
The Pixar Films dataset, curated by software engineer Eric Leung, provides structured information on every Pixar film released from 1995’s Toy Story to 2024’s Inside Out 2. It includes detailed data such as film titles, release dates, run times, genres, creators, budgets, and global box office earnings. The dataset also captures public response metrics like IMDb scores, Rotten Tomatoes ratings, and CinemaScore, along with Academy Award nominations and wins. This rich dataset enables deep analysis of storytelling trends, financial performance, and critical reception across nearly three decades of Pixar’s animated films.

*Disclaimer: All datasets and reports do not represent any company, institution or country, but just a sample dataset to demonstrate capabilities of SQL and powerbi.*

## DATA DICTIONARY
* Number: Unique identifier for each Pixar film, in order of release
* Film: Title of the Pixar Film
* Release Date: Release date of the film
* Run time: Duration of the film in minutes
* Film rating: Official film rating (e.g., G, PG, PG-13)
* Role Title: Role of the person (e.g., director, producer)
* Name: Name of the individual
* Value:Genre or Subgenre type (e.g., Animation, Adventure)
* Budget:Estimated production budget
* Box_office_us_worldwide: Total worldwide box office earnings
* Rotten tomatoes score: Rotten Tomatoes critic score (out of 100)
* Rotten rotten counts: Number of reviews on Rotten Tomatoes
* Cinema score: CinemaScore rating (e.g., A+, A, B)
* Imdbs score: IMDb user rating (out of 10)
* Award type: Type of Academy Award (e.g., Best Animated Feature)
* Status: Status of the award (e.g., won, nominated)

## DATA SOURCE
The dataset was originally compiled and maintained by software engineer Eric Leung, providing structured information about every Pixar film from 1995 to 2024.

[Download Here](https://maven-datasets.s3.us-east-1.amazonaws.com/Pixar+Films/Pixar+Films.zip)

Dax  functions used in power bi

[click Here](https://docs.google.com/document/d/1kDGrnayXgFXQb5RfGFLPQKvOtw037GawrWzTI9GcjXo/edit?usp=sharing)

# PROBLEM STATEMENT (EDA)
*  How does a film’s budget relate to its worldwide box office success?
*  Which genres or subgenres tend to perform best at the box office and with critics?
*  Which creators (e.g., directors, screenwriters) are most associated with critical and commercial success?
*  Has Pixar’s film quality or popularity improved or declined over time?
*  How many films were nominated for the oscar award?
*  Which movies are top longest movies by run time?

## TOOLS
- Excel
- MSSQL 
- Powerbi

## KEY PERFORMANCE INDICATOR
- 🎥 Total Films
- 💈 Average IMBDs Scores
- 💰 Total Budget
- 💸 Return on Investment (ROI)
- 🍬 Total Revenue

##  Data Cleaning 
   ## Excel (Initial Stage)

- Checked for and removed duplicate rows, especially in the pixar_people and academy sheets.
  
- Header Adjustment: The first row was set as the header, and subsequent rows were re-indexed for clarity.

- Standardized column names (e.g., Box Office Worldwide ➝ box_office_worldwide) for consistency across imports.

- Verified date fields (e.g., release_date) were in a valid date format and corrected any anomalies

- Removed any stray empty rows or columns from the dataset.
  
   ## SQL (Database Preparation)

- Loaded each table into SQL Server and used data profiling to detect inconsistencies.

- Trimmed leading/trailing whitespaces from film titles using LTRIM(RTRIM()) to ensure clean joins.

- Created a surrogate key where necessary (e.g., film rank or index) due to the non-unique nature of film titles across roles/awards.

- Handled nulls in critical fields (like imdb_score, box_office_worldwide) by filtering or setting default values for analysis.

  ## POWER  BI (Modeling & Visual Layer)

-Ensured consistent data types (e.g., budget as currency, scores as decimals).

- Used Power Query to remove unneeded columns and rename fields for readability in visuals.

- Established clean one-to-many relationships between fact and dimension-like tables using cleaned film columns.

- Applied filters to exclude incomplete records during visualizations (e.g., missing ratings or earnings).

# DATA ANALYSIS
![image](https://github.com/user-attachments/assets/dff55f25-6d3a-4a63-82a3-f00cb6047460)

# DESCRIPTIVE ANALYSIS 1

* Total Films = 28
* Average IMBDs Score = 7.53
* Total Budget = $4.4billion
* Total Return On Investment = $12.69billion
* Total Revenue = 17.04bilion
* Total Revenue from US (Canada) =$6.93billion
* Revenue from other box office = $10.11billion

# DESCRIPTIVE ANALYSIS 2
## Determine if higher budgets lead to higher earnings?

   ![chart1](https://github.com/user-attachments/assets/53628151-4f44-457a-a33f-5a38d860cdb0)
   
Based on the analysis, there isn’t a direct one-to-one relationship between a film’s budget and its worldwide earnings. For instance, the film **(Finding nemo)** with the highest earnings **($871M)** had a lower budget **($94M)** than others with bigger budgets and lower returns. Meanwhile, a film **(Toy story)** with a modest $30M budget still earned a remarkable $394M, outperforming another **(A bug's Life)** with $120M budget that earned just $363M. This suggests that higher spending **does not** guarantee higher box office success. Understanding this dynamic can guide future budgeting by emphasizing strategic investment over sheer spending, helping studios allocate resources more effectively without assuming that bigger budgets always lead to bigger profits.

## Identify top-performing genres based on revenue.

  ![Screenshot 2025-05-31 134742](https://github.com/user-attachments/assets/c0e75e1a-7fb0-4fc7-b1e3-2b85b7c338a3)
  
From the visualization above the top genres are Adventures,Animation and computer Animation  generating $17billion as revenue  and an IMDBs Score of 211.20 each comedy followed the chart with a revenue of $12.7billion and an IMDBs of 159 and lastly Fantsy wuth $8.3 billion as revenue and 108.60 IMDBs Score.  

##  Recognize top contributors to Pixar’s success.

![Screenshot 2025-05-31 141402](https://github.com/user-attachments/assets/efb6077a-1b9d-40dc-8b48-438d04e0b787)

   *"Great stories are not written by chance, but by the minds who dare to imagine the impossible.”*
From our analysis, five standout creators have consistently shaped Pixar’s legacy of storytelling excellence. Through repeated roles across multiple high-performing and award-winning films, they’ve proven to be the creative pillars behind Pixar’s global success. 
Adrain Molina topped the chart as a co- director for two Pixar films which geneated about $1.6billion, Matthew Aldrich followed as a sceenwriter for a film that generated $841million while Jim Morris as a producer, his film generated over $521 million and finally Jim Reardon as a screenwriter generated a worldwide revenue of $521 million.

## Track trends in film reception over time.
![Screenshot 2025-06-01 125809](https://github.com/user-attachments/assets/1efa886b-3c8a-40e8-8ef3-ddc7106ca1f4)

 “Time may change the tools of storytelling, but great stories always find their audience.”

Over the years, Pixar’s films have shown a remarkable consistency in critical and audience reception, with standout titles continuing to earn high ratings across platforms like IMDb, Rotten Tomatoes, and Metacritic. This upward trend reflects not just technical growth but a deepening connection with viewers through relatable themes and emotional depth. As storytelling evolves, Pixar proves that when heart meets innovation, audiences will keep coming back — year after year.
Although, there have  been fluatations over the years in terms of the  average worldwide earnings and average IMDBs score where peak moments is seen in 2018 generating an averahe worldwide earning of **$1.2billion**  with an imdbs score of 7.20 and a Dip can be seen in 2021 with an average world wide earning of about **$51mllion** and an IMDBs score of 7.40 

## Award Nomination
![Screenshot 2025-06-08 135322](https://github.com/user-attachments/assets/01e610f6-2a8f-4254-874e-718a5050471c)

 The number of movies nominated is 40, while 28 were not eligbe for nomination, from the 40 nominaed, 17 won the oscar awards.

 ## Movies by Run time
 ![Screenshot 2025-06-08 140303](https://github.com/user-attachments/assets/c7d4286a-ce86-4a3e-9dfc-50fd36760629)

Every minute counts when telling a story that stays with the audience.”
Analyzing Pixar movies by run time reveals that most films fall within the 106–118 minute range, balancing storytelling depth with audience attention span. While longer films can offer more character development, Pixar consistently delivers impactful narratives within a tightly crafted duration. This consistency reflects their strength in efficient, emotionally rich storytelling that resonates across all ages.

## 🪕General Dashboard
![Screenshot 2025-06-08 141221](https://github.com/user-attachments/assets/785a03c7-75ae-4f1a-ae86-31ff95b86edd)

##  🍡Predictive Analysis

   * **Budget vs Box Office Forecasting**
Films with moderate budgets (between $90M–$115M) tend to yield the highest worldwide earnings, suggesting that overly high budgets do not guarantee proportional returns. A regression model built on historical budget and earnings data can help forecast box office potential based on proposed budgets.

   * **Genre & Success Alignment**
Adventure, Animation, and Family genres consistently appear in high-earning and highly-rated films. By analyzing genre frequency and reception scores, we can predict which genre combinations are more likely to succeed with both critics and audiences.

   * **Top Creators as Success Indicators**
Involvement of specific high-performing directors or writers (e.g., those with 3+ past box office hits or awards) may be used as a predictive factor for a film's critical or commercial performance.

## ⚠️Challenges Encountered

 - Lack of a Unique Primary Key for Joins
The dataset uses the film title as the linking field across multiple tables, but since some film titles appear multiple times (due to multiple people or genres per film), this created difficulty in establishing reliable one-to-many relationships.

   *👉 Solution: A synthetic primary key (like a film ID) had to be assumed or created to ensure accurate joins, especially when modeling relationships in SQL and Power BI.*

- Inconsistent or Missing Values Across Tables
Several fields (such as cinema_score, rotten_tomatoes_score, and box_office data) had missing or incomplete entries, which affected full-scope analysis.

   *👉 Solution: Data cleaning involved filtering out null values for key metrics or using conditional logic in SQL and Power BI to ensure visuals and metrics weren’t skewed.*

## Recommendations 
 1. Focus future stories on emotion-driven narratives that resonate globally. A film that makes people feel will always travel further than one that just entertains.

 2. Encourage the integration of data-driven storytelling in early production stages—letting historical performance guide plot complexity, character arcs, and even release timing for better audience alignment.

 3. While Pixar’s formula has proven successful, the industry and audience tastes are evolving. Innovate through diverse representation, new visual techniques, and non-traditional narratives, without losing the emotional core that defines the brand.

 4. Invest in retaining and collaborating with top-performing creative talents, as their involvement often boosts a film’s success.

 5. Maintain film lengths within this sweet spot to maximize engagement without compromising narrative depth.

## Appreciation
![image](https://github.com/user-attachments/assets/2cfb69dd-50d8-4b31-96d0-b7aa4592d493)

   🙏 Thank You
Thank you for taking the time to explore this analysis. Your curiosity and interest fuel the value of data storytelling. I hope this journey through Pixar’s cinematic world offered both insight and inspiration. Keep asking questions—there’s always more to discover. 🌟

