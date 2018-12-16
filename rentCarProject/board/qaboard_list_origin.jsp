<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").on("click",function(){
		$("#writeForm").removeAttr("style");
	});
	
});
</script>
</head>
<body>
<h1>qaboard List</h1>
<form action="QABoard">
<select name="searchName">
	<option value="title">제목</option>
	<option value="userid">작성자</option>
</select>
<input type="text" name="searchValue"><input type="submit" value="검색">
</form>
<table border="1">
	<tr>
		<th>글 구분</th>
		<th>문의타입</th>
		<th>작성자ID</th>
		<th>작성제목</th>
	<!-- 	<th>댓글root</th>
		<th>댓글step</th> -->
	</tr>
	<c:forEach var="dto" items="${list.list}">
	<tr>
		<c:if test="${dto.repstep == 0}">
		<td>신규글</td>
		</c:if>
		<c:if test="${dto.repstep != 0}">
		<td><img src="images/qa_board/reply2-1.png">답글</td>
		</c:if>
		<td>${dto.type}</td>
		<td>${dto.userid}</td>
		<td><a href="QABoardContent?num=${dto.num}">${dto.title}</a></td>
		<%-- <td>${dto.reproot }</td>
		<td>${dto.repstep }</td> --%>
	</tr>
	</c:forEach>
	<tr>
	<td colspan="4">
		
			<a <c:if test="${paging.curPage != 1}">
			href="QABoard?curPage=1&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >처음</a> &nbsp;
		
			
			<a <c:if test="${paging.startPage != 1}"> 
			href="QABoard?curPage=${paging.startPage - 1 }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >&lt;&lt;</a> &nbsp;
		
			<a <c:if test="${paging.curPage != 1}"> 
			href="QABoard?curPage=${paging.curPage - 1 }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >&lt;</a> &nbsp;
			
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1" varStatus="status">
				
				<a <c:if test="${paging.curPage != i}"> 
			href="QABoard?curPage=${i}&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >${i}</a> &nbsp;
				
			</c:forEach>
			
			<a <c:if test="${paging.endPage != paging.totalNum}"> 
			href="QABoard?curPage=${paging.curPage + 1 }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >&gt;</a> &nbsp;
			
			<a <c:if test="${paging.endPage != paging.totalNum}"> 
			href="QABoard?curPage=${paging.endPage + 1 }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >&gt;&gt;</a> &nbsp;
			
			<a <c:if test="${paging.endPage != paging.totalNum}"> 
			href="QABoard?curPage=${paging.totalNum }&searchName=${list.searchName}&searchValue=${list.searchValue}"
			</c:if> >마지막</a> &nbsp;
			
	</td>
	</tr>
</table>

<button id="writeBtn">글쓰기</button>&nbsp;&nbsp;
<a href="QABoard"><button id="writeBtn">목록</button></a>&nbsp;&nbsp;
<div id="writeForm" style="display: none;">
<jsp:include page="qaboard_write.jsp" />
</div>
</body>
</html>

