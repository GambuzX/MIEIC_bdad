.mode columns
.headers on

DROP VIEW IF EXISTS LikedPhotos;
DROP VIEW IF EXISTS UserCountPerPhoto;

CREATE VIEW LikedPhotos AS
SELECT P.id
FROM Likes L join Photo P
ON L.photo=P.id
GROUP BY P.id
HAVING Count(*)>3;

CREATE VIEW UserCountPerPhoto AS
SELECT AI.photo, COUNT(Ai.user) as quant
FROM AppearsIn AI join LikedPhotos LP
ON AI.photo=LP.id
GROUP BY AI.photo;

SELECT AVG(quant) FROM UserCountPerPhoto;