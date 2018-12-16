<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





<script>
 
	 $(document).ready(function(){
		
		 $("#selectMailAddress").on("change", function() {
				var mail = $(this).val();
				if (mail == "select") {
					$("#email_Domain").val('');
				} else {
					$("#email_Domain").val(mail); 
				}
			});
		 $(".k_language").on("keyup",function(){
				if($(this).val( 
						$(this).val().replace
						( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''))){
					};	
				 });
	});

</script>


<section class="mainContent">
		<div class="bg_sub">
			<img src="images/bg_brand_sub.png" alt="johnnyrockets">
		</div>
		
		<div class="subWrap">

			<div class="brand_location">
				<a href="/zBurger" class="btn_home">Home</a> &gt; <a href="#none"> <em title="현재 페이지입니다.">메뉴</em></a> 
			</div>
			<div class="brd_tit_area">
				<h2 class="tit_brd01">
					 비회원 로그인
				</h2>
					<p class="txt_brd07" style="margin-top: 25px;">맛있는 쟈니스에 오신것을 환영합니다. </p>
			</div>

			<div class="loginWrap_box">
				<div class="login_tit">
					정직한 음식이 만드는 행복한 세상!
				</div>
				<div class="login_form">
					<form action="">
						<div class="input_row mb10">
							<input type="text" id="email_ID" class="form-input k_language" style="width:calc(100% - 23px)"placeholder="이메일을 입력해 주세요">
							<span class="ui-input-email"></span>
						</div>
						<div class="input_row">
							<input type="text" id="email_Domain" class="form-input signUp_next_check" style="width:100%">
						</div>
								<div class="ui-col3">
									<div class="ui-select-ty6 ui-col-ty2 form-select">
										<select id="selectMailAddress" class="selectMailAddressClass"style="width:470px;margin-block-start: 9px">
											<option value="select">직접입력</option>
											<option value="gmail.com" data-attr1="" data-attr2="" data-attr3="">gmail.com</option>
											<option value="naver.com" data-attr1="" data-attr2="" data-attr3="">naver.com</option>
											<option value="nate.com" data-attr1="" data-attr2="" data-attr3="">nate.com</option>
											<option value="daum.net" data-attr1="" data-attr2="" data-attr3="">daum.net</option>
										</select>
									</div>
								</div>

						<a href="#" class="btn btn-reverse btn-lg login-button login_submit2" style="margin-block-start: 50px;">확인</a>
					</form>
				</div>
			</div>

						


		</div>
	</section>
	<!-- //body -->