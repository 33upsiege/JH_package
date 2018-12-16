


$(document).ready(function(){

	
	$( "#start_date" ).datepicker({ 
		showOn:"both",
		buttonImage: "images/icon/a.jpg",
		buttonImageOnly: true,
		changeMonth: true,
		changeYear: true,
		nextText: '다음달',
		prevText: '이전달',
	    dateFormat:"yy-mm-dd",
	});
	
	$( "#end_date" ).datepicker({
		showOn:"both",
		buttonImage: "images/icon/a.jpg",
		buttonImageOnly: true,
		changeMonth: true,
		changeYear: true,
		nextText: '다음달',
		prevText: '이전달',
	    dateFormat:"yy-mm-dd",
	});
	
	 $("#check_btn").on("submit",function(){
	    	var start_date = $("#start_date").val();
	    	var end_date = $("#end_date").val();
	    	this.action="MyRentCheck";
	   		this.method="get";	
	 });
	 
	 
	 $("#all_check_btn").on("submit",function(){
	    	var start_date = "";
	    	var end_date = "";
	    	this.action="MyRentCheck";
	   		this.method="get";	
	 });
	 
	 
	 $( "#QAstart_date" ).datepicker({ 
			showOn:"both",
			buttonImage: "images/icon/a.jpg",
			buttonImageOnly: true,
			changeMonth: true,
			changeYear: true,
			nextText: '다음달',
			prevText: '이전달',
		    dateFormat:"yy-mm-dd",
		});
		
		$( "#QAend_date" ).datepicker({
			showOn:"both",
			buttonImage: "images/icon/a.jpg",
			buttonImageOnly: true,
			changeMonth: true,
			changeYear: true,
			nextText: '다음달',
			prevText: '이전달',
		    dateFormat:"yy-mm-dd",
		});
		
		 
		 $("#check_btnQA").on("submit",function(){
		    	var start_dateQA = $("#start_dateQA").val();
		    	var end_dateQA = $("#end_dateQA").val();
		    	this.action="MyRentCheck";
		   		this.method="get";	
		 });
		 
		 
		 $("#all_check_btnQA").on("submit",function(){
		    	var start_dateQA = "";
		    	var end_dateQA = "";
		    	this.action="MyRentCheck";
		   		this.method="get";	
		 });
		 
		//email
		$("#choose_email").on("change", function() {
			var mail = $(this).val();
			if (mail == "choose_phone") {
				$("input[name='']").val('');
			} else {
				$("input[name='email']").val(mail); 
			}
		});	
		//email 한글방지
		$(".email_box").on("keyup",function(){
			if($(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''))){
			};	
		});
		//생일달력
			$(".birth").datepicker({
				dateFormat: "yy-mm-dd",
				maxDate: 0,
				 yearRange:"c-100:c+0",
				changeMonth: true,
			     changeYear: true
			});
		//비밀번호 확인
			$("#pw_check").on("keyup",function(){
	    		var pw_check = $("#pw_check").val().length;
	    		var pw_check2 = $("#pw_check_again").val().length;
	    		var pw_mesg2 = "한번 더 입력 해주세요";
	    		var empty = '';
	    		if(pw_check != 0){
	    			$("#pw_result1").text(pw_mesg2);
	    		}else if(pw_check ==0){
	    			$("#pw_result1").text("비밀번호를 입력해 주세요");
	    		} 
	    	});
			$("#pw_check_again").on("keyup",function(){
	    		var pw_check = $("#pw_check").val();
	    		var pw_mesg =  "비밀번호가 일치하지 않습니다";
	    		var pw_mesg2 = "비밀번호 일치";
	    		if(pw_check == $(this).val()){
	    			$("#pw_result2").text(pw_mesg2);
	    			$("#pw_result1").text('');
	    		}else{
	    			$("#pw_result2").text(pw_mesg);
	    	}
	    	});
			//전화번호 한글방지
			$(".phone2").on("keyup",function(){
				if($(this).val($(this).val().replace(/[^0-9]/g,""))){
				};	
			});
			$(".phone3").on("keyup",function(){
				if($(this).val($(this).val().replace(/[^0-9]/g,""))){
				};	
			});
			
			$("#mypage_update").off('click').on("click", function(){
				if($("#pw_check").val() ==""){
					alert("비밀번호는 필수 입니다.");
					event.preventDefault();
				}else if($("#pw_check_again").val()==""){
					alert("비밀번호를 체크해주세요.");
					event.preventDefault();
				}else if($("#phone2").val()==""){
					alert("전화번호는 필수 입니다.");
					event.preventDefault();
				}else if($("#phone3").val()==""){
					alert("전화번호는 필수 입니다.");
					event.preventDefault();
				}else if($("#licensenum").val()==""){
					alert("면허 번호는 필수 입니다.");
					event.preventDefault();
				}else if($("#driver_licence").val()==""){
					alert("면허 종류는 필수 입니다.");
					event.preventDefault();
				}else if($("#email1").val()==""){
					alert("이메일은 필수 입니다.");
					event.preventDefault();
				}else if($("#email2").val()==""){
					alert("이메일은 필수 입니다.");
					event.preventDefault();
				}else if($("#post").val()!=""||$("#addr1").val()!=""||$("#addr2").val()!=""){
					if($("#post").val()==""){
						alert("나머지 주소를 입력해주세요.");
						event.preventDefault();
					}else if($("#addr1").val()==""){
						alert("나머지 주소를 입력해주세요.");
						event.preventDefault();
					}else if($("#addr2").val()==""){
						alert("나머지 주소를 입력해주세요.");
						event.preventDefault();
					}
				}else {
					$("#myinfo_update_form").on("submit",function(event){
			   		 	this.action="MyInfoUpdate";
			   		 	this.method="get";
			  	     });
		    	}
			});
			
	
 
});