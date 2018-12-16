<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
			<script type="text/javascript">
				$(document).ready(function(){
					
					$(".navMenubar li").click(function(){
						var idx= $(this).index();
						var tabName =$.trim($(this).find(".mn-text").text());
						console.log(tabName);
						console.log(idx);
					
						$(this).siblings().removeClass("on");
						$(this).addClass("on");


						$(".mn_delivery_list").removeClass("on");
						$(".mn_delivery_list").eq(idx).addClass("on");
						
						
						 $.ajax({
							url : 'listProduct', //text.jsp로 연결하겠다.
							type : "get", //방식 get post
							data : {
								"tabName" :tabName
								
							}, //comBox 가 servlet string과 같게 받아야 함.
							dataType : 'text', //요청했을 때 내가 받고싶은 형 종류
							success : function(data, status, xhr) { //지가 알아서 성공하면 이 함수 실행
								$(".mn_delivery_list").eq(idx).find(".deliveryMenu li").remove();
								$(".mn_delivery_list").eq(idx).find(".deliveryMenu").prepend(data); 
								//console.log(data);
							},
							error : function(xhr, status, error) { //실패하면 지가 알아서 이 함수 실행
								console.log(error);
							}

						});  //ajax 
						
					}); //

				});
			</script>
			
			
			

	<!-- body -->
	<section class="mainContent">
		<div class="bg_sub">
			<img src="images/bg_brand_sub.png" alt="johnnyrockets">
		</div>
		
		<div class="subWrap">

			<div class="brand_location">
				<a href="/" class="btn_home">Home</a> &gt; <a href="#none"> <em title="현재 페이지입니다.">딜리버리</em></a> 
			</div>

			<div class="brd_tit_area">
				<h2 class="tit_brd01">
					 DELIVERY MENU
				</h2>
				<p class="txt_brd07" style="margin-top: 25px;">정직한 음식이 만드는 행복한 세상!  다양한 메뉴를 배달로 만나세요! </p>
			</div>
			
			<div class="sectionBox">
				<ul class="navMenubar">
					<li class="on">
						<a href="javascript:void(0);">
							<span class="mn_img">
								<img src="images/product/dv_mn_new.png" alt="" />
							</span>
							<span class="mn-text">추천메뉴</span>
							
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="mn_img">
								<img src="images/product/dv_mn_set_burger.png" alt="" />
							</span>
							<span class="mn-text">버거</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="mn_img">
								<img src="images/product/dv_mn_side_menu.png" alt="" />
							</span>
							<span class="mn-text">사이드메뉴</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="mn_img">
								<img src="images/product/dv_mn_drink.png" alt="" />
							</span>
							<span class="mn-text">음료</span>
						</a>
					</li>
				</ul>
				<!-- 추천메뉴 -->
				
				<div class="mn_delivery_list on">
					<ul class="bestMenu deliveryMenu">
						
						
						 <c:forEach var="goods" items="${list}">
						<li>
							<a href="productInfo?menu_code=${goods.menu_code}">
								<img src="images/product/${goods.menu_img}.jpg" alt="" />
								<span>${goods.menu_name}</span>
							</a>
							
							<p class="delivery-list-phrase">${goods.menu_content_1}</p>
							<p class="delivery-list-price">${goods.menu_price}</p>
							
							<span class="mn-cart">
								<a href="">카트담기</a>
							</span>
							<span class="mn-cart bdnone">
								<a href="">바로주문</a>
							</span>

						</li>
						</c:forEach>
						 
						<!-- <li>
							<a href="">
								<img src="images/burger5.jpg" alt="" />
								<span>할라피뇨 듬뿍</span>
							</a>
							
							<p class="delivery-list-phrase">매콤한 고추와 달콤한 빨간소스의 절묘한 그 맛을 버거로도 즐기자!</p>
							<p class="delivery-list-price">5,000</p>
		
							<span class="mn-cart">
								<a href="">카트담기</a>
							</span>
							<span class="mn-cart bdnone">
								<a href="">바로주문</a>
							</span>

						</li>
						<li>
							<a href="">
								<img src="images/burger6.jpg" alt="" />
								<span>할라피뇨 듬뿍</span>
							</a>
							
							<p class="delivery-list-phrase">매콤한 고추와 달콤한 빨간소스의 절묘한 그 맛을 버거로도 즐기자!</p>
							<p class="delivery-list-price">5,000</p>

							<span class="mn-cart">
								<a href="">카트담기</a>
							</span>
							<span class="mn-cart bdnone">
								<a href="">바로주문</a>
							</span>
						</li>
						<li>
							<a href="">
								<img src="images/burger7.jpg" alt="" />
								<span>할라피뇨 듬뿍</span>
							</a>
							
							<p class="delivery-list-phrase">매콤한 고추와 달콤한 빨간소스의 절묘한 그 맛을 버거로도 즐기자!</p>
							<p class="delivery-list-price">5,000</p>

							<span class="mn-cart">
								<a href="">카트담기</a>
							</span>
							<span class="mn-cart bdnone">
								<a href="">바로주문</a>
							</span>
						</li>
						<li>
							<a href="">
								<img src="images/burger8.jpg" alt="" />
								<span>할라피뇨 듬뿍</span>
							</a>
							
							<p class="delivery-list-phrase">매콤한 고추와 달콤한 빨간소스의 절묘한 그 맛을 버거로도 즐기자!</p>
							<p class="delivery-list-price">5,000</p>

							<span class="mn-cart">
								<a href="">카트담기</a>
							</span>
							<span class="mn-cart bdnone">
								<a href="">바로주문</a>
							</span>
						</li>
						<li>
							<a href="">
								<img src="images/burger9.jpg" alt="" />
								<span>할라피뇨 듬뿍</span>
							</a>
							
							<p class="delivery-list-phrase">매콤한 고추와 달콤한 빨간소스의 절묘한 그 맛을 버거로도 즐기자!</p>
							<p class="delivery-list-price">5,000</p>

							<span class="mn-cart">
								<a href="">카트담기</a>
							</span>
							<span class="mn-cart bdnone">
								<a href="">바로주문</a>
							</span>
						</li> -->
					</ul>
				</div>
				<!-- // 추천메뉴 -->

				<!-- 버거 -->
				<div class="mn_delivery_list">
					<ul class="bestMenu deliveryMenu">
						
					</ul>
				</div>
				<!-- // 버거 -->

				<!-- 사이드메뉴 -->
				<div class="mn_delivery_list">
					<ul class="bestMenu deliveryMenu">
						
					</ul>
				</div>
				<!-- // 사이드메뉴 -->

				<!-- 음료 -->
				<div class="mn_delivery_list">
					<ul class="bestMenu deliveryMenu">
						
					</ul>
				</div>
				<!-- // 음료 -->
			
			</div> <!--// sectionBox-->

		</div>
	</section>
	<!-- //body -->



</body>
</html>
