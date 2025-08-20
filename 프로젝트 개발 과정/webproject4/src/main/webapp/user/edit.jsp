<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="travellog.UserVO" %>
<%@ page session="true" %>

<%
    // 세션에서 로그인 정보 가져오기
    UserVO user = (UserVO) session.getAttribute("userInfo");
    if(user == null) {
        // 로그인 안 되어있으면 로그인 페이지로 이동
        response.sendRedirect("user/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
/* 스타일은 join.jsp랑 비슷하게 */
form { max-width: 500px; margin: 50px auto; display: flex; flex-direction: column; }
label { margin-top: 10px; }
input { padding: 8px; margin-top: 5px; }
button { margin-top: 20px; padding: 10px; background-color: #4CAF50; color: white; border: none; cursor: pointer; }
button:hover { background-color: #45a049; }
</style>
</head>
<body>
<h2>회원정보 수정</h2>
<form action="editUser.do" method="post">
    <label>아이디</label>
    <input type="text" name="loginId" value="<%= user.getLoginId() %>" readonly>

    <label>비밀번호</label>
    <input type="password" name="loginPw" value="<%= user.getLoginPw() %>" required>

    <label>이름</label>
    <input type="text" name="name" value="<%= user.getName() %>" required>

    <label>전화번호</label>
    <input type="text" name="phoneNumber" value="<%= user.getPhoneNumber() %>">

    <label>이메일</label>
    <input type="email" name="email" value="<%= user.getEmail() %>">

    <label>생년월일</label>
    <input type="date" name="birth" value="<%= user.getBirth() %>">

    <button type="submit">수정 완료</button>
</form>
</body>
</html>
