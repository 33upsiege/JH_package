<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
<style>
* {
	margin: 0;
	padding: 0
}

body {
	/* font-family: '맑은 고딕' 돋움; */
	font-size: 17px;
	color: #333
}

.tbl-ex {
	margin: 100px auto 0px auto;
}

.tbl-ex, .tbl-ex th, .tbl-ex td {
	border: 1px solid gray;
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	padding: 8px;
}

.tbl-ex th {
	background-color: #999;
	font-size: 1.1em;
	color: #fff;
	border-width: 2px 0;
}

.tbl-ex td {
	border-style: dotted;
}

.tbl-ex tr:hover td {
	background-color: tomato;
	cursor: pointer;
}

.even {
	background-color: highlight;
}
</style>
<!-- body -->
<section class="mainContent">
	<div class="bg_sub">
		<img src="images/bg_brand_sub.png" alt="johnnyrockets">
	</div>

	<div class="subWrap">

		<div class="brand_location">
			<a href="/" class="btn_home">Home</a> &gt; <a href="#none"> <em
				title="현재 페이지입니다.">메뉴</em></a>
		</div>

		<div class="brd_tit_area">
			<h2 class="tit_brd01">주문조회페이지</h2>

			<p class="txt_brd07" style="margin-top: 25px;">
				<a href="mypage">회원 정보 변경</a> | <a href="myorder">주문배송조회</a>
			</p>
		</div>

		<div class="loginWrap_box">
			<table class="tbl-ex">

				<tr>
					<th>주문날짜</th>
					<th>주문 항목</th>
					<th>수령인</th>
					<th>배송주소</th>
					<th>요청사항</th>
					<th>주문 총 금액</th>
					<th>주문 상황</th>
				</tr>
				<c:forEach var="list" items="${list}" varStatus="status">
				<tr 
				<c:if test="${status.index%2 == 0}">
					 class="even"
				</c:if>
				>
					<td>${list.order.sales_payment_date}</td>
					<td>${list.product.menu_name} 외 ${list.count }건</td>
					<td>${list.order.order_people}</td>
					<td>${list.order.order_address}</td>
					<td>${list.order.order_request}</td>
					<td>${list.order.order_all_price}</td>
					<td>
						<c:choose>
							<c:when test="${list.order.order_status=='1'}"> 결제완료 </c:when>
							<c:when test="${list.order.order_status=='2'}"> 주문확인 </c:when>
							<c:when test="${list.order.order_status=='3'}"> 배송중 </c:when>
							<c:when test="${list.order.order_status=='4'}"> 배송완료 </c:when>
							<c:when test="${list.order.order_status=='5'}"> 주문취소 </c:when>
							<c:when test="${list.order.order_status=='5'}"> 취소완료  </c:when>
						</c:choose>
					</td>
				</tr>
				</c:forEach>

			</table>

		</div>
	</div>
</section>
<!-- //body -->


