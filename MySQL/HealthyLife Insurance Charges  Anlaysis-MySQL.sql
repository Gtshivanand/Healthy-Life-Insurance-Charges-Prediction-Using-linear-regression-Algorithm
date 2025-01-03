create database HealthyLifeInsurance ;

use HealthyLifeInsurance ;

SHOW TABLES;

DESCRIBE insurance ;

select*from insurance ;

# 1. Total insurance charges across all individuals:

SELECT SUM(charges) AS total_charges FROM insurance;

# 2. Average charges by gender:

SELECT sex, AVG(charges) AS average_charges 
FROM insurance 
GROUP BY sex 
ORDER BY average_charges DESC;

# 3. Top 10 highest charges:

SELECT * FROM insurance ORDER BY charges DESC LIMIT 10;

# 4. Count of individuals based on smoking status:

SELECT smoker, COUNT(*) AS count FROM insurance GROUP BY smoker;

# 5. Average BMI by region:

SELECT region, AVG(bmi) AS average_bmi 
FROM insurance 
GROUP BY region 
ORDER BY average_bmi DESC;

# 6. Region contributing the highest total charges:

SELECT region, SUM(charges) AS total_charges 
FROM insurance 
GROUP BY region 
ORDER BY total_charges DESC 
LIMIT 1;

# 7. Number of individuals with BMI greater than 30 (indicating obesity):

SELECT COUNT(*) AS obese_count FROM insurance WHERE bmi > 30;

# 8. Correlation between the number of children and charges:

SELECT children, AVG(charges) AS average_charges 
FROM insurance 
GROUP BY children 
ORDER BY average_charges DESC;

# 9. Percentage of smokers in the dataset:

SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM insurance)) AS smoker_percentage 
FROM insurance 
WHERE smoker = 'yes';

# 10. Age group with the highest average charges:

SELECT CASE 
         WHEN age BETWEEN 18 AND 25 THEN '18-25' 
         WHEN age BETWEEN 26 AND 35 THEN '26-35' 
         WHEN age BETWEEN 36 AND 45 THEN '36-45' 
         WHEN age BETWEEN 46 AND 55 THEN '46-55' 
         ELSE '56+' 
       END AS age_group, 
       AVG(charges) AS average_charges 
FROM insurance 
GROUP BY age_group 
ORDER BY average_charges DESC;

# 11. Effect of smoking on charges (smokers vs. non-smokers):

SELECT smoker, AVG(charges) AS average_charges 
FROM insurance 
GROUP BY smoker 
ORDER BY average_charges DESC;

# 12. Top 5 individuals with the highest BMI:

SELECT * FROM insurance ORDER BY bmi DESC LIMIT 5;

# 13. Region with the highest percentage of smokers:

SELECT region, 
       (COUNT(CASE WHEN smoker = 'yes' THEN 1 END) * 100.0 / COUNT(*)) AS smoker_percentage 
FROM insurance 
GROUP BY region 
ORDER BY smoker_percentage DESC 
LIMIT 1;

# 14. Average charges for individuals with and without children:
SELECT CASE 
         WHEN children > 0 THEN 'With Children' 
         ELSE 'No Children' 
       END AS category, 
       AVG(charges) AS average_charges 
FROM insurance 
GROUP BY category;

# 15. Gender-wise count of smokers:
SELECT sex, smoker, COUNT(*) AS count 
FROM insurance 
GROUP BY sex, smoker 
ORDER BY sex, smoker;

# 16. Age and charges relationship for smokers:
SELECT age, AVG(charges) AS average_charges 
FROM insurance 
WHERE smoker = 'yes' 
GROUP BY age 
ORDER BY average_charges DESC;

# 17. Identify individuals who are likely overweight (BMI > 25) but have low charges (< $5,000):
SELECT * 
FROM insurance 
WHERE bmi > 25 AND charges < 5000;

# 18. Highest charges in each region by smoker status:
SELECT region, smoker, MAX(charges) AS highest_charges 
FROM insurance 
GROUP BY region, smoker 
ORDER BY region, smoker;

# 19. Distribution of individuals by BMI categories (Underweight, Normal, Overweight, Obese):
SELECT CASE 
         WHEN bmi < 18.5 THEN 'Underweight' 
         WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal' 
         WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight' 
         ELSE 'Obese' 
       END AS bmi_category, 
       COUNT(*) AS count 
FROM insurance 
GROUP BY bmi_category 
ORDER BY count DESC;

# 20. Top 5 oldest individuals with the highest insurance charges:

SELECT * 
FROM insurance 
ORDER BY age DESC, charges DESC 
LIMIT 5;

# 21. Average charges by gender and smoking status:
SELECT sex, smoker, AVG(charges) AS average_charges 
FROM insurance 
GROUP BY sex, smoker 
ORDER BY sex, smoker;

# 22. Effect of having children on charges for smokers and non-smokers:
SELECT smoker, 
       CASE 
         WHEN children > 0 THEN 'With Children' 
         ELSE 'No Children' 
       END AS category, 
       AVG(charges) AS average_charges 
FROM insurance 
GROUP BY smoker, category 
ORDER BY smoker, category;

# 23. Identify regions where individuals with BMI > 30 have the highest average charges:
SELECT region, AVG(charges) AS average_charges 
FROM insurance 
WHERE bmi > 30 
GROUP BY region 
ORDER BY average_charges DESC;






