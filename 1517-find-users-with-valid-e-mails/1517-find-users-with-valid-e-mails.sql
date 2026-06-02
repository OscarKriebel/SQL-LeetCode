/* Write your T-SQL query statement below */
SELECT *
FROM Users
WHERE mail COLLATE Latin1_General_CS_AS LIKE '%@leetcode.com'
    AND mail LIKE '[A-z]%'
    AND LEFT(mail, LEN(mail) - 13) NOT LIKE '%[^A-z0-9_\.\-]%'