<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);


  .textRight {text-align: right;border-bottom:1px dashed #000;padding-bottom:10px;}
   .header_title{ height: 140px;background: #fff;color: black;padding: 20px 0;font-family: 'Jeju Gothic', sans-serif;} 
 .wrap_content{width:1080px; margin:0 auto; overflow:hidden;} 
 .subMenu{width: 20%;height: 600px; float:right;background-color:#083763;color:white;padding-top:50px;padding-left:20px;padding-right: 20px;}
 .img{display: inline-block;}
    *{}
 hr { display: block;margin-top: 0.5em; margin-bottom: 0.5em;margin-left: auto;margin-right: auto;border-style: inset;border-width: 1px;} 
/*  .information .menu_section{background:#083763; color:orange;} */
 .order{margin-top: 50px;}
 .resDate{width: 100%; height: 600px;margin-top: 30px;}
 .resStartDate, .resEndDate{display: inline;}
 .waring{margin-top: 30px;}
 .waringContent{background-color: azure;margin: 15px;padding: 18px}
 .selectType{background-color: azure;margin: 15px;padding: 23px}
 .preBtn{display: inline-block;}
 .last_btn{margin-top: 20PX;float: left;margin-bottom: 40px;text-align: center;width: 100%;}
 .finish,.cancel,#address_btn{
  padding: 0 18px;
  height: 29px;
  font-size: 12px;
  font-weight: bold;
  color: #527881;
  text-shadow: 0 1px #e3f1f1;
  background: #cde5ef;
  border: 1px solid;
  border-color: #b4ccce #b3c0c8 #9eb9c2;
  border-radius: 16px;
  outline: 0;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  background-image: -webkit-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: -moz-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: -o-linear-gradient(top, #edf5f8, #cde5ef);
  background-image: linear-gradient(to bottom, #edf5f8, #cde5ef);
  -webkit-box-shadow: inset 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.15);
  box-shadow: inset 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.15);
  font-family: 'Jeju Gothic', sans-serif;}
 #choose_email {font-family: 'Jeju Gothic', sans-serif;}
 #choose_email option{font-family: 'Jeju Gothic', sans-serif;}
 #driver_licence{font-family: 'Jeju Gothic', sans-serif;}
 .nextBtn{display: inline-block; margin-left: 5px; }  
 .preBtn .finish{ width: 90px;height: 40px;text-align: center;font-size: 15px;font-family: 'Jeju Gothic', sans-serif;}
 .nextBtn .cancel{ width: 90px;height: 40px;text-align: center;font-size: 15px;font-family: 'Jeju Gothic', sans-serif;}
 .phone1 {width:57px;height:25px; text-align:center;}
 .phone2 {width:52px;height:22px; text-align:center;}
 .phone3 {width:52px;height:22px; text-align:center;}
  .information  select, addressTable select{
        width: 180px;
        height: 20px;
    }
  .information input, addressTable input{
        width: 180px;
        height: 20px;
    }
 .order button{width: 50px;padding: 5px; font-size: 15px; font-family: 'Jeju Gothic', sans-serif;}
    
 .information table ,.addressTable table{
    width: 100%;
    border-top: 1px solid orange;
    border-collapse: collapse;
  }
 .information td,.addressTable td {
    border-bottom: 1px solid #ccc;
    padding: 10px;
    font-size: 15px;
     height: 22px;
     font-family: 'Jeju Gothic', sans-serif;
  }
 .header_title .title{
        font-size: 20px;
        margin-top: 20px;
        margin-bottom: 20px;
    }
 .information, .addressTable{
        margin-bottom: 30px;
    }
.address_Table input{height:22px;}
</style>

<script type="text/javascript" src="..js/jquery-3.3.1.js"></script>
<!-- 달력 -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!------------->
<!-- 달력한국어 설정 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<!------------->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">

<script type="text/javascript">


	$(document).ready(function(){
		//email
		$("#choose_email").on("change", function() {
			var mail = $(this).val();
			if (mail == "choose_phone") {
				$("input[name='']").val('');
			} else {
				$("input[name='email']").val(mail); 
			}
		});	
		//email 한글방지
		$(".email_box").on("keyup",function(){
			if($(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''))){
			};	
			});
		//생일달력
			$(".birth").datepicker({
				dateFormat: "yy-mm-dd",
				maxDate: 0,
				 yearRange:"c-100:c+0",
				changeMonth: true,
			     changeYear: true
			});
		//비밀번호 확인
			$("#pw_check").on("keyup",function(){
	    		var pw_check = $("#pw_check").val().length;
	    		var pw_check2 = $("#pw_check_again").val().length;
	    		var pw_mesg2 = "한번 더 입력 해주세요";
	    		var empty = '';
	    		if(pw_check != 0){
	    			$("#pw_result1").text(pw_mesg2);
	    		}else if(pw_check ==0){
	    			$("#pw_result1").text("비밀번호를 입력해 주세요");
	    		} 
	    	});
			$("#pw_check_again").on("keyup",function(){
	    		var pw_check = $("#pw_check").val();
	    		var pw_mesg =  "비밀번호가 일치하지 않습니다";
	    		var pw_mesg2 = "비밀번호 일치";
	    		if(pw_check == $(this).val()){
	    			$("#pw_result2").text(pw_mesg2);
	    			$("#pw_result1").text('');
	    		}else{
	    			$("#pw_result2").text(pw_mesg);
	    	}
	    	});
			//전화번호 한글방지
			$(".phone2").on("keyup",function(){
				if($(this).val($(this).val().replace(/[^0-9]/g,""))){
				};	
				});
			$(".phone3").on("keyup",function(){
				if($(this).val($(this).val().replace(/[^0-9]/g,""))){
				};	
				});
			//id 확인
			 $("#id_check").on("keyup",function(){
				$.ajax({
					type : "GET",
					url : "IDCheck",
					dataType : "text",
					data : {
						userid : $("#id_check").val()
					},
					success : function(data, status, xhr){
						$("#id_result").text(data);
					},//end success
					error : function(xhr,status,error){
						/* alert("사용 할 수 없는 ID 입니다");
						$("#id_check").val(''); */
						$("#id_result").text(data);
					}//end error
				});//end ajax
					if($(this).val().length >= 11){
						alert("10자 이하로 입력해 주세요");
						$("#id_check").val('');
					}
				if($(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''))){
				}
			});
			$("form").on("submit",function(event){
				var check1 = $(".next_page").val();
				var email_check = $(".email_box").val();
				var phone2 = $(".phone2").val();
				var phone3 = $(".phone3").val();
				var birth = $(".brith").val();
				var licence = $("input[name='icensenum']").val();
				if(check1==0 || email_check==0 || phone2==0 || phone3==0||licence==0){
					alert("* 정보를 다시 확인 하십시오")
					event.preventDefault();
				}
				
			}); 
			

	});//end ready
	
</script>
   <div class="wrap_content">
      
       <div class="resDate">  
       		<div class="header_title">
		           <h1 style="font-size: 30px">회원가입</h1>
		           <p style="margin-top: 10px">기본정보를 입력하세요</p><br>
		           <p class="textRight">*필수 입력 항목</p>	
		           <div class="empty"></div>
		           <p class="title">회원 정보 입력</p>
       		</div><br>   
     <form action="SignUp" id="myform"><!-- signUp From  -->
     	<div class=information>
               <table>
          
                    <tr> 
               	       <td width="200px" style="background-color: azure" class="menu_section">이름 * </td>
                  		<td><input type="text" name="username" width="200px" maxlength=5 class="next_page"></td>
                   </tr>
                     <tr>                        <td width="200px" style="background-color: azure">ID *</td>
                        <td><input type="text" name="userid" id="id_check" class="next_page" placeholder="영문,숫자 조합 한글 사용 불가"maxlength=11 >
                        	<span id="id_result"></span>
                        </td>
                    </tr>
                     <tr> 
                       <td width="200px" style="background-color: azure" >PW *</td>
                        <td><input type="password" id="pw_check" class="next_page" name="passwd" maxlength=10 placeholder="영문,숫자 조합 10자 이내" >
                       		<span id="pw_result1">비밀번호를 입력해 주세요</span>
                        </td>
                    </tr>
                     <tr>
                       <td width="200px" style="background-color: azure" >PW 확인 *</td>
                        <td><input type="password" id="pw_check_again" class="next_page"maxlength=10 placeholder="영문,숫자 조합 10자 이내">
                        	<span id="pw_result2"></span>
                        </td>
                    <tr> <!-- 유효성체크 -->
                       <td width="200px" style="background-color: azure">전화 *</td>
                        <td>
                           <select name="phone1" class="phone1">
						     	<option value="choose_phone">선택</option>
						     	<option value="010">010</option>
						     	<option value="02">02</option>
						        <option value="070">070</option>
						   </select>-
						      <input type="text" name="phone2" class="phone2" maxlength=4 >-
						      <input type="text" name="phone3" class="phone3" maxlength=4 ><br>
						</td>
                    </tr>
                     <tr> 
                       <td width="200px" style="background-color: azure">생일 </td>
                        <td><input type="text" name="birth" class="birth"placeholder="클릭하세요"></td>
                    </tr>
                    <tr><!-- AJAX 구현 -->
                       <td width="200px" style="background-color: azure">E-MAIL </td>
                        <td><input type="text" name="email1" class="email_box"> @ <input type="text" name="email" class="email_box">
                        	<select id="choose_email" name="email2">
                        		<option value="">선택하기</option>
                        		<option value="google.com">google.com</option>
                        		<option value="naver.com">naver.com</option>
                        		<option value="nate.com">nate.com</option>
                        		<option value="daum.net">daum.net</option>
                        		<option value="">직접입력</option>
                        	</select>
                        
                        </td>
                    </tr>
               </table>
       </div>
           <div class="addressTable" >
               <table>
                     <tr><!-- 주소 구현 -->
                       <td width="200px" style="background-color: azure">주소 </td>
                       		
                        <td><input type="text" name="post" style="height:20px;width: 180px">　<button id="address_btn">주소검색</button></td>
                    </tr>
                    <tr><!-- 주소 구현 -->
                       <td width="200px" style="background-color: azure">상세주소 </td>
                       		
                        <td><input type="text" name="addr1" class="next_page"style="height:20px;width: 180px;">　<input type="text" name="addr2" class="next_page"style="height:20px;width: 180px"></td>
                    </tr>
                     <tr><!-- AJAX 구현 -->
                       <td width="200px" style="background-color: azure">면허 번호 *</td>
                        <td><input type="text" name="licensenum" style="height:20px;width: 180px"></td>
                    </tr>
                    <tr>
                       <td width="200px" style="background-color: azure">면허 종류 *</td>
                       <td>
                          <select id="driver_licence" name="licensetype">
                    	      <option value="choose">선택하기</option>
                              <option value="manual">1종보통</option>
                              <option value="manual2">1종대형(특수)</option>  
                              <option value="auto">2종보통</option>
                              <option value="bike">2종소형</option>        
                          </select>
                       </td>
                    </tr>
               </table>
           </div>
	  <div class="last_btn">
		               <div class="preBtn">
		                   <input type="submit" value="가입하기" class="finish">
		               </div>  
		               <div class="nextBtn">
		                    <input type="button" value="취소" class="cancel">
		               </div>
	  </div>
               </form> 
           </div>
       </div>
 
   