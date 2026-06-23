# Write your MySQL query statement below
SELECT st.product_id,
       st.fy AS first_year,
       quantity,
       price 
FROM Sales s JOIN 
(SELECT product_id, MIN(year) AS fy FROM Sales GROUP BY product_id) st
ON s.year = st.fy AND s.product_id = st.product_id
-- GROUP BY st.product_id