<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지역 화면 구현(서울, 부산, 제주)</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
	
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/map.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/southKoreaLow.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
	<header>
		<h1>추천여행지</h1> <!-- 큰 제목 고정 -->
	</header>
	
	<h2 id="spot-title"></h2>
	<div id="spot-post"></div>

	<script type="text/javascript">
		// type이 변경되면 실행될 이벤트 리스너
		$('#type').on('change', function() {
			let type = $('#type').val();
			$.ajax({
				url : 'JQServlet',
				data : {
					'type' : type
				},
				dataType : 'json',
				success : changeDetail
			})
		})

		// detail 옵션 변경
		function changeDetail(data) {
			$('#detail').empty();
			for (let key in data) {
				const option = `<option value="${key}">${data[key]}</option>`;
				$('#detail').append(option);
			}
		}
	</script>
</body>
</html>