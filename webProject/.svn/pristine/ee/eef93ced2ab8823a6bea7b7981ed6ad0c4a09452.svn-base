<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>추천여행지</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	background: #f9fafb;
	color: #333;
}

header {
	background: #fff; /* 흰색 배경 */
	border-bottom: 1px solid #eaeaea;
	padding: 20px 0;
	text-align: center;
}

header h1 {
	margin: 0;
	font-size: 1.8rem;
	font-weight: 600;
}

section {
	margin: 20px auto;
	text-align: center;
}

#sido {
	padding: 10px 15px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 8px;
	background: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	transition: all 0.2s ease-in-out;
}

#sido:hover {
	border-color: #888;
}

#site {
    margin: 0;           
    max-width: none;     
    width: 100vw;       
    height: 100vh;        /* 브라우저 세로 전체 */
    border-radius: 0;     /* 모서리 둥글기 제거 */
    overflow: hidden;
}

iframe {
    width: 100%;
    height: 100%;
    border: none;
}

footer {
	position: fixed; /* 화면에 고정 */
	bottom: 0; /* 항상 하단 */
	left: 0;
	width: 100%; /* 가로 전체 */
	background: #fff;
	border-top: 1px solid #eaeaea;
	padding: 20px 0;
	z-index: 100; /* 맵이나 다른 요소 위에 보이도록 */
}

.ad-banner {
	display: flex;
	justify-content: space-around; /* 3개 광고 가로로 균등 배치 */
	align-items: center;
	width: 100%;
	max-width: none; /* 가로 제한 해제 */
	margin: 0 auto;
}

.ad {
	flex: 1; /* 3개 광고가 균등 분할 */
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid #ddd;
	background: #f9f9f9;
	transition: all 0.3s ease;
}

.ad img {
	max-height: 60px;
	max-width: 80%;
	object-fit: contain;
}
</style>

</head>
<body>
	<header>
		<h1>전국 추천 여행지</h1>
	</header>
	<section>
		<form>
			<select id="sido">
				<option value="">시도 선택</option>
			</select>
		</form>
	</section>
	<div id="site" style="margin-top: 20px;"></div>

	<script type="text/javascript">
 	// 시도 목록 불러오기
    $.ajax({
        url : 'spot.post',
        dataType : 'json',
        success : function(data) {
            // select 박스 초기화
            $('#sido').empty();
            $('#sido').append('<option value="">시도 선택</option>');
            
            // 서버에서 받은 배열을 option으로 추가
            data.forEach(function(sido) {
            	 $('#sido').append('<option value="' + sido + '">' + sido + '</option>');
            });
        }
    });
    
    // 시도 선택 시 구글맵 띄우기
    $('#sido').on('change', function() {
    let sido = $(this).val();
    if (sido) {
        // "추천 여행지" 키워드 추가
        let query = sido + " 추천 여행지";
        $("#site").html(`
            <iframe 
              src="https://www.google.com/maps?q=\${encodeURIComponent(query)}&output=embed" 
              width="100%" height="600" style="border:0;" allowfullscreen="" loading="lazy">
            </iframe>
        `);
    } else {
        $("#site").empty();
    }
});
	</script>

	<footer>
  <div class="ad-banner">
    <div class="ad-slide">
      <a class="ad" href="https://www.agoda.com" target="_blank">
        <img src="img/agoda-banner.png">
      </a>
      <a class="ad" href="https://www.skyscanner.net" target="_blank">
        <img src="img/sky-banner.png">
      </a>
      <a class="ad" href="https://www.trip.com" target="_blank">
        <img src="img/trip-banner.png">
      </a>
      <!-- 반복해서 자연스럽게 이어지도록 복제 -->
      <a class="ad" href="https://www.agoda.com" target="_blank">
        <img src="img/agoda-banner.png">
      </a>
      <a class="ad" href="https://www.skyscanner.net" target="_blank">
        <img src="img/sky-banner.png">
      </a>
      <a class="ad" href="https://www.trip.com" target="_blank">
        <img src="img/trip-banner.png">
      </a>
    </div>
  </div>
</footer>

<style>
.ad-banner {
  width: 100%;
  overflow: hidden;  /* 밖으로 튀어나가는 건 숨김 */
}

.ad-slide {
  display: flex;  /* 가로로 나열 */
  width: max-content;
  animation: scroll 15s linear infinite; /* 15초 동안 계속 왼쪽으로 이동 */
}

.ad {
  flex: 0 0 auto;  /* 크기 고정 */
  width: 33.3vw;   /* 화면의 1/3씩 차지 */
  height: 80px;
  display: flex;
  justify-content: center;
  align-items: center;
}

/* 흘러가는 애니메이션 */
@keyframes scroll {
  from {
    transform: translateX(0);
  }
  to {
    transform: translateX(-50%);
  }
}
</style>


</body>

</html>
