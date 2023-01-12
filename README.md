# Amazon_Vine_Analysis

## Overview

The purpose of this analysis was to break down the amazon reviews of Outdoor equipment to gather demographic data about the database. Primarily the influence of the Amazon Vine program; a service that companies may use to receive reviews for their products by paying a fee to Amazon who then sends their products to customers to use and then leave a review. To do this we accessed the Amazon Review Datasets page and selected the desired data, loaded it into Google Colab with Pyspark, created out tables and then sent the data to pgAdmin for further analysis and query.

### Tools Used

* Data Used: "https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Outdoors_v1_00.tsv.gz"
* Amazon AWS RDS
* Google Colaborate with PySpark
* pgAdmin version 6.12

## Results

<a href="https://github.com/cmason1996/Amazon_Vine_Analysis/tree/main/Images" target="_blank">Click here to view images of the data tables</a>

### Vine Reviews VS Non-Vine Reviews

INSERT PICTURE OF VINE_TABLE HERE

The table that we are the most interested in for this analysis is the vine_table which selects the review_id, star_rating, helpful_votes, total_votes, vine, and verified_purchase columns from the main dataset. This is the table that was qeuried for the rest of this analysis


## Summary

### Going Forward