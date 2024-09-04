/* Getting Started:
Enter "USE {database};" before entering your SQL statements.
Type "--your question" + Enter to try out AI-generated SQL queries
Declare a parameter like "Where id = ${arg}".
*/
USE test;
SELECT
  Parcel.group,
  COUNT(Parcel.group) as COUNT
FROM
  Parcel
  INNER JOIN Parcel_Project ON Parcel_Project.parcel_id = Parcel.parcel_id
  INNER JOIN Project ON Parcel_Project.project_id = Project.project_id
WHERE
  (
    Project.project_id = ${project_id}
    OR ${project_id} = ''
  )
GROUP BY
  Parcel.group
HAVING
  COUNT(Parcel.group) > 1
ORDER BY
  COUNT(Parcel.group) DESC;