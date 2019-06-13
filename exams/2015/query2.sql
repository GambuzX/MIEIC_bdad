.mode columns
.headers on

SELECT name
FROM User U1
WHERE NOT EXISTS (SELECT * FROM Photo P join User U2 ON P.user=U2.id WHERE U2.id=U1.id);