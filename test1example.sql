-- 2020이후 출판된 도서를 검색하시오

USE test1;
SELECT title '도서명', year(pubyear) '출판연도'
FROM book
WHERE pubyear >= 2020-01-01;

SELECT M.name '이름', M.memberId '회원번호', B.Title '도서명', R.RentDate '대출일자' 
FROM ((member M
	Inner JOIN rental R
	ON M.memberID = R.Memberid)
	INNER JOIN book B
	ON R.BookId = B.BookID)
	WHERE m.name = '김연아';

SELECT M.name '이름', M.memberId '회원번호', B.Title '도서명', R.RentDate '대출일자' 
FROM ((member M
	Inner JOIN rental R
	ON M.memberID = R.Memberid)
	INNER JOIN book B
	ON R.BookId = B.BookID)
	WHERE R.ReturnDate IS null;
	
SELECT B.title '도서명' ,B.bookid '도서번호', COUNT(R.bookid) '대출횟수'
FROM book B
	 LEFT outer JOIN rental R 
 	ON R.BookId = B.BookID
 	GROUP BY B.bookID;
 	
SELECT title '책제목', price '가격'
FROM book
ORDER BY price desc
LIMIT 1; 