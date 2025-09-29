CREATE DATABASE test1;

USE test1;

CREATE TABLE Book(
	BookID INT PRIMARY KEY AUTO_INCREMENT , 
	Title VARCHAR(20) NOT NULL ,
	Author VARCHAR(20) NOT null,
	Publisher VARCHAR(20) NOT null,
	price INT CHECK (price >=0) ,
	PubYear DATE
	);
	
CREATE TABLE MEMBER(
	memberID INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20) NOT NULL,
	phone VARCHAR(20),
	address VARCHAR(20)
	);
	
	
CREATE TABLE Rental(
	RentalID INT PRIMARY KEY AUTO_INCREMENT,
	Memberid INT NOT null,
	BookId INT NOT null,
	RentDate DATE NOT null,
	ReturnDate DATE,
	FOREIGN KEY (MemberID)
		references MEMBER(memberid),
	FOREIGN KEY (BookID)
		REFERENCES book(Bookid)
	);
	
	-- =======================================
-- 테스트 데이터 삽입
-- =======================================

-- 1. Book 테이블에 데이터 추가
INSERT INTO Book(Title, Author, Publisher, price, PubYear) VALUES
('축구의 역사', '김축구', '굿스포츠', 7000, '2020-01-01'),
('축구 아는 여자', '이축구', '굿스포츠', 13000, '2023-05-10'),
('피겨의 정석', '박피겨', '좋은북스', 11000, '2022-08-15'),
('야구란 무엇인가', '최야구', '좋은북스', 9500, '2021-03-01'),
('생존 수영', '정수영', '생각서점', 15000, '2024-02-20');

-- 2. MEMBER 테이블에 데이터 추가
INSERT INTO MEMBER(NAME, phone, address) VALUES
('박지성', '010-1111-2222', '서울'),
('김연아', '010-3333-4444', '경기'),
('손흥민', '010-5555-6666', '강원'),
('이대호', NULL, '부산'); -- 전화번호가 없는 회원

-- 3. Rental 테이블에 데이터 추가
-- 주의: MemberID와 BookID는 위에서 생성된 데이터의 ID(1, 2, 3...)와 일치해야 합니다.
-- (AUTO_INCREMENT는 보통 1부터 시작합니다)
INSERT INTO Rental(MemberID, BookID, RentDate, ReturnDate) VALUES
(1, 1, '2024-01-05', '2024-01-15'),   -- 박지성 회원이 '축구의 역사'를 대여하고 반납함
(1, 2, '2024-02-10', '2024-02-20'),   -- 박지성 회원이 '축구 아는 여자'를 대여하고 반납함
(2, 3, '2024-03-01', '2024-03-10'),   -- 김연아 회원이 '피겨의 정석'을 대여하고 반납함
(3, 1, '2024-03-05', NULL),           -- 손흥민 회원이 '축구의 역사'를 대여하고 아직 반납 안함
(3, 4, '2024-04-11', NULL),           -- 손흥민 회원이 '야구란 무엇인가'를 대여하고 아직 반납 안함
(4, 5, '2024-05-20', '2024-05-30');   -- 이대호 회원이 '생존 수영'을 대여하고 반납함


-- =======================================
-- 데이터 확인
-- =======================================
SELECT * FROM Book;
SELECT * FROM MEMBER;
SELECT * FROM Rental;