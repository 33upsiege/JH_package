<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   


<link rel="stylesheet" href="css/mypage.css" type="text/css" />  
<script type="text/javascript" src="..js/jquery-3.3.1.js"></script>
<!-- 달력 -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<!------------->
<!-- 달력한국어 설정 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<!------------->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="js/mypage.js"></script>

   <div class="wrap_content">
      
       <div class="resDate">  
       		<div class="header_title" style="height: 10px;">
		           <h1 style="font-size: 15px">내 정보</h1>
       		</div>
     <form action="MyInfoUpdate" id="myinfo_update_form"><!-- signUp From  -->
 
     	<div class=information>
               <table>
          
                    <tr> 
               	       <td width="200px" style="background-color: azure" class="menu_section">이름 </td>
                  		<td><input type="text" name="username" width="200px" class="mypage_user" value="${memberDTO.username}" readonly="readonly"></td>
                   </tr>
                    <tr>
                    	<td width="200px" style="background-color: azure">ID</td>
                        <td><input type="text" name="userid" width="200px" class="mypage_user" value="${memberDTO.userid}" readonly="readonly"></td>
                    </tr>
                     <tr> 
                       <td width="200px" style="background-color: azure" >PW*</td>
                        <td><input type="password" id="pw_check" class="next_page" name="passwd" maxlength=10 value="${memberDTO.passwd}">
                       		<span id="pw_result1">비밀번호를 입력해 주세요</span>
                        </td>
                    </tr>
                     <tr>
                       <td width="200px" style="background-color: azure" >PW 확인*</td>
                        <td><input type="password" id="pw_check_again" class="next_page"maxlength=10 value="${memberDTO.passwd}">
                        	<span id="pw_result2"></span>
                        </td>
                    <tr> <!-- 유효성체크 -->
                       <td width="200px" style="background-color: azure">전화*</td>
                        <td>
                           <select name="phone1" class="phone1">
                           	<c:choose>
								<c:when test="${fn:split(memberDTO.phone, '-')[0]=='010'}">
									<option value="010" selected="selected">010</option>
									<option value="02">02</option>
						        	<option value="070">070</option>
								</c:when>
								<c:when test="${fn:split(memberDTO.phone, '-')[0]=='02'}">
									<option value="02" selected="selected">02</option>
									<option value="010">010</option>
							        <option value="070">070</option>
								</c:when>
								<c:when test="${fn:split(memberDTO.phone, '-')[0]=='070'}">
									<option value="070" selected="selected">070</option>
									<option value="010">010</option>
						     		<option value="02">02</option>
								</c:when>
							</c:choose>
						   </select>-
						      <input type="text" id="phone2" name="phone2" class="phone2" maxlength=4 value="${fn:split(memberDTO.phone, '-')[1]}">-
						      <input type="text" id="phone3" name="phone3" class="phone3" maxlength=4 value="${fn:split(memberDTO.phone, '-')[2]}"><br>
						</td>
                    </tr>
                     <tr> 
                       <td width="200px" style="background-color: azure">생일 </td>
                        <td><input type="text" name="birth" class="birth" <c:if test="${memberDTO.birth==null}">placeholder="클릭하세요"</c:if> value="${memberDTO.birth}"></td>
                    </tr>
                    <tr><!-- AJAX 구현 -->
                       <td width="200px" style="background-color: azure">E-MAIL* </td>
                        <td><input type="text" id="email1" name="email1" class="email_box" value="${fn:split(memberDTO.email, '@')[0]}"> @ 
                        <input type="text" id="email2" name="email" class="email_box" value="${fn:split(memberDTO.email, '@')[1]}">
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
                       		
                        <td><input type="text" id="post"  name="post" style="height:20px;width: 180px" value="${memberDTO.post}">　<button id="address_btn">주소검색</button></td>
                    </tr>
                    <tr><!-- 주소 구현 -->
                       <td width="200px" style="background-color: azure">상세주소 </td>
                       		
                        <td><input type="text" id="addr1" name="addr1" class="next_page"style="height:20px;width: 180px;" value="${memberDTO.addr1}">　
                        <input type="text" id="addr2" name="addr2" class="next_page"style="height:20px;width: 180px" value="${memberDTO.addr2}"></td>
                    </tr>
                     <tr><!-- AJAX 구현 -->
                       <td width="200px" style="background-color: azure">면허 번호* </td>
                        <td><input type="text" id="licensenum" name="licensenum" style="height:20px;width: 180px"  value="${memberDTO.licensenum}"></td>
                    </tr>
                    <tr>
                       <td width="200px" style="background-color: azure">면허 종류* </td>
                       <td>
                          <select id="driver_licence" name="licensetype">
                          <c:choose>
								<c:when test="${memberDTO.licensetype=='manual'}">
									<option value="manual" selected="selected">1종보통</option>
									<option value="manual2">1종대형(특수)</option>  
                              		<option value="auto">2종보통</option>
                              		<option value="bike">2종소형</option>  
								</c:when>
								<c:when test="${memberDTO.licensetype=='manual2'}">
									<option value="manual">1종보통</option>
									<option value="manual2"  selected="selected">1종대형(특수)</option>  
                              		<option value="auto">2종보통</option>
                              		<option value="bike">2종소형</option>  
								</c:when>
								<c:when test="${memberDTO.licensetype=='auto'}">
									<option value="manual">1종보통</option>
									<option value="manual2">1종대형(특수)</option>  
                              		<option value="auto"  selected="selected">2종보통</option>
                              		<option value="bike">2종소형</option>  
								</c:when>
								<c:when test="${memberDTO.licensetype=='bike'}">
									<option value="manual">1종보통</option>
									<option value="manual2">1종대형(특수)</option>  
                              		<option value="auto">2종보통</option>
                              		<option value="bike" selected="selected">2종소형</option>  
								</c:when>
							</c:choose>      
                          </select>
                       </td>
                    </tr>
               </table>
           </div>
	  <div class="last_btn">
		               <div class="preBtn">
		               		<button class="mypage_update" id="mypage_update">수정</button>
		               </div>  
		               <div class="nextBtn">
		                    <input type="reset" value="취소" class="mypage_cancel">
		               </div>
	  </div>
               </form> 
           </div>
       </div>
 
   