<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Cal+Sans&display=swap');

.cal-sans-regular {
	font-family: "Cal Sans", sans-serif;
	font-weight: 400;
	font-style: normal;
	}

html, body {
	font-family: 'Noto Sans KR', sans-serif;
	height: 100%;
	margin: 0;
}

.container {
	position: absolute;
	top: 50%;
	right: 100px; /* 오른쪽 여백 */
	transform: translateY(-50%);
	width: 300px;
	padding: 20px;
	background: rgba(255, 255, 255, 0.9);
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.container-top {
	font-family: "Cal Sans", sans-serif;
	font-size: 45px;
	text-align: center;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 8px;
	margin: 5px 0;
	box-sizing: border-box;
}

button {
	font-size: 20px;
	width: 100%;
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}



</style>



<script defer src="./regist.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>

<div class="container">
   <h2 class="container-top">TRABLOG</h2>
   <form action="insert.do" name="regform" id="regform"
      method="post" onsubmit="return sendit()">
      <input type ="hidden" name = "isIdCheck" id = "isIdCheck" value ="n">
      
      <p>
         <input type="text" name="userid" id="userid" maxlength="20" placeholder="아이디">
		
         <input type="button" id="btnIdCheck" value="중복체크">
			<input type="text" name="name" id="name" placeholder="이름">
      </p>
      <p id="checkmsg"></p>
      <p>
         <input type="password" name="userpw" id="userpw"
            maxlength="20" placeholder="비밀번호">
      </p>
      <p>
    	<input type="password" name="userpw_check" id="userpw_check" maxlength="20" placeholder="비밀번호 확인">
	  </p>
     
      <p>
      </p>
      <p>
         <input type="text" name="hp" id="hp" placeholder="전화번호">
      </p>
      <p>
         <input type="text" name="email" id="email" placeholder="이메일">
      </p>
   	  <p>
         <input type="text" name="birth" id="birth" placeholder="생년월일 8자리">
      </p>
      <p>
         <button>가입하기</button>
      </p>
   </form>
</div>


</body>
</html>
