======================================================================
  ====================================================================
  Creation of table by codes was not used because Bulk loading was 
 restricted due to OS security policy; data ingested via ETL tool.
======================================================================
======================================================================

===========================================================================================================
--Checking for nulls and duplicates , i found that there were in fact 300 duplicates of my primary key.
I proceeded to do this
============================================================================================================
SELECT DISTINCT
*
INTO orders_cleaned
FROM bronze.mrw

SELECT 
COUNT(*)
FROM bronze_mrw;
SELECT 
COUNT(*)
FROM orders_cleaned;

