# Amazon_Vine_Analysis

## Overview

The purpose of this analysis was to break down the amazon reviews of Outdoor equipment to gather demographic data about the database. Primarily the influence of the Amazon Vine program; a service that companies may use to receive reviews for their products by paying a fee to Amazon who then sends their products to customers to use and then leave a review. To do this we accessed the Amazon Review Datasets page and selected the desired data, loaded it into Google Colab with PySpark, created our tables and then sent the data to pgAdmin for further analysis and query.

### Tools Used

* Data Used: "https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Outdoors_v1_00.tsv.gz"
* Amazon AWS RDS
* Google Colaborate with PySpark
* pgAdmin version 6.12

## Results

<a href="https://github.com/cmason1996/Amazon_Vine_Analysis/tree/main/Images" target="_blank">Click here to view all images of the data tables</a>

### Vine Reviews VS Non-Vine Reviews

<img width="483" alt="vine_table" src="https://user-images.githubusercontent.com/112291888/211958592-5cb5eabf-6fba-480e-9fdd-fba0ae99cd73.png">

The table that we are the most interested in for this analysis is the vine_table which selects the review_id, star_rating, helpful_votes, total_votes, vine, and verified_purchase columns from the main dataset. This is the table that was qeuried for the rest of this analysis.

<a href="https://github.com/cmason1996/Amazon_Vine_Analysis/blob/main/Amazon_Review_Analysis.sql" target="_blank">Click here to view the SQL queries</a>

<img width="452" alt="step_5_counts" src="https://user-images.githubusercontent.com/112291888/211958697-a92952ce-865c-4c74-bb4d-afc047dd1577.png">

* By using a SQL select query we were able to determine from the data that there were 107 reviews left by individuals in the Amazon Vine program and 39,850 reviews left by individuals not in the Amazon Vine program.

* By using an addition select statement, this time with a where condition, we determine that there are only 56 5-star reviews from individuals in the Vine program while there are 20,996 5-star reviews left by individuals not in the Vine program.

<img width="475" alt="step_5_no_vine" src="https://user-images.githubusercontent.com/112291888/211958810-82e1266e-0f16-4a3a-a784-413ff5dcdc10.png">

<img width="481" alt="step_5_yes_vine" src="https://user-images.githubusercontent.com/112291888/211958827-5d13d529-de93-4f6f-b149-e30341518389.png">

* To find the percentages of 5-star reviews, both with and without vine, to the total number of reviews we had to do some fancy SQL work. First we needed to create temporary tables to hold the data we wanted to complete then merge them to run the calculations on them. In doing this we see that the number of 5-star reviews that did not use Vine compared to the total number of reviews is 48.206%. While the number of 5-star reviews that did use Vine compared to the total number of reviews is much smaller at 00.129%.

## Summary

In conclusion, the Amazon Vine program does not appear to have any positivity bias towards the selection of purchases based on reviews as the percentage of reviews using Vine is so small. This could mean that while over half of the reviews that do use Vine are 5-star, there may be a bias towards 5-star reviews from individuals who are being given a free product. This is not a good predictor of the success or failure of a product in a wider market. 

### Going Forward 

Something to consider is that this analysis was run on a single dataset that concerns with a single category of product. Keeping this in mind, it would be a good idea to aggregate datasets and run the analysis again or to run the analysis on multiple datasets and compare the outputs. Due to the use of only one dataset, we need to acknowledge that there could be bias in the data, that maybe outdoor equipment just does not have a lot of exposure to the Vine program and therefore has less reviews of that type.
