<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	padding-top: 50px; /*헤더크기만큼 내리는 코드*/
	padding-top: 50px; /*헤더크기만큼 내리는 코드*/
    background: linear-gradient(135deg, #e2eafc 30%, #cfdef3 90%);
}
</style>
<title>대한민국 지도</title>
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/map.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/southKoreaLow.js"></script>
</head>
<body>
	<%@ include file="common/header.jsp"%>	
	<div id="chartdiv" style="width: 100%; height: 800px;"></div>

	<script>
		// amCharts 루트(렌더링 컨테이너) 생성
		var root = am5.Root.new("chartdiv");
		
		//지도 맵차트 생성(메르카토르 투영 + 화면 고정효과)
		var chart = root.container.children.push(
			    am5map.MapChart.new(root, {
			        projection: am5map.geoMercator(),
			        panX: "none",
			        panY: "none", 
			        wheelX: "none",
			        wheelY: "none" 
			    })
			)
		
		// 지도 폴리곤 시리즈 추가 (대한민국 경계선 GeoJSON)
		var koreaSeries = chart.series.push(
		    am5map.MapPolygonSeries.new(root, {
		        geoJSON: am5geodata_southKoreaLow 
		    })
		);
		
		// 폴리곤 스타일 공통 설정
		koreaSeries.mapPolygons.template.setAll({
		    interactive: true,
		    stroke: am5.color(0xe3e3e3),
		    strokeWidth: 1,
		    fillOpacity: 0.7, 
		    fill: am5.color(0x74b9ff), 
		    cursorOverStyle: "pointer" 
		});
		
		// 호버 스타일
		koreaSeries.mapPolygons.template.states.create("hover", {
		    fill: am5.color(0x0984e3), 
		    fillOpacity: 0.9,
		    strokeWidth: 2 
		});
		
		//=== 지도에서 클릭한 지역을 -> 한글로 변환 -> url 매핑 -> 페이지 이동 순서로 처리 ===
		
		// 지역별 한글명 매핑 (영문명을 한글명으로 변환)
		var locationNames = {
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
		
		// 튤팁 텍스트 한글화
		koreaSeries.mapPolygons.template.adapters.add("tooltipText", (text, target) => {
			  const raw = target.dataItem?.dataContext?.name;
			  return locationNames[raw] || raw || "";
			});
		
		// 지역별 url 매핑
		var contextPath = '<%=request.getContextPath()%>';

	    var locationUrls = {
	        "서울특별시": contextPath + "/post/location.do?location=seoul",
	        "부산광역시": contextPath + "/post/location.do?location=busan", 
	        "대구광역시": contextPath + "/post/location.do?location=ready",
	        "인천광역시": contextPath + "/post/location.do?location=ready",
	        "광주광역시": contextPath + "/post/location.do?location=ready",
	        "대전광역시": contextPath + "/post/location.do?location=ready",
	        "울산광역시": contextPath + "/post/location.do?location=ready,",
	        "세종특별자치시": contextPath + "/post/location.do?location=ready",
	        "경기도": contextPath + "/post/location.do?location=ready",
	        "강원도": contextPath + "/post/location.do?location=ready",
	        "충청북도": contextPath + "/post/location.do?location=ready",
	        "충청남도": contextPath + "/post/location.do?location=ready",
	        "전라북도": contextPath + "/post/location.do?location=ready",
	        "전라남도": contextPath + "/post/location.do?location=ready",
	        "경상북도": contextPath + "/post/location.do?location=ready",
	        "경상남도": contextPath + "/post/location.do?location=ready",
	        "제주특별자치도": contextPath + "/post/location.do?location=jeju"
	    };
			
		
		// 튤팁 텍스트 한글화
		koreaSeries.mapPolygons.template.adapters.add("tooltipText", (text, target) => {
			  const raw = target.dataItem?.dataContext?.name;
			  return locationNames[raw] || raw || "";
			});
		
		// 지역별 url 매핑
		var contextPath = '<%=request.getContextPath()%>';

	    var locationUrls = {
	        "서울특별시": contextPath + "/post/location.post?location=seoul",
	        "부산광역시": contextPath + "/post/location.post?location=busan", 
	        "대구광역시": contextPath + "/post/location.post?location=ready",
	        "인천광역시": contextPath + "/post/location.post?location=ready",
	        "광주광역시": contextPath + "/post/location.post?location=ready",
	        "대전광역시": contextPath + "/post/location.post?location=ready",
	        "울산광역시": contextPath + "/post/location.post?location=ready,",
	        "세종특별자치시": contextPath + "/post/location.post?location=ready",
	        "경기도": contextPath + "/post/location.post?location=ready",
	        "강원도": contextPath + "/post/location.post?location=ready",
	        "충청북도": contextPath + "/post/location.post?location=ready",
	        "충청남도": contextPath + "/post/location.post?location=ready",
	        "전라북도": contextPath + "/post/location.post?location=ready",
	        "전라남도": contextPath + "/post/location.post?location=ready",
	        "경상북도": contextPath + "/post/location.post?location=ready",
	        "경상남도": contextPath + "/post/location.post?location=ready",
	        "제주특별자치도": contextPath + "/post/location.post?location=jeju"
	    };
			
		
		// 지도에서 해당 지역(폴리곤)을 클릭했을 때 버튼 클릭처럼 동작하게
		koreaSeries.mapPolygons.template.events.on("click", function (ev) {
			  const rawName = ev.target.dataItem?.dataContext?.name || ''; 
			  const koreanName = locationNames[rawName] || rawName;
			  const url = locationUrls[koreanName];

			  // URL이 존재하면 window.location.href로 해당 주소로 이동
			  if (url && url !== "#") {
			    window.location.href = url;
			  } else {
			    console.warn("URL not mapped:", koreanName);
			  }
			});
		
		// 차트 애니메이션
		chart.appear(1000, 100);
	</script>
	<%@ include file="common/footer.jsp"%>
</body>
</html>