-- data exploration 
--here have to add import over csv data file into database ...in the import/export option in the table right click 
--check the UTF extenshion always and remove the primary key that we include while the creating the table 

--count the table rows so indentity the table inserted correct or not 
select count(*) from zepto;

-- look at the sample data 
select * from zepto limit 10;

--check the null values
select * from zepto
where name is NULL
OR
category is NULL
or
 mrp is NULL
or
discountPercent is NULL
or
availableQuantity is NULL
or
 weightInGms is NULL
or
 outOfStock is NULL
or 
 quantity is NULL;

--different product catergory
SELECT DISTINCT category from 
zepto order by category;

--product in stcok vs product of stock
SELECT outOfStock,count(sku_id) as number_item
from zepto GROUP BY outOfStock;

--product names present multiple time 
SELECT name,COUNT(sku_id) 
FROM zepto
GROUP BY name
HAVING COUNT(sku_id)>1
ORDER BY COUNT(sku_id) DESC;

--data cleaning 

--product with price =0

SELECT * FROM zepto where 
mrp=0 OR discountSellingPrice=0;

--now we have to delete that product having value 0

DELETE from zepto 
where mrp=0;