

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=bf026618-2d62-45d5-98b1-668fa4f2a9cf"></script>

<script type="text/javascript">
 window.onload = function() {
    initTmap(127.197509,37.306194); //김포
    $("#map_div").css("display","none");
} 

var map, routeSearchLayer, styleMap, point_vector_layer;
var lon = 126.986072;
var lat = 37.570028;
var markerStartLayer=null ;
       
      
 
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
           // document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            //document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
                $(".storeWrapBox").css('display', 'block');
                
                
                
                
                
               ///initTmap(127.197509,36.506194); //김포
               
                
                
                // 2. API 사용요청
                var fullAddr = $('#sample4_roadAddress').val();
                $("#fullAddr2").text(fullAddr);
                
                $.ajax({
                   method:"GET",
                   url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", 
                   async:false,
                   data:{
                      "coordType" : "WGS84GEO",
                      "fullAddr" : fullAddr,
                      "page" : "1",
                      "count" : "20",
                      "appKey" : "bf026618-2d62-45d5-98b1-668fa4f2a9cf",
                   },
                   success:function(response){
                      //기존 마커 지우기
                      console.log("markerStartLayer>>" , markerStartLayer);
                      markerStartLayer.clearMarkers();
                      
                      var prtcl = response;
                      
                      // 3. 마커 찍기
                      var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String
                      console.log(prtclString);
                       xmlDoc = $.parseXML( prtclString ),
                       $xml = $( xmlDoc ),
                       $intRate = $xml.find("coordinate");
                      
                      //검색 결과 정보가 없을 때 처리
                        if($intRate.length==0){
                           //예외처리를 위한 파싱 데이터
                          $intError = $xml.find("error");
                           
                         // 주소가 올바르지 않을 경우 예외처리
                          if($intError.context.all[0].nodeName == "error"){
                             $("#result").text("요청 데이터가 올바르지 않습니다.");
                          }
                        }   
                       
                      if($intRate[0].getElementsByTagName("lon").length>0){//구주소
                         lon = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
                          lat = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
                      }else{//신주소
                         lon = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
                         lat = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
                      }
                      
                      
                       var size = new Tmap.Size(24, 38);
                      var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
                      var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png' />", size, offset);
                      var marker_s = new Tmap.Marker(new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857"), icon);
                      markerStartLayer.addMarker(marker_s);
                      
                      map.setCenter(new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857"), 15);
                      
                        //검색 결과 표출
                      var matchFlag, newMatchFlag;
                        //검색 결과 주소를 담을 변수
                        var address = '', newAddress = '';
                        var city, gu_gun, eup_myun, legalDong, adminDong, ri, bunji;
                        var buildingName, buildingDong, newRoadName, newBuildingIndex, newBuildingName, newBuildingDong;
                      //새주소일 때 검색 결과 표출
                      //새주소인 경우 matchFlag가 아닌 newMatchFlag가 응닶값으로 온다
                      if($intRate[0].getElementsByTagName("newMatchFlag").length>0){
                         // 새(도로명) 주소 좌표 매칭 구분 코드
                         newMatchFlag = $intRate[0].getElementsByTagName("newMatchFlag")[0].childNodes[0].nodeValue;
                         
                         // 시/도 명칭
                         if($intRate[0].getElementsByTagName("city_do").length>0){
                            city = $intRate[0].getElementsByTagName("city_do")[0].childNodes[0].nodeValue;
                            newAddress += city+"\n";
                         }
                         // 군/구 명칭
                         if($intRate[0].getElementsByTagName("gu_gun").length>0){
                            gu_gun = $intRate[0].getElementsByTagName("gu_gun")[0].childNodes[0].nodeValue;
                            newAddress += gu_gun+"\n";
                         }
                         // 읍면동 명칭
                         if($intRate[0].getElementsByTagName("eup_myun").length>0){
                            eup_myun = $intRate[0].getElementsByTagName("eup_myun")[0].childNodes[0].nodeValue;
                            newAddress += eup_myun+"\n";
                         }
                         // 출력 좌표에 해당하는 법정동 명칭
                         if($intRate[0].getElementsByTagName("legalDong").length>0){
                            legalDong = $intRate[0].getElementsByTagName("legalDong")[0].childNodes[0].nodeValue;
                            newAddress += legalDong+"\n";
                         }
                         // 출력 좌표에 해당하는 법정동 명칭
                         if($intRate[0].getElementsByTagName("adminDong").length>0){
                            adminDong = $intRate[0].getElementsByTagName("adminDong")[0].childNodes[0].nodeValue;
                            newAddress += adminDong+"\n";
                         }
                         // 출력 좌표에 해당하는 리 명칭
                         if($intRate[0].getElementsByTagName("ri").length>0){
                            ri = $intRate[0].getElementsByTagName("ri")[0].childNodes[0].nodeValue;
                            newAddress += ri+"\n";
                         }
                         // 출력 좌표에 해당하는 지번 명칭
                         if($intRate[0].getElementsByTagName("bunji").length>0){
                            bunji = $intRate[0].getElementsByTagName("bunji")[0].childNodes[0].nodeValue;
                            newAddress += bunji+"\n";
                         }
                         // 새(도로명) 주소 매칭을 한 경우, 길 이름을 반환
                         if($intRate[0].getElementsByTagName("newRoadName").length>0){
                            newRoadName = $intRate[0].getElementsByTagName("newRoadName")[0].childNodes[0].nodeValue;
                            newAddress += newRoadName+"\n";
                         }
                         // 새(도로명) 주소 매칭을 한 경우, 건물 번호를 반환
                         if($intRate[0].getElementsByTagName("newBuildingIndex").length>0){
                            newBuildingIndex = $intRate[0].getElementsByTagName("newBuildingIndex")[0].childNodes[0].nodeValue;
                            newAddress += newBuildingIndex+"\n";
                         }
                         // 새(도로명) 주소 건물명 매칭을 한 경우, 건물 이름을 반환
                         if($intRate[0].getElementsByTagName("newBuildingName").length>0){
                            newBuildingName = $intRate[0].getElementsByTagName("newBuildingName")[0].childNodes[0].nodeValue;
                            newAddress += newBuildingName+"\n";
                         }
                         // 새주소 건물을 매칭한 경우 새주소 건물 동을 반환
                         if($intRate[0].getElementsByTagName("newBuildingDong").length>0){
                            newBuildingDong = $intRate[0].getElementsByTagName("newBuildingDong")[0].childNodes[0].nodeValue;
                            newAddress += newBuildingDong+"\n";
                         }
                         
                         // 검색 결과 표출
                         var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
                         //$("#result").html("검색결과(새주소) : "+newAddress+","+"\n"+"응답코드:"+newMatchFlag+"(상세 코드 내역은 "+docs+"에서 확인)");
                      }
                      
                      
                      //구주소일 때 검색 결과 표출
                      //구주소인 경우 newMatchFlag가 아닌 MatchFlag가 응닶값으로 온다
                      if($intRate[0].getElementsByTagName("matchFlag").length>0){
                         // 매칭 구분 코드
                         matchFlag = $intRate[0].getElementsByTagName("matchFlag")[0].childNodes[0].nodeValue;
                         
                         // 시/도 명칭
                         if($intRate[0].getElementsByTagName("city_do").length>0){
                            city = $intRate[0].getElementsByTagName("city_do")[0].childNodes[0].nodeValue;
                            address += city+"\n";
                         }
                         // 군/구 명칭
                         if($intRate[0].getElementsByTagName("gu_gun").length>0){
                            gu_gun = $intRate[0].getElementsByTagName("gu_gun")[0].childNodes[0].nodeValue;
                            address += gu_gun+"\n";
                         }
                         // 읍면동 명칭
                         if($intRate[0].getElementsByTagName("eup_myun").length>0){
                            eup_myun = $intRate[0].getElementsByTagName("eup_myun")[0].childNodes[0].nodeValue;
                            address += eup_myun+"\n";
                         }
                         // 출력 좌표에 해당하는 법정동 명칭
                         if($intRate[0].getElementsByTagName("legalDong").length>0){
                            legalDong = $intRate[0].getElementsByTagName("legalDong")[0].childNodes[0].nodeValue;
                            address += legalDong+"\n";
                         }
                         // 출력 좌표에 해당하는 법정동 명칭
                         if($intRate[0].getElementsByTagName("adminDong").length>0){
                            adminDong = $intRate[0].getElementsByTagName("adminDong")[0].childNodes[0].nodeValue;
                            address += adminDong+"\n";
                         }
                         // 출력 좌표에 해당하는 리 명칭
                         if($intRate[0].getElementsByTagName("ri").length>0){
                            ri = $intRate[0].getElementsByTagName("ri")[0].childNodes[0].nodeValue;
                            address += ri+"\n";
                         }
                         // 출력 좌표에 해당하는 지번 명칭
                         if($intRate[0].getElementsByTagName("bunji").length>0){
                            bunji = $intRate[0].getElementsByTagName("bunji")[0].childNodes[0].nodeValue;
                            address += bunji+"\n";
                         }
                         // 출력 좌표에 해당하는 지번 명칭
                         if($intRate[0].getElementsByTagName("buildingName").length>0){
                            buildingName = $intRate[0].getElementsByTagName("buildingName")[0].childNodes[0].nodeValue;
                            address += buildingName+"\n";
                         }
                         // 출력 좌표에 해당하는 지번 명칭
                         if($intRate[0].getElementsByTagName("buildingDong").length>0){
                            buildingDong = $intRate[0].getElementsByTagName("buildingDong")[0].childNodes[0].nodeValue;
                            address += buildingDong+"\n";
                         }
                         // 검색 결과 표출
                         var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
                         //$("#result").html("검색결과(지번주소) : "+address+","+"\n"+"응답코드:"+matchFlag+"(상세 코드 내역은 "+docs+"에서 확인)");
                         
                         
                      }

                   },
                   error:function(request,status,error){
                      console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                   }
                });//ajax

             		console.log(lon);
                      console.log(lat);
                      
                
                  $("#map_div").empty();
                //36.580899, 126.329477
                $("#map_div").css("display","block");
                initTmap(lon,lat); //안면도
                
                
                
            }//else
            	
        }
    }).open();
    
    
}
/*	테스트 원본
 	
 $(document).ready(function(){
	$(".btnPaymentCall").click(function(){
		$("#confirmform").submit();
	});
}); */


//serialize to json
$.fn.serializeObject = function()
{
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};


$(document).ready(function(){
	$(".btnPaymentCall").click(function(){
		if($("#ipt_item23").is(":checked") == true){
			var forms = $("#confirmform").serializeObject();
			console.log(forms); 
			payment();
		}
		else{
			$("#confirmform").submit();			
		}
		
		
	});
});



function initTmap(x,y){
    // 1. 지도 띄우기
   map = new Tmap.Map({
      div : 'map_div',
      width : "752px",
      height : "400px",
   });
   map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);
   var tData = new Tmap.TData(); //REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.
   markerStartLayer = new Tmap.Layer.Markers("marker");//마커 레이어 생성
   
   
   //location.reload();
   var e_lonLat = new Tmap.LonLat(x,y); //김포 시작 좌표입니다.
   var s_lonLat = new Tmap.LonLat(127.028228, 37.498962); //도착 서울 좌표입니다.
   
   var optionObj = {
      reqCoordType:"WGS84GEO", //요청 좌표계 옵셥 설정입니다.
      resCoordType:"EPSG3857", //응답 좌표계 옵션 설정입니다.
      trafficInfo:"Y" //교통정보 표출 옵션 설정입니다.
    }
   
   
   
   tData.getRoutePlan(s_lonLat, e_lonLat, optionObj);//경로 탐색 데이터를 콜백 함수를 통해 XML로 리턴합니다.
   
   tData.events.register("onComplete", tData, onComplete);//데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트를 등록합니다.
   tData.events.register("onProgress", tData, onProgress);//데이터 로드중에 발생하는 이벤트를 등록합니다.
   tData.events.register("onError", tData, onError);//데이터 로드가 실패했을 떄 발생하는 이벤트를 등록합니다.
   
   map.addLayer(markerStartLayer);//map에 마커 레이어 추가
   
   //데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트 함수 입니다. 
   function onComplete(){        
      //교통정보 표출시 생성되는 LineColor 입니다.      
      console.log("onComplete");

      var trafficColors = {
         extractStyles:true,
      };    
      var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(this.responseXML);
      var vectorLayer = new Tmap.Layer.Vector("vectorLayerID");
      vectorLayer.addFeatures(kmlForm);    
      
      map.addLayer(vectorLayer);
      //경로 그리기 후 해당영역으로 줌  
      map.zoomToExtent(vectorLayer.getDataExtent());
   }
   //데이터 로드중 발생하는 이벤트 함수입니다.
   function onProgress(){
      //alert("onComplete");
      console.log("onProgress");
   }
   //데이터 로드시 에러가 발생시 발생하는 이벤트 함수입니다.
   function onError(){
      alert("onError");
      
   }
   // 맵 생성 실행
} //init tmap   

function payment(){
	var forms = $("#confirmform").serializeObject();
	var item_name = $(".payment-mn__tit").text();
	var quantity = '${count}';
	var total_amount = '${price}';
	
	var forms = $("#confirmform").serializeObject();
	var request = $.ajax({
		url : 'restTest',
		method : 'POST',
		data: JSON.stringify({itemName: item_name, quantity: quantity, totalAmount: total_amount
			, 'count':forms.count
			, 'menu_code':forms.menu_code
			, 'order':{'order_address':forms.order_address
						,'order_all_price':forms.order_all_price
						,'order_people':forms.order_people
						,'order_request':forms.order_request
						,'order_tel':forms.order_tel}
			, 'price':forms.price
			, 'toping':forms.toping
			, 'toping_price':forms.toping_price
			}), 
		contentType: "application/json"
		
	});

	request.done(function(data) {
		kakaopayUrl = data[0].next_redirect_pc_url;
		window.open(kakaopayUrl,"","width=550,height=500")
		
	});

	request.fail(function(jqXHR, textStatus) {
		console.log("Request failed: " + textStatus);
	});
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
					  DELIVERY
				</h2>
				<p class="txt_brd07" style="margin-top: 25px;">정직한 음식이 만드는 행복한 세상!  다양한 메뉴를 배달로 만나세요! </p>
			</div>
		
			<div class="sectionBox">
				<form action="addOrderConfirm" method="post" id="confirmform">
				<input type="hidden" value="${menu_code }" name="menu_code" />
				<input type="hidden" value="${toping }" name="toping" />
				<input type="hidden" value="${count }" name="count" />
				<input type="hidden" value="${price }" name="price" />
				<input type="hidden" value="${toping_price }" name="toping_price" />
				
				<input type="hidden" value="${member_name}" name="order_people" /> <!--  유저이름 세션에서 받아와서 넘기기!!!!!!!!!  -->
				<div class="productInfoBox">

					<div class="payment-hd">
						<div class="main-tit-area">
							<p class="main-tit-sub">햄버거를 편리한 딜리버리 서비스로 즐겨보세요.</p>
							<h2 class="main-tit-htit">결제하기</h2>
						</div>
					</div> <!-- //payment-hd -->
					
					
					<div class="payment-bd mb50">
						<div class="payment-mn">
							<div class="payment-mn-hd js-payment-toggle-hd">
								<h3 class="payment-mn__htit">결제 예정 메뉴</h3>
							</div>
							
							<c:forEach var="list" items="${pdtlist}">
							<div class="payment-mn-bd js-payment-toggle-bd">
								<ul class="payment-mn-list orderMenuListBox">
									<li class="payMenu" data-menucd="2272820" data-price="18400" data-qtt="1">
										<h4 class="payment-mn__tit">${list.menu_name}</h4>
										<p class="payment-mn__img">
											<img src="images/product/${list.menu_img}.jpg" width="180" height="126" alt="NEW★블랙라벨폴인치즈버거팩">
										</p>
										<div class="payment-mn-grid">
											<p class="payment-mn__txt">${list.menu_content_1}</p>	
											<p class="payment-mn__txt">${list.menu_content_2}</p>	
											<%-- <p class="payment-mn__txt">${toping}</p> --%>
											<p class="payment-mn__price">
												<span class="ui-price__red-sm">${price}</span>
											</p>
											<p class="payment-mn__option">
												<span class="ui-num-option">		
												<input type="text" id="" class="ui-num-option__input" readonly="" value="수량 : ${count} 개"   style="border:0;width:300px;text-align:left" />	
												</span>
											</p>	
											
										</div> <!-- //payment-mn-grid -->
									</li>
									<li class="payment-mn__foot-group">	
										<span class="payment-mn__foot1">담긴 상품 
											<span class="ui-num sumMenuCnt">${count }</span>개</span>
											<span class="payment-mn__foot2">합계
											<span class="ui-price__blk-lg sumPrice" data-sumprice="18400">${price }</span>
										</span>
									</li>
								</ul><!-- //payment-mn-list -->
							</div><!-- //payment-mn-bd -->
							</c:forEach>
							
						</div><!-- //payment-mn -->
					</div> <!-- //payment-bd -->

					<div class="order-hd">
					</div> <!-- //order-hd -->

					<div class="order-bd mb50">
						
						<input type="hidden" value="${price }" name="order_all_price" />
						
						<div class="payment-mn-hd js-payment-toggle-hd">
							<h3 class="payment-mn__htit">배송지 정보</h3>
						</div>
						<div class="payment-mn-bd js-payment-toggle-bd">
							<ul class="payment-mn-list orderMenuListBox">
								<li class="payMenu" >
									<p class="order_address">
										<span class="pdtLeft">
											배달 받을 주소
										</span>
										<span class="pdtRight">
											<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="order_address" class="input_type1 mt10 ui-input-ty2"  style="width:49%" />
											<input type="text" placeholder="나머지 주소" class="ui-input-ty2" style="width:30%"  />
											<span id="guide" style="color:#999"></span>
											
											<!-- 
											<span class="hidden">주소</span>
											<input type="text" id="sample4_postcode" placeholder="우편번호" name="post"class="input_type1 sm "  />
											<a href="javascript:void(0);" onclick="sample4_execDaumPostcode()" class="v_middle btn_l btn_type1">
												<span>주소찾기</span>
											</a><br>
											<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr1"class="input_type1 mt10"  />
											<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="addr2"class="input_type1 mt10"  />
											<span id="guide" style="color:#999"></span>
											 -->
											
											<a href="javascript:void(0);" onclick="sample4_execDaumPostcode()" class="btn btnNext" id="signUp_next_Btn">주소찾기</a>
										</span>
									</p>
									<p class="order_address">
										<span class="pdtLeft">
											휴대폰
										</span>
										<span class="pdtRight">
											<input type="text" class="ui-input-ty2" name="order_tel" style="width:80%"  />
										</span>
									</p>
									
									<p class="order_info_txt mb20">
										<textarea name="order_request" cols="30" rows="5" class="payment-info__txtarea" id="payment_text" placeholder="요청사항 입력 예) 집 앞에서 전화주세요." style="margin: 10px 0px 0px; width: 82%; height: 80px;"></textarea>
									</p>
									
									<p class="order_info_txt order_address">
										<span class="pdtLeft" style="color:#b92432;font-weight:bold">
											배달매장
										</span>
										<span class="col-red storeWrapBox pdtRight" style="display:none;color:#b92432;font-weight:bold"">강남점· 예상 소요시간 <span class="store_time">30-40분</span></span> 
									</p>
									<!-- <input type="text" class="text_custom" id="fullAddr" name="fullAddr" value="서울 송파구 탄천동로 36 (잠실동)">
									 <a class="btn_select" id="btn_select" name="btn_select">
									            <span class="map_ico">적용하기</span>
									         </a> -->
									<div id="map_div">
									</div>   
									
									<p id="result"></p>


								</li>
							</ul><!-- //payment-mn-list -->
						</div><!-- //payment-mn-bd -->
						
					</div> <!-- //order-bd -->

					<div class="order-bd">
						<div class="payment-mn-hd js-payment-toggle-hd">
							<h3 class="payment-mn__htit">결제 수단</h3>
						</div>
						<div class="payment-mn-bd js-payment-toggle-bd">
								<div class="payment-info-bd gbnBox">
									<ul class="box">
										<li class="directPayMent">
											<p class="payment-info__tit">바로결제</p>
											<ul>
												<li>
													<ul class="lst-type__horizon">
														<li>
															<div class="payment-info__item">
																<div class="ui-checkbox-ty3">
																	<input type="radio" id="payment" name="cashGb" class="ui-checkbox-inp" value="CN">
																	<span class="ui-checkbox-label ui-checkbox-label__ty2"><span class="v-hidden">선택</span></span>
																</div>
															</div>
															<p class="payment-info__item2"><label for="payment">카드결제</label></p>
														</li>
														<li>
															<div class="payment-info__item">
																<div class="ui-checkbox-ty3">
																	<input type="radio" id="ipt_item23" name="cashGb" class="ui-checkbox-inp" value="MC">
																	<span class="ui-checkbox-label ui-checkbox-label__ty2"><span class="v-hidden">선택</span></span>
																</div>
															</div>
															<p class="payment-info__item2"><label for="ipt_item23" >카카오페이결제</label><img src="resources/images/ico_kakaopay.gif"/></p>
														</li>
													</ul>
												</li>
												<li></li>
											</ul>
										</li>
										<li class="storePayment">
											<p class="payment-info__tit">후불결제</p>
											<ul class="lst-type__horizon">
												<li>
													<div class="payment-info__item">
														<div class="ui-checkbox-ty3">
															<input type="radio" id="ipt_item14" name="cashGb" class="ui-checkbox-inp" value="OC">
															<span class="ui-checkbox-label ui-checkbox-label__ty2"><span class="v-hidden">선택</span></span>
														</div>
													</div>
													<p class="payment-info__item2"><label for="ipt_item14">카드결제</label></p>
												</li>
												<li>
													<div class="payment-info__item">
														<div class="ui-checkbox-ty3">
															<input type="radio" id="ipt_item55" name="cashGb" class="ui-checkbox-inp" value="CS">
															<span class="ui-checkbox-label ui-checkbox-label__ty2"><span class="v-hidden">선택</span></span>
														</div>
													</div>
													<p class="payment-info__item2"><label for="ipt_item55">현금결제</label></p>
												</li>
											</ul>
										</li>
									</ul>
								</div> <!-- //payment-info-bd -->

							</div><!-- //payment-mn-bd -->
					</div> <!-- //order-bd -->
					
					<div class="sign-button">
						<a href="javascript:void(0)" class="btn btn-lg btn-second ">취소</a>
						<a href="javascript:void(0)" class="btn btn-lg btn-third btnPaymentCall">결제하기</a>
						
					</div>
					
				</form>
				</div> <!-- //productInfoBox -->


			
			
			</div> <!--// sectionBox-->
		</div>
	</section>
	<!-- //body -->



</body>
</html>
