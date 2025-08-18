<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<style>
body {
	margin: 0;
	padding-top: 80px;
	font-family: system-ui, -apple-system, Segoe UI, Roboto,
		Apple SD Gothic Neo, Noto Sans KR, sans-serif;
	background: linear-gradient(135deg, #e2eafc 30%, #cfdef3 90%);
	color: #111;
}

/* 컨테이너 */
.cards {
	max-width: 1320px;
	margin: 40px auto;
	padding: 0 16px
}

/* GRID: 항상 3열 고정 */
.grid {
	display: grid;
	grid-template-columns: repeat(3, minmax(380px, 1fr)); /* 가로 3개 고정 */
	gap: 32px;
}

/* CARD */
.card  {
	display: block;
	text-decoration: none;
	color: inherit;
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 4px 18px rgba(0, 0, 0, .08);
	transition: transform .15s ease, box-shadow .15s ease;
	font-family: "Gowun Dodum", sans-serif;
}
#searchList{
  max-width: 1320px;
  margin: 8px auto 0;  
  padding: 0 16px;    
  text-align: right;  
}

.card:hover {
	transform: translateY(-4px);
	box-shadow: 0 10px 24px rgba(0, 0, 0, .12);
}

/* 썸네일 영역(비율 고정) */
.card-header {
	background: #f5f7fa;
}

.card-header img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

/* 본문 */
.card-body-header {
	padding: 12px 16px 16px
}

.post-title {
	margin: 8px 0 6px;
	font-size: 18px;
	font-weight: 700;
	line-height: 1.35;
}

.card-body-hashtag {
	margin: 0;
	font-size: 15px;
	font-weight: 400;
	color: #333;
}

/* 빈 지역 */
.empty {
	text-align: center;
	margin-top: 100px;
}
img {
	max-height: 200px;
	min-width: 300px;

}
#postLocation {
	padding-top: 9px;
}
#postLocation, #postDay{ 
	text-align: right; 
}

#postTitle, #userId {
	text-align: left; 
}
#searchList select,
#searchList input {
  height: 36px;
  padding: 0 12px;
  border: 1px solid #d0d7de;
  border-radius: 10px;
  background: #fff;
  font-size: 14px;
  vertical-align: middle;           /* 세로 정렬 깔끔하게 */
  box-shadow: inset 0 1px 2px rgba(0,0,0,.05);
}

/* 크기 통일감 */
#searchList select { 
width: 90px; 
font-family: "Gowun Dodum", sans-serif;
}
#searchList input  { 
width: 260px; 
font-family: "Gowun Dodum", sans-serif;
}

/* 포커스 링만 은은하게 */
#searchList select:focus,
#searchList input:focus {
  outline: none;
  border-color: #6c757d;            /* 부트스트랩 secondary 톤 */
  box-shadow: 0 0 0 3px rgba(108,117,125,.15);
}

/* 버튼: 높이/라운드 맞추기 (부트스트랩 색상 유지) */
#searchList #searchButton {
  height: 36px;
  padding: 0 14px;
  border-radius: 10px;
  font-family: "Gowun Dodum", sans-serif;
}

	
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<form action="list.post" method="post">
		<div id="searchList">
			<select id="searchCondition" name="searchCondition" aria-label="검색 조건">
				<option value="postTitle">제목</option>
				<option value="postLocation">도시</option>
				<option value="userId">작성자</option>
			</select>
			<input type="text" id="searchInput" name="searchInput" autocomplete="off">
			<button class="btn btn-secondary" type="submit" id="searchButton">검색하기</button>
		</div>
	</form>
	
	
	<div class="cards">
		<c:choose>
			<c:when test="${empty list}">
				<div class="empty">
					<h2>😂아직 여행객 없는 지역😂</h2>
					<p>곧 멋진 여행 후기가 올라올 예정입니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="grid">
					<c:forEach var="p" items="${list}">
						<a class="card" href="${pageContext.request.contextPath}/view.post?pkid=${p.pkId}">
							<div class="card-body-header">
								<div class="card-header">
									<img src="${p.postThumbnail}">
								</div>
								<div class="row g-1 align-items-center">
									<div class="col-7" id="postTitle">
										<h3 class="post-title">${p.postTitle}</h3>
									</div>
									<div class="col-5" id="postLocation">
										<p class="card-body-hashtag">📍 ${p.postLocation}</p>
									</div>
									<div class="col-5" id="userId">
										<p class="card-body-hashtag">😎 ${p.userId}님</p>
									</div>
									<div class="col-7" id="postDay">
										<p class="card-body-hashtag">📅 ${p.postStartDay} ~ ${p.postEndDay}</p>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>