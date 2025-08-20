<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="travellog.UserVO" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
/* 스타일은 join.jsp랑 비슷하게 */

body {
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #e2eafc 30%, #cfdef3 90%);
}

.container {
	margin-top: 80px;
	width: 500px;
	padding: 20px;
	background: rgba(255, 255, 255, 0.9);
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.container-top {
	font-size: 30px;
	text-align: center;
}

form { max-width: 500px; margin: 50px auto; display: flex; flex-direction: column; }
label { margin-top: 10px; }
input { padding: 8px; margin-top: 5px; }
button { margin-top: 20px; padding: 10px; background-color: #1A66CC; color: white; border: none; 
cursor: pointer; font-size: 20px; font-weight: bold;border-radius: 4px;}
button:hover { background-color: #0D33B3; }
</style>
</head>
<body>

<div class="container">

	<div>
		<h2 class="container-top">회원정보수정</h2>
	</div>
	
	<form action="${pageContext.request.contextPath}/updateUser.do" method="post">
	    <label>아이디</label>
	    <input type="text" name="userid" value="${sessionScope.userInfo.loginId}" readonly>
	
	    <label>비밀번호</label>
	    <input type="password" name="userpw" value="${sessionScope.userInfo.loginPw}" required>
	
	    <label>이름</label>
	    <input type="text" name="name" value="${sessionScope.userInfo.name}" required>
	
	    <label>전화번호</label>
	    <input type="text" name="hp" value="${sessionScope.userInfo.phoneNumber}" required>
	
	    <label>이메일</label>
	    <input type="email" name="email" value="${sessionScope.userInfo.email}" required>
	
	    <label>생년월일</label>
	    <input type="date" name="birth" value="${sessionScope.userInfo.birth}" required>
	
	    <button type="submit">수정 완료</button>
	</form>

</div>
</body>
</html>
