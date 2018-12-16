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

	<form action="MyQABoard" method="get">		
		<div id=qa_div>
		<p class="mypage_title">1:1 문의 내역</p>
		<div class="period_div">
			<p class="period_p">조회기간</p>
			<input type="text" id="QAstart_date" class="date_input" name="start_dateQA">~<input type="text" id="QAend_date" class="date_input" name="end_dateQA">
			<button class="mypage_btn"  id="check_btnQA">조회</button>
			<button class="mypage_btn" id="all_check_btnQA">전체</button>
		</div>
		<table class="table_my_rentcheck">
			<tr class="top_border">
				<th width="170px;">문의타입</th>
				<th>제 목</th>
				<th width="170px;">작성일</th>
			</tr>
			<c:forEach var="QAlist" items="${myQaList.list}">
				 <tr class="notice">
				 
				 		<td>
				 			<c:choose>
								<c:when test="${QAlist.repstep == 1}">
									답변
								</c:when>
								<c:when test="${QAlist.repstep == 0}">
									${QAlist.type}
								</c:when>
							</c:choose>	
				 		</td>
				 		
				 		<td>
				 			<c:choose>
								<c:when test="${QAlist.repstep == 0}">
									<a href="QABoardContent?num=${QAlist.num}">${QAlist.title}</a>
								</c:when>
								<c:when test="${QAlist.repstep != 0}">
									<img src="images/qa_board/reply2-1.png">&nbsp;&nbsp;
									<a href="QABoardContent?num=${QAlist.num}">${QAlist.title}</a>
								</c:when>
							</c:choose>	
				 		</td>
						<td>${QAlist.writeday}</td>					
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3"  style="border-bottom: none;">
					<c:if test="${pagingQA.totalNumQA > 0}"><a <c:if test="${pagingQA.startPageQA > 1}"/> href='MyQABoard?curPageQA=1'>처음</a>&nbsp;</c:if>
					<c:if test="${pagingQA.totalNumQA > 0}"><a <c:if test="${pagingQA.curPageQA > 1}"/> href='MyQABoard?curPageQA=${pagingQA.curPageQA-1}'>이전</a>&nbsp;</c:if>
					<c:forEach var="i" begin="${pagingQA.startPageQA}" end="${pagingQA.endPageQA}" step="1" varStatus="status">
						<a <c:if test="${pagingQA.curPageQA != i}"/> href='MyQABoard?curPageQA=${i}'>${i}</a>&nbsp;
					</c:forEach>	
					<c:if test="${pagingQA.totalNumQA > 1}"><a <c:if test="${pagingQA.curPageQA < pagingQA.totalNumQA}"/> href='MyQABoard?curPageQA=${pagingQA.curPageQA+1}'>다음</a>&nbsp;</c:if>
					<c:if test="${pagingQA.totalNumQA > 1}"><a <c:if test="${pagingQA.endPageQA < pagingQA.totalNumQA}"/> href='MyQABoard?curPageQA=${pagingQA.totalNumQA}'>끝</a>&nbsp;</c:if>	
					</td>
				</tr>
				
		</table>
		
		
		</div>
	</form>
</div>