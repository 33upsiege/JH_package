<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/admin.js' />"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<header>
	<div class="wrap_admin">
		<div class="admin_header">
			<a href="../index">사용자</a> <a href="../login">로그인</a>
		</div>

		<div class="header_login">
			<ul>
				<li class="order_notice" id="order_notice">주문알림</li>
				<li class="stock_notice" id="stock_notice">재고알림</li>
				<li id="user_index">사용자 홈 이동</li> 
			</ul>
		</div>
	</div>
</header>

<div class="wrap_admin">
	<div class="order_notice_box">
		<div class="close">
			<span onClick="closeLayer(this)" style="cursor:pointer;font-size:1em" title="닫기">X</span><br>
		</div>
		<div class="curDate"></div>
		<ul id="order_list"></ul>
	</div>
	
	
		
	<div class="stock_notice_box">
		<div class="close">
			<span onClick="closeLayer(this)" style="cursor:pointer;font-size:1em" title="닫기">X</span>
		</div>
		<div class="curDate"></div>
			<ul>
				<li>
				<hr>
				<p class="notice_box_title">관리자님 재료 체크하셨나요?<br></p>
				<p class="notice_box_span" id="stock_list"><br></p>
				<div class="notice_box_a"><button class="btn btn-warning">재료주문</button></div>
				</li>
			</ul>
	</div>
</div>
