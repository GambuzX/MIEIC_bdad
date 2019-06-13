.mode columns
.headers on

DELETE FROM Photo
WHERE julianday('2010-01-01') - julianday(uploadDate) > 0
AND NOT EXISTS(SELECT AI.photo
				FROM AppearsIn AI
				WHERE AI.photo=id
				GROUP BY AI.photo
				HAVING count(distinct Ai.user)>=2);