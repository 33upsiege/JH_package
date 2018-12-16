<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
<script>
   $(document).ready(function() {
      $(".optionList li").on("click",function(){
           $(".addoption").remove();
           $("#sum_burger").empty();
           $("#nowQty").val(1);
         var basic = $("#sum_burger").data('basic');
         $("#sum_burger").text(basic);
            var sum = 0;
            $(".optionList li .subCheckBox").each(function(idx, ele){
               if(ele.checked){
                  var topping = $(this).val(); //input 의 val
                  var data_code = $(this).data('code'); //input 의 val
                  var topping_result = $(this).data('name');
                  var g = "<span class=addoption>"+topping+"&nbsp <em style='display:none'class=code>"+data_code+"/</em><em style='display:none' class=result>"+topping_result+"/</em></span>";
                  $(".detail-price__tit").append(g);
                  var arr =[];
                  
                  arr.push(topping_result);
                  sum += parseInt(arr);
                  $("#sum_burger").text(sum+basic);
               }
            });
      });//end add
      
            $("#plus_btn").on("click",function(){
                var result_sum = $("#nowQty").val(); 
                $("#nowQty").val((parseInt(result_sum)+1));
                var add_count = $("#nowQty").val((parseInt(result_sum)+1));
                 var sum = 0;
                 var basic = $("#sum_burger").data('basic');
                $("#sum_burger").text(basic);
            $(".optionList li .subCheckBox").each(function(idx, ele){
                  if(ele.checked){
                     var topping_result = $(this).data('name');
                     var arr =[];
                     arr.push(topping_result);
                     sum += parseInt(arr);
                     var basic = $("#sum_burger").data('basic');
                     $("#sum_burger").empty();
                     $("#sum_burger").text(add_count.val()*(sum+basic));
                  }
               });
            });
             $("#minus_btn").on("click",function(){
                var result2;
                var basic;
                   var result_sum = $("#nowQty").val();
                    if(result_sum>1){
                    $("#nowQty").val((parseInt(result_sum)-1));
                    var add_minus_count = $("#nowQty").val((parseInt(result_sum)-1));
                    var sum = 0;
             $(".optionList li .subCheckBox").each(function(idx, ele){
                  if(ele.checked){
                     var topping_result = $(this).data('name');
                     var arr =[];
                     arr.push(topping_result);
                     sum += parseInt(arr);
                     var sum2 = $("#sum_burger").text();
                     $("#sum_burger").empty();
                     $("#sum_burger").text(parseInt(sum2)-topping_result);
                     basic = $("#sum_burger").data('basic');
                     result2 = $("#sum_burger").text();
                  }
          });//end each
                       $("#sum_burger").text(result2-basic);
         }//end if
      });//end plus&minus btn
   });//end ready
</script>
			
	<script>
	
	
	function order(x,y,z){
		//var k = $(".addoption").text().replace(/[^\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F]/gi,",");
		//var toping = k.replace( /\,,,,,,,/gi , '/' ); 
		
		/* var k2 = $(".addoption em").text().replace(/[^\uAC00-\uD7AF\u1100-\u11FF\u3130-\u318F]/gi,",");
		var toping = k2.replace( /\,,,,,,,/gi , '/' ); 
		 */
		var k3 = $(".addoption .code").text();
		var k4 = $(".addoption .result").text();
		console.log(x,y,z,k3,k4)
		location.href = "order?count="+y+"&toping_price="+k4+"&price="+x+"&menu_code="+z+"&toping="+k3;
	}
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
			 	<form action="order" id="form">
			 	
				<c:forEach var="list" items="${pdtlist}">
				<div class="productInfoBox">
					<%-- <c:set var="list" value="${pdtlist2}" /> --%>
					<!--  111111${pdtlist2} <br /><br /><br /><br /> -->
			
					<%-- ${list} --%>
					<div class="detali_spot">
						<span>
							<img src="images/product/${list.menu_img}.jpg" alt="" />
						</span>
					</div>
					<div class="detali_cont">
							<div class="detail-cont-hd">
								<strong>${list.menu_name}</strong>
							</div>
	
							<div class="detail-cont-bd">
								<div class="detail-cont-bd_inner mb20">
									<p class="detail-subtit">${list.menu_content_1} </p>
									<div class="detail-item">
										<div class="detail-item__txt">
											${list.menu_content_2}	
										</div>
									</div>
								</div><!-- //detail-cont-bd -->
						
								<div class="detail-selected__item">
										
								</div>
								<div class="detail-price">
									
									<%-- <c:set var="xxx" value="${aaa}" scope="session" /> --%>
									<c:if test="${list.menu_category=='버거'}">
									
									<!-- 재료추가 -->
									<div class="toppingBox">
										<strong class="tit">재료추가</strong>
										<div class="option">
											<ul class="optionList">
			                                    <li>
			                                       <label>
			                                          <img src="images/lettuce.png" alt="상추" class="width100" style="width:93%" />
			                                          <span class="topping">양상추(+600)</span>
			                                       </label>
			                                       <div class="ui-checkbox">
			                                          <input type="checkbox" value="양상추(+600)"id="ipt_item1" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box" data-name=600 data-code="p3">
			                                          <label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
			                                       </div>
			                                    </li>
			                                    <li>
			                                       <label>
			                                          <img src="images/tomato.png" alt="토마토" class="width100" style="width:93%" />
			                                          <span class="topping">토마토(+600)</span>
			
			                                          <div class="ui-checkbox">
			                                             <input type="checkbox" value="토마토(+600)" id="ipt_item2" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box" data-name=600 data-code="p8">
			                                             <label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
			                                          </div>
			                                       </label>
			                                    </li>
			                                    <li>
			                                       <label>
			                                          <img src="images/egg.png" alt="에그" class="width100" style="width:93%" />
			                                          <span class="topping">계란(+600)</span>
			                                       </label>
			                                       <div class="ui-checkbox">
			                                          <input type="checkbox" id="ipt_item3" value="계란(+600)" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box" data-name=600  data-code="p6">
			                                          <label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
			                                       </div>
			                                    </li>
			                                    <li>
			                                       <label>
			                                          <img src="images/artisan_chicken.png" alt="치킨" class="width100" />
			                                          <span class="topping" >치킨(+600)</span>
			                                       </label>
			                                       <div class="ui-checkbox">
			                                          <input type="checkbox" value="치킨(+600)"id="ipt_item4" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box" data-name=600 data-code="p7">
			                                          <label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
			                                       </div>
			                                    </li>
			                                    <li>
			                                       <label>
			                                          <img src="images/patty.png" alt="패티" class="width100" />
			                                          <span class="topping">패티(+900)</span>
			                                       </label>
			                                       <div class="ui-checkbox">
			                                          <input type="checkbox" value="패티(+900)"id="ipt_item5" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box" data-name=900 data-code="p2">
			                                          <label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
			                                       </div>
			                                    </li>
			                                    <li>
			                                       <label>
			                                          <img src="images/bacon.png" alt="베이컨" class="width100" />
			                                          <span class="topping">베이컨(+600)</span>
			                                       </label>
			                                       <div class="ui-checkbox">
			                                          <input type="checkbox"value="베이컨(+600)" id="ipt_item6" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box" data-name=600 data-code="p1">
			                                          <label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
			                                       </div>
			                                    </li>
			                                    <li>
			                                       <label>
			                                          <img src="images/onion.png" alt="onion" class="width100" />
			                                          <span class="topping">양파(+600)</span>
			                                       </label>
			                                       <div class="ui-checkbox">
			                                          <input type="checkbox" value="양파(+600)"id="ipt_item7" name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box" data-name=600 data-code="p4">
			                                          <label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
			                                       </div>
			                                    </li>
			                                    <li>
			                                       <label>
			                                          <img src="images/cheese1.png" alt="cheese1" class="width100" />
			                                          <span class="topping">치즈(+600)</span>
			                                       </label>
			                                       <div class="ui-checkbox">
			                                          <input type="checkbox"  id="ipt_item8" value="치즈(+600)"name="ServiceTermsCheck" class="ui-checkbox-inp subCheckBox signup_check_box" data-name=600 data-code="p10">
			                                          <label class="ui-checkbox-label" for="ipt_item2"><span class="v-hidden">선택</span></label>
			                                       </div>
			                                    </li>
			                                    
			                                 </ul>
										</div>
									</div>
									<!-- //재료추가 -->
									</c:if>
									
									<div class="detail-price__tit">
										합계&nbsp;<span class="ui-price__red-lg sumPriceBox" id="sum_burger" data-basic=${list.menu_price}>
											${list.menu_price}
											
										</span>
										
										<!-- 재료 추가 란 -->
										
										<!-- //재료 추가 란 -->
									</div>
									<div class="detail-price__txt">
										<span class="ui-num-option ui-num-option__lg">
											<button type="button" class="ui-num-option__button ui-num-option__button__l minusBtn" data-menucd="1345427" data-price="2000"id="minus_btn" onfocus="blur();">-</button>
											<input type="text" class="ui-num-option__input" id="nowQty" value="1" readonly="true" />
											<button type="button" class="ui-num-option__button ui-num-option__button__r plusBtn" data-menucd="1345427" data-price="2000" id="plus_btn" onfocus="blur();">+</button>
										</span>
									</div>
								</div><!-- //detail-price -->
								
								<!-- 구매버튼 -->
								<div class="detail-button">
									<a href="javascript:void(0);" class="btn btn-lg btn-second menuBasketAdd">장바구니</a>
									<a href="javascript:order($('#sum_burger').text(),$('#nowQty').val(),'${list.menu_code}' );" class="btn btn-lg btn-third menuDirectPayment">바로주문</a>
								</div>
								<!-- //구매버튼 -->

								<div class="detail_tbl">
									<h3 class="detail_tbl-tit">영양정보 </h3>
									<div class="tbl_type__type2">
										<table>
										<colgroup>
											<col style="width:auto;">
											<col style="width:15.28%">
											<col style="width:14.28%">
											<col style="width:14.28%">
											<col style="width:14.28%">
											<col style="width:14.28%">
											<col style="width:14.28%">
										</colgroup>
										<tbody>
										<tr>
											<th>Serving<br>Size</th>
											<th>열량(kcal)</th>
											<th>당류(g)</th>
											<th>단백질(g)</th>
											<th>포화지방(g)</th>
											<th>나트륨(mg)</th>
											<th>콜레스테롤(mg)</th>
										</tr>
										<tr id="nutritionCal"><th>100 </th><th>149 </th><th>3</th><th>4</th><th>3</th><th>84</th><th>0</th></tr>
										</tbody>
										</table>
										<div class="detail_guide">* 딜리버리와 매장 제품의 영양정보는 구성에 따라 다를 수 있습니다.</div>
									</div>
									<div class="detail-desc">
										<dl class="detail-phrase"><dt></dt><dd></dd></dl><dl class="detail-phrase"><dt> </dt><dd></dd></dl>
									</div>
								</div><!-- //detail_tbl -->

							</div><!-- //detail-cont-bd -->
					</div>
				</div>
				
				</c:forEach>
				</form>
			

			
			
			</div> <!--// sectionBox-->

			

		</div>
	</section>
	<!-- //body -->














</body>
</html>
