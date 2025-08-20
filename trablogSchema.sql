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
postLocation VARCHAR(50) NOT NULL,
postContent mediumtext NOT NULL
);

DROP TABLE tb_post;

 select * from tb_post;