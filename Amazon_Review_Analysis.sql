-- create the vine table using the vine_table.csv file
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
-- verify that the data was imported correctly
SELECT * FROM vine_table;

------------ STEP 1. create a new table where total votes is greater than or equal to 20 ----------

SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO total_votes
FROM vine_table
WHERE (total_votes >= 20);
-- verify that the vine_table was filtered correctly and that the data was inserted into a new table
SELECT * FROM total_votes;

------------ STEP 2. create a new table from the total_votes table where the helpful_votes/total_votes >= 50% -----------

SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO divided_votes
FROM total_votes
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;
-- verify that the total_votes was filtered correctly and that the data was inserted into a new table
SELECT * FROM divided_votes;

------------ STEP 3. create a new table using divided_votes where the vine column is filtered for 'Y' ------------

SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO vine_yes
FROM divided_votes
WHERE (vine = 'Y');
-- verify that the divided_votes was filtered correctly and that the data was inserted into a new table
SELECT * FROM vine_yes;

------------ STEP 4. create a new table using divided_votes where the vine column is filtered for 'N' ------------

SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO vine_no
FROM divided_votes
WHERE (vine = 'N');
-- verify that the divided_votes was filtered correctly and that the data was inserted into a new table
SELECT * FROM vine_no;

----------------- STEP 5. Count the number of 5-star review in vine_yes and vine_no -----------------

-- count the total number of reviews 
SELECT COUNT(review_id)
FROM vine_table;
----- TOTAL REVIEW: 2,302,174 -----

-- counting the number of review with vine = 'Y'
SElECT COUNT(vine)
FROM vine_yes;
----- TOTAL VINE REVIEWS: 107 -----

-- counting the number of reviews with vine = 'N'
SElECT COUNT(vine)
FROM vine_no;
----- TOTAL NON-VINE REVIEWS: 39,850 -----

-- counting the number of 5-star reviews with vine = 'Y'
SElECT COUNT(vine)
FROM vine_yes
WHERE (star_rating = 5);
----- TOTAL 5-STAR REVIEWS W/VINE = 'Y': 56 -----

-- counting the number of 5-star reviews with vine = 'N'
SElECT COUNT(vine)
FROM vine_no
WHERE (star_rating = 5);
----- TOTAL 5-STAR REVIEWS W/VINE = 'N': 20,996 -----

-- get the percentage of 5-star reviews to the total number of reviews that did not use vine
------------ TOTAL_REVIEWS/5_STAR_NO_VINE_REVIEWS * 100 ------------
-- use this to create the 5-star column from the no_vine table
SELECT star_rating
INTO five_star_yes_vine
FROM vine_yes
WHERE (star_rating = 5);
-- create a new table to hold the count of total_reviews
CREATE TABLE total_reviews (total_reviews int);
-- insert data into the table
INSERT INTO total_reviews(total_reviews)
SELECT COUNT(total_votes)
FROM total_votes;
-- verify the data
SELECT * FROM total_reviews;

-- create a new table to hold the count of 5-star paid vine reviews
CREATE TABLE five_star_unpaid_reviews (total_5_star_reviews int);
-- insert data into the table
INSERT INTO five_star_unpaid_reviews(total_5_star_reviews)
SELECT COUNT(star_rating)
FROM five_star_no_vine;
-- verify the data
SELECT * FROM five_star_unpaid_reviews;

-- merge the two tables 
SELECT tr.total_reviews, fsur.total_5_star_reviews
INTO unpaid_review_temp
FROM total_reviews AS tr
INNER JOIN five_star_unpaid_reviews AS fsur ON (1 = 1);
--verify merger
SELECT * FROM unpaid_review_temp;

-- calculate the percentage
SELECT CAST(total_5_star_reviews AS FLOAT)/ CAST(total_reviews AS FLOAT)*100
FROM unpaid_review_temp;
----- PERCENTAGE OF 5-STAR REVIEWS VS TOTAL REVIEWS = 48.206% -----

------------ TOTAL_REVIEWS/5_STAR_YES_VINE_REVIEWS * 100 ------------

-- use this to create the 5-star column from the yes_vine table
SELECT star_rating
INTO five_star_yes_vine
FROM vine_yes
WHERE (star_rating = 5);
-- create a new table to hold the count of 5-star paid vine reviews
CREATE TABLE five_star_paid_reviews (total_5_star_reviews int);
-- insert data into the table
INSERT INTO five_star_paid_reviews(total_5_star_reviews)
SELECT COUNT(star_rating)
FROM five_star_yes_vine;
-- verify the data
SELECT * FROM five_star_paid_reviews;

-- merge the two tables 
SELECT tr.total_reviews, fspr.total_5_star_reviews
INTO paid_review_temp
FROM total_reviews AS tr
INNER JOIN five_star_paid_reviews AS fspr ON (1 = 1);
--verify merger
SELECT * FROM paid_review_temp;

-- calculate the percentage
SELECT CAST(total_5_star_reviews AS FLOAT)/ CAST(total_reviews AS FLOAT)*100
FROM paid_review_temp;
----- PERCENTAGE OF 5-STAR REVIEWS VS TOTAL REVIEWS = 00.129% -----