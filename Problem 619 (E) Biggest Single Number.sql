/*
LeetCode
Problem: 619 (E) Biggest Single Number

Table my_numbers contains many numbers in column num including duplicated ones.
Can you write a SQL query to find the biggest number, which only appears once.

+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 | 

For the sample data above, your query should return the following result:

+---+
|num|
+---+
| 6 |

Note:
If there is no such number, just output null. 
*/

SELECT MAX(T.NUM) AS NUM
FROM
(SELECT NUM, COUNT(NUM) AS C
 FROM MY_NUMBERS
GROUP BY NUM
ORDER BY NUM) AS T
WHERE C = 1