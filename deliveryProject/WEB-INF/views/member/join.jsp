<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <script>
 
 $(document).ready(function(){
	 	$("#ipt_item_all").on("click",function(){
		if($(this).is(":checked")){
			$(".subCheckBox").prop("checked",true);
		}else{
			$(".subCheckBox").prop("checked",false);
		}
	});//end check 
	 	
	$("#signUp_next_Btn").on("click",function(event){
		var signUpCheck1 = $("#ipt_item1").is(":checked");
		var signUpCheck2 = $("#ipt_item2").is(":checked");
		var signUpCheck3 = $("#ipt_item3").is(":checked");
		if(signUpCheck1==false || signUpCheck2==false || signUpCheck3==false){
			alert("서비스 이용 약관 동의를 확인 해 주세요.");
			event.preventDefault();
		}
	})//end signUp_next_Btn
 })//end ready
 </script>
<!-- body -->
	<section class="mainContent">
		<div class="inner joinWrap">
			<div class="sign-section">
				<div class="sign-inner">
					<div class="sign-hd">
						<!-- <img src="images/brand_logo.png" alt="로고" /> -->
						<span class="tit">
							쟈니스버거 코리아 
							<span>통합회원가입</span>
						</span>
							
						<div class="sign-progress">
							<ul>
								<li class="is-active"><p><span class="ui-num-tye">1</span><br>약관 동의</p></li>
								<li><p><span class="ui-num">2</span><br>정보 입력</p></li>
								<li><p><span class="ui-num">3</span><br>가입 완료</p></li>
							</ul>
						</div>

					</div>
					<div class="sign-bd">
						<div class="sign-phrase">
							<p class="i-txt">회원가입을 위해서 아래 카드약관, 온라인약관, 개인정보 취급방침에 대한 안내를 읽고 동의해주세요.</p>
							<div class="i-bx">
								<div class="ui-checkbox">
									<input type="checkbox" id="ipt_item_all" name="checkAll" class="ui-checkbox-inp">
									<label class="ui-checkbox-label" for="ipt_item1"><span class="v-hidden">선택</span></label>
								</div>
							</div>
						</div><!-- //sign-phrase -->

						<!-- sign-entry 약관1 -->
						<div class="sign-entry">
							<div class="sign-entry-hd">
								<h4 class="sign-entry-htit">서비스 이용약관 <span class="fc_red">(필수)</span></h4>
								<div class="sign-entry-chk">
									<div class="ui-checkbox">
										<input type="checkbox" id="ipt_item1" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box">
										<label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
									</div>
								</div>
							</div>

							<iframe title="[필수]해피포인트카드 회원이용약관" frameborder="0" leftmargin="0" marginheight="0" marginwidth="0" scrolling="auto" height="135" src="https://member.happypointcard.com/member_02/clause01.html" topmargin="0" style="background-color:#ffffff; border:1px solid #D7D7D7;" width="540"></iframe>
						</div>
						<!-- //sign-entry 약관1 -->

						<!-- sign-entry 약관2 -->
						<div class="sign-entry">
							<div class="sign-entry-hd">
								<h4 class="sign-entry-htit">서비스 이용약관 <span class="fc_red">(필수)</span></h4>
								<div class="sign-entry-chk">
									<div class="ui-checkbox">
										<input type="checkbox" id="ipt_item2" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box">
										<label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
									</div>
								</div>
							</div>

							<iframe title="[필수]해피포인트카드 회원이용약관" frameborder="0" leftmargin="0" marginheight="0" marginwidth="0" scrolling="auto" height="135" src="https://member.happypointcard.com/member_02/clause02.html" topmargin="0" style="background-color:#ffffff; border:1px solid #D7D7D7;" width="540"></iframe>
						</div>
						<!-- //sign-entry 약관2 -->

						<!-- sign-entry 약관3 -->
						<div class="sign-entry">
							<div class="sign-entry-hd">
								<h4 class="sign-entry-htit">서비스 이용약관 <span class="fc_red">(필수)</span></h4>
								<div class="sign-entry-chk">
									<div class="ui-checkbox">
										<input type="checkbox" id="ipt_item3" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box">
										<label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
									</div>
								</div>
							</div>

							<iframe title="[필수]해피포인트카드 회원이용약관" frameborder="0" leftmargin="0" marginheight="0" marginwidth="0" scrolling="auto" height="135" src="https://member.happypointcard.com/member_02/clause03.html" topmargin="0" style="background-color:#ffffff; border:1px solid #D7D7D7;" width="540"></iframe>
						</div>
						<!-- //sign-entry 약관3 -->


						<section class="sign-phrase-list">
							<h4 class="htit">회원가입 유의사항</h4>
							<ul>
								<li>반드시 회원님 명의로 된 휴대폰을 이용해주세요.</li>
								<li>타인의 개인정보를 도용하여 가입할 경우 향후 적발 시 서비스 이용제한 및 법적 제재를 받으실 수 있습니다.</li>
							</ul>
						</section>

						<div class="sign-button">
							<a href="join2" class="btn btnNext" id="signUp_next_Btn">다음</a>
						</div>

					</div><!-- //sign-bd -->


				
					
				</div>


			</div>
		</div>
	</section>
	<!-- //body -->