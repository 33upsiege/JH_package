<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			

			
	 <!-- body -->
   <section class="mainContent">
      <div class="bg_sub">
         <img src="images/bg_brand_sub.png" alt="johnnyrockets" />
      </div>
      <div class="subWrap">

         <div class="brand_location">
            <a href="/" class="btn_home">Home</a> &gt; <a href="#none"> <em title="현재 페이지입니다.">주문완료</em></a> 
         </div>

         <div class="brd_tit_area">
            <h2 class="tit_brd01">
               	  주문 완료
            </h2>
            <p class="txt_brd07" style="margin-top: 25px;">정직한 음식이 만드는 행복한 세상! 다양한 메뉴를 배달로 만나세요! </p>
         </div>
      
         <div class="sectionBox">
            <div class="productInfoBox">

               <div class="payment-hd">
                  <div class="main-tit-area">
                     
                      <br /> <br />
                     <h4 class="main-tit-htit">주문이 완료되었습니다.</h4>
                  </div>
               </div> <!-- //payment-hd -->
               <div class="tblDIV">
	               <table class="tblOrder">
	              	<colgroup>
	              		<col width="20%" />
	              		<col width="*" />
	              	</colgroup>
	              	
	               	<tr>
	               		<td>배송지 주소 :</td>
	               		<td>${order.order_address}</td>
	               	</tr>
	               	<tr>
	               		<td>결제 금액 :</td>
	               		<td>${order.order_all_price}원</td>
	               	</tr>
	               	<tr>
	               		<td>배송 요청 사항 :</td>
	               		<td>${order.order_request}</td>
	               	</tr>
	               	<c:set var="x" value="${order}"/> <!-- 저장 태그 -->
	               	<!-- 
	               		결제 전 ( 1 )
					-결제 완료 ( 2 )
					-배송 중 ( 3 )
					-배송 완료 ( 4 )
					-주문 취소 
	               	
	               	 -->
					<tr>
	               		<td>주문 상태 :</td>
	               		<td>
	               		<c:if test="${x.order_status=='1'}">
						     결제 전 입니다.
						</c:if>
						<c:if test="${x.order_status=='2'}"> 
						     결제 완료 되었습니다. 배송 준비 중입니다.
						</c:if>	
						<c:if test="${x.order_status=='3'}"> 
						    현재 배송 중입니다.
						</c:if>		
						<c:if test="${x.order_status=='4'}"> 
						    현재 배송 완료 상태입니다.
						</c:if>	
						<c:if test="${x.order_status=='5'}"> 
						    주문 취소 상태입니다.
						</c:if>	
	               		</td>
	               	</tr>
	               	
	               </table>
               </div>
               <br />
               <a href="myorder" class="btn btn-reverse btn-lg login-button login_submit2">주문내역 확인</a>
               <a href="index" class="btn  btn-lg login-button login_submit">홈으로</a>
      		</div> <!-- //productInfoBox -->
      	</div> <!-- //sectionBox -->
      </div><!-- //subWrap  -->
   </section>
   <!-- //body -->



</body>
</html>
