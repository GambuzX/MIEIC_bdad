.mode columns
.headers on

SELECT caption
FROM Photo P join User U ON P.user=U.id
WHERE U.name='Daniel Ramos'
AND julianday(P.uploadDate) - julianday(P.creationDate) = 2;