<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="css/mypage.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script src="js/mypage.js"></script>


<div class="wrap_my_rentcheck">
	<form action="MyRentCheck" method="get">
	<div id=rent_check_div>
		<p class="mypage_title">최근 예약 내역 확인</p>
		<div class="period_div">
			<p class="period_p">조회기간</p>
			<input type="text" id="start_date" class="date_input" name="start_date">~<input type="text" id="end_date" class="date_input" name="end_date">
			<button class="mypage_btn" id="check_btn">조회</button>
			<button class="mypage_btn"  id="all_check_btn">전체</button>
		</div>
		<table class="table_my_rentcheck">
			<tr class="top_border">
				<th>랜트번호</th>
				<th>랜트일자</th>
				<th>랜트차정보</th>
				<th>랜트금액</th>
				<th>랜트상태</th>
			</tr>
			<c:forEach var="list" items="${reservList.list}">
			 	<tr>
					<td>${list.rentId}</td>
					<td>
						대여일시 ${list.rentDate}~
						<c:choose>
							<c:when test="${empty list.realReturnDate}">
								반납예정일시 ${list.returnDate}
							</c:when>
							<c:when test="${!empty list.realReturnDate}">
								반납일시 ${list.realReturnDate}
							</c:when>
						</c:choose>
					</td>
					<td>${list.carDTO.carName}</td>
					<td><fmt:formatNumber value="${list.price}" type="currency"> </fmt:formatNumber></td>
					<td>
						<c:choose>
							<c:when test="${empty list.realReturnDate}">
								예약완료
							</c:when>
							<c:when test="${!empty list.realReturnDate}">
								반납완료
							</c:when>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="border-bottom: none;">
					<c:if test="${paging.totalNum > 0}"><a <c:if test="${paging.startPage > 1}"/> href='MyRentCheck?curPage=1'>처음</a>&nbsp;</c:if>
					<c:if test="${paging.totalNum > 0}"><a <c:if test="${paging.curPage > 1}"/> href='MyRentCheck?curPage=${paging.curPage-1}'>이전</a>&nbsp;</c:if>
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1" varStatus="status">
						<a <c:if test="${paging.curPage != i}"/> href='MyRentCheck?curPage=${i}'>${i}</a>&nbsp;
					</c:forEach>
					<c:if test="${paging.totalNum > 1}"><a <c:if test="${paging.curPage < paging.totalNum}"/> href='MyRentCheck?curPage=${paging.curPage+1}'>다음</a>&nbsp;</c:if>
					<c:if test="${paging.totalNum > 1}"><a <c:if test="${paging.endPage < paging.totalNum}"/> href='MyRentCheck?curPage=${paging.totalNum}'>끝</a>&nbsp;</c:if>	
					</td>
				</tr>
				
		</table>
		
		
		</div>
	</form>
</div>