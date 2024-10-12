/* Getting Started:
Enter "USE {database};" before entering your SQL statements.
Type "--your question" + Enter to try out AI-generated SQL queries
Declare a parameter like "Where id = ${arg}".
*/
USE test;
SELECT Project.title as Project_title,
  Parcel.title as Parcel_title,
  Parcel_Project.amount
FROM Parcel
LEFT JOIN  Parcel_Project ON Parcel_Project.parcel_id = Parcel.parcel_id
LEFT JOIN Project ON Parcel_Project.project_id = Project.project_id
  WHERE
  (
    Project.project_id = ${project_id}
    OR ${project_id} = 'allproject'
  )
ORDER BY startDate DESC LIMIT 10;