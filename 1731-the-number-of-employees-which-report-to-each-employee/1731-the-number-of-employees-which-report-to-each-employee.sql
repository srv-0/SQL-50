# Write your MySQL query statement below
SELECT e.employee_id,
       e.name,
       st.cnt AS reports_count,
       st.avg_age AS average_age
FROM Employees e LEFT JOIN 
(SELECT reports_to AS employee_id,
        ROUND(AVG(age)) AS avg_age,
        COUNT(reports_to) AS cnt FROM Employees
WHERE reports_to IS NOT NULL
GROUP BY reports_to) st

ON e.employee_id = st.employee_id
WHERE st.cnt IS NOT NULL
ORDER BY e.employee_id
