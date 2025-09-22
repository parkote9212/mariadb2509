DELIMITTER //
CREATE PROCEDURE myProc()
BEGIN
	SELECT * FROM membertbl WHERE memberName = '당탕이';
	SELECT * FROM producttbl WHERE productName = '냉장고';
END //
DELIMITER;
