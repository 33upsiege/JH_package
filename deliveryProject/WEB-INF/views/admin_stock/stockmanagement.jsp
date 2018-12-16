<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<!-- 모달 윈도우창 -->
	<div class="stock_list_wrap">
		<span>
			<label for="Insert_modal" class="Insert_button">재고 추가</label>
		</span>
			<span class="StockTitle">재고리스트</span>
		<span>
			<label for="Modify_modal" class="Modify_button">재고 수정</label>
		</span>
	</div>
	<br>
	<br>
	<div class="stock_list_wrap">
	<jsp:include page="stocklist.jsp" flush="true" /><br>
	</div>
	<br>


	<input type="checkbox" id="Modify_modal" class="Modify_hidden ">
	<div class="Modify_box_modal">
		<label for="Modify_modal" class="Modify_closer">x</label>
		<div class="text">
			<p>재고 수정</p>
			<jsp:include page="stockmodify.jsp" flush="true" />
		</div>
	</div>
	
	<!-- 모달 윈도우창 -->
	<input type="checkbox" id="Insert_modal" class="Insert_hidden">
	<div class="Insert_box_modal">
		<label for="Insert_modal" class="Insert_closer">x</label>
		<div class="text">
			<p>재고 추가</p>
			<jsp:include page="stockinsert.jsp" flush="true" />
		</div>
	</div>
	
</body>
</html>