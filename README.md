# SIA-Web-Project
공간정보 아카데미 2차 프로젝트


text 실시간 연동
https://make-somthing.tistory.com/24
https://honeystorage.tistory.com/274

https://ccomccomhan.tistory.com/164?category=639596

https://honeystorage.tistory.com/274

마우스포인터 ㅋㅋ
https://www.mf2fm.com/rv/dhtmlheartcursor.php


버전관리
https://leeeeeyeon-dev.tistory.com/96


	<Resource name="jdbc/webProject"
		auth="Container"
		type="javax.sql.DataSource"
		maxTotal="20"
		maxIdle="10"
		driverClassName="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/newhr?serverTimezone=UTC"
		username="root"
		password="rootroot" />

-------------------------------------------------------------------------- sql 

CREATE DATABASE IF NOT EXISTS login;
USE login;
use login;

1. user 테이블
CREATE TABLE tb_user ( #user는 안된대
			pkid int auto_increment primary key,
		    loginId VARCHAR(50) NOT NULL UNIQUE,
		    loginPw VARCHAR(100) NOT NULL,
		    loginName VARCHAR(50) NOT NULL,
		    phoneNumber VARCHAR(20),
		    email VARCHAR(100),
		    birth varchar(100)
		);

		DROP TABLE tb_member;
		DROP TABLE tb_user;

		select * from tb_user;


2. post 테이블

   
