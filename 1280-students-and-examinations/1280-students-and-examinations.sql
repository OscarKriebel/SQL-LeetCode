/* Write your T-SQL query statement below */
SELECT
    stud.student_id AS student_id,
    stud.student_name AS student_name,
    sub.subject_name AS subject_name,
    SUM(CASE WHEN exam.student_id IS NULL
             THEN 0 ELSE 1 END
    ) AS attended_exams
FROM Students AS stud
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS exam
    ON stud.student_id = exam.student_id AND sub.subject_name = exam.subject_name
GROUP BY stud.student_id, stud.student_name, sub.subject_name
ORDER BY stud.student_id ASC, sub.subject_name ASC