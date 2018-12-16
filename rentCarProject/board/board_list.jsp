<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="contents">
		<!-- tbl_top -->
		<div class="tbl_top">
			<h4 class="tit_h4 f_l">형카 공지사항</h4>
			<div class="f_r">
				<a href="NoticeUIWrite" class="btn_m btn_type3"><span>작성하기</span></a>
				<!-- <a href="#" class="btn_m btn_type5"><span>삭제</span></a> -->
			
			</div>
		</div>
		<!-- //tbl_top -->   
	
	
		<!-- tbl_type1 -->
		<div class="tbl_type1">
			<%-- <c:set var="dto" value="${list}" scope="session" /> --%>
			<input type="hidden" value ="${dto.num}" />
			<table>
				<colgroup>
					<col width="*"><col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var ="list" items="${pdto.list}"  varStatus="status">
					<%-- <c:forEach var ="dto" items="${list}"  varStatus="status"> --%>
					<tr class="notice">
						<td class="con"><a href="NoticeBoardView?num=${list.num}">${list.title}</a></td>
						<td>${list.userid}</td>
						<td>${list.writeday}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- //tbl_type1 -->
		<%-- ${pdto.totalRecord} --%>
		<!--  ${pdto.perPage}  //5  -->
		
		<!-- <c:set var="paging" value="${pdto}" scope="session" />저장 태그 -->
		<c:set var="c" value="${pdto.curPage}" scope="request" />
		<c:set var="p" value="${pdto.perPage}" scope="request" />
		<c:set var="total" value="${pdto.totalRecord}" scope="request" />
		<c:set var="max" value="${ Math.floor(total/p)}" scope="request" />
		
		<c:set var="ppp" value="3" />
		<c:set var="startPage" value="${Math.floor((c-1)/3) * 3 +1}" scope="request" />
		
		<c:set var="endPage" value="${startPage + ppp -1}" scope="request" />
	
		<!-- 
		startPage : ${startPage } <br /> 
		total : ${total} <br />
		p : ${p} <br /> 
		max : ${max } <br /> 
		
		 -->
		<c:if test="${total % p != 0}"> 
			<%-- ${max+1} --%>
			<c:set var="max" value="${max+1}" scope="request" />
		</c:if>
		
		<!-- 
		c: ${c} <br />
		ppp : ${ppp }<br /> 
		
		endPage : ${endPage }<br />
		 -->
		<c:if test="${endPage>max}"> 
			<c:set var="endPage" value="${max}" scope="request" /> 
			${endPages}
		</c:if>
		
		
		
		<div class="paging">
			<c:if test="${1<c}"> 
			<span>
				<a href="NoticeBoard?curPage=${1}" >&lt;&lt;</a>
			</span>
			</c:if>
			<!-- c < max -->
			<c:if test="${1<c}">
				<span>
					<a href="NoticeBoard?curPage=${c-1}" >&lt;</a>
				</span>
			</c:if> 
			
			
			<c:forEach var="x" begin="${startPage}" end="${endPage }">
				<c:choose>
	    			<c:when test="${c==x}">
						<strong>
							${x}
						</strong>
					</c:when>
					<c:otherwise>
					
						<a href="NoticeBoard?curPage=${x}">${x}</a>
					
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			
			<c:if test="${c < max}"> 
				<a href="NoticeBoard?curPage=${c+1}">&gt;</a>
			
			</c:if>
			
			<c:if test="${endPage < max}"> 
				<fmt:parseNumber var="max" type="number" value="${max}" />
				<a href="NoticeBoard?curPage=${max}">&gt;&gt;</a>
			</c:if>
			
	
		</div>
		
		

	</div>