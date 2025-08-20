<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 보기</title>
<style>
body {
	padding-top: 50px;
}

.cards {
	max-width: 1200px;
	margin: 40px auto;
	padding: 0 16px;
}

.grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
	gap: 28px;
}

.card {
	display: flex;
	flex-direction: column;
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 4px 18px rgba(0, 0, 0, .08);
	transition: transform .15s ease, box-shadow .15s ease;
	height: auto;
	width: auto;
	margin: 0;
	float: none;
}

.card:hover {
	transform: translateY(-4px);
	box-shadow: 0 10px 24px rgba(0, 0, 0, .12);
}

.card-header {
	height: 220px;
	background: #f5f7fa;
}

.card-header img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

.card-header-text {
	background-color: #fa2414;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	margin: 15px 15px 15px 15px;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px 10px 10px;
	line-height: 30px;
}

.card-body-header {
	margin: 10px 20px 0px 20px;
}

.card-body-hashtag {
	color: #2478ff;
}

h3 {
	font-size: 20px;
}

.empty {
	text-align: center;
	padding: 80px 20px;
	color: #666;
}

.empty h2 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.empty p {
	font-size: 20px;
	color: #999;
}
</style>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="cards">
		<c:choose>
			<c:when test="${empty list}">
				<div class="empty">
					<h2>페이지 준비 중</h2>
					<p>곧 멋진 여행 후기가 올라올 예정입니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="grid">
					<c:forEach var="p" items="${list}">
						<div class="card">
							<div class="card-body-header">
								<a class="post-title" href="${pageContext.request.contextPath}/post/view.post?pkid=${p.pkId}"></a>
								<a class="post-title" href="${pageContext.request.contextPath}/post/view.do?pkid=${p.pkId}">
									${p.postTitle} </a>
								<div class="card-header">${p.postContent}</div>
								<p class="card-body-hashtag">${p.postLocation}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>