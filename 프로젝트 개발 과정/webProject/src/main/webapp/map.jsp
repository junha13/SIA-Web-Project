<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>대한민국 지도</title>
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/map.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/southKoreaLow.js"></script>
<style>
    body {
        font-family: 'Noto Sans KR', Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f5f5f5;
    }
    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }
    #chartdiv {
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    .info-box {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        margin-top: 20px;
        text-align: center;
    }
	    
	    .map-popover{
	  position: fixed;
	  min-width: 260px;
	  max-width: 320px;
	  background:#fff;
	  border:1px solid #e6e6e6;
	  border-radius:14px;
	  box-shadow:0 12px 30px rgba(0,0,0,.15);
	  padding:14px;
	  z-index: 10000;
	}
	.map-popover::after{
	  content:"";
	  position:absolute;
	  left:24px; bottom:-10px;
	  border-width:10px 10px 0 10px;
	  border-style:solid;
	  border-color:#fff transparent transparent transparent;
	  filter: drop-shadow(0 -1px 0 rgba(0,0,0,.08));
	}
	.map-popover__header{
	  display:flex; align-items:center; justify-content:space-between;
	  gap:8px; margin-bottom:6px;
	}
	.map-popover__close{
	  appearance:none; border:0; background:transparent;
	  font-size:20px; line-height:1; cursor:pointer; color:#666;
	}
	.map-popover__desc{ color:#444; font-size:14px; margin:6px 0 12px; }
	.map-popover__actions{ display:flex; gap:8px; align-items:center; }
	.details-btn{
	  display:inline-flex; align-items:center; justify-content:center;
	  padding:8px 12px; border-radius:8px; font-weight:600; text-decoration:none;
	  background:#ef3b2d; color:#fff; /* FreezPak 느낌 */
	}
	.details-btn:hover{ opacity:.9; }
    
</style>
</head>
<body>
<div id="chartdiv" style="width: 100%; height: 500px;"></div>

<!-- 카드형 팝업 -->
<div id="map-popover" class="map-popover" hidden>
  <div class="map-popover__header">
    <strong id="pop-title"></strong>
    <button id="pop-close" class="map-popover__close" aria-label="닫기">×</button>
  </div>
  <div id="pop-desc" class="map-popover__desc"></div>
  <div class="map-popover__actions">
    <!-- 필요하면 전화 버튼도 가능: <a id="pop-phone" class="icon-btn" href="#" target="_blank" title="전화">☎</a> -->
    <a id="pop-details" class="details-btn" href="#" target="_blank" rel="noopener">Details</a>
  </div>
</div>


<script>
var root = am5.Root.new("chartdiv");

// 지도 차트 생성
var chart = root.container.children.push(
    am5map.MapChart.new(root, {
        panX: "rotateX",
        projection: am5map.geoMercator()
    })
);

var colors = am5.ColorSet.new(root, {});

// 한국 지도 시리즈 생성
var koreaSeries = chart.series.push(
    am5map.MapPolygonSeries.new(root, {
        geoJSON: am5geodata_southKoreaLow
    })
);

// 지역별 URL 매핑 (실제 페이지 URL로 수정 필요)
var regionUrls = {
    "서울특별시": "https://www.google.com/search?q=서울",
    "부산광역시": "/region/busan.jsp", 
    "대구광역시": "/region/daegu.jsp",
    "인천광역시": "/region/incheon.jsp",
    "광주광역시": "/region/gwangju.jsp",
    "대전광역시": "/region/daejeon.jsp",
    "울산광역시": "/region/ulsan.jsp",
    "세종특별자치시": "/region/sejong.jsp",
    "경기도": "/region/gyeonggi.jsp",
    "강원도": "/region/gangwon.jsp",
    "충청북도": "/region/chungbuk.jsp",
    "충청남도": "/region/chungnam.jsp",
    "전라북도": "/region/jeonbuk.jsp",
    "전라남도": "/region/jeonnam.jsp",
    "경상북도": "/region/gyeongbuk.jsp",
    "경상남도": "/region/gyeongnam.jsp",
    "제주특별자치도": "/region/jeju.jsp"
};

// 지역별 한글명 매핑 (영문명을 한글명으로 변환)
var regionNames = {
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

// 지도 폴리곤 설정 (수정중)
koreaSeries.mapPolygons.template.setAll({
    tooltipText: `{name} 첫 번째 링크 안내 두 번째 링크 안내`,
    interactive: true,
    stroke: am5.color(0xe3e3e3),
    strokeWidth: 1,
    fillOpacity: 0.7,
    fill: am5.color(0x74b9ff),
    cursorOverStyle: "pointer"
});

// 호버 효과
koreaSeries.mapPolygons.template.states.create("hover", {
    fill: am5.color(0x0984e3),
    fillOpacity: 0.9,
    strokeWidth: 2
});

// 클릭 이벤트 추가
koreaSeries.mapPolygons.template.onPrivate("tooltipText", function(tooltip, target) {
    // 클릭 이벤트 리스너 추가
    target.on("click", function(ev) {
        var dataItem = ev.target.dataItem;
        var regionData = dataItem.dataContext;
        var regionName = regionData.name;
        
        // 영문명을 한글명으로 변환
        var koreanName = regionNames[regionName] || regionName;
        
        // 해당 지역의 URL 가져오기
        var targetUrl = regionUrls[koreanName];
        
        if (targetUrl) {
            // 실제 구현시에는 아래 주석을 해제하고 alert는 제거
            // window.location.href = targetUrl;
            
            // 테스트용 알림창 (실제 구현시 제거)
            alert(koreanName + " 소개 페이지로 이동합니다.\n" + "URL: " + targetUrl);
            
            // 또는 새 창에서 열기
            // window.open(targetUrl, '_blank');
        } else {
            alert(koreanName + "에 대한 페이지를 준비중입니다.");
        }
    });
});

// 차트 애니메이션
chart.appear(1000, 100);
</script>
</body>
</html>