<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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
	padding-top: 80px;
	font-family: system-ui, -apple-system, Segoe UI, Roboto,
		Apple SD Gothic Neo, Noto Sans KR, sans-serif;
	background: linear-gradient(135deg, #eef2ff 0%, #e6f0fa 100%);
	color: #222;
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
	font-size: 28px;
	font-weight: 800;
	margin: 0 0 12px
}

.meta {
	gap: 10px 14px;
	font-size: 14px;
	color: #6b7280;
	margin: 0 0 16px;
	font-family: "Gowun Dodum", sans-serif;
}

.content {
	font-size: 16px;
	line-height: 1.7;
	text-align: center;
	font-family: "Gowun Dodum", sans-serif;
}
/* 본문 이미지: 중앙 정렬 + 살짝 작게 */
.content img {
	display: block;
	margin: 12px auto;
	min-width: 450px; /* 필요하면 숫자만 조절해서 더 작게/크게 */
	height: auto;
	border-radius: 6px;
}
#createdAt {
	text-align: right; 
	font-family: "Gowun Dodum", sans-serif;
	font-size: 14px;
	color: #6b7280;
}

</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="wrap">
		<div class="row g-1">
			<div class="col-12">
				<div class="title">
					[
					<c:out value="${post.postTitle}" />
					]
				</div>
			</div>
			<div class="col-6">
				<div class="meta">
					📍
					<c:out value="${post.postLocation}" />
					| 📅
					<c:out value="${post.postStartDay} ~ ${post.postEndDay}" escapeXml="false" />
					| 😎
					<c:out value="${post.userId}" escapeXml="false" />
				</div>
			</div>
			<div class="meta col-6" id="createdAt">
				<c:out value="작성시간 : ${post.createdAt}" escapeXml="false" />
			</div>
			<div class="content col-12">
				<c:out value="${post.postContent}" escapeXml="false" />
			</div>
			<div class="col-12 text-center">
				<button class="btn btn-secondary" id="backButton"><span>돌아가기</span></button>
			</div>
		</div>
	</div>
	
	<%@ include file="/common/footer.jsp"%>
	<script>
	
	$('#backButton').on('click', function () {
		location.href = 'all.post';
	});
	
	</script>
</body>
</html>