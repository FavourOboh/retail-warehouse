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


============================================================================================================
--Fixing the caps for country segment, some started with caps and some started with lowercase.
============================================================================================================
UPDATE dbo.orders_cleaned
SET country = 'Nigeria'
WHERE LOWER(TRIM(country)) = 'nigeria';

UPDATE dbo.orders_cleaned
SET country = 'Kenya'
WHERE LOWER(TRIM(country)) = 'kenya';

UPDATE dbo.orders_cleaned
SET country = 'Ghana'
WHERE LOWER(TRIM(country)) = 'ghana';
