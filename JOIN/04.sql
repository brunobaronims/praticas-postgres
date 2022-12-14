SELECT users.id AS id, users.name AS "name", roles.name AS "role", companies.name AS company, experiences."startDate" AS "startDate"
FROM companies
INNER JOIN experiences ON experiences."companyId"=companies.id
INNER JOIN roles ON roles.id=experiences."roleId"
INNER JOIN users ON users.id=experiences."userId"
WHERE users.id='50' AND experiences."endDate" IS NULL;


