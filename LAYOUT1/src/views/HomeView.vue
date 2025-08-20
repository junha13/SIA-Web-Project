

<template>

<!--상단 타이틀 추가하기-->
  <div class="d-flex flex-column h-100">

    <div class="app-header d-flex align-items-center justify-content-between border-bottom border-3 border-secondary bg-white p-1 shadow-sm">
      <button class="w-80px btn btn-icon align-self-center">
        <i class="ki-duotone ki-setting-2 fs-2x ">
          <span class="path1"></span> 
          <span class="path2"></span> 
        </i>
      </button>
      <div class="w-550px d-flex align-self-center">
        <span class="fs-1 fw-bold">안전등산</span>
      </div>
      <button class="w-80px btn btn-icon btn-light" id="kt_app_sidebar_mobile_toggle">
        <i class="ki-duotone ki-abstract-14 fs-2x">
          <span class="path1"></span>
          <span class="path2"></span>
        </i>
    </button>
	</div>

	<!--메인 영역-->
	<div class="flex-glow-1 overflow-auto p-5 ">

		<div>
			<div class="d-flex flex-row flex-fill justify-content-between h-475px">

				<div class="text-white w-50"> <!-- w-50 // 부모 너비의 50퍼만 사용한다는 뜻 flex-fill은 문자열이 남은 공간을 밀어내며 커짐-->
					<div class="d-flex flex-column">
						<div class="h-350px p-2"> <!--paddig같은 경우엔 부모에 걸어주는게 효과적임 그리고 너비나 높이설정도 미리 하면 좋음-->
							<div class="w-100 h-100 bg-primary rounded-3"> <!--그랬을때 자식은 부모의 %로 적용하는게 나중에 볼때 좋음-->
                <div class="p-3">
                  <div class="mt-2">
                    <span class="fs-1 fw-bold title">오늘의 등산로</span><br></br>
                    <span class="fs-4">등산로 보기</span>
                  </div>
                </div>
							</div>
						</div>

						<div class="h-125px p-2">
							<div class="w-100 h-100 bg-primary rounded-3"> <!-- rounded는 3까지밖에 없음-->
                <div class="p-3">
                  <div class="mt-2">              
                    <span class="fs-1 fw-bold title">등산</span><br></br>
                    <span class="fs-4">나만의</span><br>
                    <span class="fs-4">등산기록</span>
                  </div>
                </div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="text-white w-50">
					<div class="d-flex flex-column">
						<div class="h-175px p-2">
							<div class="w-100 h-100 bg-primary rounded-3">
                <div class="p-3">
                  <div class="mt-2">
                    <span class="fs-1 fw-bold title">민원신청</span><br></br>
                    <span class="fs-4">불편, 개선사항 접수</span>
                  </div>
                </div>
							</div>
						</div>
						<div class="h-175px p-2">
							<div class="w-100 h-100 bg-primary rounded-3">   
                <div class="p-3">
                  <div class="mt-2">
                  <span class="fs-1 fw-bold title">긴급</span><br></br>
                  <span class="fs-4">SOS 신고</span>
                  </div>
                </div>
							</div>			
						</div>
						<div class="h-125px p-2">
							<div class="w-100 h-100 bg-primary rounded-3">
                <div class="p-3">
                  <div class="mt-2">
                    <span class="fs-1 fw-bold title">커뮤니티</span><br></br>
                    <span class="fs-4">#오등완</span><br>
                    <span class="fs-4">#등린이</span>
                  </div>
                </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    <div class="p-2 mt-3">
      <div>
        <span class="fs-1 fw-bold title">어서와 등산은 처음이지? 😎</span>
      </div>
      <div>
        <div>
          <span class="fs-4">요즘 뜨는 등산멘토</span>
        </div>
        <div class="d-flex flex-row align-items-center">
          <div>
            <img src="/src/assets/images/hrr.jpg" class="w-95px rounded-circle border border-2 border-secondary shadow cursor-pointer"></img>
          </div>
          <div class="ms-3">
            <img src="/src/assets/images/bp.png" class="w-95px rounded-circle border border-2 border-secondary shadow cursor-pointer"></img>
          </div>
          <div class="ms-3">
            <img src="/src/assets/images/faker.jpg" class="w-95px rounded-circle border border-2 border-secondary shadow cursor-pointer"></img>
          </div>
          <div class="ms-3">
            <img src="/src/assets/images/bong.jpg" class="w-95px rounded-circle border border-2 border-secondary shadow cursor-pointer"></img>
          </div>
          <div class="ms-3">
            <img src="/src/assets/images/son.jpg" class="w-95px rounded-circle border border-2 border-secondary shadow cursor-pointer"></img>
          </div>
        </div>
      </div>
      <div class="h-200px">
        <div class="mt-3">
          <span class="fs-1 fw-bold title">지금 가장 핫한 게시물 🧡</span>
        </div>
        <div class="d-flex flex-row">
            <img src="/src/assets/images/han.jpg" class="w-50 h-150px p-1"></img>
            <img src="/src/assets/images/zi.jpg" class="w-50 h-150px p-1"></img>
        </div>
      </div>
    </div>
  </div>


	<!--하단 탭-->

	<!--border-top:위쪽 테두리 -->

 <!--:이 붙으면 어떤 상황에 있을 때를 말하는ㄱ임-->

 <!--호출되는 상황 이해하기-->
    <div class="fixed-bottom d-md-none bg-white border-top h-10">

      <div class="menu menu-row d-flex justify-content-around py-2 fs-6 fw-bold cursor-pointer">

        <div class="menu-item flex-column align-items-center flex-fill mx-4 tab-btn"
             :class="(activeTab == 'home') ? 'active' : ''"
             @click="tabButtonClicked('home')">
          <span class="menu-icon mb-1">
              <i class="ki-duotone ki-home fs-2x">
              </i>
          </span>
          <span class="menu-title">코스</span>
        </div>

        <div class="menu-item flex-column align-items-center flex-fill mx-4 tab-btn"
            :class="(activeTab == 'search') ? 'active' : ''"
             @click="tabButtonClicked('search')">
          <span class="menu-icon mb-1">
              <i class="ki-duotone ki-parcel-tracking fs-2x">
                <span class="path1"></span>
                <span class="path2"></span>
                <span class="path3"></span>
              </i>
          </span>
          <span class="menu-title">등산</span>
        </div>

        <div class="menu-item flex-column align-items-center flex-fill mx-4 tab-btn"
            :class="(activeTab == 'document') ? 'active' : ''"
             @click="tabButtonClicked('document')">
          <span class="menu-icon mb-1">
              <i class="ki-duotone ki-document fs-2x">
                <span class="path1"></span>
                <span class="path2"></span>
              </i>
          </span>
          <span class="menu-title">홈</span>
        </div>

        <div class="menu-item flex-column align-items-center flex-fill mx-4 tab-btn"
            :class="(activeTab == 'aa') ? 'active' : ''"
             @click="tabButtonClicked('aa')">
          <span class="menu-icon mb-1">
              <i class="ki-duotone ki-dots-circle fs-2x">
                <span class="path1"></span>
                <span class="path2"></span>
                <span class="path3"></span>
                <span class="path4"></span>
              </i>
          </span>
          <span class="menu-title">위험신고</span>
        </div>

        <div class="menu-item flex-column align-items-center flex-fill mx-4 tab-btn"
            :class="(activeTab == 'more') ? 'active' : ''"
             @click="tabButtonClicked('more')">
          <span class="menu-icon mb-1">
              <i class="ki-duotone ki-dots-circle fs-2x">
                <span class="path1"></span>
                <span class="path2"></span>
                <span class="path3"></span>
                <span class="path4"></span>
              </i>
          </span>
          <span class="menu-title">커뮤니티</span>
        </div>

      </div>

    </div>

  </div>

  <!-- 드로어 -->
  <div id="kt_drawer_basic1"
    class="bg-white d-flex flex-column drawer-hidden"
    data-kt-drawer="true"
    data-kt-drawer-activate="true"
    data-kt-drawer-toggle="#kt_app_sidebar_mobile_toggle"
    data-kt-drawer-width="{default: '250px', 'md': '500px'}"
    data-kt-drawer-direction="end" 
  >
  <!--start: 왼쪽, 오른쪽은 end로 바꾸면 됨-->

    <div class="p-5 border-bottom">
      <h3>메뉴</h3>
    </div>

    <div class="p-5">

      <div class="menu menu-column fs-6 fw-bold">

        <div class="menu-item">
          <div class="menu-link bg-light-primary text-primary px-4 py-2 rounded">
            <span class="menu-icon">
              <i class="ki-duotone ki-home fs-2x text-primary">
              </i>
            </span>
            <span class="menu-title m-2">홈</span>
          </div>
        </div>

        <div class="menu-item">
          <div class="menu-link bg-light-secondary text-dark px-4 py-2 rounded">
            <span class="menu-icon">
              <i class="ki-duotone ki-parcel-tracking fs-2x">
                <span class="path1"></span>
                <span class="path2"></span>
                <span class="path3"></span>
              </i>
            </span>
            <span class="menu-title m-2">찾기</span>
          </div>
        </div>

        <div class="menu-item">
          <div class="menu-link bg-light-secondary text-dark px-4 py-2 rounded">
            <span class="menu-icon">
              <i class="ki-duotone ki-document fs-2x">
                <span class="path1"></span>
                <span class="path2"></span>
              </i>
            </span>
            <span class="menu-title m-2">문서</span>
          </div>
        </div>

      </div>

    </div>

    <div class="m-10">

      <button class="btn btn-sm btn-primary" @click="closeDrawer()">닫기</button>

    </div>


  </div>



</template>


<script setup>

import { ref, onMounted } from 'vue'

let drawer;

const activeTab = ref('home');

// 화면이 보이기 전에 한번 호출됨
onMounted(() => {
  console.log(`HomeView::onMounted 호출됨.`);

  // Drawer 설정
  KTDrawer.createInstances();

  const drawerElem = document.querySelector('#kt_drawer_basic1');
  drawer = KTDrawer.getInstance(drawerElem);
  drawer.on('kt.drawer.shown', () => {
    console.log(`Drawer가 보여짐`);

    drawerElem.classList.remove('drawer-hidden');
  })
  drawer.on('kt.drawer.hidden', () => {
    console.log(`Drawer가 사라짐`);
    drawerElem.classList.add('drawer-hidden');
  })

})


// 드로어 안에 있는 [닫기] 버튼을 눌렀을 때
function closeDrawer() {
  console.log(`closeDrawer 호출됨`);

  if (drawer) {
    drawer.hide();
  }

}


// 하단 탭의 버튼이 눌렸을 때
function tabButtonClicked(name) {
  console.log(`tabButtonClicked 호출됨`);

  activeTab.value = name;
}



</script>

<style scoped>


.my-border {
  border: 2px dashed violet;
}

/* 드로어 */
.drawer-hidden {
  transform: translateX(-100%);
  visibility: hidden;
}

.drawer-shown {
  visibility: visible;
}

/* 탭버튼 */
.tab-btn {
  padding: 4px 8px;
  border-radius: 8px;
  transition: all 0.25s ease-in-out;
}

.tab-btn.active {
  background-color: rgba(15, 110, 253, 0.1);
  color: var(--bs-primary) !important;
  border-radius: 8px;
  transform: scale(1.1);
}

.tab-btn .menu-icon {
  transition: color 0.25s ease-in-out;
}

.tab-btn.active .menu-icon i {
  color: var(--bs-primary) !important;
}



</style>