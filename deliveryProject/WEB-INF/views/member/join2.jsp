<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

 <script>
 
 $(document).ready(function(){
	 
	 /* 가입정보 전송 */
	/*  var submit = $("#add_submit").on("click",function(){
		 $("#join_form").attr("action","join3").submit();
	 }); */
	 
	 
	 
	 
	 /* 한글방지 */
	 $(".k_language").on("keyup",function(){
		if($(this).val( 
				$(this).val().replace
				( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''))){
			};	
		 });
	 /* 아이디 유효성 */
	 $("#id_check_btn").on("click",function(){
		 console.log("중복확인");
			$.ajax({
				type : "GET",
				url : "checkID",
				dataType : "text",
				data : {
					member_id : $("#check_userID").val()
				},
				success : function(data, status, xhr){
					if(data == "ok"){
						alert("사용가능 ID 입니다");	
					} else if (data == "no"){
						alert("사용 할 수 없는 ID 입니다");						
						$("#check_userID").val('');
					}
				},//end success
				error : function(xhr,status,error){
					alert("에러입니다 다시 시도해주세요");
				}//end error
			});//end ajax
				if($(check_userID).val().length >= 13){
					alert("12자 이하로 입력해 주세요");
					$("#check_userID").val('');
				}
		});
	 /* 비밀번호 유효성 */
	 $("#password1").on("keyup",function(){
		 var pw1 = $("#password1").val();
		 var pw2 = $("#password2").val();
		 var pw_mesg = "한번 더 입력 해주세요.";
		 if(pw1.length !=0){
			 $("#password_check1").text("비밀번호를 입력해 주세요")
			 $("#password_check1").attr('style','color:red');
		 }
		 if(pw1.length >= 6){
			 $("#password_check1").text("사용 가능한 비밀번호 입니다.");
			 $("#password_check1").attr('style','color:lightgreen');
		 }
		 if(pw1 != pw2 && pw1.length >= 6 && pw2.length >= 6){
			 $("#password_check1").text("비밀번호를 확인해 주세요")
			 $("#password_check1").attr('style','color:red');
			 $("#password_check2").text("비밀번호 불일치");
			 $("#password_check2").attr('style','color:red');
		 }else if(pw1 == pw2 && pw1.length >= 6 && pw2.length >= 6){
			 $("#password_check1").text("");
			 $("#password_check2").text("비밀번호 일치");
			 $("#password_check2").attr('style','color:lightgreen');
		 }
	 })//end password1
	 $("#password2").on("keyup",function(){
		 var pw1 = $("#password1").val();
		if(pw1 == $(this).val()){
			$("#password_check2").text("비밀번호 일치");
			$("#password_check2").attr('style','color:lightgreen');
		    $("#password_check1").text("");
		}else{
			$("#password_check2").text("비밀번호 불일치");
			$("#password_check2").attr('style','color:red');
		}		
	 });//end password2
	 $("#selectMailAddress").on("change", function() {
			var mail = $(this).val();
			if (mail == "select") {
				$("#email_Domain").val('');
			} else {
				$("#email_Domain").val(mail); 
			}
		});	
	 /* 필수항목 alert */
	  //10-10 개발전 임시주석 
		$(".btnNext").on("click",function(event){
		var check_id = $("#check_userID").val();
		var check_gender = $(".ui-checkbox-inp").is(":checked");
		var check_birth = $(".birth_check option:selected").val();//.is(":selected");
		var check_name = $("#check_userName").val()
		var check_address1 = $("#userAddress1").val();
		var check_address2 = $("#userAddress2").val();
		var check_address2 = $("#userAddress3").val();
		var check_passwd1 = $("#password1").val();
		var check_passwd2 = $("#password2").val();
		var check_phone = $("#check_userPhone").val();
		var check_mail = $(".email_check").val()
		if(check_id.length == 0){
			alert("아이디를 확인 해 주세요");
			event.preventDefault();
		}
		if(check_name == 0){
			alert("이름을 확인 해 주세요");
			event.preventDefault();
		}
		if(check_passwd1.length == 0 || check_passwd2 == 0 || check_passwd1 != check_passwd2  ){
			alert("비밀번호를 확인 해 주세요");
			event.preventDefault();
		}
		if(check_gender == false){
			alert("성별을 선택 해 주세요");
			event.preventDefault();
		}
		if(check_birth == false){
			alert("생년월일을 선택 해 주세요");
			event.preventDefault();
		}
		/* if(check_address1.length == 0){
			alert("주소를 확인 해 주세요");
			event.preventDefault();
		}
		if(check_address2.length == 0){
			alert("주소를 입력 해 주세요");
			event.preventDefault();
		}
		if(check_address3.length == 0){
			alert("상세주소를 확인 해 주세요");
			event.preventDefault();
		} */
		if(check_phone.length == 0){
			alert("연락처를 확인 해 주세요");
			event.preventDefault();
		}
		if(check_mail.length == 0){
			alert("이메일을 확인 해 주세요");
			event.preventDefault();
		}
		$("#join_form").attr("action","join3").submit();
	});
 	$("#phone_check_btn").on("click",function(){
 		alert("서비스 준비중 입니다");
 	}) 
 	
 
 })//end ready
</script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
           //   document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
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
								<li><p><span class="ui-num-tye">1</span><br>약관 동의</p></li>
								<li class="is-active"><p><span class="ui-num">2</span><br>정보 입력</p></li>
								<li><p><span class="ui-num">3</span><br>가입 완료</p></li>
							</ul>
						</div>
					</div>
					<div class="sign-bd sign-step2">
						<div class="sign-tbl">
							<div class="sign-tbl-hd">
								<h3 class="htit">계정정보 입력</h3>
								<span class="sub-txt">필수 입력 표시입니다.</span>
							</div>
							<div class="tbl_type">
								<form id="join_form" method="post">
								<table>
								<col style="width:25%">
								<col style="width:75%">
								<tbody>
								<tr>
								<th data-label="Payment"><label for="userID" class="bu-star">아이디</label></th>
								<td>
									<div class="sign-id">
										<input type="text" class="form-input k_language signUp_next_check" name="member_id" id="check_userID" maxlength='13' placeholder='12자 이하' >
										<a href="javascript:void(0)" class="form-btn btn btn-sm btnUserIDCheck" id="id_check_btn">중복확인</a>
									</div>
								</td>
								</tr>
								<tr>
								<th data-label="Payment"><label for="userName" class="bu-star signUp_next_check">이름</label></th>
								<td>
									<div class="sign-name">
										<input type="text" class="form-input signUp_next_check" id="check_userName"  name="member_name">
									</div>
								</td>
								</tr>
								<tr>
									<th><label for="password1" class="bu-star" >비밀번호</label></th>
									<td>
										<div class="sign-pass">
											<input type="password" id="password1" name="member_passwd" class="form-input signUp_next_check" placeholder="6~12자리 / 영문,숫자조합" maxlength='12'>
											<span id="password_check1"></span>
										</div>
									</td>
								</tr>
								<tr>
									<th><label for="password2" class="bu-star">비밀번호 확인</label></th>
									<td>
										<div class="sign-pass">
											<input type="password" id="password2" class="form-input signUp_next_check" maxlength='12'>
											<span id="password_check2"></span>
										</div>
									</td>
								</tr>
								<tr>
									<th><span class="bu-star">생년월일</span></th>
									<td>
										<div class="sign-year-area">
											<div class="ui-select-ty6 form-select date_select">
												<select id="birthYear" class="birth_check" name="member_birthday1"><option value="">년도 선택</option><option value="2018">2018년</option><option value="2017">2017년</option><option value="2016">2016년</option><option value="2015">2015년</option><option value="2014">2014년</option><option value="2013">2013년</option><option value="2012">2012년</option><option value="2011">2011년</option><option value="2010">2010년</option><option value="2009">2009년</option><option value="2008">2008년</option><option value="2007">2007년</option><option value="2006">2006년</option><option value="2005">2005년</option><option value="2004">2004년</option><option value="2003">2003년</option><option value="2002">2002년</option><option value="2001">2001년</option><option value="2000">2000년</option><option value="1999">1999년</option><option value="1998">1998년</option><option value="1997">1997년</option><option value="1996">1996년</option><option value="1995">1995년</option><option value="1994">1994년</option><option value="1993">1993년</option><option value="1992">1992년</option><option value="1991">1991년</option><option value="1990">1990년</option><option value="1989">1989년</option><option value="1988">1988년</option><option value="1987">1987년</option><option value="1986">1986년</option><option value="1985">1985년</option><option value="1984">1984년</option><option value="1983">1983년</option><option value="1982">1982년</option><option value="1981">1981년</option><option value="1980">1980년</option><option value="1979">1979년</option><option value="1978">1978년</option><option value="1977">1977년</option><option value="1976">1976년</option><option value="1975">1975년</option><option value="1974">1974년</option><option value="1973">1973년</option><option value="1972">1972년</option><option value="1971">1971년</option><option value="1970">1970년</option><option value="1969">1969년</option><option value="1968">1968년</option><option value="1967">1967년</option><option value="1966">1966년</option><option value="1965">1965년</option><option value="1964">1964년</option><option value="1963">1963년</option><option value="1962">1962년</option><option value="1961">1961년</option><option value="1960">1960년</option><option value="1959">1959년</option><option value="1958">1958년</option><option value="1957">1957년</option><option value="1956">1956년</option><option value="1955">1955년</option><option value="1954">1954년</option><option value="1953">1953년</option><option value="1952">1952년</option><option value="1951">1951년</option><option value="1950">1950년</option></select>
											</div>
											<div class="ui-select-ty6 form-select date_select">
												<select id="birthMonth"class="birth_check" name="member_birthday2">
													<option value="">월 선택</option>
													<option value="01">01월</option>
													<option value="02">02월</option>
													<option value="03">03월</option>
													<option value="04">04월</option>
													<option value="05">05월</option>
													<option value="06">06월</option>
													<option value="07">07월</option>
													<option value="08">08월</option>
													<option value="09">09월</option>
													<option value="10">10월</option>
													<option value="11">11월</option>
													<option value="12">12월</option>
												</select>
											</div>
											<div class="ui-select-ty6 form-select date_select">
												<select id="birthDay" class="birth_check" name="member_birthday3">
												<option value="">일 선택</option>
												<option value="01">1일</option>
												<option value="02">2일</option>
												<option value="03">3일</option>
												<option value="04">4일</option>
												<option value="05">5일</option>
												<option value="06">6일</option>
												<option value="07">7일</option>
												<option value="08">8일</option>
												<option value="09">9일</option>
												<option value="10">10일</option>
												<option value="11">11일</option>
												<option value="12">12일</option>
												<option value="13">13일</option>
												<option value="14">14일</option>
												<option value="15">15일</option>
												<option value="16">16일</option>
												<option value="17">17일</option>
												<option value="18">18일</option>
												<option value="19">19일</option>
												<option value="20">20일</option>
												<option value="21">21일</option>
												<option value="22">22일</option>
												<option value="23">23일</option>
												<option value="24">24일</option>
												<option value="25">25일</option>
												<option value="26">26일</option>
												<option value="27">27일</option>
												<option value="28">28일</option>
												<option value="29">29일</option>
												<option value="30">30일</option>
												<option value="31">31일</option>
												
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th><span class="bu-star">성별</span></th>
									<td>
										<div class="sign-gen">
											<ul class="lst-type__horizon">
												<li>
													<div class="payment-info__item">
														<div class="ui-checkbox-ty3">
															<input type="radio" id="sex_m" name="member_gender" class="ui-checkbox-inp" value="M">
															<span class="ui-checkbox-label ui-checkbox-label__ty2"><span class="v-hidden">선택</span></span>
														</div>
													</div>
													<p class="payment-info__item2"><label for="sex_m">남자</label></p>
												</li>
												<li>
													<div class="payment-info__item">
														<div class="ui-checkbox-ty3">
															<input type="radio" id="sex_w" name="member_gender" value="F" class="ui-checkbox-inp">
															<span class="ui-checkbox-label ui-checkbox-label__ty2"><span class="v-hidden">선택</span></span>
														</div>
													</div>
													<p class="payment-info__item2"><label for="sex_w">여자</label></p>
												</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
								<th data-label="Payment"><label for="userAddress" class="bu-star">주소</label></th>
								<td>
								<!--<div class="address_menu">
									 	<input type="text" class="form-input signUp_next_check" name="post" id="sample4_roadAddress" >
										<a href="javascript:void(0)" class="form-btn btn btn-sm btnUserIDCheck" id="search_address" onclick="sample4_execDaumPostcode()">주소검색</a><br/>
										<input type="text" class="form-input signUp_next_check" id="sample4_roadAddress" name="addr1" style='margin-block-start: 6px;width:270px'><br/>
										<input type="text" class="form-input signUp_next_check" id="sample4_jibunAddress" name="addr2"placeholder="상세주소 입력" style='width:270px;margin-block-start: 6px;'>
									</div> -->
									
									
									
				                        <input type="text" id="sample4_postcode" placeholder="우편번호" name="member_post" class="form-input signUp_next_check"  />
				                        <a href="javascript:void(0);" onclick="sample4_execDaumPostcode()" class="form-btn btn btn-sm btnUserIDCheck">
				                           <span>주소찾기</span>
				                        </a><br>
				                        <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="member_address1"class="form-input signUp_next_check" style='margin-block-start: 6px;width:270px'  />
				                        <input type="text" id="sample4_jibunAddress" placeholder="상세주소" name="member_address2"class="form-input signUp_next_check" style='width:270px;margin-block-start: 6px;'  /><br/>
				                        <span id="guide" style="color:#999"></span> 
								</td>
								</tr>
								<tr>
								<th data-label="Payment"><label for="userPhone" class="bu-star">연락처</label></th>
								<td>
									<div class="sign-phone">
										<input type="text" class="form-input k_language signUp_next_check" name="member_phone" id="check_userPhone" placeholder="'-' 제외하고 입력해주세요">
										<a href="javascript:void(0)" class="form-btn btn btn-sm" id="phone_check_btn">인증받기</a>
									</div>
								</td>
								</tr>
								<tr>
								<tr>
									<th><label for="inp-item4" class="bu-star">이메일 주소</label></th>
									<td>
										<div class="sign-mail">
											<div class="ui-col4">
												<input type="text" id="email_ID" name="member_email1"class="form-input k_language signUp_next_check email_check" style="width:calc(100% - 23px)">
												<span class="ui-input-email"></span>
											</div>
											<div class="ui-col3">
												<input type="text" id="email_Domain" name="member_email2" class="form-input signUp_next_check email_check" style="width:100%">
											</div>
											<div class="ui-col3">
												<div class="ui-select-ty6 ui-col-ty2 form-select">
													<select id="selectMailAddress" class="selectMailAddressClass">
														<option value="select">직접입력</option>
														<option value="gmail.com" data-attr1="" data-attr2="" data-attr3="">gmail.com</option>
														<option value="naver.com" data-attr1="" data-attr2="" data-attr3="">naver.com</option>
														<option value="nate.com" data-attr1="" data-attr2="" data-attr3="">nate.com</option>
														<option value="daum.net" data-attr1="" data-attr2="" data-attr3="">daum.net</option>
													</select>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th><label for="inp-item5" class="bu-none" >닉네임</label></th>
									<td>
										<div class="sign-aka">
											<input type="text" id="nickName" name="member_nickname" class="form-input" placeholder="한글 6자리 이하" maxlength="6">
										</div>
									</td>
								</tr>
								</tbody>
								</table>
								</form>
							</div>
						</div>
						<div class="sign-button">
							<button id="add_submit" class="btn btnNext">다음</button>
						</div>
						
					</div><!-- //sign-bd -->
				</div> <!-- //sign-inner -->
			</div> <!-- //sign-section -->
		</div> <!-- //joinWrap -->
	</section>
	<!-- //body -->