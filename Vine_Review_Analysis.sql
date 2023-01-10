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

-- STEP 1. create a new table where total votes is greater than or equal to 20
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO total_votes
FROM vine_table
WHERE (total_votes >= 20);

-- verify that the vine_table was filtered correctly and that the data was inserted into a new table
SELECT * FROM total_votes;

-- STEP 2. create a new table from the total_votes table where the helpful_votes/total_votes >= 50%
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO divided_votes
FROM total_votes
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

-- verify that the total_votes was filtered correctly and that the data was inserted into a new table
SELECT * FROM divided_votes;

-- STEP 3. create a new table using divided_votes where the vine column is filtered for 'Y'
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO vine_yes
FROM divided_votes
WHERE (vine = 'Y');

-- verify that the divided_votes was filtered correctly and that the data was inserted into a new table
SELECT * FROM vine_yes;

-- STEP 4. create a new table using divided_votes where the vine column is filtered for 'N'
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO vine_no
FROM divided_votes
WHERE (vine = 'N');

-- verify that the divided_votes was filtered correctly and that the data was inserted into a new table
SELECT * FROM vine_no;

-- STEP 5. Count the number of 5-star review in vine_yes and vine_no
-- counting the number of 5-star reviews with vine = 'Y'
SElECT COUNT(vine)
FROM vine_yes
WHERE (star_rating = 5);

-- counting the number of 5-star reviews with vine = 'N'
SElECT COUNT(vine)
FROM vine_no
WHERE (star_rating = 5);








