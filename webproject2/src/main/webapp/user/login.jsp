<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String loginId = null;
if (session.getAttribute("loginId") != null) {
	loginId = (String) session.getAttribute("loginId");
}

// 에러 메시지 가져오기
String errorMessage = null;
if (request.getParameter("error") != null) {
	errorMessage = "회원정보가 없습니다. 다시 입력해 주세요!";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- Bootstrap CSS & JS -->
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

.main {
	display:flex;
	align-items: center;
	justify-content: flex-start;
	padding-left: 200px;
	height: 100vh;
/* 	background: linear-gradient(135deg, #e0eafc, #cfdef3 80%); */
}

/* carousel css code */
.carousel-container {
	width: 1000px;
	height: 600px;
	margin-right: 50px;
	overflow: hidden;
}

.carousel-container img {
	width: 100%;
	height: 700px;
	object-fit: cover; /* 꽉 채우기 */
}

/* 로그인 창 */
.login-container {
	position: absolute;
	top: 50%;
	right: 230px; /* 오른쪽 여백 */
	transform: translateY(-50%);
	width: 320px;
	padding: 20px;
	background: rgba(255, 255, 255, 0.9);
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.login-top {
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

.join-box {
	display: flex;
	justify-content: center;
}

.go-join {
	text-decoration: none;
	font-weight: bold;
	padding-left: 10px;
}

</style>
</head>
<body>

<div class="main">
	<!-- 전체화면 Carousel -->
	<div class="carousel-container" data-bs-ride="carousel">
		<div class="carousel-item active" data-bs-interval="5000">
			<img src="<%=request.getContextPath()%>/img/Busan.jpg" alt="부산">
		</div>
		<div class="carousel-item" data-bs-interval="5000">
			<img src="<%=request.getContextPath()%>/img/Jeju.jpg" alt="제주">
		</div>
		<div class="carousel-item" data-bs-interval="5000">
			<img src="<%=request.getContextPath()%>/img/Seoul.jpg" alt="서울">
		</div>
	</div>

	<!-- 로그인 창 -->
	<div class="login-container">
		<%
		if (loginId == null) {
		%>
		<h2 class="login-top">TRABLOG</h2>
		<%
		if (errorMessage != null) {
		%>
		<div style="color: red; font-weight: bold;"><%=errorMessage%></div>
		<%
		}
		%>
		<form method="post" action="login.do">
			<p>
				<input placeholder="아이디" type="text" name="loginId" required autofocus>
			</p>
			<p>
				<input placeholder="비밀번호" type="password" name="loginPw" required>
			</p>
			<p>
				<button type="submit">로그인</button>
			</p>
		</form>
		<div class="join-box">
			<p class="question">
				아직 회원이 아니신가요?  <a href="join.jsp" class="go-join">회원가입</a>
			</p>
		</div>
		<%
		} else {
		%>
		<h3><%=loginId%>님 환영합니다.</h3>
		
		<p>
			<a href="logout.jsp">로그아웃</a>
		</p>
		<%
		}
		%>
	</div>
</div>


</body>
</html>