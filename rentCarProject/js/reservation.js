$(function() {
	
	
	changCss();
	
	
	var rentDate = null;
	var returnDate = null;
	
    $( "#resStartDate" ).datepicker({ 
    	showOn:"both",
		buttonImage: "images/icon/a.jpg",
		buttonImageOnly: true,
		changeMonth: true,
		changeYear: true,
		nextText: '다음달',
		prevText: '이전달',
		minDate: 0,
        maxDate: '+3M',
        dateFormat:"yy-mm-dd",
        onSelect: function(date) {
        	rentDate = date;
        	var rentDate2 = new Date(rentDate);
        	var returnDate2 = new Date(returnDate);
        	if(returnDate == null){
        		$("#rentDate").text(date);
        	}else if(returnDate2 <= rentDate2){
        		alert("대여일시가 반납일시 보다 늦을 수 없습니다.");
        		$("#resStartDate").val("");
        		$("#resStartDate").focus();
        	}else if(returnDate2 >= rentDate2){
        		$("#rentDate").text(date);
        	}    
         }
    });
    
    $( "#resEndDate" ).datepicker({
    	showOn:"both",
		buttonImage: "images/icon/a.jpg",
		buttonImageOnly: true,
		changeMonth: true,
		changeYear: true,
		nextText: '다음달',
		prevText: '이전달',
		minDate: 0,
        maxDate: '+3M',
        dateFormat:"yy-mm-dd",
        onSelect: function(date) {
        	returnDate = date;
        	var rentDate2 = new Date(rentDate);
        	var returnDate2 = new Date(returnDate);
        	if(rentDate == null){
        		alert("대여일시를 먼저 선택해야 합니다.")
        		$("#resEndDate").val("");
        		$("#resStartDate").focus();
        	}else if(returnDate2 >= rentDate2){
        		$("#returnDate").text(date);
        	}else if(returnDate2 <= rentDate2){
        		alert("대여일시가 반납일시 보다 늦을 수 없습니다.");
        		$("#resEndDate").focus();
        	}
         }
    });
    
    
    $("#store").on("change",function(){
    	if($("#store option:selected").val()==""){
    		$(".shop").text("");
    	}else{
    		$("#shop").text($("#store option:selected").text());
    		$("#return_shop").text($("#store option:selected").text());
    	}
    	
    });
    
    $("#nextCar_btn").off('click').on("click", function(event){
    	if($("#resStartDate").val()==""){
    		alert("대여일시를 입력하세요.");
    		$("#resStartDate").focus();
    		event.preventDefault();
    	}else if($("#resEndDate").val()==""){
    		alert("반납일시를 입력하세요.");
    		$("#resEndDate").focus();
    		event.preventDefault();
    	}else if($(".shop").text()==""){
    		alert("지점을 선택해 주세요.");
    		$("#store").focus();
    		event.preventDefault();
    	}else{
    		$("#select_date").on("submit",function(event){
	   		 	this.action="RentCar";
	   		 	this.method="get";
	  	     });	
    	}
    });
    
    
    $(".carType").on("submit",function(){
    	var carType = $(".carType").val();
    	this.action="RentCar";
   		this.method="get";	
    });
    
    $(".carSelect").off().on("click", function(){
		var carInfo = $("input[type=radio][name=carSelect]:checked").val();
    	$("#carName").text(carInfo.split("/")[0]);
    	var carPrice = carInfo.split("/")[2];
    	
    	var rentdate = $("#rentdate").val();
    	var returndate = $("#returndate").val();
    	
    	var totalday = calcTotalday(rentdate,returndate);
    	
    	var price = carPrice * totalday;
    	var price_commna = addComma(price);
    	$("#price").val(price_commna);
    	$("#price_param").val(price_commna);
    	$("#discount_price").val(price_commna);
    	$("#discount_param").val(price_commna);
    });
    
    $("#preDate_btn").off().on("click", function(){
    	window.history.back();
    	return false;
    });
    
    
    
    
    $("#nextOpt_btn").off().on("click", function(){
    	if($("#carName").text()==""){
    		alert("대여하실 차를 선택해주세요.");
    		event.preventDefault();
    	}else{
    		$("#car_form").attr("action","RentOption");
    	}
    });
    
    $("#preCar_btn").on("click", function(){
    	window.history.back();
    	return false;
    });
    
    $("#nextQua_btn").on("click", function(){
    	$("#option_form").attr("action","RentAgreement");
    });
    
    
    $(".cupon_select").off().on("change",function(event){
    	var promotion = $(".cupon_select option:selected");
    	$("#promotion").val(promotion.text());
    	var promotion_val = promotion.val();
    	var price = $("#price").val();
    	if(promotion_val == ""){
    		$("#price").css('color','white');
    		$("#price").css('text-decoration','none');
    		$("#price").val(price);
    		$("#discount_price").val(price);    	
    		$("#promotion").val("");
    	}else{
    		$("#price").css('text-decoration','line-through');
    		$("#price").css('text-decoration-color',' #ea0000');
    		var promotion_price = price.replace(/,/,"") * promotion_val;
    		var promotion_price_comma = addComma(promotion_price);
    		$("#discount_price").val(promotion_price_comma);    	
    	}	
    });
    
    $(".insurance_select").off().on("change",function(event){
    	var insurance = $(".insurance_select option:selected");
    	
    	var rentdate = $("#rentdate").val();
    	var returndate = $("#returndate").val();
    	var totalday = calcTotalday(rentdate,returndate);
    	
    	var price = $("#param_price").val();
    	
    	if(insurance.val() == ""){
    		$("#price").val(price);
    		if($(".cupon_select option:selected").val()==""){
    			$("#discount_price").val(price); 
    			$("#insurance").val("");
    		}else{
    			var promotion_val = $(".cupon_select option:selected").val()
    			var reprice = price.replace(/,/gi,"")*promotion_val;
    			var reprice_comma = addComma(reprice);
    			$("#discount_price").val(reprice_comma); 
    		}	
    	}else{
    		$("#insurance").val(insurance.text());
    		
    		var insurance_val = insurance.val() * totalday;
    		var insurance_price = parseInt(price.replace(/,/gi,"")) + parseInt(insurance_val);
    		var promotion_val = $(".cupon_select option:selected").val();
    		var insurance_price_comma = addComma(insurance_price);
    		$("#price").val(insurance_price_comma);
    		if(promotion_val==""){
    			promotion_val = 1;
    		}
    		var promotion_price = insurance_price * promotion_val;
    		var promotion_price_comma = addComma(promotion_price);
    		$("#discount_price").val(promotion_price_comma); 
    	}
    	
    	
    	 	
   
    });
    
    $(".option_checkbox").off().on("click",function(){
		var result = "";
		if($(".option_checkbox").is(":checked")){
			$("input[type='checkbox'].option_checkbox:checked").each(function(index,data){
				result += data.value + " ";
				$("#car_option").val(result);
			});
		}else{
			if($("input[type='checkbox'].option_checkbox:checked").length == 0){
				$("#car_option").val("");
			}
		}
		
    });
    
   

    function calcTotalday(first,last){
    	var dRent = Date.parse(first);
    	var dReturn = Date.parse(last);

    	var diff = dReturn - dRent;
    	var day = 24 * 60 * 60 * 1000; // 시간 * 분 * 초 * 밀리세컨
    	var totalday = (diff/day)+1;
    	
    	return totalday;
    }
    
    
   $("#qua_radio").on("click", function(){
	  $("#orderBtn").removeAttr('disabled');
	  $("#orderBtn").css('background-color','darkorange');
   });
    
   $("#cancelBtn").off().on("click", function(){
	  alert("모든 예약이 초기화 됩니다.메인화면으로 이동합니다.");
	  location.href="index.jsp"
   });
   
   
   $(".rent_shop").off().on("click",function(){
	   var shopid = $("#shopid").val();
	   if(shopid==""){
		   shopid= $("#store option:selected").val();
	   }
	   window.open("RentShopInfo?shopid="+shopid, "지점정보", 'width=440, height=590, scrollbars=no, resizable=no, toolbars=no, menubar=no');   
	   
	    
   });
   
   $(".closeBtn").off().on("click",function(){
	   window.self.close();
   });
   
   function changCss(){
	   if($("#price").val() != $("#discount_price").val()){
   		   $("#price").css('text-decoration','line-through');
   		   $("#price").css('text-decoration-color',' #ea0000');
	   }
   }
   
   // 숫자에 천단위로 콤마 찍기 
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	

});