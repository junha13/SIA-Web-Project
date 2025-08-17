# SIA-Web-Project
공간정보 아카데미 2차 프로젝트

-일단 ajax쪽 기능 구현해둬서 보면서 loction 받는 곳에 적용하시기만 하면 될 것 같구요, 테이블에서 지역 테이블도 만들어놨는데 이거 만드셔야 ajax 되게 했어요. 그거 gpt딸깍하면 다 생성해줘서 그거 한번 확인하시고 붙혀넣으시면 될거같아요.
-밑에는 그냥 생각나는거 적어둔거라 한번 읽어보시고 우선순위 매겨서 처리해주시면 감사하겠습니다. 

1. 로그인 한 이름이 post 저장할 때 같이 저장되도록(세션에 가지고 있으면 되나?), post list에 같이 나와야 하고 상세페이지에서도 누가썻는지 보여야 하니까

2. 이제 페이지간 연결을 다 만들어놔도 될듯(post 서블릿 2개인데 합치기 어려우면 일요일에 합칠게요, postwrite도 2개일텐데 실행해봐서 그 기능 여러개 있는게 진짜임(아니면 일요일에 지울게요))

3. 지역 테이블 전부 만들어두는게 편하긴 할듯 어차피 ajax 했으니까 ( 근데 현재 ajax는 정말 기능만 구현해둔거임)

4. 마이페이지 or 상세페이지

5. login, join 관련 코드가 너무 난잡한 경향이 있음 기능별로 정리를 한다던가 약간의 가독성을 고려해줫으면 좋겠음

6. 프론트엔드 ( 사이트 대표 배경색, 포인트컬러, 로고(클로드 굳임), 폰트 등등 약간 통일감 있게 해두고 시작하면 이쁠듯, main꾸미기? main이 진짜 조금만 잘만하면 진짜 이쁘게 나올듯요)

7. postlist에서 커서올리면 약간 애니메이션 효과( 뭐 약간 검은색이 되면서 강조효과가 주어진다던지 등?), 그리고 post 작성에서 썸네일, 시작일, 종료일 받을수도 있음(그때가서 요소만 변경할 수 있게)

8. 추천여행지도 굳이굳이 있으면 좋긴할듯(마지막날에?)

9. 코드를 보면서 하는게 아니라 기억이 잘 안나는데 메서드 이름정리 변수 이름정리 해야 할듯, jsp파일도 하이픈들어간거 많은데 camelCase로 통일하는게 좋을듯

10. 저만 놀러가서 죄송합니다. 화이팅하시고 일요일에 뵙겠습니다.

-------------------------------------------------------------------------- 

text 실시간 연동
https://make-somthing.tistory.com/24
https://honeystorage.tistory.com/274

https://ccomccomhan.tistory.com/164?category=639596

https://honeystorage.tistory.com/274

마우스포인터 ㅋㅋ
https://www.mf2fm.com/rv/dhtmlheartcursor.php


버전관리
https://leeeeeyeon-dev.tistory.com/96


	<Resource name="jdbc/webProject"
		auth="Container"
		type="javax.sql.DataSource"
		maxTotal="20"
		maxIdle="10"
		driverClassName="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/newhr?serverTimezone=UTC"
		username="root"
		password="rootroot" />

-------------------------------------------------------------------------- 
헤더 - 로그인하면 세션값에 따라 마이페이지 등등 뜨는 것
https://codingwone.tistory.com/78
