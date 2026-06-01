/* Write your T-SQL query statement below */
SELECT 
    (2 * (CEILING((id * 1.0) / 2) - 1)) + ROW_NUMBER() OVER (PARTITION BY CEILING((id * 1.0) / 2) ORDER BY id DESC) AS id,
    student
FROM Seat
ORDER BY id