<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="css/reservation.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/reservation.js"></script>


 <div class="wrap_reservation">
	<div id="reservation_div">
	<form id="select_date">
       <div class="resDate">  
           <h1 style="font-size: 30px">일정선택</h1>
           <p style="margin-top: 10px">고객님의 총 대여하실 기간을 선택해주세요.</p><br>
           <p class="resStartDate"  style="font-size: 15px">대여일시</p>&nbsp;<input type="text" class="resStartDate reserv_input" id="resStartDate" name="rentdate" required="required"> 
           <p class="resEndDate"  style="font-size: 15px">&nbsp;&nbsp;반납일시</p>&nbsp;<input type="text" class="resEndDate reserv_input" id="resEndDate" name="returndate" required="required">
           <div class="waring">
               <img src="images/icon/waring.png" width="15px">알려드립니다<br>
               <div class="waringContent" style="margin-bottom: 50px">
			                예약은 최대 90일 내 선택이 가능하며,<br>
			                차량 출고시 계약서 작성 및 차량 확인에 약 15분 정도의 시간이 소요됩니다.   
                </div>
           </div>
           <div class="city">
              <h1 style="font-size: 30px">지점선택</h1>
              <p style="margin-top: 10px">대여지점을 선택해주세요.</p><br>
                   <select name="shopid" id="store" class="store" required>
                   	   <option value="">지점 선택</option>
                       <option value="J001">제주지점</option>
                       <option value="J002">서귀포지점</option>
                       <option value="J003">함덕지점</option>
                       <option value="J004">협재지점</option>
                   </select>
           </div>  
           <div class="resev_nextBtn">
               <button id="nextCar_btn" class="btn">차종선택</button>
           </div> 
       </div>
 	</form>
   </div> 
   
   <div class="subMenu">
    	<jsp:include page="rent_rightmenu.jsp" flush="false"></jsp:include>
    </div>

</div>

   