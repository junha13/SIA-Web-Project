<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 보기</title>
<style>

	.container {
		display: flex;
		flex-wrap: wrap;
		gap: 30px;/*가로세로 카드 사이 간격*/
		/*justify-content: center; 가운데 정렬*/
		}

	.cards {
        background: #f6f0fa;
        padding: 10px;
        margin: 0 auto;
        overflow: hidden; /* float 속성인식 */
	    }
	
	.card {
		flex: 0 0 320px
	    height: 400px;
	    width: 320px;
	    border-radius: 15px;
	    display: inline;
	    margin-top: 30px;
	    margin-left: 30px;
	    margin-bottom: 30px;
/* 	    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); */
	    overflow: hidden;
	    float: left;
	    }
	
	.card-header{
		width: 100%;
	    height: 250px;
	}
	
	.card-header-text {
	    background-color: #fa2414 ;
	    color: #FFF ;
	    font-weight: bold ;
	    text-align: center ;
	    float: right;
	    margin: 15px 15px 15px 15px;
	    border-radius: 50%;
	    font-weight: bold;
	    padding: 10px 10px 10px 10px;
	    line-height: 30px;
	}
	
	.card-body-header{
	    margin: 10px 20px 0px 20px;
	}
	
	.card-body-hashtag {
	    color: #2478ff;
	}
	
	h3{
	font-size: 20ps;
	}
	
	.empty {
	  text-align: center;
	  padding: 80px 20px;
	  color: #666;
	}
	.empty h2 {
	  font-size: px;
	  font-weight: bold;
	  margin-bottom: 10px;
	}
	.empty p {
	  font-size: 20px;
	  color: #999;
	}
</style>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<%@ include file="/common/header.jsp" %>

<c:choose>
  <c:when test="${empty list}">
  	<div class="empty">
    	<h2>My page</h2>
    	<p>여행을 기록하세요!</p>
    </div>
  </c:when>
</c:choose>

<c:forEach var="p" items="${list}">
<form action="view.post?pkid=${p.pkid}" method="post">
  <div class="card">

    <div class="card-header">
      ${p.postContent}
    </div>
    <div class="card-body-header">
      <h3>${p.postTitle}</h3>
      <p class="card-body-hashtag">${p.postLocation}</p>
    </div>
    </div>
    </form>
  
</c:forEach>

<%@ include file="/common/footer.jsp" %>

<script>
$('.card').on("click", function(e) {
    const card = e.target.closest('.card');
    if (!card) return;
    const form = card.closest('form');
    if (form) form.submit();
});

</script>
</body>
</html>