<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="./js/regist.js"></script>
</head>
<body>
   <h2>회원가입</h2>
   <form action="member_ok" name="regform" id="regform"
      method="post" onsubmit="return sendit()">
      <input type ="hidden" name = "isIdCheck" id = "isIdCheck" value ="n">
      
      <p>
         아이디 : <input type="text" name="userid" id="userid" maxlength="20" onkeydown ="idModify()">
         <input type="button" id="btnIdCheck" value="중복체크"
            onclick="clickBtn()">
      </p>
      <p id="checkmsg"></p>
      <p>
         비밀번호 : <input type="password" name="userpw" id="userpw"
            maxlength="20">
      </p>
     
      <p>
         이름 : <input type="text" name="name" id="name">
      </p>
      <p>
         휴대폰 번호 : <input type="text" name="hp" id="hp">
      </p>
      <p>
         이메일 : <input type="text" name="email" id="email">
      </p>
   	  <p>
         생년월일 : <input type="text" name="birth" id="birth" placeholder=예시-19990805>
      </p>
      <p>
         <button>가입완료</button>
         <button type="reset">다시작성</button>
      </p>
   </form>


</body>
</html>
