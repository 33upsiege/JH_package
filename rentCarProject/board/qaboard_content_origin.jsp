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
	
	//select 박스 선택해두기
	var type = "${dto.type}";
	if(type != null){
		$(".type").val(type).selected;
	}
	
	//댓글 버튼 임시 이벤트 - style{display:none} 삭제
	$("#repBtn").on("click",function(){
		$("#rep").removeAttr("style");
	});
	
	$("#updateBtn").on("click",function(){
		var modify = confirm('저장 하시겠습니까?');
		if(modify==true){
		$("#boardForm").attr("action","QABoardUpdate").submit();
		alert("수정되었습니다");
		}else{
			return false;
		}			
		});
	
	$("#deleteBtn").on("click",function(){
		var chk = confirm('정말 삭제하시겠습니까?');
		if(chk){
			//location.replace("QABoardDelete?num="+${dto.num});
			location.href="QABoardDelete?num="+${dto.num};
		} else{
			return false;
		}
			
	});
}); 

</script>
<style type="text/css">


</style>
</head>
<body>
<h1>게시판 상세 페이지</h1>
<form id="boardForm">
<input type="hidden" name="num" value="${dto.num}">
<select class="type" name="type">
	<option>예약 문의</option>
	<option>기타 문의</option>
</select><br>
작성자ID : <input type="text" name ="userid" value="${dto.userid}" readonly="readonly"><br>
글쓴시간 : <input type="text" name ="writeday" value="${dto.writeday}" readonly="readonly"><br>
작성 제목 : <input type="text" name ="title" value="${dto.title}"><br>
문의 내용 : <input type="text" name ="content" value="${dto.content}"><br>
</form>
<button id="updateBtn">글 수정(해당유저,관리자)</button>&nbsp;&nbsp;<button id="repBtn">답글 작성(관리자용)</button><br>
<button id="deleteBtn">글 삭제(해당유저,관리자,삭제시 댓글까지 다삭제)</button>&nbsp;&nbsp;<a href="QABoardUI"><button>목록으로</button></a>
<br>
<br>
<br>

<div id="rep" style="display: none; ">
<form action="QABoardRepWrite">
<input type="hidden" name="reproot" value="${dto.reproot}">
<input type="hidden" name="repstep" value="${dto.repstep}">
<input type="hidden" name ="type" value="${dto.type}">
작성 제목 : <input type="text" name ="title" value=""><br>
문의 내용 : <input type="text" name ="content" value=""><br>
<input type="submit" value="답글쓰기">
</form>
</div>

</body>
</html>