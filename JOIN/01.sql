SELECT users.id AS id, users.name AS name, cities.name AS city
FROM users
INNER JOIN cities ON users."cityId"=cities.id
WHERE cities.name='Rio de Janeiro';