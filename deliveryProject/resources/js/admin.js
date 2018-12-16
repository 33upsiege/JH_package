$(document).ready(function(){
	
	$("#user_index").on("click",function(){
		location.href="../index";
	});
	
	$("#imgInp").change(function() {
		  readURL(this);
	});
	
	
	$("#searchMenu").on("change", function(){
		console.log("sss");
		$("form").attr("action","admin/menuList");
	});

	$(function(){
		/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
		$('#order_notice').on("click",function(e)
		{
			
			$(".curDate").html(new Date().format("yyyy년 MM월 dd일 a/p hh시 mm분 ss초"));
			$("#order_list").html("");
			
			$.ajax({
				//html , 서블릿 , jsp 다됨 제이슨 객체임
				url:'orderNotice',
				type:"get",
				dataType:'json',
				success:function(data,status,xhr){
					console.log(data); 
					$.each(data, function(idx, salesList){
					
						var dfPrice = addComma(data[idx].orderAllPrice);
						var orderCode = data[idx].orderCode;
						console.log(orderCode);
						var orderStatus = data[idx].orderStatus;
						console.log(orderStatus);
						var orderBtn = "<p class='notice_box_btn'><button  class='btn btn-success' onClick='buttonSelect("+JSON.stringify(data[idx].orderCode)+","+data[idx].orderStatus+")'>주문확인</button></p>";
						if(orderStatus=='1'){                                                                             
							orderStatus = '결제완료';                                                                         
							orderBtn = "<p class='notice_box_btn'><button class='btn btn-success' onClick='buttonSelect("+JSON.stringify(data[idx].orderCode)+","+data[idx].orderStatus+")'>주문확인</button></p>";
						}else if(orderStatus=='2'){                                                                       
							orderStatus = '주문확인';                                                                         
							orderBtn = "<p class='notice_box_btn'><button class='btn btn-primary' onClick='buttonSelect("+JSON.stringify(data[idx].orderCode)+","+data[idx].orderStatus+")'>배송</button></p>";
						}else if(orderStatus=='3'){
							orderStatus = '배송중';
							orderBtn = "";
						}else if(orderStatus=='4'){
							orderStatus = '배송완료';
							orderBtn = "";
						}else if(orderStatus=='5'){
							orderStatus = '주문취소';
							orderBtn = "<p class='notice_box_btn'><button class='btn btn-danger' onClick='buttonSelect("+JSON.stringify(data[idx].orderCode)+","+data[idx].orderStatus+")'>주문취소</button></p>";
						}else if(orderStatus=='6'){
							orderStatus = '주문취소완료';
							orderBtn = "";
						}
						
						var orderCount = data[idx].orderCount-1;
						var mesg ='';
						
						if(orderCount>0){
							mesg = "외 "+orderCount+"건";
						}
						
						$("#order_list").append("<li>" +
								"<hr>" +
								"<input type='hidden' value="+data[idx].orderCode+" id='order_code'>"+
								"<p class='notice_box_span'>"+"주문번호 : "+data[idx].orderCode+"</p>" +
								"<p class='notice_box_span'>"+"주문일시 : "+data[idx].salesPaymentDate+"</p>" +
								"<p class='notice_box_span'>"+"상품명 : "+data[idx].menuName+" "+mesg+"</p>" +
								"<p class='notice_box_span'>"+"가격 : "+dfPrice+" 원"+"</p>" +
								"<div id='"+data[idx].orderCode+"'>"+
								"<p class='notice_box_span'>"+"주문상태 : "+orderStatus+"</p>"+
								orderBtn +
								"</div>"+
								"</li>"
								
						);
						console.log(salesList);
					});
					
				},
				error:function(xhr,status,error){
					console.log(error);
				}
			});

			
			console.log("order_notice");
			
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.order_notice_box').width();
			var oHeight = $('.order_notice_box').height();

			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX + 10;
			var divTop = e.clientY + 5;

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
			if( divTop + oHeight > sHeight ) divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if( divLeft < 0 ) divLeft = 0;
			if( divTop < 0 ) divTop = 0;

			$('.order_notice_box').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
		});
	});
	
	
	
	$(function(){

		/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
		$('#stock_notice').off().on("click",function(e)
		{
			$(".curDate").html(new Date().format("yyyy년 MM월 dd일 a/p hh시 mm분 ss초"));
			$("#stock_list").html("");
			console.log("stock_notice");
			
			$.ajax({
				//html , 서블릿 , jsp 다됨 제이슨 객체임
				url:'stockNotice',
				type:"get",
				dataType:'json',
				success:function(data,status,xhr){
					
					if(data.length == 0){
						$("#stock_list").append(
								"<p class='notice_box_span' style='color:green;font-weight: bold;'>모든 재료가 완벽합니다.</p>" 
						);
					}else{
						$.each(data, function(idx, salesList){
							$("#stock_list").append(
									"<p class='notice_box_span'>"+data[idx].pName+"\t"+data[idx].pAmount+" 남았습니다. </p>" 
							);
						});
					}
					
				},
				error:function(xhr,status,error){
					console.log(error);
				}
			});

			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.stock_notice_box').width();
			var oHeight = $('.stock_notice_box').height();

			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX + 10;
			var divTop = e.clientY + 5;

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
			if( divTop + oHeight > sHeight ) divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if( divLeft < 0 ) divLeft = 0;
			if( divTop < 0 ) divTop = 0;

			$('.stock_notice_box').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
		});
	});
	
	   $(".delBtn").on("click",function(){
   		   var mCode = $(this).attr("data-delBtn");
   		   var del = $(this);
   		 $.ajax({
    		   url:'delMenu',
    		   type:"get",
    		   dataType:'text',
    		   data:{
    			   mCode:mCode
    		   },
    		   success:function(data,status,xhr){
    			   if(data=='success'){
    				   del.parents().filter("tr").remove();		   
    				   
    			   }//end if
    		   },
    		   error:function(xhr,status,error){
    			   console.log(error);
    		   }
   		 });
   	   });
});


function buttonSelect(orderCode,btnStatus){
	console.log(orderCode,btnStatus);
		$.ajax({
			url:'statusBtn',
			type:"post",
			contentType: "application/json",
			dataType:'json', 
			data:JSON.stringify({orderCode:orderCode , orderStatus:btnStatus}),
			success:function(data,status,xhr){		
				console.log(data);
				var orderCode = data.orderCode;
				var orderStatus = data.orderStatus;
				var orderBtn="";
				if(orderStatus=='1'){
					orderStatus = '주문확인';
					orderBtn = "<p class='notice_box_btn'><button class='btn btn-primary' onClick='buttonSelect("+JSON.stringify(data.orderCode)+","+data.orderStatus+")'>배송</button></p>";
				}else if(orderStatus=='2'){
					orderStatus = '배송중';
					orderBtn = "";
				}else if(orderStatus=='3'){
					orderStatus = '배송완료';
					orderBtn = "";
				}else if(orderStatus=='4'){
					orderStatus = '배송완료';
					orderBtn = "";
				}else if(orderStatus=='5'){
					orderStatus = '주문취소완료';
					orderBtn = "";
				}else if(orderStatus=='6'){
					orderStatus = '주문취소완료';
					orderBtn = "";
				}

					$("#"+data.orderCode+"").html("");
					$("#"+data.orderCode+"").append(
							"<p class='notice_box_span' id='order_status'>"+"주문상태 : "+orderStatus+"</p>"+
							orderBtn
					);
				
			},
			error:function(xhr,status,error){
				console.log(error);
			}
		});
}

function closeLayer( obj ) {
	$(obj).parent().parent().hide();
}

//숫자에 천단위로 콤마 찍기 
function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){
	var s = '', i = 0; 
	while (i++ < len) { s += this; 
	} 
	return s;
};
String.prototype.zf = function(len){
	return "0".string(len - this.length) + this;
};
Number.prototype.zf = function(len){
	return this.toString().zf(len);
};



function readURL(input) {

	  if (input.files && input.files[0]) {
	    var reader = new FileReader();

	    reader.onload = function(e) {
	      $('#blah').attr('src', e.target.result);
	    }

	    reader.readAsDataURL(input.files[0]);
	  }
}


	
