<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.numbering{font-weight: bolder;}
.searchArea{margin-left: 350px;height: 25px;width: 300px;}
.qa_search_btn,.qa_wirte_btn
{color:#fff;background:#083763;border:1px solid #083763;width: 60px;height: 30px; font-size:12px}
.searchValue{height:25px;width:155px}
.mm{width:1080px;margin:0 auto;padding:50px 0;}
</style>


<script type="text/javascript" src="..js/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#writeBtn").on("click",function(){
		$("#writeForm").removeAttr("style");
	});
	
});
</script>

<div class="contents">

		<!-- tbl_top -->
		<div class="tbl_top">
			<h4 class="tit_h4 f_l" style="padding-bottom: 25px;">형카 문의사항</h4>
			
		</div>
		<!-- //tbl_top -->

		<!-- tbl_type1 -->
		<div class="tbl_type1">
			<input type="hidden" value ="${dto.num}" />
			<table class="mm">
				<%-- <colgroup>
					<col width="*"><col width="*">
					<col width="15%">
				</colgroup> --%>
					<tr>
						<th width="85px" style="lhs:5px solid red">문의유형</th> 
						<th width="550px">제목</th>
						<th width="85px">작성자</th>
					</tr>
				
				
				<tbody>
			<c:forEach var="dto" items="${list.list}">
				<tr class="notice">
					<c:if test="${dto.repstep == 1}">
						<td><img src="images/qa_board/letter-n.png">&nbsp;답변</td>
					</c:if>
					<c:if test="${dto.repstep == 0}">
						<td>${dto.type}</td>
					</c:if>
					<c:if test="${dto.repstep == 0}">
					<td class="con"><a href="QABoardContent?num=${dto.num}">${dto.title}</a></td>
					</c:if>
					
					<c:if test="${dto.repstep != 0}">
					<td class="con"><img src="images/qa_board/reply.png">&nbsp;&nbsp;
					<a href="QABoardContent?num=${dto.num}">${dto.title}</a></td>
					</c:if>
					
					<td>${dto.userid}</td>
					<%-- <td>${dto.reproot }</td>
					<td>${dto.repstep }</td> --%>
					
				</tr>
			</c:forEach>
		</tbody>
		<tr>
	<td colspan="3">
		
			<%-- <a <c:if test="${paging.curPage != 1}">
			href="QABoard?curPage=1&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if>>처음</a> &nbsp; --%>
		
			
			<a <c:if test="${paging.startPage != 1}"> 
			href="QABoard?curPage=${paging.startPage - 1 }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >◀이전</a> &nbsp;
		
			<%-- <a <c:if test="${paging.curPage != 1}"> 
			href="QABoard?curPage=${paging.curPage - 1 }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >이전</a> &nbsp; --%>
			
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1" varStatus="status">
				
				<a class="numbering"<c:if test="${paging.curPage != i}"> 
			href="QABoard?curPage=${i}&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >${i}</a> &nbsp;
				
			</c:forEach>
			
			<%-- <a <c:if test="${paging.endPage != paging.totalNum}"> 
			href="QABoard?curPage=${paging.curPage + 1 }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >다음</a> &nbsp; --%>
			
			<a <c:if test="${paging.endPage != paging.totalNum}"> 
			href="QABoard?curPage=${paging.endPage + 1 }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >다음 ▶</a> &nbsp;
			
			<%-- <a <c:if test="${paging.endPage != paging.totalNum}"> 
			href="QABoard?curPage=${paging.totalNum }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >마지막</a> &nbsp; --%>
			
			<div class="f_r">
				<button id="writeBtn" class="qa_wirte_btn mr30">글쓰기</button>
			</div>
		
	</td>
	</tr>
			</table><br>
			
	<form action="QABoard" class="searchArea">
			<select name="searchName">
				<option value="title">제목</option>
				<option value="userid">작성자</option>
			</select>
				<input type="text" name="searchValue"class="searchValue">
				<input type="submit" value="검색" class="qa_search_btn">
	</form>
		</div>
		<div id="writeForm" style="display: none;">
		<jsp:include page="qaboard_write.jsp" />
		</div>

	</div>