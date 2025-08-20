<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">


<style type="text/css">


@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap');
	/* 전체 navbar 스타일 */
.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	height: 50px;
	line-height: 50px;
	background-color: #f8f9fa;
	border-bottom: 1px solid #BDBDBD;
	font-family: 'Noto Sans KR', sans-serif;
	z-index: 1000;
}

/* 내부 컨테이너는 가로 정렬용 flex 컨테이너 */
.container {
	max-width: 1500px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 15px;
	height: 100%;
}

/* 로고 */
.navbar-brand {
	font-weight: bold;
	font-size: 20px;
	color: #575757;
	text-decoration: none;
}

.nav-item {
	margin-left: 20px;
	list-style: none;
}

.nav-user {
	margin-left: 20px;
}

.menu {
	font-size: 18px;
	font-weight: bold;
	color: #575757;
	text-decoration: none;
	list-style: none;
	transition: color 0.3s ease;
	cursor: pointer;
	margin-left: 20px;
	align-items: center;
	display: flex;
	padding: 0;
}

.menu:hover {
	color: #333333;
	text-decoration: none;
}

.navbar-link {
	text-decoration: none;
}

/* 로그인 환영문구 등 span을 inline-block으로 맞춤 */
.nav-item span.main_menu {
	display: inline-block;
}

.navbar-nav {
	display: flex !important;
	flex-direction: row;       /* 가로 방향으로 */
	justify-content: center;  /* 중앙 정렬 */
	align-items: center;      /* 세로 중앙 정렬 */
	padding: 0;
	margin: 0;
}

.navbar-nav > li {
	margin-left: 20px;
	list-style: none;
	display: flex;
	align-items: center;  
	height: 50px;
}
	
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light fixed-top">
		<div class="container">
			<!-- main 로고 -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/map.jsp"><span class="menu">TRABLOG</span></a>
				
				
			<!-- main menu -->
			<ul class="navbar-nav justify-content-center">

				<li class="nav-item">
					<a class="navbar-link" href="${pageContext.request.contextPath}/all.post"><span class="menu">모든글보기</span></a>
				</li>
				<li>
					<a class="navbar-link" href="${pageContext.request.contextPath}/spot.jsp"><span class="menu">추천여행지</span></a>
				</li>
				
				<!-- user menu -->
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				
				<li class="nav-user" id="login">		
					<c:if test="${empty sessionScope.loginId}"><!-- 로그인 세션에 값이 없으면 보이는 요소 -->
						<a class="menu" href="${pageContext.request.contextPath}/user/login.jsp">로그인</a>
					</c:if>
					<c:if test="${not empty sessionScope.loginId}"><!-- 로그인 세션에 값이 있으면 보이는 요소 -->
					  <a class="menu" href="${pageContext.request.contextPath}/post/postWrite.jsp">글쓰기</a>
					  <a class="menu" href="${pageContext.request.contextPath}/user/mypost.post">마이페이지</a>
					  <a class="menu" href="${pageContext.request.contextPath}/user/edit.jsp">회원정보수정</a>
					  <span class="menu">${sessionScope.userInfo.name}님, 환영합니다!</span>
					  <a class="menu" href="logout.do">로그아웃</a>

					</c:if>
				</li>
                
			</ul>
		</div>
	</nav>
	
	 <script type="text/javascript">
    // 페이지가 로드되면 실행되는 함수
    window.onload = function() {
      // 현재 페이지의 경로(path)를 가져옵니다.
      var path = window.location.pathname;

      // '회원정보수정' 링크를 찾아서 저장합니다.
      var editLink = document.querySelector('a[href*="/user/edit.jsp"]');

      // 만약 현재 경로가 마이페이지(/user/myPage.jsp)가 아니라면
      if (path.indexOf('/user/mypost.post') === -1) {
        // '회원정보수정' 링크가 존재하는지 확인하고
        if (editLink) {
          // 해당 링크를 숨깁니다.
          editLink.style.display = 'none';
        }
      }
    };
  </script>
	
</body>
</html>