/*
LeetCode
Problem: 196 Delete Duplicate Emails

Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.

For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+

Note:

Your output is the whole Person table after executing your sql. Use delete statement.
*/

DELETE P1 FROM PERSON P1, PERSON P2
WHERE P1.EMAIL = P2.EMAIL AND P1.ID > P2.ID

-------------------------------------------------------------

DELETE FROM PERSON 
WHERE ID NOT IN (SELECT MIN(P.ID) FROM (SELECT * FROM PERSON) P
                                    GROUP BY P.EMAIL)
                                    
--------------------------------------------------------------------

DELETE FROM PERSON
WHERE ID  NOT IN 
            (SELECT ID1 FROM (
                             SELECT EMAIL, MIN(ID) AS ID1
                             FROM PERSON
                             GROUP BY EMAIL)AS T)                          