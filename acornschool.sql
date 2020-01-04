-- --------------------------------------------------------
-- 호스트:                          192.168.1.243
-- 서버 버전:                        5.5.64-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- acornschool 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `acornschool` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `acornschool`;

-- 테이블 acornschool.pet 구조 내보내기
CREATE TABLE IF NOT EXISTS `pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- 테이블 데이터 acornschool.pet:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` (`id`, `name`, `owner`, `species`, `sex`, `birth`, `death`) VALUES
	(8, '돌이', 'acorn', '곰', 'f', '2014-08-01', '2016-02-01'),
	(9, '대한', '민주', 'cat', 'f', '2001-02-04', NULL),
	(10, '민국', '자유', 'cat', 'f', '2010-03-17', NULL),
	(11, '만세', '민주', 'cat', 'f', '2010-05-13', NULL),
	(12, '하자', '민주', 'cat', 'm', '2015-08-27', NULL),
	(13, '성공', '자유', 'cat', 'm', '2017-08-31', '2018-04-29'),
	(19, '마음', 'acorn', '백구', 'f', '2018-01-02', '2018-11-04');
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;

-- 프로시저 acornschool.pet_delete 구조 내보내기
DELIMITER //
CREATE PROCEDURE `pet_delete`(
	IN `inname` VARCHAR(50),
	OUT `res` INT
)
    COMMENT 'inname 은 클라이언트 올라오는것. res는 나가는것'
BEGIN
	DECLARE cnt INT DEFAULT 0;
	SELECT COUNT(*) INTO cnt FROM pet WHERE NAME = inname;    # 카운트에서 나온 값을 pet에 넣기
	if cnt > 0 then DELETE FROM pet WHERE NAME = inname;
	SET res = 0;
	ELSE SET res = 2;
	END if;
END//
DELIMITER ;

-- 프로시저 acornschool.pet_insert 구조 내보내기
DELIMITER //
CREATE PROCEDURE `pet_insert`(
	IN `name` VARCHAR(50),
	IN `owner` VARCHAR(50),
	IN `species` VARCHAR(50),
	IN `sex` CHAR(1),
	IN `birth` DATE,
	IN `death` DATE
)
BEGIN
	INSERT INTO pet(NAME, OWNER, species, sex, birth, death)     # 필드이름
	VALUES(NAME,OWNER, species, sex, birth, death);      # 변수이름
END//
DELIMITER ;

-- 프로시저 acornschool.pet_select 구조 내보내기
DELIMITER //
CREATE PROCEDURE `pet_select`()
BEGIN
	SELECT * FROM pet;
END//
DELIMITER ;

-- 프로시저 acornschool.pet_update 구조 내보내기
DELIMITER //
CREATE PROCEDURE `pet_update`(
	IN `searchname` VARCHAR(50),
	IN `updatename` VARCHAR(50),
	OUT `res` INT
)
    COMMENT 'res는 출력이라서 out'
BEGIN
	DECLARE cnt INT DEFAULT 0;    #  변수명, 데이터타입, 디폴트는 0
	SELECT COUNT(*) INTO cnt FROM pet WHERE NAME = searchname;   # 전부다 확인해본다, 검색어와 같으면 키운트 올라감
	if cnt >0 then UPDATE pet SET NAME = updatename   # 그 값이 0보다 크면 update  gownrh 
		WHERE NAME = searchname;
		set res = 0;   # 변수에 입력할때는 set
	ELSE SET res = 2;   # 업데이트 안돼면 2를 출력
	END if;
END//
DELIMITER ;

-- 테이블 acornschool.sungjuk 구조 내보내기
CREATE TABLE IF NOT EXISTS `sungjuk` (
  `bunho` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `kor` int(11) DEFAULT NULL,
  `mat` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`bunho`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- 테이블 데이터 acornschool.sungjuk:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sungjuk` DISABLE KEYS */;
INSERT INTO `sungjuk` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`) VALUES
	(1, '1', 1, 1, 1, NULL, NULL, NULL),
	(2, '??', 1, 1, 1, NULL, NULL, NULL),
	(3, '??', 23, 23, 23, NULL, NULL, NULL),
	(4, '?', 1, 1, 1, NULL, NULL, NULL),
	(5, '?', 12, 12, 12, NULL, NULL, NULL),
	(6, '??', 10, 10, 10, NULL, NULL, NULL),
	(7, '??', 1, 2, 3, NULL, NULL, NULL),
	(8, '??', 3, 4, 5, NULL, NULL, NULL);
/*!40000 ALTER TABLE `sungjuk` ENABLE KEYS */;

-- 프로시저 acornschool.sungjuk_delete 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_delete`(
	IN `in_name` VARCHAR(50),
	OUT `out_res` INT
)
BEGIN
	DECLARE cnt INT DEFAULT 0;
	SELECT COUNT(*) INTO cnt FROM sungjuk WHERE NAME = in_name;
	if cnt > 0 then DELETE FROM sungjuk WHERE NAME = in_name;
		SET out_res = 0;
	ELSE SET out_res := 2;
	END if;
END//
DELIMITER ;

-- 프로시저 acornschool.sungjuk_insert 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_insert`(
	IN `in_name` VARCHAR(20),
	IN `in_kor` INT,
	IN `in_mat` INT,
	IN `in_eng` INT
)
BEGIN
	INSERT INTO sungjuk (NAME, kor, mat, eng)
	VALUES(in_name, in_kor, in_mat, in_eng);
END//
DELIMITER ;

-- 프로시저 acornschool.sungjuk_select 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_select`()
BEGIN
	SELECT * FROM sungjuk;
END//
DELIMITER ;

-- 프로시저 acornschool.sungjuk_update 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_update`(
	IN `searchname` VARCHAR(50),
	IN `updatename` VARCHAR(50),
	OUT `res` INT
)
BEGIN
	DECLARE cnt INT DEFAULT 0;    #  변수명, 데이터타입, 디폴트는 0
	SELECT COUNT(*) INTO cnt FROM sungjuk WHERE NAME = searchname;   # 전부다 확인해본다, 검색어와 같으면 키운트 올라감
	if cnt >0 then UPDATE sungjuk SET NAME = updatename   # 그 값이 0보다 크면 update  gownrh 
		WHERE NAME = searchname;
		set res = 0;   # 변수에 입력할때는 set
	ELSE SET res = 2;   # 업데이트 안돼면 2를 출력
	END if;
END//
DELIMITER ;

-- 프로시저 acornschool.sungjuk_update2 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_update2`(
	IN `in_name` VARCHAR(50),
	IN `up_name` VARCHAR(50),
	OUT `out_res` INT
)
BEGIN

	DECLARE cnt INT DEFAULT 0;
	SELECT COUNT(*) INTO cnt from sungjuk WHERE NAME = in_name;
	
	if cnt > 0 then UPDATE sungjuk SET NAME = up_name, kor = in_kor, mat = in_mat, eng = in_eng WHERE NAME = in_name;
		SET out_res := 0;
	ELSE SET out_res := 2;
	END if;
	
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
