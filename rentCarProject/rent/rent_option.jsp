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
	<form id="option_form">
	<div id="option_div" >
		<div class="resDate">  
           <h1 style="font-size: 30px">옵션 및 할인 선택</h1>
           <p style="margin-top: 10px">부대장비 및 자차손해면책제도, 할인 항목 등을 선택하세요.</p><br>

            <input type="hidden" id="rentdate" name="rentdate" value="${reservDTO.rentDate}">
 			<input type="hidden" id="returndate" name="returndate" value="${reservDTO.returnDate}">
 			<input type="hidden" name="shopid" id="shopid"  value="${reservDTO.shopId}">
 			<input type="hidden" name="shopname" value="${shopname}">
 			<input type="hidden" name="carname" value="${carname}">
 			<input type="hidden" name="carid" value="${reservDTO.carId}">
 			<input type="hidden" name="carprice" value="${carprice}">
 			<input type="hidden" id="param_price" name="price" value="${price}">
 			<input type="hidden" id="discount_param" name="discount_param" value="${discount_param}">
 			
           
           <p class="option_title">옵션/차량할인선택</p>
           <div class="saleTable">
               <table>
                    <tr>
                       <td colspan="2" style="background-color: azure">프로모션 및 쿠폰 할인 선택</td>
                   </tr>
                    <tr>
                       <td width="200px" style="background-color: azure">프로모션 할인</td>
                       <td>
                          <select class="cupon_select" name="cupon_select" id="cupon_select">
                          	  <option value="">프로모션 선택</option>
                              <option value="0.9">여름맞이 바캉스 쿠폰 10%</option>  
                              <option value="0.8">신규 회원 쿠폰 20%</option>    
                          </select>
                       </td>
                    </tr>
               </table>
           </div>
           <div class="insuranceTable" >
               <table>
                    <tr>
                       <td colspan="2" style="background-color: azure">자차손해면책제도</td>
                   </tr>
                    <tr>
                       <td width="200px" style="background-color: azure">자차손해면책제도</td>
                       <td>
                          <select class="insurance_select" name="insurance_select" id="insurance_select">
                          	  <option value="">보험 선택</option>
                              <option value="15000">일반자차(15,000)</option>  
                              <option value="30000">슈퍼자차(30,000)</option>    
                          </select>
                       </td>
                    </tr>
               </table>
           </div>
           <div class="optionTable">
               <table>
                    <tr>
                       <td colspan="2" style="background-color: azure">부대장비 선택</td>
                   </tr>
                    <tr>
                      <td width="200px" style="background-color: azure">네비게이션</td>
                       <td><input type="checkbox" style="width:15px;height:15px;border:1px;" id="navi" class="option_checkbox" name="option_checkbox" value="네비게이션"></td>
                    </tr>
                    <tr>
                      <td style="background-color: azure">베이비카시트</td>
                       <td><input type="checkbox" style="width:15px;height:15px;border:1px;" id="carseat" class="option_checkbox" name="option_checkbox" value="베이비카시트"></td>
                    </tr>
                    <tr>
                      <td style="background-color: azure">유모차</td>
                       <td><input type="checkbox" style="width:15px;height:15px;border:1px;" id="baby" class="option_checkbox" name="option_checkbox" value="유모차"></td>
                    </tr>
               </table>
           </div>
           <div class="option_btn">
               <div class="preBtn" id="preCar_btn">
                   <button class="btn">차종선택</button>
               </div>  
               <div class="nextBtn" id="nextQua_btn">
                   <button class="btn">약관동의</button>
               </div> 
           </div>
       </div>
       
	</div>
	    <div class="subMenu">
			<div class="subMenu2">
				<input type="hidden" name="carid" value="${reservDTO.carId}">
				<input type="hidden" name="shopid" value="${reservDTO.shopId}">
				
				<p class="sub_ib sub_p">차종명칭&nbsp;</p><span class="sub_ib sub_span" id="carName">${carname}</span><br>
			    <p class="sub_ib sub_p">대여일시&nbsp;</p><span class="sub_ib sub_span" id="rentDate">${reservDTO.rentDate}</span><br>
			    <p class="sub_ib sub_p">반납일시&nbsp;</p><span class="sub_ib sub_span" id="returnDate">${reservDTO.returnDate}</span><br>
			    <p class="sub_ib sub_p">대여지점&nbsp;</p><a href="#" class="sub_ib shop rent_shop sub_span" id="shop">${shopname}</a><br>
			    <p class="sub_ib sub_p">반납지점&nbsp;</p><span class="sub_ib shop sub_span">${shopname}</span><br>
			    <hr><br>
			    <p class="option_p">할인내용</p>
			    <input type="text" name="promotion" id="promotion" class="option_input" value="<c:if test="${!empty promotion}"/>${promotion}" readonly="readonly"><br>
			    <p class="option_p">자차손해면책제도</p>
			    <input type="text" name="insurance" id="insurance" class="option_input" value="<c:if test="${!empty insurance}"/>${insurance}" readonly="readonly"><br>
			    <p class="option_p">부대장비</p>
			    <input type="text" name="car_option" id="car_option" class="option_input" value="<c:if test="${!empty carOption}"/>${carOption}" readonly="readonly"><br>
			    <hr><br>
			    <p>정상금액&nbsp;</p><input type="text" class="price_input" id="price" name="price_option" value="<c:if test="${!empty price}"/>${price}" readonly="readonly"><br>
			    <p>예약금액&nbsp;</p><input type="text" class="price_input" id="discount_price" name="discount_price" value="<c:if test="${!empty discount_param}"/>${discount_param}"readonly="readonly"><br>
			    <div class="order">
			        <button class="orderBtn" disabled="disabled">예약</button>
			        <button class="cancelBtn orderBtn" id="cancelBtn">취소</button>
			    </div>
			</div> 
	    </div> 
    </form> 
</div>
   