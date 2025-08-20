// jQuery를 사용하기 위해 문서가 완전히 로드된 후 실행되도록 설정
$(document).ready(function() {

	// 중복체크 버튼 클릭 이벤트
	$("#btnIdCheck").on("click", function() {
		var userId = $("#userid").val();

		if (userId.length === 0) {
			alert("아이디를 입력해주세요.");
			return;
		}

		// jQuery의 Ajax 메서드를 사용
		$.ajax({
			url: "doubleCheckId.do", // 요청을 보낼 URL
			type: "GET", // HTTP 메서드 (GET, POST 등)
			data: { id: userId }, // 서버로 보낼 데이터
			success: function(data) { // 요청 성공 시 실행될 함수
				var isIdExist = (data.trim() === 'true');
				var $checkMsg = $("#checkmsg");
				var $isIdCheck = $("#isIdCheck");

				if (isIdExist) {
					$checkMsg.html("이미 존재하는 아이디입니다.").css("color", "red");
					$isIdCheck.val("n");
				} else {
					$checkMsg.html("사용 가능한 아이디입니다.").css("color", "green");
					$isIdCheck.val("y");
				}
			},
			error: function(error) { // 요청 실패 시 실행될 함수
				console.error('오류 발생:', error);
				$("#checkmsg").html("통신에 실패했습니다.").css("color", "gray");
			}
		});
	});

	// 아이디 입력란에 값이 수정되었을 때 실행되는 이벤트
	$("#userid").on("keydown", function() {
	    $("#checkmsg").empty();
	    $("#isIdCheck").val("n");
	});

	// 폼 제출 이벤트
	$("#regform").on("submit", function() {
		if ($("#isIdCheck").val() === 'n') {
			alert("아이디 중복 체크를 해주세요.");
			return false;
		}

		// 2. 비밀번호와 비밀번호 확인 값 비교
		var userpw = $("#userpw").val();
		var userpw_check = $("#userpw_check").val();

		// 두 비밀번호 입력란이 비어있는지 확인
		if (userpw.trim() === "" || userpw_check.trim() === "") {
			alert("비밀번호와 비밀번호 확인란을 모두 입력해주세요.");
			$("#userpw").focus();
			return false;
		}

		// 두 비밀번호 값이 일치하는지 확인
		if (userpw !== userpw_check) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			$("#userpw_check").focus();
			return false;
		}

		// 휴대폰 번호 형식 통일
		var hp = $("#hp").val();
		var cleanedHp = hp.replace(/-/g, "");
		$("#hp").val(cleanedHp);


		// 모든 필수 입력란 검증
		var fieldNames = {
			"userid": "아이디",
			"userpw": "비밀번호",
			"name": "이름",
			"hp": "전화번호",
			"email": "이메일",
			"birth": "생년월일"
		};

		for (var fieldId in fieldNames) {
			if ($("#" + fieldId).val().trim() === "") {
				var fieldName = fieldNames[fieldId];
				alert(fieldName + "을(를) 입력해주세요.");
				$("#" + fieldId).focus();
				return false;
			}
		}

		// 다른 유효성 검사 로직 추가 가능
		alert("회원가입 완료!");
		return true;
	});

});