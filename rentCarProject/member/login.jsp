<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
*{margin:0; padding:0;} 

 .loginWrap {
  font: 13px/20px "Lucida Grande", Tahoma, Verdana, sans-serif;
  color: #404040;
}

.login {
  position: relative;
  margin: 30px auto;
  padding: 20px 20px 20px;
  width: 310px;
  background: white;
  border-radius: 3px;
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}


.login {

  background: whitesmoke;
  border-radius: 4px;
  border:4px solid #083763;
  z-index:10;
}

.login h1 {
  margin: -20px -20px 21px;
  line-height: 40px;
  font-size: 15px;
  font-weight: bold;
  color: #555;
  text-align: center;
  text-shadow: 0 1px white;
  background: #f3f3f3;
  border-bottom: 1px solid #cfcfcf;
  border-radius: 3px 3px 0 0;
  background-image: -webkit-linear-gradient(top, whiteffd, #eef2f5);
  background-image: -moz-linear-gradient(top, whiteffd, #eef2f5);
  background-image: -o-linear-gradient(top, whiteffd, #eef2f5);
  background-image: linear-gradient(to bottom, whiteffd, #eef2f5);
  -webkit-box-shadow: 0 1px whitesmoke;
  box-shadow: 0 1px whitesmoke;
  font-family: 'Jeju Gothic', sans-serif;
}

.login p {
  margin: 20px 0 0;
}

.login p:first-child {
  margin-top: 0;
}

.login input[type=text], .login input[type=password] {
  width: 278px;
}

.login p.remember_me {
  float: left;
  line-height: 31px;
}
.login_help {
 float: left;
    line-height: 31px;
    clear: both;
}


.login p.remember_me label {
  font-size: 12px;
  color: #777;
  cursor: pointer;
  font-family: 'Jeju Gothic', sans-serif;
}

.login p.remember_me input {
  position: relative;
  bottom: 1px;
  margin-right: 4px;
  vertical-align: middle;
}

.login p.submit{
  text-align: right;
}


.login_help {
  margin: 20px 0;
  font-size: 11px;
  color: darkorange;
  text-align: left;
/*   text-shadow: 0 1px #2a85a1; */
}

.login_help a {
  color: darkorange;
  text-decoration: none;
}

.login_help a:hover {
  text-decoration: underline;
}

:-moz-placeholder {
  color: #c9c9c9 !important;
  font-size: 13px;
}

::-webkit-input-placeholder {
  color: #ccc;
  font-size: 13px;
}

/* input { */
/*   font-family: 'Lucida Grande', Tahoma, Verdana, sans-serif; */
/*   font-size: 14px; */
/* } */

.login input[type=text],.login input[type=password] {
  margin: 5px;
  padding: 0 10px;
  width: 260px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}

.login input[type=text]:focus, .login input[type=password]:focus {
  border-color: #7dc9e2;
  outline-color: #dceefc;
  outline-offset: 0;
}

.ok_btn,.close_btn {
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
  font-family: 'Jeju Gothic', sans-serif;
} 

.next_page:active {
  background: #cde5ef;
  border-color: #9eb9c2 #b3c0c8 #b4ccce;
  -webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.2);
}

 /* .lt-ie9 input[type=text], .lt-ie9 input[type=password] {
  line-height: 34px;
}  */

 .loginBox{width:500px;height:500px;}
 .loginWrapBox .bg{ position:fixed;top:0;left:0; width:100%; height:100%; background:rgba(0, 0, 0, .4); opacity:0.7; z-index: 5;}
 
 .login{position: absolute;
    top: 29%;
    left: 50%;
    margin-left: -150px;
    width: 300px;
    height: 260px;
    background: #fff;
    z-index: 7;}
 
 
 </style>
 <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
      
    $(document).ready(function(){
            //팝업레이어
         $('#close_btn,.bg').on("click",function() {  
            $('.LoginlayerBox').hide();        
         });
         /* 로그인  */
         $("#btnLogin").click(function(){
            $(".LoginlayerBox").show();
         });
         
         //아이디 체크
           $("formlogin").on("submit",function(event){      
              var id = $("#userid").val();
              var pw = $("#userpw").val();
                    if(id.length==0){
                       alert("ID를 입력하세요")
                       $("uesrid").focus();
                       event.preventDefault();
                    }else if(pw.length==0){
                       alert("비밀번호를 입력하세요")
                       $("userpw").focus();
                       event.preventDefault(); 
                    }
                 });
           //id 한글 입력 방지
           $("#userid").on("keyup",function(){
             if($(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''))){
             };   
             });
      
          //아이디 저장쿠키
           var userInputId = getCookie("userInputId");
           $("input[name='userid']").val(userInputId); 
            
           if($("input[name='userid']").val() != ""){ 
               $("#remember_me").attr("checked", true); 
            
           $("#remember_me").on("change",function(){ 
               if($("#remember_me").is(":checked")){ 
                   var userInputId = $("input[name='userid']").val();
                   setCookie("userInputId", userInputId, 3); 
               }else{
                   deleteCookie("userInputId");
               }
               });
           }
           $("input[name='userid']").on("keyup",function(){ 
               if($("#remember_me").is(":checked")){ 
                   var userInputId = $("input[name='userid']").val();
                   setCookie("userInputId", userInputId, 3); 
               }
           });
       function setCookie(cookieName, value, exdays){
           var exdate = new Date();
           exdate.setDate(exdate.getDate() + exdays);
           var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
           document.cookie = cookieName + "=" + cookieValue;
       }
       function deleteCookie(cookieName){
              var expireDate = new Date();
              expireDate.setDate(expireDate.getDate() - 1);
              document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
       }
       function getCookie(cookieName) {
           cookieName = cookieName + '=';
           var cookieData = document.cookie;
           var start = cookieData.indexOf(cookieName);
           var cookieValue = '';
           if(start != -1)
           {
                 start += cookieName.length;
                 var end = cookieData.indexOf(';', start);
                 if(end == -1)end = cookieData.length;
                 cookieValue = cookieData.substring(start, end);
             }
           return unescape(cookieValue);
       }
    });//end ready
</script>
<!-- 로그인 폼 시작-->
<div class="LoginlayerBox" style="display:none;">

   <div class="loginWrapBox">
      <div class="bg"></div>
      <div class="login">
        <h1>WelCome 형카</h1>
        <form method="post" action="Login" id="formlogin">
          <p><input type="text" name="userid"placeholder="UserID" id="userid"></p>
          <p><input type="password" name="passwd"placeholder="Password" id="userpw"
                  onKeyDown="if(event.keyCode==13)loginProcess()"></p>
          <p class="remember_me">
            <label>
              <input type="checkbox" name="remember_me" id="remember_me">
                 아이디 기억하기
            </label>
          </p>
          <p class="submit"><input type="submit" name="commit" value="LOGIN" class="ok_btn">
          <p class="login_help">
            <label>
              <a href="#">아이디 찾기</a>
            </label>
            <label>
             <a href="#">비밀번호 찾기</a>
            </label>
          <p class="submit"><input type="button" value="CLOSE" class="close_btn" id="close_btn"></p>
          
        </form>
      </div>
   </div>
</div>
