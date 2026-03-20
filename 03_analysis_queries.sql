--in our dataset the value are in paise we have to convert into rupees
UPDATE zepto
set mrp=mrp/100.0,
discountSellingPrice=discountSellingPrice/100.0;

select mrp,discountSellingPrice from zepto;

--Q1. Find the top 10 best-value product name
		--based on the discount percentage 
SELECT DISTINCT name,mrp,discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--Q2.What are the products with high MRP but of Stock.
SELECT DISTINCT name,mrp
FROM zepto 
WHERE outOfStock = TRUE and 
mrp >300 ORDER BY mrp DESC;

--Q3. Calculate Estimated Revenue for each category
SELECT category,
sum(discountSellingPrice*availableQuantity) AS TOTAL_REVENUE_EACH_CATEGORY
FROM zepto
GROUP BY category
ORDER BY TOTAL_REVENUE_EACH_CATEGORY DESC;

--Q4. Fnd all product where MRP is greater than 500 and discount is less thean 10%
SELECT DISTINCT name,mrp,discountPercent
FROM zepto 
WHERE mrp >500 and discountPercent <10
ORDER BY mrp DESC, discountPercent DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage 
SELECT category,
ROUND(AVG(discountPercent),2) AS AVG_DISCOUNT 
FROM zepto 
GROUP BY category 
ORDER BY AVG_DISCOUNT DESC
LIMIT 5;

--Q6. find the price per garm for products above 100g and sort by best value 
SELECT DISTINCT name,weightInGms,discountSellingPrice,
ROUND(discountSellingPrice/weightInGms,2) AS price_in_gram
FROM zepto 
where weightInGms > 100
ORDER BY price_in_gram;

--Q7 Group the products into categories like low,medium,Bulk
SELECT DISTINCT name,weightInGms,
CASE WHEN weightInGms <1000 THEN 'LOW'
	 WHEN weightInGms <5000 THEN 'MEDIUM'
	 ELSE 'BULK'
	 END AS weight_category
FROM zepto;	 

--Q8. What is the Total Inventory weight per category
SELECT category,
ROUND(SUM(weightInGms*availableQuantity),2)AS total_quantity
FROM zepto
GROUP BY category 
ORDER BY total_quantity DESC;

