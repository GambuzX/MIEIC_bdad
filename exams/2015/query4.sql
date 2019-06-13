.mode columns
.headers on

DROP VIEW IF EXISTS FriendsList;

CREATE VIEW FriendsList AS
SELECT id
FROM User
WHERE name='Daniel Ramos'
UNION
SELECT U2.id
FROM User U1 join Friend F join User U2
WHERE U1.id=F.user1 AND F.user2=U2.id
AND U1.name='Daniel Ramos'
UNION
SELECT U3.id
FROM User U1 join Friend F1 join User U2 join Friend F2 join User U3
WHERE U1.id=F1.user1 AND F1.user2=U2.id AND U2.id=F2.user1 AND F2.user2=U3.id
AND U1.name='Daniel Ramos';


SELECT caption
FROM Photo P1
WHERE EXISTS (SELECT *
				FROM FriendsList FL join AppearsIn AI
				ON FL.id=AI.user
				WHERE AI.photo=P1.id);