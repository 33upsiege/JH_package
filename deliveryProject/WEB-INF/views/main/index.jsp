<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="ko">
<head>
<meta charset="utf-8"> 
<meta name="viewport" > 
<title>title</title>


</head>
<body> 
	
	<div class="wrap">
		<div class="headerWrap">
			
		
			<section>
				<div class="mainWrap">
					<div class="innerCont">
						<span class="maintxt">
							미국 정통 프리미엄  
						</span><br />
						<span class="maintxt v2">
							수제버거  딜리버리 서비스
						</span>

						<ul class="cont_list ">
							<li>
								<img src="images/img_delivery3.jpg" alt="" class="width100" />
							</li>
							<li>
								<ul class="bx_carousels">
									<li>
										<img src="images/burger1.png" alt="햄버거1" />
									</li>
									<li>
										<img src="images/burger2.png" alt="햄버거2" />
									</li>
									<li>
										<img src="images/burger3.png" alt="햄버거3" />
									</li>
								</ul>
								<span class="icoNew">New</span>
							</li>
							<li>
								<img src="images/img_menu2.jpg" alt="" class="width100"  /> 
								<!--
								<div class="info">
									자니로켓 본점 <br />
									평일 - 10:30~<br />
									주말 - 10:30~20:30 (금요일포함)<br />

									매장 별로 영업시간이<br />
									다를 수 있습니다.
								</div>
								-->
							</li>
							<li>
								<div class="main-offshop-item">
									<p class="main-offshop-txt">STORE<br>SEARCH</p>
									<p class="main-offshop-txt2">고객님과 가장 가까이 있는<br>매장을 찾아보세요!</p>
									<a href="/store/findStore"><span class="btn btn-lg main-offshop-button">VIEW</span></a>
								</div>
							</li>
						</ul>
						
					</div>
				</div>

			</section>

		</div><!--// headerWrap -->




		<!-- 메뉴소개 -->
		<!-- <section>
			블랙버젼
			<div class="menuWrap bg_bk">
				<p class="mb50">
					<img src="images/stit_sign01_0119.gif" alt="나만의 시그니처 버거 만들기" />
				</p>

				<p class="mb100" >
					<img src="images/signiture.jpg" alt="나만의 시그니처 버거 만들기" />
				</p>
				<ul class="sig_menu bx_num3">
					<li>
							<img src="images/s1.jpg" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/s2.jpg" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/s5.jpg" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/s4.jpg" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/s6.jpg" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/s3.jpg" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/s7.jpg" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/s8.jpg" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
				
				</ul>
			</div> -->
			<!-- //블랙버젼 -->

			<!-- 화이트 버젼 -->
			<div class="menuWrap bg_wh">
				<p class="">
					<img src="images/stit_sign01_0119.png" alt="나만의 시그니처 버거 만들기" />
				</p>

				<p class="" >
					<img src="images/burger2.jpg" alt="나만의 시그니처 버거 만들기" />
				</p>
				<ul class="sig_menu bx_num3">
					<li>
							<img src="images/artisan_chicken.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/bacon.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/Bacon_Onion_Sauce.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/bun1.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/crispy_chicken.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/Fried_Onion_Strings.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/grill-seasoning.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/patty.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					<li>
							<img src="images/Sweet_Mustard_Sauce.png" alt="" class="width100 "  />
							<span class="bgBlack"></span>
					</li>
					
				
				</ul>
			</div>
			<!-- // 화이트 버젼 -->
		</section>
		<!-- //메뉴소개 -->
		
		<!-- 매장위치 -->
		<section>
			<div class="store_wrap">
				<p class="storeBG">
					<img src="images/bg_brand_sub.png" alt=""  />
				</p>

				<span class="title">Best Seller</span>
				<ul class="bestMenu">
					
					<c:forEach items="${xxx}" var="burger">
						<li>
							<a href="">
								<img src="images/${burger.menu_img}.jpg" alt="" /> 
								<span>${burger.menu_name}</span>
							</a>
						</li>
					</c:forEach>
					
					<!-- <li>
						<a href="">
							<img src="images/burger5.jpg" alt="" />
							<span>할라피뇨 듬뿍</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/burger6.jpg" alt="" />
							<span>할라피뇨 듬뿍</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/burger7.jpg" alt="" />
							<span>할라피뇨 듬뿍</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/burger8.jpg" alt="" />
							<span>할라피뇨 듬뿍</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/burger9.jpg" alt="" />
							<span>할라피뇨 듬뿍</span>
						</a>
					</li> -->
				</ul>


				<span class="title">매장위치</span>

				<div class="map">
					<!-- <img src="images/spot.jpg" alt="" />
					<img src="images/spot2.jpg" alt="" /> -->
					<div id="map" style="width:690px;height:350px; float:left;margin-left: 366px"></div>
				<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a743f7f651218d8dff6c973cfbb3816"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new daum.maps.LatLng(37.499460, 127.028980), // 지도의 중심좌표
					        
					       /* 에이콘 강남  
					        37°29'58.1"N 127°01'44.3"E
					        37.499460, 127.028980 */
					        
					        level: 4, // 지도의 확대 레벨
					        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
					    }; 
					// 지도를 생성한다 
					var map = new daum.maps.Map(mapContainer, mapOption); 
					// 지도에 마커를 생성하고 표시한다
					var marker = new daum.maps.Marker({
					    position: new daum.maps.LatLng(37.499460, 127.028980), // 마커의 좌표
					    map: map // 마커를 표시할 지도 객체
					});
					
				</script>
			<div class="brd_store_infor">
					<div class="brd_tit_area03">
						<h2 class="tit_brd03">강남점</h2>
					</div>
					<div id="store_story">서울특별시 강남구 역삼동 강남대로94길<br/>쟈니스버거(에이콘아카데미) 강남점<br>
							(주중) 10:00~23:00<br>
							(금요일, 주말) 10:00~23:00<br>
							월 2회 휴무+설,추석 당일 휴무<br>
							<a href="http://map.daum.net/?urlX=506416&urlY=1111102&urlLevel=3&itemId=24995999&q=%EC%97%90%EC%9D%B4%EC%BD%98%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8%20%EA%B0%95%EB%82%A8%EC%BA%A0%ED%8D%BC%EC%8A%A4&srcid=24995999&map_type=TYPE_MAP" target="_blank" title="새 창 열림">
							<img src="images/btn_store.png" alt="지도상세보기" style="display: block;margin-block-start: 20px;"></a>
					</div>
			</div>
			</div>
		</section>


		



	</div><!-- //wrap  -->
	
	
<!--  메인 스크립트  -->
<script type="text/javascript" src="http://darling2.cafe24.com/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	/*
	$(".menuWrap li").mouseover(function(){
		$(this).siblings().removeClass("on");
		$(this).addClass("on");
	});
	*/

	var k = $(window).height();
	$(".headerWrap").css("height",k);
});

$(window).resize(function(){
		var k = $(window).height();
		$(".headerWrap" ).css("height",k);
	})


		$(function(){
			/* 메인 상단 슬라이드 */
			$('.innerCont .bx_carousels').bxSlider({
					speed:1000,
					auto:true,
					controls:false,
					pager:true
					
			  });

			  $('.bx_num3').bxSlider({
					ticker: true,
					speed:100000,
					tickerHover:false,
					maxSlides:8, //최고 보여질 슬라이드 수 // slideWidth *   maxSlides =  bx-wrapper width값
					//minSlides:4, //큰 박스 800에 맞춰서  slideWidth 값이 맞는 선에서 노출
					slideWidth:200, // 블랙햄버거 340
					slideMargin:40
			  });
		
		  
	});
</script>
<!--  //메인 스크립트  -->

</body>
</html>
