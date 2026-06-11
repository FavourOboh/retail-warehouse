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

============================================================================================================
  fix lettering for customer segment
============================================================================================================
UPDATE dbo.orders_cleaned
SET customer_segment = 'Corporate'
WHERE LOWER(TRIM(customer_segment)) = 'corporate'

UPDATE dbo.orders_cleaned
SET customer_segment = 'Consumer'
WHERE LOWER(TRIM(customer_segment)) = 'consumer'

===========================================================================================================
  product_category
===========================================================================================================
UPDATE dbo.orders_cleaned
SET product_category = 'Beauty'
WHERE LOWER(TRIM(product_category)) = 'beauty'

UPDATE dbo.orders_cleaned
SET product_category = 'Electronics'
WHERE LOWER(TRIM(product_category)) = 'electronics'

UPDATE dbo.orders_cleaned
SET product_category = 'Fashion'
WHERE LOWER(TRIM(product_category)) = 'fashion'

UPDATE dbo.orders_cleaned
SET product_category = 'Home'
WHERE LOWER(TRIM(product_category)) = 'home'

=========================================================================================================
  payment method
=========================================================================================================
UPDATE dbo.orders_cleaned
SET payment_method = 'Card'
WHERE LOWER(TRIM(payment_method)) = 'card'

UPDATE dbo.orders_cleaned
SET payment_method = 'Cash'
WHERE LOWER(TRIM(payment_method)) = 'cash'

UPDATE dbo.orders_cleaned
SET payment_method = 'Transfer'
WHERE LOWER(TRIM(payment_method)) = 'transfer'

==========================================================================================================
  order_status
==========================================================================================================
UPDATE dbo.orders_cleaned 
SET order_status = 'Cancelled'
WHERE LOWER(TRIM(order_status)) = 'cancelled'

UPDATE dbo.orders_cleaned 
SET order_status = 'Completed'
WHERE LOWER(TRIM(order_status)) = 'completed'

UPDATE dbo.orders_cleaned 
SET order_status = 'Returned'
WHERE LOWER(TRIM(order_status)) = 'returned'

===============================================================================================================
Fixing negatives in quantity; After discussing with the team, I was told that the negatives were input errors
  and i could go ahead and make them positive integers 
===============================================================================================================

UPDATE dbo.orders_cleaned
SET quantity = ABS(quantity)
WHERE quantity < 0;

