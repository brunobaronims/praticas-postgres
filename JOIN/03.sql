SELECT users.id AS id, users.name AS name, courses.name AS course, schools.name AS school, educations."endDate" AS "endDate"
FROM users
INNER JOIN educations ON educations."userId"=users.id
INNER JOIN schools ON schools.id=educations."schoolId"
INNER JOIN courses ON courses.id=educations."courseId"
WHERE users.id='30';