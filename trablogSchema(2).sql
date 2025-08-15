CREATE DATABASE IF NOT EXISTS trablog; 
use trablog;

CREATE TABLE tb_user ( #user는 안된대 
pkid int auto_increment primary key, 
loginId VARCHAR(50) NOT NULL UNIQUE, 
loginPw VARCHAR(100) NOT NULL, 
loginName VARCHAR(50) NOT NULL, 
phoneNumber VARCHAR(20), 
email VARCHAR(100), 
birth varchar(100) 
);

DROP TABLE tb_user;

 select * from tb_user;
 
 CREATE TABLE tb_post ( #user는 안된대 
pkid int auto_increment primary key, 
postTitle VARCHAR(50) NOT NULL UNIQUE, 
postLocation VARCHAR(50) NOT NULL,  #이것도 regions에서 받아야 하나?
postContent mediumtext NOT NULL
#유저 name or id 받기 (foreignkey로 그래야 게시글 당 유저가 저장됨)
);

DROP TABLE tb_post;

 select * from tb_post;
 
 create table tb_regions (
 sggCode varchar(10) not null PRIMARY KEY,
 sidoName varchar(20) not null,
 sggName varchar(20) not null,
 label varchar(30) not null 
 );
 
 DROP TABLE tb_regions;

 select * from tb_regions;
 
 
 #더미 인서트 데이터 // gpt한테 이렇게 인서트데이터 써달라고 하면 200몇갠가 다 써주긴함 (확인필수)
 INSERT INTO tb_regions (sggCode, sidoName, sggName, label) VALUES
('11020', '서울특별시', '구로구', '서울특별시 구로구'),
('11010', '서울특별시', '강남구', '서울특별시 강남구'),
('31020', '경기도', '수원시', '경기도 수원시'),
('39010', '제주특별자치도', '제주시', '제주특별자치도 제주시'),
('39020', '제주특별자치도', '서귀포시', '제주특별자치도 서귀포시');
 