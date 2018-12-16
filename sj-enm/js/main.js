/* *******************************************************
 * filename : main.js
 * description : 메인에만 사용되는 JS
 * date : 2017-05-30
******************************************************** */


jQuery(function($){
	/* 메인 비주얼 */
	$("#mainVisual .visual-img").css("width",100 * $("#mainVisual .visual-img li").size() + "%");
	$("#mainVisual .visual-img li").css("width",100 / $("#mainVisual .visual-img li").size() + "%");
	var visualNum = "0";
	$("#mainVisual .visual-img li").hide();

	function visualTime(){
		if(visualNum < ($("#mainVisual .visual-img li").length - 1)){
			visualNum++;
		}else{
			visualNum = 0;
		}
		visualPlay();
	}
	function visualPlay(){
		/*$("#mainVisual .visual-btn").each(function(id){
				if(id == visualNum){
					$(this).addClass("on");
				}else{
					$(this).removeClass("on");
				}
		});*/
		
		$("#mainVisual .visual-img").children("li").fadeOut(500,function  () {
			$(this).children(".visual-bac-cover").removeClass("on");
			$(".visual-img-thum").removeClass("active");
		});
		$("#mainVisual .visual-img").children("li").eq(visualNum).fadeIn(700,function  () {
			$(this).children(".visual-bac-cover").addClass("on");
			$(".visual-img-thum").removeClass("active");
			$(this).children(".visual-img-thum").addClass("active");
			$("#mainVisual .visual-btn.prev span").addClass("on"+visualNum);
			$("#mainVisual .visual-btn.next span").addClass("on"+visualNum);
		});
		if (visualNum == 1) {
			$("#mainVisual .visual-btn.prev span").removeClass("on0");
			$("#mainVisual .visual-btn.next span").removeClass("on0 on1 on2");
		}else if (visualNum == 2) {
			$("#mainVisual .visual-btn.prev span").removeClass("on0 on1");
			$("#mainVisual .visual-btn.next span").removeClass("on0 on1 on2");
		}else if (visualNum == 0) {
			$("#mainVisual .visual-btn.prev span").removeClass("on1 on2");
			$("#mainVisual .visual-btn.next span").removeClass("on0 on1 on2");
		}
		$(".visual-bx li").fadeOut(300).removeClass("active");
		$(".visual-bx li").eq(visualNum).fadeIn(500).addClass("active");		
		$("#mainVisual .visual-btn.prev span").addClass("on").children("#prevImg").attr('src','../images/main/btn_img'+visualNum+'_1.png');
		$("#mainVisual .visual-btn.next span").addClass("on").children("#nextImg").attr('src','../images/main/btn_img'+visualNum+'_2.png');
	};

	visualPlay();
	var visual_timer = setInterval(visualTime,4500);

	$("#mainVisual .visual-btn.prev span").on({
		click:function(){
			clearInterval(visual_timer);
			if(visualNum > 0){
				visualNum--;
				$(this).removeClass("on0 on1 on2");
			}else{
				visualNum = $("#mainVisual .visual-img li").length - 1;
			}
			visualPlay();
			visual_timer = setInterval(visualTime,5000);
			return false;
		}
	});

	$("#mainVisual .visual-btn.next span").on({
		click:function(){
			clearInterval(visual_timer);
			if(visualNum < ($("#mainVisual .visual-img li").length - 1)){
				visualNum++;
			}else{
				visualNum = 0;
			}
			visualPlay();
			visual_timer = setInterval(visualTime,5000);
			return false;
		}
	});

	// 1920 해상도 이상 비주얼 변경
	var w_width = $(window).width();

	if (w_width >= 1930) {
		//alert('1920x1080 해상도에 최적화된 화면입니다');
	}else {
		
	}

	$(".visual-bac-cover").each(function  () {
		if (w_width >= 1920) {
			$(this).children("span").children("img").css("display","none");
		}else {
			$(this).children("span").children("img").css("display","block");
		}
	});
	
	$(window).resize(function  () {
		var w_width = $(window).width();

		$(".visual-bac-cover").each(function  () {
			if (w_width >= 1920) {
				$(this).children("span").children("img").css("display","none");
			}else {
				$(this).children("span").children("img").css("display","block");
			}
		});

		if (w_width >= 1920) {
			alert('1920x1080 해상도에 최적화된 화면입니다');
		}else {
			
		}
	});
	
	
});