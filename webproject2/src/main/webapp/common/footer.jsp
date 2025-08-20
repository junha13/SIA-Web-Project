<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
/* footer가 내용 끝이나 화면 하단에 위치하도록 flex 레이아웃 보조 */
html, body {
    height: 100%;
    margin: 0;
}

/*body태그를 flexbox컨테이너로 바꾼 뒤, 세로레이아웃으로 설정한 뒤 footer가 무조건 최하단에 뜨도록 만듦*/
body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

#footer_wrap {
    margin-top: auto;
}

#footer_fix.jumbotron {
    background-color: #ffffff;
    font-family: Arial, sans-serif;
    font-size: 12px;
}
</style>

<div id="footer_wrap">
    <div class="jumbotron jumbotron-fluid" id="footer_fix" style="margin-bottom:0;">
        <div class="container">
            (08306) 서울특별시 구로구 가마산로 242(구로동 83) 3층 <br>
            TEAM 김준하 김민채 정준안 조계연 하성민 <br>
            COPYRIGHT(C) TRAVEL-LOG. ALL RIGHTS RESERVED <br>
        </div>
    </div>
</div>
