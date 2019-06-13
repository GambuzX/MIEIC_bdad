.mode columns
.headers on

DROP TRIGGER IF EXISTS trigger1;

CREATE TRIGGER trigger1
AFTER INSERT ON AppearsIn
FOR EACH ROW
WHEN (SELECT user from Likes where New.user=user and new.photo=photo) IS NULL
BEGIN
	INSERT INTO Likes(user, photo) values(New.user, New.photo);
END;