<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- 검색 -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 검색 -->
<script>

/* 	
	$(document).ready(function(){
		$(function(){
		    var autocomplete_text = ["할라피뇨 핫 올 버거","클래식 치즈버거","스모크 하우스","그릴드 어니언링 버거","허니갈릭 버거","오리지널 버거"];
		         $("#autocomplete").autocomplete({
		            source: autocomplete_text
		         });
			});
		$("#search_something").on("click",function(){
			var a = $("#autocomplete").val();
		    if(a=="할라피뇨 핫 올 버거"){
		    	alert("맵다"); 
		    }
			if(a=="클래식 치즈버거"){
				alert("클래식치즈버거");
			}
			if(a=="스모크 하우스"){
				alert("스뫀하우스");
			}
			if(a=="그릴드 어니언링 버거"){
				alert("어니언링");
			}
			if(a=="허니갈릭 버거"){
				alert("허니갈릭");
			}
			if(a=="오리지널 버거"){
				alert("오리지널");
			}
			if(a==''){
				alert("검색어를 입력해주세요");
			}
		});
		
		
	});//end ready */
</script>
<header>
	<div class="nav">
		<div class="navinner">
			<a href="index" class="logo">
				<img src="images/brand_logo.png" alt="로고" />
			</a>
			
			<!-- 로그인단 -->
			<div class="loginWrap">
				<ul>
				<c:if test="${member_id == null }" >
					<li>
						<a id="login" href="login">로그인</a>
					</li>
					<li>
						<a href="join">회원가입</a>
					</li>
					<li>
						<a href="#">주문내역조회</a>
					</li>
					<li>
						<a href="#">고객센터</a>
					</li>
					<li>
						<a href="#">인재채용</a>
					</li>
					<li>
						<a href="Burger_Master">관리자</a>
					</li>
				</c:if>
				<c:if test="${member_id != null }" >
					<li>
						<a id="login" href="logout">로그아웃</a>
					</li>
					<li>
						<a href="mypage">마이페이지</a>
					</li>
					<li>
						<a href="#">주문내역조회</a>
					</li>
					<li>
						<a href="#">고객센터</a>
					</li>
					<li>
						<a href="#">인재채용</a>
					</li>
					<li>
						<a href="Burger_Master">관리자</a>
					</li>
				</c:if>
	
				</ul>
			</div>
			<!-- //로그인단 -->
	
			<div class="nab_area" style="padding-top: 20px;">
				<ul>
					<li>
						<a href="product">메뉴</a>
					</li>
					<li>
						<a href="">딜리버리</a>
					</li>
					<li>
						<a href="">스토어</a>
					</li>
					<li>
						<a href="notice">공지사항</a>
					</li>
					<li>
						<a href="admin/index">이벤트</a>
					</li>
				</ul>
			</div><!-- //nab_area -->
	<!-- 	<div class="ui-widget">
			<input type="text" id="autocomplete">
			<a href="javascript:void(0)"><span id="search_something"class="btn btn-lg main-offshop-button">검색</span></a>
		</div> -->
	</div> <!-- //navinner -->
</div> <!-- //nav -->
</header>	<!-- //header -->