<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<style>

</style>
</head>
<body>
	<div>
		<input id="location" type="text">
		<div id="suggestBox"></div>
	</div>
 <script>
 $('#location').on('input',function() {  // location에 입력될때마다 함수 실행임
	 let keyword = $('#location').val();  
	 if(keyword.trim() === '') {  // 키워드를 지웠을땐 안떠야되니까 suggestbox를 지우는거임
		 $('#suggestBox').empty();
		 return;
	 }
	 $.ajax({
		 url: 'ajax.post',  // post 서블릿으로 요청
		 data: {action: 'suggest', q: keyword},  // action이라는 파라미터에 suggest를 담음, q라는 파라미터에 keyword를 담음 서버로 ?action=suggest&q=사용자가입력한값 이렇게 감
		 dataType: 'json',
		 success: function(data){
			 let html = '';
			 for(let i=0; i<data.length; i++) {
				 html += '<div class="item">'+data[i] +'</div>';  // 데이터 받아서 <div>로 계속 출력하는거임  css할거면 item건들면 될듯?
			 }
			 $('#suggestBox').html(html);
		 }
	 })
 })
 
 $('#suggestBox').on('click', '.item', function() {
	 $('#location').val($(this).text());  // location의 값을 suggestbox의 값으로
	 $('#suggestBox').empty();
 })
 
</script>
</body>
</html>