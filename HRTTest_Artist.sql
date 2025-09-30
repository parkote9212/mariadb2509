USE hrdtest;

CREATE TABLE Artist (
    ArtistNo INT PRIMARY KEY AUTO_INCREMENT,
    ArtistName VARCHAR(30) NOT NULL UNIQUE,
    DebutDate DATE NOT NULL,
    Genre VARCHAR(20) NOT NULL,
    Agency VARCHAR(30)
);

CREATE TABLE Album (
    AlbumNo INT PRIMARY KEY AUTO_INCREMENT,
    ArtistNo INT,
    AlbumTitle VARCHAR(50) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Sales INT CHECK(Sales >= 0),
    FOREIGN KEY (ArtistNo) REFERENCES Artist(ArtistNo)
);

INSERT INTO Artist (ArtistName, DebutDate, Genre, Agency) VALUES
('방탄소년단', '2013-06-13', 'K-POP', 'HYBE'),
('블랙핑크', '2016-08-08', 'K-POP', 'YG Entertainment'),
('아이유', '2008-09-18', 'K-POP/발라드', 'EDAM Entertainment'),
('NewJeans', '2022-08-01', 'K-POP', 'ADOR'),
('세븐틴', '2015-05-26', 'K-POP', 'PLEDIS Entertainment'),
('aespa', '2020-11-17', 'K-POP', 'SM Entertainment'),
('임영웅', '2016-08-08', '트로트/발라드', '물고기뮤직');

INSERT INTO Album (ArtistNo, AlbumTitle, ReleaseDate, Sales) VALUES
-- 방탄소년단 (ArtistNo: 1)
(1, 'MAP OF THE SOUL : 7', '2020-02-21', 5000000),
(1, 'BE', '2020-11-20', 3700000),
(1, 'Love Yourself 承 `Her`', '2017-09-18', 3000000),
(1, 'Proof', '2022-06-10', 3400000),
-- 블랙핑크 (ArtistNo: 2)
(2, 'THE ALBUM', '2020-10-02', 1500000),
(2, 'BORN PINK', '2022-09-16', 2800000),
(2, 'SQUARE UP', '2018-06-15', 500000),
-- 아이유 (ArtistNo: 3)
(3, 'LILAC', '2021-03-25', 400000),
(3, 'Love poem', '2019-11-18', 250000),
(3, 'Palette', '2017-04-21', 100000),
(3, 'The Winning', '2024-02-20', 350000),
-- NewJeans (ArtistNo: 4)
(4, 'NewJeans 1st EP `New Jeans`', '2022-08-01', 1500000),
(4, 'OMG', '2023-01-02', 1600000),
(4, 'Get Up', '2023-07-21', 2000000),
-- 세븐틴 (ArtistNo: 5)
(5, 'An Ode', '2019-09-16', 1100000),
(5, 'FML', '2023-04-24', 6200000),
(5, 'SEVENTEENTH HEAVEN', '2023-10-23', 5200000),
-- aespa (ArtistNo: 6)
(6, 'Savage', '2021-10-05', 800000),
(6, 'MY WORLD', '2023-05-08', 2100000),
-- 임영웅 (ArtistNo: 7)
(7, 'IM HERO', '2022-05-02', 1150000);


-- k-pop 가수
SELECT ArtistName '아티스트명', Agency '소속사', Genre '장르'
FROM Artist
WHERE genre = 'K-POP';

-- 판매량이 1,000,000 이상인 앨범의 제목과 판매량을 조회

SELECT AlbumTitle '앨범명', Sales '판매량'
FROM Album
WHERE (sales >=1000000);

-- 아티스트별 총 판매량을 구하시오.
SELECT A.ArtistName '아티스트명', SUM(B.Sales) `총 판매량`
FROM Artist A
INNER JOIN Album B
	ON A.ArtistNo = B.ArtistNo
GROUP BY A.ArtistName
ORDER BY
	`총 판매량` DESC;
	
	
-- 4. 수정: 아이유의 소속사를 '카카오엔터테인먼트'로 수정하시오
UPDATE Artist
SET Agency = '카카오엔터테이먼트'
WHERE ArtistName = '아이유';

SELECT * FROM Artist
WHERE ArtistName = '아이유';

-- 5. 삭제 : 앨범No가 1인 앨범 삭제
DELETE FROM Album
WHERE AlbumNo = 1;


-- 소속사별 판매량
SELECT
    A.Agency '소속사',
    COUNT(DISTINCT A.ArtistName) `아티스트 수`,
    SUM(B.Sales) `총 판매량`
FROM
    Artist  A
LEFT JOIN
    Album B ON A.ArtistNo = B.ArtistNo
GROUP BY
    A.Agency
ORDER BY
    `총 판매량` DESC;
