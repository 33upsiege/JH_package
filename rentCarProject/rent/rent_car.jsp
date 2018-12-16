<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<link rel="stylesheet" href="css/reservation.css" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script src="js/reservation.js"></script>

 
 <div class="wrap_reservation"> 
   <div id="car_div" >
    
       <div class="resCar">  
           <h1 style="font-size: 30px">차량선택</h1>
           <p style="margin-top: 10px">고객님께서 승차하실 차량을 선택하여 주세요.</p><br>
		<form id="car_form">           
			<input type="hidden" id="rentdate" name="rentdate" value="${reservDTO.rentDate}">
 			<input type="hidden" id="returndate" name="returndate" value="${reservDTO.returnDate}">
 			<input type="hidden" name="shopid" id="shopid" value="${reservDTO.shopId}">
 			<input type="hidden" name="shopname" value="${shopname}"> 
 			<input type="hidden" name="price_param" id="price_param"> 
 			<input type="hidden" name="discount_param" id="discount_param"> 

 			
           <div class="selectType">
           <button class="carType" name="carType" value="null">전체</button>
           <button class="carType" name="carType" value="경차" >경차</button>
           <button class="carType" name="carType" value="소형" >소형</button>
           <button class="carType" name="carType" value="중형" >중형</button>
           <button class="carType" name="carType" value="대형" >대형</button>
           <button class="carType" name="carType" value="SUV" >SUV</button>
           
           </div> 

          <div class="carTable">
               <table id="car_table">
               <c:if test="${empty carList }">	
                   <tr>
                       <td colspan="3">${msg}</td>
                   </tr>
               </c:if>
               <c:if test="${!empty carList }">	
	               <c:forEach var="carDTO" items="${carList}">
	                  <tr>
	                       <td><input type="radio" style="width:15px;height:15px;border:1px;"
	                       			 name="carSelect" class="carSelect" id="carSelect" value="${carDTO.carName}/${carDTO.carId}/${carDTO.price}">
	                       	</td>
	                       <td><img src="images/car/${carDTO.image}" width="70px" height="40px"></td>
	                       <td>${carDTO.carName}</td>
	                   </tr>
	               </c:forEach> 
               </c:if>
               </table>    
           </div> 
         
           
           <div class="waring">
               <img src="images/icon/waring.png" width="15px">알려드립니다<br>
               <div class="waringContent" style="margin-bottom: 10px">
			                대여자격 만 26세 이상, 운전경력 3년이상 차량 안내<br>
			                대형, 고급, 4륜, 승합, 제네시스쿠페  
                </div>
           </div>
           <div class="btn">
               <div class="preBtn">
                   <button id="preDate_btn" class="btn">날짜/지점</button>
               </div>  
               <div class="nextBtn">
                   <button id="nextOpt_btn" class="btn">옵션/할인</button>
               </div> 
           </div>
        </form>
       </div>
	</div>
	<div class="subMenu">
    	<jsp:include page="rent_rightmenu.jsp" flush="false"/>
    </div>
      
</div>
   