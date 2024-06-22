/* 
These are the SQL queries used to support the analysis.
*/

-- 1. Find count (number of customers) in each customer age group
SELECT Customer_Age, COUNT(Customer_Age) AS age_count
FROM Customers
GROUP BY Customer_Age



-- 2. Find percentage of customers in each marital status group
WITH total_count AS (
  SELECT COUNT(*) AS total
  FROM Customers
),
group_count AS (
  SELECT Marital_Status, COUNT(Marital_Status) AS marital_status_count
  FROM Customers
  GROUP BY Marital_Status
)

SELECT c.Marital_Status, ROUND((c.marital_status_count * 100.0 / t.total), 2) AS count_percentage
FROM group_count AS c, total_count AS t

 
 
 -- 3. Find count (number of customers) in each income category
SELECT Income_Category, COUNT(Income_Category) AS income_cat_count
FROM Customers
GROUP BY Income_Category



-- 4. Look at attrition flag by education level and find number of customers in each group
SELECT Attrition_Flag, Education_Level, COUNT(CLIENTNUM) AS counts
FROM Customers
GROUP BY Attrition_Flag, Education_Level
ORDER BY Attrition_Flag, Education_Level, counts DESC



-- 5. Find number of existing customers vs. attrited customers
SELECT Attrition_Flag, COUNT(Attrition_Flag) As customer_type
FROM Customers
GROUP BY Attrition_Flag