/*
Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. 
For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. 
You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. 
You will be required to prepare the dataset for the analysis you choose to do. 
As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." 
It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. 
You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. 
If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.
*/


--Yelp Dataset (yelp.com/dataset/download)
--Part 1: Profiling and Understanding

--1. Profile the data by finding the total number of records for each of the tables below:
	
--i. Attribute table = 10000
SELECT COUNT (*)
FROM albums;
--ii. Business table = 10000
SELECT COUNT (*)
FROM business;
--iii. Category table = 10000
SELECT COUNT (*)
FROM category;
--iv. Checkin table = 10000
SELECT COUNT (*)
FROM checkin;
--v. elite_years table = 10000
SELECT COUNT (*)
FROM elite_years;
--vi. friend table = 10000 
SELECT COUNT (*)
FROM friend;
--vii. hours table = 10000 
SELECT COUNT (*)
FROM hours;
--viii. photo table = 10000 
SELECT COUNT (*)
FROM photo;
--ix. review table = 10000 
SELECT COUNT (*)
FROM review;
--x. tip table = 10000 
SELECT COUNT (*)
FROM tip;
--xi. user table = 10000 
SELECT COUNT (*)
FROM user;


-- 2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

--i. Attribute = 39 attributes applied to 1115 businesses 
SELECT COUNT (DISTINCT name)
FROM attribute;
SELECT COUNT (DISTINCT business_id)
FROM attribute;

--ii. Business = 10000 businesses 
SELECT COUNT (DISTINCT id)
FROM business;

--iii. Category = 712 categories applied to 2643 businesses
SELECT COUNT (DISTINCT category)
FROM category;
SELECT COUNT (DISTINCT business_id)
FROM category;

--iv. Checkin = 493 businesses
SELECT COUNT (DISTINCT c)
FROM checkin;

--v. elite_years table = 2780 businesses
SELECT COUNT (DISTINCT user_id)
FROM elite_years;

--vi. friend table = 11 users for 9415 friends
SELECT COUNT (DISTINCT user_id)
FROM friend;
SELECT COUNT (DISTINCT friend_id)
FROM friend;

--vii. hours table = 1562 businesses
SELECT COUNT (DISTINCT business_id)
FROM hours;

--viii. photo table = 10000 photos for 6493 businesses
SELECT COUNT (DISTINCT id)
FROM photo;

--ix. review table = 10000 reviews from 9581 users for 8090 businesses  
SELECT COUNT (DISTINCT id)
FROM review;
SELECT COUNT (DISTINCT user_id)
FROM review;
SELECT COUNT (DISTINCT business_id)
FROM review;

--x. tip table = 537 users for 3979 businesses
SELECT COUNT (DISTINCT user_id)
FROM tip;
SELECT COUNT (DISTINCT business_id)
FROM tip;

--xi. user table =  10000 users
SELECT COUNT (DISTINCT id)
FROM user;


--3. Are there any columns with null values in the Users table? Indicate "yes," or "no."
--Answer: No
--SQL code used to arrive at answer:
SELECT SUM (CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS NameNull
	, SUM (CASE WHEN review_count IS NULL THEN 1 ELSE 0 END) AS ReviewNull
	, SUM (CASE WHEN yelping_since IS NULL THEN 1 ELSE 0 END) AS YelpNull
	, SUM (CASE WHEN useful IS NULL THEN 1 ELSE 0 END) AS UsefulNull
	, SUM (CASE WHEN funny IS NULL THEN 1 ELSE 0 END) AS FunnyNull
	, SUM (CASE WHEN cool IS NULL THEN 1 ELSE 0 END) AS CoolNull
	, SUM (CASE WHEN fans IS NULL THEN 1 ELSE 0 END) AS FansNull
	, SUM (CASE WHEN average_stars IS NULL THEN 1 ELSE 0 END) AS AVGStarsNull
	, SUM (CASE WHEN compliment_hot IS NULL THEN 1 ELSE 0 END) AS CompHotNull
	, SUM (CASE WHEN compliment_more IS NULL THEN 1 ELSE 0 END) AS CompMoreNull
	, SUM (CASE WHEN compliment_profile IS NULL THEN 1 ELSE 0 END) AS CompProfNull
	, SUM (CASE WHEN compliment_cute IS NULL THEN 1 ELSE 0 END) AS CompCuteNull
	, SUM (CASE WHEN compliment_list IS NULL THEN 1 ELSE 0 END) AS CompListNull
	, SUM (CASE WHEN compliment_note IS NULL THEN 1 ELSE 0 END) AS CompNoteNull
	, SUM (CASE WHEN compliment_plain IS NULL THEN 1 ELSE 0 END) AS CompPlainNull
	, SUM (CASE WHEN compliment_cool IS NULL THEN 1 ELSE 0 END) AS CompCoolNull
	, SUM (CASE WHEN compliment_funny IS NULL THEN 1 ELSE 0 END) AS CompFunnyNull
	, SUM (CASE WHEN compliment_writer IS NULL THEN 1 ELSE 0 END) AS CompWriterNull
	, SUM (CASE WHEN compliment_photos IS NULL THEN 1 ELSE 0 END) AS CompPhotosNull
FROM user;
	
	
-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

-- i. Table: Review, Column: Stars
-- min: 1, max: 5, and avg: 3.7082 (4)
SELECT MIN (stars) 
, MAX (stars)
, /*ROUND*/ (AVG (stars)) 
FROM review;
			
-- ii. Table: Business, Column: Stars
-- min: 1, max: 5, and avg: 3.6549 (4)
SELECT MIN (stars) 
, MAX (stars)
, /*ROUND*/ (AVG (stars)) 
FROM business;	
	
-- iii. Table: Tip, Column: Likes
-- min:0, max: 2, and avg: 0.0144 (0)	
SELECT MIN (likes) 
, MAX (likes)
, AVG (likes)
FROM tip;
	

-- 5. List the cities with the most reviews in descending order:
-- SQL code used to arrive at answer:
SELECT city
, SUM (review_count) as Ranking
FROM business
GROUP BY city
ORDER BY Ranking DESC
LIMIT 10;	
--	Copy and Paste the Result Below:
/* 
+------------+---------+
| city       | Ranking |
+------------+---------+
| Las Vegas  |   82854 |
| Phoenix    |   34503 |
| Toronto    |   24113 |
| Scottsdale |   20614 |
| Charlotte  |   12523 |
| Henderson  |   10871 |
| Tempe      |   10504 |
| Pittsburgh |    9798 |
| Montréal   |    9448 |
| Chandler   |    8112 |
+------------+---------+
*/

	
--6. Find the distribution of star ratings to the business in the cities of Avon and Beachwood:
-- SQL code used to arrive at answer:
SELECT city
, stars AS StarRating
, COUNT (stars) AS Distribution
FROM business
WHERE UPPER(city) IN ("AVON", "BEACHWOOD") 
GROUP BY stars 
ORDER BY city, stars DESC;
-- Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
/*
+-----------+------------+--------------+
| city      | StarRating | Distribution |
+-----------+------------+--------------+
| Avon      |        4.5 |            3 |
| Avon      |        4.0 |            3 |
| Avon      |        3.5 |            5 |
| Avon      |        2.5 |            3 |
| Avon      |        1.5 |            1 |
| Beachwood |        5.0 |            6 |
| Beachwood |        3.0 |            2 |
| Beachwood |        2.0 |            1 |
+-----------+------------+--------------+		
*/


-- 7. Find the top 3 users based on their total number of reviews:	
-- SQL code used to arrive at answer:
SELECT id
, name 
, review_count
FROM user
ORDER BY review_count DESC
LIMIT 3;	
-- Copy and Paste the Result Below:
/*
+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+
*/		


-- 8. Does posing more reviews correlate with more fans? Please explain your findings and interpretation of the results:
/*
Answer: The determination coeficient is equal 0.437, meaning that 43,7% of the behavior of one variable could be explained by the behavior of the other variable. 
By taking the squared root of it, we see a Pearson´s Correlation coefficient of (+/-)0,661, what would indicate a moderate relationship between the variables (uncertain if positive or negative so far).
Considering the covariance, we see that number of reviews and number of fans hold a positive relationship. Hence,  more reviews correlate with more fans.
*/

--	SQL code used to arrive at answer:
/* 
Pearson´s Correlation coefficient: corr(x,y)=cov(x,y)/(stddev(x)*stddev(y))
There are 4 cases when calculating the correlation in DBMSs:
*/
-- 1) CORR function supported
SELECT CORR (review_count,fans) AS Correlation 
FROM user;
-- 2) CORR function NOT supported, but STDDEV functions supported 
SELECT CovReviewsFans/(StdDevFans*StdDevReviews) AS Correlation -- Pearson´s correlation coefficient
FROM user,
	(SELECT STDDEV (review_count) AS StdDevReviews 
	, STDDEV (fans) AS StdDevFans 
	, AVG ((review_count - AvgReviews)*(fans - AvgFans)) AS CovReviewsFans --Covariance between # of reviews and # of fans
	FROM user,
		(SELECT AVG (review_count) AS AvgReviews 
		, AVG (fans) AS AvgFans 
		FROM user)
	)
;

-- 3) CORR/STDDEV functions NOT supported, but SQRT function supported -> To calculate the standard deviation, the squared root of the variance is needed. In SQLite, this function is part of the amalgamation and needs to be enabled.
SELECT CovReviewsFans/(StdDevFans*StdDevReviews) -- Pearson´s correlation coefficient
FROM user,
	(SELECT CovReviewsFans
	, SQRT (VarReviews) AS StdDevReviews -- Standard Deviation of the # of reviews
	, SQRT (VarFans) AS StdDevFans -- Standard Deviation of the # of fans
	FROM user,
		(SELECT AVG ((review_count - AvgReviews)*(review_count - AvgReviews)) AS VarReviews --Variance of the # of reviews
		, AVG ((fans - AvgFans)*(fans - AvgFans)) AS VarFans --Variance of the # of fans
		, AVG ((review_count - AvgReviews)*(fans - AvgFans)) AS CovReviewsFans --Covariance between # of reviews and # of fans
		FROM user,
			(SELECT AVG (review_count) AS AvgReviews -- Get the average # of reviews
			, AVG (fans) AS AvgFans -- Get the average # of fans
			FROM user))

	)
;

-- 4) CORR/STDDEV/SQRT functions NOT supported -> In this case, we can only calculate the determination coefficient (r²), given by: r²=cov²(x,y)/(var(x)*var(y))
SELECT (CovReviewsFans*CovReviewsFans)/(VarReviews*VarFans) AS r2
FROM user, 
	(SELECT AVG ((review_count - AvgReviews)*(review_count - AvgReviews)) AS VarReviews--Variance of the # of reviews
	, AVG ((fans - AvgFans)*(fans - AvgFans)) AS VarFans--Variance of the # of fans
	, AVG ((review_count - AvgReviews)*(fans - AvgFans)) AS CovReviewsFans --Covariance between # of reviews and # of fans
	FROM user,
		(SELECT AVG (review_count) AS AvgReviews 
		, AVG (fans) AS AvgFans 
		FROM user)
	)
;

/* Calculated by the query above, SQLite does not understand the r² as an average and retrieves 1 column with repeated values of r². For a sole value, please see below:
SELECT (AVG ((review_count - AvgReviews)*(fans - AvgFans)))*(AVG ((review_count - AvgReviews)*(fans - AvgFans)))/(VarReviews*VarFans) AS r2
FROM user, 
	(SELECT AvgReviews
	, AvgFans
	, AVG ((review_count - AvgReviews)*(review_count - AvgReviews)) AS VarReviews--Variance of the # of reviews
	, AVG ((fans - AvgFans)*(fans - AvgFans)) AS VarFans--Variance of the # of fans
	FROM user,
		(SELECT AVG (review_count) AS AvgReviews -- Get the average # of reviews
		, AVG (fans) AS AvgFans -- Get the average # of fans
		FROM user)
)
;
*/


-- 9. Are there more reviews with the word "love" or with the word "hate" in them?

-- Answer: Love
/*
+------+------+
| Love | Hate |
+------+------+
| 1780 |  232 |
+------+------+
*/	
-- SQL code used to arrive at answer:
SELECT 
SUM (CASE WHEN UPPER(text) LIKE '%LOVE%' THEN 1 ELSE 0 END) as Love
,SUM (CASE WHEN UPPER(text) LIKE '%HATE%' THEN 1 ELSE 0 END) as Hate
FROM review
;
	
	
-- 10. Find the top 10 users with the most fans:
-- SQL code used to arrive at answer:
SELECT name
, fans
FROM user
ORDER BY fans DESC
LIMIT 10;		
-- Copy and Paste the Result Below:
/*
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
*/
		

-- Part 2: Inferences and Analysis

-- 1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
--Categories: Bars ('%Bars%')	
-- City: Toronto
-- i. Do the two groups you chose to analyze have a different distribution of hours?
SELECT b.name
    , b.city
    , c.category
    , h.hours
    ,CASE WHEN stars >=4 THEN 'Good'
            WHEN (stars>=2 AND stars<=3) THEN 'Regular'
            ELSE 'Bad' END AS eval
    , b.review_count
FROM business b 
LEFT JOIN category c
ON b.id = c.business_id
LEFT JOIN hours h
ON  b.id = h.business_id
WHERE (h.hours LIKE 'Saturday%' OR h.hours LIKE 'Friday%') 
    AND (UPPER(c.category) LIKE '%BARS%' OR '% BAR' )
    AND Eval != 'Bad'
    AND UPPER(b.city) = 'TORONTO'
GROUP BY b.name, h.hours
ORDER BY eval, h.hours;
--Answer: Yes. In general, Good bars (4-5 stars) tend to stay open for fewer hours.


-- ii. Do the two groups you chose to analyze have a different number of reviews?
SELECT CASE WHEN stars >=4 THEN 'Good'
            WHEN (stars>=2 AND stars<=3) THEN 'Regular'
            ELSE 'Bad' END AS eval
    , AVG(b.review_count) AS avg_reviews
FROM business b 
LEFT JOIN category c
ON b.id = c.business_id
WHERE (UPPER(c.category) LIKE '%BARS%' OR '% BAR' )
    AND Eval != 'Bad'
    AND UPPER(b.city) = 'TORONTO'
GROUP BY eval;

--Answer: Yes. In average, Regular bars (2-3 stars) have received 4 reviews more than Good ones.

-- iii. Are you able to infer anything from the location data provided between these two groups? Explain.
SELECT b.name
    ,b.neighborhood
    ,b.postal_code
    ,c.category
    ,CASE WHEN stars >=4 THEN 'Good'
            WHEN (stars>=2 AND stars<=3) THEN 'Regular'
            ELSE 'Bad' END AS eval
    , b.review_count
FROM business b 
LEFT JOIN category c
ON b.id = c.business_id
WHERE (UPPER(c.category) LIKE '%BARS%' OR '% BAR' )
    AND Eval != 'Bad'
    AND UPPER(b.city) = 'TORONTO'
GROUP BY b.name
ORDER BY eval;
-- Answer: Most bars are in the downtown or West Toronto 
	