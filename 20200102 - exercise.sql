# 20200102 - exercise
/*
*/



INSERT INTO data1 VALUES('BBK', '바비킴', 1973,'서울','010','0000000',176,20130505);
INSERT INTO data1 VALUES('EJW', '은지원', 1972,'경북','011','8888888',174,20140303);
INSERT INTO data1 VALUES('JKW', '조관우', 1965,'경기','018','9999999',172,20101010);
INSERT INTO data1 VALUES('JYP', '조용필', 1950,'경기','011','4444444',166,20090404);
INSERT INTO data1 VALUES('KBS', '김범수', 1979,'경남','011','2222222',173,20120404);
INSERT INTO data1 VALUES('KKH', '김경호', 1971,'전남','019','3333333',177,20070707);
INSERT INTO data1 VALUES('LJB', '임재범', 1963,'서울','016','6666666',182,20090909);
INSERT INTO data1 VALUES('LSG', '이승기', 1987,'서울','011','1111111',182,20080808);
INSERT INTO data1 VALUES('SSK', '성시경', 1979,'서울','','',186,20131212);
INSERT INTO data1 VALUES('YJS', '윤종신', 1969,'경남','','',170,20050505);

INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('KBS','운동화','전자',30,2);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('KBS','노트북','전자',1000,1);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('JYP','모니터','전자',200,1);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('BBK','모니터','전자',200,5);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('KBS','청바지','의류',50,3);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('BBK','메모리','전자',80,10);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('SSK','책','서적',15,5);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('EJW','책','서적',15,2);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('EJK','청바지','의류',50,1);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('BBK','운동화','전자',30,2);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('EJW','책','서적',15,1);
INSERT INTO data2(userID,prodName,groupName,price,amount) VALUES('BBK','운동화','전자',30,2);

#SELECT d2.prodName, d2.groupNAme, d2. FROM data1 AS d1 INNER JOIN data2 AS d2 ON d1.userID = 'BBK' AND d2.userID = d1.userID;

-- BBK가 구매한 데이터를 출력하시오.
SELECT prodName, groupname, price, amount FROM data2 WHERE userID = 'BBK';

-- 김씨인 사람 중 이름과 키를 기준으로 이름, 키, 주소를 내림차순으로 출력하시오.(이름 뒤에는 '님'을 붙여서 출력)
SELECT concat(NAME, '님') NAME, height, addr FROM data1 WHERE NAME LIKE '김%' ORDER BY NAME DESC;

-- user를 출생년도별 오름차순으로 이름, 주소, 키, 출생년도를 출력하시오.(이름은 성을 빼고 출력)
SELECT substr(NAME, 2,3) NAME, addr, height, birthYear FROM data1 ORDER BY birthYear ASC;

-- 모바일 번호가 011로 시작하는 사람이 몇명인지 출력하시오.
SELECT COUNT(*) FROM data1 WHERE mobile1 LIKE '011';

-- 출생년도가 1960년에서 1979년까지 태어난 사람들이 구매한 품목을 출력하시오.
##??????
SELECT d2.prodName FROM data1 d1 INNER JOIN data2 d2 on d1.userID = d2.userID
	AND d1.birthYear > 1960 AND d1.birthYear <= 1979;

SELECT prodName FROM data2 WHERE userID IN (SELECT userID FROM data1
                                          WHERE birthYear between 1960 AND 1979);

-- UserID 별로 구매한 price, amount 합계를 출력하시오.(이때 userID는 name으로 출력하시오)
SELECT userID, amount * price FROM data2 GROUP BY userID;


-- 주소가 서울인 사람이 구매한 총액을 구하시오.
-- 품목별 판매 총액을 출력하시오.
-- 출생년도가 1970년도 이상인 사람을 대상으로 구매한 갯수가 2개 이상인 것의 판매 총합계를 구하시오.
-- 모든 유저를 출력하시오.(이름 중에 김씨와 조씨는 모두 컬씨로 바꾸어 출력)
-- 책을 구매한 사람의 이름과 출셩년도와 주소를 출력하시오.
















