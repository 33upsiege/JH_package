<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	/* 로그인 버튼 클릭 */
	$("#login_submit").on("click",function(){
		$("#login_form").attr("action","login").submit();
		 $("#join_form").attr("action","join3").submit();
	});
	
});
</script>
	<!-- body -->
	<section class="mainContent">
		<div class="bg_sub">
			<img src="images/bg_brand_sub.png" alt="johnnyrockets">
		</div>
		
		<div class="subWrap">

			<div class="brand_location">
				<a href="/" class="btn_home">Home</a> &gt; <a href="#none"> <em title="현재 페이지입니다.">메뉴</em></a> 
			</div>

			<div class="brd_tit_area">
				<h2 class="tit_brd01">
					 로그인 
				</h2>
				
					<p class="txt_brd07" style="margin-top: 25px;">맛있는 쟈니스에 오신것을 환영합니다. </p>
			</div>

			<div class="loginWrap_box">
				<div class="login_tit">
					정직한 음식이 만드는 행복한 세상!
				</div>
				<div class="login_form">
					<form id="login_form"  method="post">
						<div class="input_row mb10">
							<input type="text" placeholder="아이디 입력" name="member_id" />
						</div>
						<div class="input_row">
							<input type="password" placeholder="비밀번호 입력" name="member_passwd"/>
						</div>

						<div class="login-chk">
							<div class="login-chk-item">
								<div class="ui-checkbox-ty2">
									<input type="checkbox" id="ipt_item1" name="kfc_save_id" class="ui-checkbox-inp">
									<span class="ui-checkbox-label"></span>
								</div>
								<label for="ipt_item1" class="ui-checkbox-label-ty2">아이디 저장</label>
							</div>
						</div>

						<button id="login_submit" class="btn btn-reverse btn-lg login-button login_submit">로그인 </button>
						<!-- <a href="javascript:void(0)" id="login_submit" class="btn  btn-reverse btn-lg login-button login_submit">로그인</a> -->
						<a href="join" class="btn  btn-lg login-button login_submit">회원가입</a>

						<div class="login-util">
							<ul>
								<li><a href="find_id">아이디 찾기</a></li>
								<li><a href="pw_find">비밀번호 찾기</a></li>
							</ul>
						</div>
						
					</form>
				</div>
			</div>


		</div>
	</section>
	<!-- //body -->