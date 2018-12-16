<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script type="text/javascript" src="http://darling2.cafe24.com/js/jquery.bxslider.min.js"></script>

  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
<script type="text/javascript" src="http://darling2.cafe24.com/js/jquery.bxslider.min.js"></script>
<script>
	
	$(document).ready(function(){
		var k = $(window).width();

		var minus = k/5-11;
		$(".carInfo li" ).css("width",minus);

		$(".tabCar .tab li").click(function(){
			var idx= $(this).index();
			console.log(idx);
		
			$(this).siblings().removeClass("on");
			$(this).addClass("on");


			$(".tab_cont").removeClass("on");
			$(".tab_cont").eq(idx).addClass("on");

		});

		
	});

	$(window).resize(function(){
		/* 메인 차 예약하기 */
		var k = $(window).width();

		var minus = k/5-11;
		$(".carInfo li" ).css("width",minus);


	})

	$(function(){
		/* 메인 상단 슬라이드 */
		$('.mainSlider .bx_carousels').bxSlider({
				speed:1000,
				auto:true,
				controls:false,
				pager:false
				
		  });
		  $('.reviewSlider .bx_carousels').bxSlider({
				speed:1000,
				auto:true,
				controls:false,
				pager:true,
				slideWidth:1243
				
		  });
		  
		//형카 예약 눌렀을때 로그인 했는지 체크		  
			$("#Reservation_a").on("click",function(){
				loginCheck();
			});	  
			//로그인체크 함수
			function loginCheck(){
				var userid = '${sessionScope.userid}';
				//alert(userid);
				if(userid==""){
					$(".LoginlayerBox").show();
					event.preventDefault();
				}else{
					var url = "ReservationUI"; 
					$(location).attr('href',url);
				}
			}
		  
	});
	

</script>


  
 </head>

 <link rel="stylesheet" href="css/main.css" />
 <link rel="stylesheet" href="css/common.css" />

		<div class="wrap">
		
			<!-- 로그인  -->
			<jsp:include page="../member/login.jsp" flush="true"/>
			<!-- //로그인  -->
			
			<!-- 메인 퀵 -->
			<div class="l__car-search-tab">
				<div class="js__car-search-tab">
					<aside class="l__car-search-tab">
						<h1 class="title">렌터카 빠른검색</h1>
						<span class="explain">제주여행 필수 예약 렌트카!<br>렌트카 예약은 오로지  <em class="fc_orange fc_weight fs14">형카!</em></span>
						<div class="icon">
							<img src="images/main/ico.png" alt="" />
						</div>
					</aside>
				</div>
			</div>
			<!-- //메인 퀵 -->
			<header class="headerWrap">
				<div class="bd">
					<div class="loginWrap">
						<ul>
 
  					<c:if test="${empty userid}">
  								<li>
									<a href="index.jsp">홈</a>
								</li>
								<li>
									<a href="#" id="btnLogin">로그인</a>
								</li>
								<li>
									<a href="SignUpUI">회원가입</a>
								</li>
								<li>
									<a href="#">채용</a>
								</li>
					</c:if>   
					<c:if test="${! empty userid}">
								
								<li>
									<a href="MyPageUI">${userid}님</a>
								</li>
								<li>
									<a href="index.jsp">홈</a>
								</li>
								<li>
									<a href="Logout">로그아웃</a>
								</li>
								<li>
									 <a href="MyPageUI">내정보</a>
								</li>
								<li>
									<a href="#">채용</a>
								</li>
					</c:if>
						</ul>
					</div>
				</div>
				<div class="gnb_box">
					<h1 class="logo">
						<a href="index.jsp"><img src="images/main/logo.png" alt="" /></a>
					</h1>

					<ul class="menu">
						<li>
							<a href="#">형카소개</a>
						</li>
						<li>
							<a href="ReservationUI" id="Reservation_a">형카예약</a>
						</li>
						<li>
							<a href="NoticeUI">형카알림</a>
						</li>
						<li>
							<a href="QABoardUI">형카문의</a>
						</li>
						
					</ul>
					
				</div>
				<!-- 로그인 팝업 -->
			<!-- 	<div class="loginWrap">
					<div class="login">
						<h1>WelCome 형카</h1>
						  <form method="post" action="Login">
								<p>
									<input type="text" name="userid"placeholder="UserID" id="userid">
								</p>
								<p>
									<input type="password" name="passwd"placeholder="Password" id="userpw"
									 onKeyDown="if(event.keyCode==13)loginProcess()">
								</p>
								<p class="remember_me">
									<label>
										<input type="checkbox" name="remember_me" id="remember_me">
										아이디 기억하기
									</label>
								</p>
								<p class="submit">
									<input type="submit" name="commit" value="로그인">
								</p>
						  </form>
					</div>
					<div class="login_help">
						<p><a href="#">아이디 찾기</a></p>
					</div>
					<div class="login_help">
						<p><a href="#">비밀번호 찾기</a></p>
					</div>
				</div> -->
				<!-- //로그인 팝업 -->
			</header><!-- //headerWrap -->
