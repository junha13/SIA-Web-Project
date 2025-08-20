<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
     	String loginId = null;
    	if(session.getAttribute("loginId") != null){
       		loginId = (String)session.getAttribute("loginId");
    	}
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
	
	<%
		if(loginId == null) {
	%>
	
	<form method = "post" action="login_ok"> <!-- 임시 -->
		<p>ID : <input type = "text" name = "loginId"></p>
		<p>PW : <input type = "text" name = "loginPw"></p>
		<p><button>login</button></p>
	</form>
	
	<p>아직 회원이 아니신가요?<a href = join.jsp>회원가입</a></p> <!-- 임시 -->
	
	<%
		}else{
	%>
	
	<h3><%=loginId %>님 환영합니다.</h3>
	<p><a href = "logout.jsp">로그아웃</a></p> <!-- 임시 -->
	
	<%
		}
	%>
	
</body>
</html>