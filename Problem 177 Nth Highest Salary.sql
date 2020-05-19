/*
LeetCode
Problem: 177 Nth Highest Salary

Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M = (SELECT COUNT(DISTINCT SALARY) FROM EMPLOYEE);
  RETURN (
      # Write your MySQL query statement below.
      
      CASE
      WHEN N <= M THEN
      (SELECT SALARY FROM (SELECT DISTINCT SALARY 
      FROM EMPLOYEE
      ORDER BY SALARY DESC
      LIMIT N) AS RESULT
      ORDER BY SALARY
      LIMIT 1)
      ELSE NULL
      
     END
  );
END
--------------------------------------------------------------
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M = N-1;
  RETURN (
      # Write your MySQL query statement below.
      
      SELECT DISTINCT SALARY FROM EMPLOYEE
      ORDER BY SALARY DESC LIMIT M, 1
  );
END