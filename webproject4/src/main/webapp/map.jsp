<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
body {
  padding-top: 70px; /*헤더크기만큼 내리는 코드*/
	background: linear-gradient(135deg, #e2eafc 30%, #cfdef3 90%);
}

.main {
	display: flex;
	align-items: center;
}

#image-top {
	position: fixed;
	top: 200px;
	right: 180px;
	width: 380px;
	height: 270px;
	display: none;
	overflow: hidden;
	z-index: 1000;
	transform: rotate(-6deg);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

#image-top img{
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

#image-bottom {
	position: fixed; /* 화면 고정 */
	top: 500px;		/* 화면 상단에서 150px 아래 */
	right: 200px;	/* 화면 오른쪽에서 30px 안쪽 */
	width: 380px;
	height: 270px;
	display: none;
	overflow: hidden;
	z-index: 1000;	/* 다른 요소 위에 표시 */
	transform: rotate(5deg);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

#image-bottom img{
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

@media(max-width: 1550px) {
	#image-top {
		width: 280px;
		height: 200px;
		right: 80px;
		top: 180px;
	}
}

@media(max-width: 1550px) {
	#image-bottom {
		width: 280px;
		height: 200px;
		right: 80px;
		top: 400px;
	}
}

@media(max-width: 700px) {
	#image-top, #image-bottom {
		width: 0;
		height: 0;
		display: none;
	}
}



</style>

<title>대한민국 지도</title>
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/map.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/southKoreaLow.js"></script>
</head>

<body>
	<%@ include file="/common/header.jsp"%>
	
<div class="main">
	<!-- 지도 영역 -->
	<div id="chartdiv" style="width: 100%; height: 800px;"></div>
	
	<!-- 위쪽에 호버되는 이미지-->
		<div id="image-top">
			<img src="">
		</div>
		
	<!-- 오른쪽에 호버되는 이미지-->
		<div id="image-bottom">
			<img src="">
		</div>
	
</div>
	<script>
		// amCharts 루트(렌더링 컨테이너) 생성
		const root = am5.Root.new("chartdiv");
		
		//지도 맵차트 생성(메르카토르 투영 + 화면 고정효과)
		const chart = root.container.children.push(
			    am5map.MapChart.new(root, {
			        projection: am5map.geoMercator(), // 지도 투영법
			        panX: "none", // 가로 패닝 금지
			        panY: "none", // 세로 패닝 금지
			        wheelX: "none", // 마우스 휠 가로 줄, 스크롤 금지
			        wheelY: "none" // 마우스 휠 세로 줄, 스크롤 금지
			    })
			)
		
		// 지도 폴리곤 시리즈 추가 (대한민국 경계선 GeoJSON)
		const koreaSeries = chart.series.push(
		    am5map.MapPolygonSeries.new(root, {
		        geoJSON: am5geodata_southKoreaLow //amCharts 에서 제공하는 한국 저해상도 지오데이터
		    })
		);
		
		// 폴리곤 스타일 공통 설정
		koreaSeries.mapPolygons.template.setAll({
		    interactive: true, // 마우스 인터렉션 허용
		    stroke: am5.color(0xe3e3e3), // 외곽선 색
		    strokeWidth: 1, // 외곽선 두께
		    fillOpacity: 0.7, // 내부 채우기 투명도
		    fill: am5.color(0x74b9ff), // 기본 채우기 색
		    cursorOverStyle: "pointer" // 호버 시 포인터 커서
		});
		
		// 호버 스타일
		koreaSeries.mapPolygons.template.states.create("hover", {
		    fill: am5.color(0x0984e3), // 더 진한 파란색
		    fillOpacity: 0.9, // 불투명도(증가)
		    strokeWidth: 2 // 외곽선(두껍게)
		});
		
		// 튤팁 텍스트 : 영어 -> 한국어
		koreaSeries.mapPolygons.template.adapters.add("tooltipText", (text, target) => {
			  const raw = target.dataItem?.dataContext?.name;
			  return locationNames[raw] || raw || "";
			});
		
		// 5. 지역별 url 매핑
		const contextPath = '<%=request.getContextPath()%>';

		const locationUrls = {
				  "서울특별시": `location.post?location=seoul`,
				  "부산광역시": `location.post?location=busan`,
				  "대구광역시": `location.post?location=daegu`,
				  "인천광역시": `location.post?location=incheon`,
				  "광주광역시": `location.post?location=gwangju`,
				  "대전광역시": `location.post?location=daejeon`,
				  "울산광역시": `location.post?location=ulsan`,
				  "세종특별자치시": `location.post?location=sejong`,
				  "경기도": `location.post?location=gyeonggi`,
				  "강원도": `location.post?location=gangwon`,
				  "충청북도": `location.post?location=chungbuk`,
				  "충청남도": `location.post?location=chungnam`,
				  "전라북도": `location.post?location=jeonbuk`,
				  "전라남도": `location.post?location=jeonnam`,
				  "경상북도": `location.post?location=gyeongbuk`,
				  "경상남도": `location.post?location=gyeongnam`,
				  "제주특별자치도": `location.post?location=jeju`
				};
			
		// 지역별 한글명 매핑 (영문명을 한글명으로 변환)
		const locationNames = {
		    "Seoul": "서울특별시",
		    "Busan": "부산광역시",
		    "Daegu": "대구광역시", 
		    "Incheon": "인천광역시",
		    "Gwangju": "광주광역시",
		    "Daejeon": "대전광역시",
		    "Ulsan": "울산광역시",
		    "Sejong": "세종특별자치시",
		    "Gyeonggi": "경기도",
		    "Gangwon": "강원도",
		    "North Chungcheong": "충청북도",
		    "South Chungcheong": "충청남도", 
		    "North Jeolla": "전라북도",
		    "South Jeolla": "전라남도",
		    "North Gyeongsang": "경상북도",
		    "South Gyeongsang": "경상남도",
		    "Jeju": "제주특별자치도"
		};
		
		// 지역별 호버 이미지(여러 개라 배열로 받음)
		const locationImages = {
			"서울특별시": [
				contextPath + "/img/seoul1.JPG",
				contextPath + "/img/seoul2.JPG"
			],
	        "부산광역시": [
	        	contextPath + "/img/busan1.JPG",
	        	contextPath + "/img/busan2.JPG"
	        ],
	        "제주특별자치도": [
	        	contextPath + "/img/jeju1.JPG",
	        	contextPath + "/img/jeju2.JPG"
	        ]	
		}
		
		const topImgDiv = document.getElementById("image-top");
		const bottomImgDiv = document.getElementById("image-bottom");

		// 지역별 호버 이미지 관련 이벤트(마우스 올렸을 때 실행)
		koreaSeries.mapPolygons.template.events.on("pointerover", function(ev) {
			const rawName = ev.target.dataItem?.dataContext?.name || "";
			const korName = locationNames[rawName] || rawName;
			const imgs = locationImages[korName];

		  if (imgs && imgs.length >= 2) {
			topImgDiv.style.display = "block";
			bottomImgDiv.style.display = "block";
		    topImgDiv.querySelector("img").src = imgs[0];
		    bottomImgDiv.querySelector("img").src = imgs[1];
		  }
		});

		// 지역별 호버 이미지 관련 이벤트(마우스 내렸을 때 실행)
		koreaSeries.mapPolygons.template.events.on("pointerout", function(ev) {
			topImgDiv.style.display = "none";
			topImgDiv.querySelector("img").src = "";
			bottomImgDiv.style.display = "none";
			bottomImgDiv.querySelector("img").src = "";
		});
		
		
		// 지도에서 해당 지역(폴리곤)을 클릭했을 때 버튼 클릭처럼 동작하게
		koreaSeries.mapPolygons.template.events.on("click", function (ev) {
			  const rawName = ev.target.dataItem?.dataContext?.name || ''; //amCharts가 내부적으로 가진 GeoJSON 데이터에서 name 필드(영문)를 가져옴
			  const koreanName = locationNames[rawName] || rawName; // locationNames 매핑 객체를 이용해 "Seoul" → "서울특별시"로 변환
			  const url = locationUrls[koreanName]; // 한글 지역명을 키로 해서 locationUrls에서 대응되는 URL 찾기

			  // URL이 존재하면 window.location.href로 해당 주소로 이동
			  if (url && url !== "#") {
			    window.location.href = url;
			  } else {
			    console.warn("URL not mapped:", koreanName);
			  }
			});
		
		// 차트 애니메이션
		chart.appear(1000, 100);
		
		
		// =====
		// 지도에서 클릭한 지역을 -> 한글로 변환 -> url 매핑 -> 페이지 이동 순서로 처리함.
		// ====
	</script>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>