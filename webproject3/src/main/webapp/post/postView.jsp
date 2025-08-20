<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
	crossorigin="anonymous"></script>

<title></title>
<style>
body {
	margin: 0;
	background: var(--bs-dark-bg-subtle);
	font-family: "Gowun Dodum", sans-serif;
	color: #222;
	padding-top: 80px;
}

.wrap {
	width: 1200px;
	margin: auto;
	margin-top: 0%;
	margin-bottom: 20px;
	background: #fff;
	border: 1px solid #e9ecef;
	border-radius: 12px;
	padding: 24px 28px;
	box-sizing: border-box;
}

.title {
	font-size: 26px;
	font-weight: 700;
	margin-bottom: 8px;
}

.meta {
	font-size: 14px;
	color: #666;
	margin-bottom: 18px;
}

.content {
	font-size: 16px;
	line-height: 1.7;
	text-align: center;
}
/* 본문 이미지: 중앙 정렬 + 살짝 작게 */
.content img {
	display: block;
	margin: 12px auto;
	max-width: 300px; /* 필요하면 숫자만 조절해서 더 작게/크게 */
	height: auto;
	border-radius: 6px;
}
</style>
</head>
<body>
<%@ include file="/common/header.jsp"%>
	<div class="wrap">
		<div class="title">
			제목:
			<c:out value="${post.postTitle}" />
		</div>
		<div class="meta">
			장소:
			<c:out value="${post.postLocation}" />
		</div>
		<div class="content">
			<c:out value="${post.postContent}" escapeXml="false" />
		</div>
		<div class="createAt">
			작성시간 :
			<c:out value="${post.createdAt}" escapeXml="false" />
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>