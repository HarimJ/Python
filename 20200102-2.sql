# 2020. 01.02
# table 'goods' code
INSERT INTO goods VALUES(1, '냉장고', 2, 850000);
INSERT INTO goods VALUES(2, '세탁기', 3, 550000);
INSERT INTO goods VALUES(3, '전자레인지', 2, 350000);
INSERT INTO goods VALUES(4, 'HDTV', 3, 1500000);

# 테이블 만들때 name 은  not null 로 지정했는데
# INSERT INTO goods(CODE,su,dan) VALUES(4,3,1500000);
# primary key = code 기본값이 0 , 코드는 중복이 되면 안됨
# INSERT INTO goods(NAME,su,dan) VALUES("py", 3, 1500000);

SELECT * FROM goods
INSERT INTO goods(CODE, NAME, su) VALUES(5, '드론', 1);
UPDATE goods SET dan = 1000000 WHERE CODE=5; #중복없이 데이터 입력
DELETE FROM goods WHERE CODE = 5
INSERT INTO goods VALUES(5, 'VR기기', 2, 1440000);
INSERT INTO goods VALUES(6, 'Drone', 1, 890000);
INSERT INTO goods(CODE,NAME,su) VALUES(7,'고성능컴퓨터', 3);

# 이름이 냉장고이고 단가가 750000원 이상인 데이터 출력
SELECT * FROM goods WHERE NAME='냉장고'and dan >750000 ;
#단가가 750000원 이하인 제품 출력
SELECT * FROM goods WHERE dan<750000;
# 단가가 500000원 이상이고 1200000이하인 제품출력
SELECT * FROM goods WHERE dan>500000 AND dan<1200000;
# 판매 수량이 3개 이상인 제품명과 단가의 출력
SELECT NAME, dan FROM goods WHERE su>=3;

#-------------------------------------------------------
#school data

INSERT INTO school(schoolname, address,schoolcode, studentcount)
VALUES("충주여자고등학교", "충주시","CH00000001",300);

INSERT INTO school(schoolname, address, schoolcode, studentcount)
VALUES("신성여자고등학교", "제주시","IC00000001",500);

INSERT INTO school(schoolname, address, schoolcode, studentcount)
VALUES ("종로여자고등학교","종로구","JR00000001",300);

INSERT INTO school(schoolname, address, schoolcode, studentcount)
VALUES("제주여자고등학교","서울시","SE00000001",300);


#----------------------------------------------------------------
# student data
INSERT INTO student(NAME, kor, mat, eng, schoolcode)     # 뒤에 name, kor등 은 테이블에 다 있으면 안써도 되는데 
VALUES("전공인",81,81,81,"SE00000001");                  # 여기에는 total, avg 가 없어서 하나하나 써서 지정해야한다. 

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("전공이",81,81,81,"SE00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("전공삼",91,100,100,"CH00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("전공사",100,100,100,"CH00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("고려인",100,100,100,"CH00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("종로구",100,81,71,"IC00000001");

INSERT INTO student(NAME, kor, mat, eng, schoolcode)
VALUES("김만덕",100,81,71,"IC00000001");

SELECT * FROM school;    # 출력하기
SELECT * FROM student;

SELECT * FROM school WHERE schoolcode = 'CH00000001';
SELECT *FROM student WHERE NAME = '고려인';
SELECT NAME, kor, eng, mat FROM student WHERE NAME = '전공인';
SELECT NAME AS '이름',kor AS '국어', mat AS '수학', eng AS '영어'FROM student WHERE NAME = '전공이';

# 서브쿼리
SELECT NAME, kor, mat, eng FROM student WHERE schoolcode 
IN(SELECT schoolcode FROM school WHERE schoolname = '신성여자고등학교');
 
SELECT NAME, kor, mat, eng FROM student WHERE NAME LIKE '전공%';
SELECT NAME, kor, mat, eng FROM student WHERE NAME like '%공%';
SELECT NAME, kor, mat, eng FROM student WHERE NAME LIKE '_려_';   # _ : 글자수 / 여기서는 려가 가운데 있는 3글자

SELECT * FROM student WHERE kor>90 AND mat >90 AND eng>90;
SELECT *FROM student WHERE kor>90 OR mat>90 OR eng>90;
SELECT *FROM student WHERE kor >80 AND kor >90;
SELECT *FROM student WHERE kor BETWEEN 80 AND 100;


# group by, having, order by, limit
SELECT * FROM student LIMIT 1;   # 맨위에 한개를 가져오는것(head 같은)

SELECT * FROM student ORDER BY NAME DESC;   # descending 내림차순 
SELECT * FROM student ORDER BY NAME ASC;    # ascending 오름차순


SELECT sc.schoolname, sc.schoolcode, st.name, st.average     # st : 별칭
     FROM student st INNER JOIN school sc                    # 두개의 조건이 만족  outer
        ON st.schoolcode = sc.schoolcode;

# outer join - 일치하지 않을때.. 

SELECT NAME AS '이름', kor AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME = '전공이';
SELECT CONCAT(NAME, '님') AS '이름', kor AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME = '전공인';
SELECT REPLACE(CONCAT(NAME,'님'),'님','형') AS '이름', LPAD(kor, 10,'*') AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME = '전공삼';
SELECT SUBSTR(REPLACE(CONCAT(NAME,'님'),'님','형'), 1,2) AS '이름', LPAD (kor,10,'*')AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME = '김만덕';
  # as '이름' 에서 처음 1~2 (시작:1, 끝:2) 번째만 출력해라 -> '김만' 
SELECT LENGTH(REPLACE(CONCAT(NAME,'님'),'님','형'),1,2))AS '이름', LPAD(kor, 10,'*') AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME = '김종호';
  # 이름 길이를 출력.. (한글은 한글자당 3개 length, 즉 '김만' = 6개)

# concat : 문자결합. '님'을 출력해라
# repalce :'님'을 '형'으로 바꿔라 
# LPAD : 10개 *을 채워라( 정렬/ L : 왼쪽 부터 시작 )
# substr : 1에서 2를 뽑아라 


# 문제
#(이 문제들 다시 풀어보기)
-- student 중 eng 점수를 출력하되 그 이름을 "영어" 로 하시오.
SELECT eng AS '영어' FROM student;
-- 이름 가운데 자가"공"인 사람을 모두 출력하시오.
SELECT * FROM student WHERE NAME LIKE '%공%';
-- 학교 이름이 충주 여자 고등학교인 사람의 name과 total을 출력하시오.
  # join
SELECT st.name, st.total FROM student AS st INNER JOIN school AS sc ON sc.schoolname = '충주여자고등학교' AND st.schoolcode = sc.schoolcode;
-- student 에서 total 을 이용하여 정렬하고 상위 2사람만 출력하시오.
  # where, group by, having, order by, limit 순서
SELECT * FROM student ORDER BY total DESC LIMIT 2;

   # 문제 내가 푼것
-- 전공인의 국어 : 80, 영어 : 90 으로 변경하고 합계와 평균 그리고 grade 를 수정
   -- 계산을 수동으로 하고 변화만 적용하시오.
update student set kor = 80 WHERE NAME = '전공인';
UPDATE student SET eng = 90 WHERE NAME  = '전공인';
UPDATE student SET total = 251 WHERE NAME = '전공인';
UPDATE student SET average = 83 WHERE NAME = '전공인';
UPDATE student SET grade = 'B' WHERE NAME = '전공인';

  # 선생님 답안
UPDATE student SET eng = 90, kor = 80 WHERE NAME = '전공인';
UPDATE student SET total = 81+80+90, average = ROUND((90+80+81)/3,2), grade = 'B' WHERE NAME = '전공인';
UPDATE student SET total = kor+mat+eng, average = ROUND((90+80+81)/3,2), grade = 'B' WHERE NAME = '전공인';

    # other example
UPDATE student SET total = kor+mat+eng, average = ROUND((90+80+81)/3,2), grade =
(case when score >= 90 then 'A학점'
when(score>=80 AND score<90) then 'B학점'
when(score>=70 AND score<80) then 'C학점'
when(score>=60 AND score<70) then 'D학점'
ELSE 'F학점'
END) WHERE NAME = '전공인';


-- student 중 kor, mat 점수만 출력하시오.
SELECT kor, mat FROM student;

-- student 중 average 가 90이상인 사람의 name, schoolname을 출력하시오. - 
SELECT NAME, schoolname from where student average > 90;

   # 선생님 답안
   # 서로 다른 테이블에 있는 정보라서 join을 써야한다.
SELECT st.name, sc.schoolname FROM student AS st INNER JOIN school AS sc 
	ON st.average > 90 AND st.schoolcode = sc.schoolcode;

#-----------------------------------------------------------

# 저장 프로시져 연습 (서버측에서 테스트 하는것)
CALL student_select();   #- 내가 저장한 함수를 부를때. (내장함수 호출)
CALL student_insert("제주도", 100,100,100, 'IC00000001', @res);
SELECT @res;      # IC 일때는 0 : 성공, tt 일때는 -1 : 실패


# 이름을 변경하는 프로시져 연습
CALL student_updatename("제주도", "제주민", @res);
SELECT @res;


CALL student_sum();


# cursor & fetch 
CALL student_updateone();
SELECT * FROM student;






