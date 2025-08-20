<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
body {
	background-color: var(--bs-dark-bg-subtle);
}
#post {
	max-width: 1200px;
	text-align:center;
	margin: auto;
	margin-top: 70px;
	
}
#suggestBox {
	display: none;   /* 기본 숨김 */
	position: absolute;
	background: #fff;
	z-index:9999;
	font-family: "Gowun Dodum", sans-serif;
	font-size: 18px;
	border: 1px solid #000;
	padding: 8px;
	border-radius:5px;
	min-width: 300px;
}
.dropdown {
	text-align:left;
}
input {
	width: 100%;
	border: 1px solid #000;
	padding: 8px;
	font-family: "Gowun Dodum", sans-serif;
	border-radius:5px;
}
button {
	margin-top: 8px;
}
#thumbnail {
	height:42px;
	background-color: #FFFFFF;
	font-family: "Gowun Dodum", sans-serif;
	border: 1px solid #000;
	border-radius:5px;
}
#text {
	font-family: "Gowun Dodum", sans-serif;
	line-height: 38px;
}
</style>
</head>
<body>
<%@ include file="/common/header.jsp" %>
<script>
	tinymce.init({
		selector: '#textBox',
		elementpath: false,
		menubar: false,
		branding: false,
		width: '100%',
		height: 700,
		resize: false,
	    license_key: 'gpl',                         // ★ 커뮤니티(GPL) 동의
	    base_url: '${pageContext.request.contextPath}/js/tinymce', // ★ 플러그인/스킨 경로 기준
	    suffix: '.min',
		
		// 꼭 쓰는 플러그인만
		plugins: 'lists link',
		
		// 심플 툴바
		toolbar: 'undo redo | bold italic underline',
		
		// 이미지 붙여넣기/드래그를 base64로 본문에 포함
		paste_data_images: true,
		automatic_uploads: false,
		object_resizing: false,
		
		// (선택) 허용 확장자 제한
		images_file_types: 'png,jpg,jpeg',
		
		images_upload_handler: (e) => {
			const type = e.blob().type;               // image/png or image/jpeg
			if (!/^image\/(png|jpeg)$/i.test(type)) {
			  return Promise.reject('PNG/JPEG만 가능');
			}
			return Promise.resolve(`data:${type};base64,${e.base64()}`);
		},
		
		// (선택) 본문 이미지 스타일(가운데 + 반응형)
		content_style: `
			@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
			body { 
			 	font-family: "Gowun Dodum", sans-serif; 
				font-size: 23px;
				line-height: 0.8; 
				text-align:center
			}
			img { 
				display:block; 
				margin:8px auto; 
				width:500px;
				max-width: 100%;
				height:auto; 
			}`
	});
</script>
	<div id="postWritePage">
		<div id="post">
			<form class="row g-1" action="insert.post" method="post" enctype="multipart/form-data"> <!-- 데이터가 인코딩 되는 방식을 정하는건데 이거는 모든 문자를 인코딩하지 않음 -->
				<input type="hidden" id="userId" name="userId" value="${sessionScope.loginId}">
				<div class="col-6">
					<input id="title" name="title" placeholder="제목을 입력해주세요" autocomplete="off">
				</div>
				<div class="col-6">
					<input id="location" name="location" placeholder="여행 장소를 입력해주세요 (시군구 단위)" autocomplete="off">
					<div id="suggestBox"></div>
				</div>
				<div class="col-1">
					<span id="text">여행 시작일</span>
				</div>
				<div class="col-2">
					<input type="date" id="startDay" name="startDay" autocomplete="off">
				</div>
				<div class="col-1">
					<span id="text">여행 종료일</span>
				</div>
				<div class="col-2">
					<input type="date" id="endDay" name="endDay" autocomplete="off">
				</div>
				<div class="col-1">
					<span id="text">대표 사진</span>
				</div>
				<div class="col-5">
					<input type="file" id="thumbnail"  name="thumbnail" accept="image/*">
				</div>
				<div class="col-12">
				<div class="textBox">
					<textarea id="textBox" name="contentHtml"></textarea>
				</div>
				</div>
				<div class="col-12">
					<button class="btn btn-primary" type="submit" id="acceptButton">작성 완료</button>
				</div>	
			</form>
		</div>
	</div>
	<script>
	$('#post form').on('submit', function (e) {
	    console.log('submit handler');
	    const title = $('#title').val();
	    const location = $('#location').val();
	    const textBox = tinymce.get('textBox').getContent();
	    const startDay = $('#startDay').val();
	    const endDay = $('#endDay').val();
	    const thumbnail = $('#thumbnail').val();
	    const form = this;  // this로 안하면 무한루프임
	    
	    e.preventDefault();

	    if (!title) {
	      alert('입력해라 타이틀');
	      $('#title').focus();
	      return;
	    }
	    if(!startDay || !endDay) {
	    	alert('여행 시작일, 종료일을 확인해주세요');
	    	return;
	    }
	    
	    if(!thumbnail) {
	    	alert('대표 이미지를 선택해주세요');
	    	return;
	    }
	    
	    if (!textBox) {
	      alert('입력해라 텍스트');
	      return;
	    }
	    if (!location) {
	      alert('입력해라 위치');
	      $('#location').focus();
	      return;
	    }
	    const locationVal = $('#location').val();
	    
	    $.ajax({  // location 이 regions 테이블의 label에 존재하는지 
	    	url: 'locationCheck.post',
	    	data: {location: locationVal},
	    	dataType: 'json',
	    	success: function(data) {
	    		if(!data) {
	    			alert('올바른 지역명을 입력해주세요.')
	    			$('#location').focus();
	    			return;
	    		} else if (data) {
	    		    tinymce.triggerSave(); // TinyMCE 본문을 <textarea name="contentHtml">에 반영
	    		    form.submit();
	    		}
	    	}
	    })
	    
	});
	
	
	$('#location').on('input',function() {  // location에 입력될때마다 함수 실행임
	 let keyword = $('#location').val();  
	 if(keyword.trim() === '') {  // 키워드를 지웠을땐 안떠야되니까 suggestbox를 지우는거임
		 $('#suggestBox').hide().empty();
		 return;
	 }
	 $.ajax({
		 url: 'ajax.post',  // post 서블릿으로 요청
		 data: {action: 'suggest', input: keyword},  // action이라는 파라미터에 suggest를 담음, q라는 파라미터에 keyword를 담음 서버로 ?action=suggest&q=사용자가입력한값 이렇게 감
		 dataType: 'json',
		 success: function(data) {
			let html = '';
			 for(let i=0; i<data.length; i++) {
				 html += '<div class="dropdown">'+data[i] +'</div>'  // 데이터 받아서 <div>로 계속 출력하는거임  css할거면 dropdown건들면 될듯?
			 }
			 $('#suggestBox').html(html).show();
		 }
	 })
	})
	
	$('#suggestBox').on('click', '.dropdown', function() {
	 $('#location').val($(this).text());  // location의 값을 suggestbox의 값으로
	 $('#suggestBox').hide().empty();
	})
	
	$('#endDay').on('change', function() {  // 입력커서가 빠져나왔을때 체크 (blur) => 근데 어색함 => change로 두고 => this로 변경된 dom객체 value값을 가져오는거임
		const startDay = $('#startDay').val();
		const endDay = $(this).val();
		
		if(!startDay) {
			alert('여행 시작일을 먼저 선택해주세요');
			$(this).val("");
			return;
		}
		if(startDay>endDay) {
			alert('여행 종료일은 여행 시작일보다 빠르게 설정할 수 없습니다.');
			$(this).val("");
			return;
		}
	})
	
	
	</script>
		<%@ include file="/common/footer.jsp"%>
</body>
</html>