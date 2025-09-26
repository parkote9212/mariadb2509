USE sqldb;
-- packet값 오류
insert INTO maxtbl VALUES (repeat('A',10000000), repeat('가',10000000));
SELECT LENGTH(col1), LENGTH(col2) FROM maxtbl;
SHOW VARIABLES LIKE 'max%';