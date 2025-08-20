<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<!-- 캐러솔 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

.main-container {
	display:flex;
	width: 85%;
	max-width: 1800px;
	height: 800px;
	margin: 50px auto;
	overflow: hidden;
	border-radius: 10px;
	box-shadow: 0 5px 20px rgba(0,0,0,0.15);
}

/* carousel css code */
.carousel-container {
	flex: 3;
	height: 100%;
}

.carousel-container img {
	height: 100%;
	object-fit: cover; /* 꽉 채우기 */
}

.join-container {
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background: #fff;
	padding: 40px;
	box-shadow: -2px 0 10px rgba(0,0,0,0.1);
	position: relative;
	z-index: 10;
}

.join-container form {
	width: 100%;
	max-width: 320px;
	margin-top: 20px;
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

input[type="text"], 
input[type="email"], 
input[type="password"], 
input[type="date"] {
    width: 100%;
    padding: 8px;
    margin: 5px 0;
    box-sizing: border-box;
}

.duplicate-check {
	font-size: 15px;
	width: 100%;
	padding: 6px;
	background-color: #ffffff;
	border: 2px solid #1A66CC;
	border-radius: 4px;
	color: #222222;
	cursor: pointer;
}

button {
	font-size: 20px;
	font-weight: bold;
	width: 100%;
	padding: 10px;
	background-color: #1A66CC;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0D33B3;
}

</style>

<script defer src="./regist.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>


<div class="main-container">
	<!-- Carousel -->
	<div class="carousel-container">
		<div class="carousel slide h-100" data-bs-ride="carousel">
			<div class="carousel-item active h-100" data-bs-interval="5000">
				<img src="<%=request.getContextPath()%>/img/Busan.jpg" class="d-block w-100 h-100" alt="부산">
			</div>
			<div class="carousel-item h-100" data-bs-interval="5000">
				<img src="<%=request.getContextPath()%>/img/Jeju.jpg" class="d-block w-100 h-100" alt="제주">
			</div>
			<div class="carousel-item h-100" data-bs-interval="5000">
				<img src="<%=request.getContextPath()%>/img/Seoul.jpg" class="d-block w-100 h-100" alt="서울">
			</div>
		</div>
	</div>

	<div class="join-container">
	   <h2 class="container-top">TRABLOG</h2>
	   <form action="insert.do" name="regform" id="regform"
	      method="post" onsubmit="return sendit()">
	      <input type ="hidden" name = "isIdCheck" id = "isIdCheck" value ="n">
	      
	      <p>
	         <input type="text" name="userid" id="userid" maxlength="20" onkeydown ="idModify()" placeholder="아이디">
	         <input class="duplicate-check" type="button" id="btnIdCheck" value="중복체크" onclick="clickBtn()">
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
	         <input type="text" name="name" id="name" placeholder="이름">
	      </p>
	      <p>
	         <input type="text" name="hp" id="hp" placeholder="전화번호">
	      </p>
	      <p>
	         <input type="email" name="email" id="email" placeholder="이메일">
	      </p>
	   	  <p>
	         생년월일 <input type="date" name="birth" id="birth">
	      </p>
	      <p>
	         <button>가입하기</button>
	      </p>
	   </form>
	</div>
</div>

</body>
</html>
