# Write your MySQL query statement below
SELECT DISTINCT e.employee_id,
       e.department_id
FROM Employee e JOIN 
(SELECT employee_id,
        COUNT(*) AS cnt FROM EMPLOYEE
        GROUP BY employee_id) AS st
ON e.employee_id = st.employee_id
WHERE primary_flag = 'Y' OR st.cnt = 1