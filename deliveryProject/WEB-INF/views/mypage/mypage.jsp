<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>


.transition, form button, form .question label, form .question input[type="text"] {
  -moz-transition: all 0.25s cubic-bezier(0.53, 0.01, 0.35, 1.5);
  -o-transition: all 0.25s cubic-bezier(0.53, 0.01, 0.35, 1.5);
  -webkit-transition: all 0.25s cubic-bezier(0.53, 0.01, 0.35, 1.5);
  transition: all 0.25s cubic-bezier(0.53, 0.01, 0.35, 1.5);
}

* {
  font-family: Helvetica, sans-serif;
  font-weight: light;
  -webkit-font-smoothing: antialiased;
}

html {
}

form {
  position: relative;
  display: inline-block;
  max-width: 700px;
  min-width: 500px;
  box-sizing: border-box;
  background-color: white;
  border-radius: 40px;
  left: 10%;
  -moz-transform: translate(-50%, 0);
  -ms-transform: translate(-50%, 0);
  -webkit-transform: translate(-50%, 0);
  transform: translate(-50%, 0);
}
form h1 {
  color: #ff4a56;
  font-weight: 100;
  letter-spacing: 0.01em;
  margin-left: 15px;
  margin-bottom: 35px;
  text-transform: uppercase;
}
form button {
  margin-top: 35px;
  background-color: white;
  border: 1px solid #ff4a56;
  line-height: 0;
  font-size: 17px;
  display: inline-block;
  box-sizing: border-box;
  padding: 20px 15px;
  border-radius: 60px;
  color: #ff4a56;
  font-weight: 100;
  letter-spacing: 0.01em;
  position: relative;
  z-index: 1;
}
form button:hover, form button:focus {
  color: white;
  background-color: #ff4a56;
}
form .question {
  position: relative;
  padding: 10px 0;
}
form .question:first-of-type {
  padding-top: 0;
}
form .question:last-of-type {
  padding-bottom: 0;
}
form .question label {
  transform-origin: left center;
  color: #ff4a56;
  font-weight: 100;
  letter-spacing: 0.01em;
  font-size: 17px;
  box-sizing: border-box;
  padding: 10px 15px;
  display: block;
  position: absolute;
  margin-top: -40px;
  z-index: 2;
  pointer-events: none;
}
form .question input[type="text"] {
  appearance: none;
  background-color: none;
  border: 1px solid #ff4a56;
  line-height: 0;
  font-size: 17px;
  width: 100%;
  display: block;
  box-sizing: border-box;
  padding: 10px 15px;
  border-radius: 60px;
  color: #ff4a56;
  font-weight: 100;
  letter-spacing: 0.01em;
  position: relative;
  z-index: 1;
}
form .question input[type="text"]:focus {
  outline: none;
  background: #ff4a56;
  color: white;
  margin-top: 30px;
}
form .question input[type="text"]:valid {
  margin-top: 30px;
}
form .question input[type="text"]:focus ~ label {
  -moz-transform: translate(0, -35px);
  -ms-transform: translate(0, -35px);
  -webkit-transform: translate(0, -35px);
  transform: translate(0, -35px);
}
form .question input[type="text"]:valid ~ label {
  text-transform: uppercase;
  font-style: italic;
  -moz-transform: translate(5px, -35px) scale(0.6);
  -ms-transform: translate(5px, -35px) scale(0.6);
  -webkit-transform: translate(5px, -35px) scale(0.6);
  transform: translate(5px, -35px) scale(0.6);
}

</style>
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
					 마이페이지
				</h2>
				
					<p class="txt_brd07" style="margin-top: 25px;"><a href="mypage">회원 정보 변경</a> | <a href="myorder">주문배송조회</a></p>
			</div>

			<div class="loginWrap_box">
				
				<h2 style="text-align: left; margin-left: 50px; margin-bottom: 30px; font-size: 17px;">*정보를 클릭해서 변경해주세요</h2>
				<form method="post" action="mypage_update">
				  <div class="question">
				    <input type="text" required readonly="readonly" name="member_id"/>
				    <label>아이디 : ${member.member_id }</label>
				  </div>
				  <div class="question">
				    <input type="text" required  readonly="readonly" name="member_name"/>
				    <label>이름 : ${member.member_name}</label>
				  </div>
				  <div class="question">
				    <input type="text" required name="member_passwd"/>
				    <label>비밀번호 : *******</label>
				  </div>
				  <div class="question">
				    <input type="text" required name="member_nickname" />
				    <label>닉네임 : ${member.member_nickname }</label>
				  </div>
				    <div class="question">
				    <input type="text" required name="member_email"/>
				    <label>Email : ${member.member_email }</label>
				  </div>
				    <div class="question">
				    <input type="text" required name="member_phone"/>
				    <label>연락처 : ${member.member_phone }</label>
				  </div>
				    <div class="question">
				    <input type="text" required name="member_post"/>
				    <label>우편번호 : ${member.member_post }</label>
				  </div>
				    <div class="question">
				    <input type="text" required name="member_address1"/>
				    <label>주소 : ${member.member_address1 } </label>
				  </div>
				   <div class="question">
				    <input type="text" required name="member_address2"/>
				    <label>상세주소 : ${member.member_address2 }</label>
				  </div>
				  <button>정보변경</button>
				</form>
			</div>
		</div>
	</section>
	<!-- //body -->


