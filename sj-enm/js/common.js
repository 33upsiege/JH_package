/* *******************************************************
 * filename : common.js
 * description : 전체적으로 사용되는 JS
 * date : 2017-05-30
******************************************************** */


jQuery(function($){
	/*if ( $(".sidebar-list").length > 0 ) {
		$(window).scroll(function  () {
			var scroll_Top = $(window).scrollTop();
			var startTop = $("#infoContainer").offset().top - 70;

			if ( scroll_Top > startTop ) {
				$(".sidebar-box").addClass("fixed");
			}else {
				$(".sidebar-box").removeClass("fixed");
			}
		
		
			var menuCount=$(".sidebar-list li").size();
			var nav= new Array();
			for(var i=0;i<menuCount;i++){
				nav[i]="nav"+i;
				nav[i]=$($(".sidebar-list li").eq(i).find("a").attr("href")).offset().top - 70;
			}
			
			$(".sidebar-list li").each(function  (idx) {
				if( scroll_Top >= nav[idx] ){
					$('.sidebar-list li').removeClass('on');
					$('.sidebar-list li').eq(idx).addClass('on');
				};
			});
		});
		$(".sidebar-list li a").click(function  () {
			var goDiv = $($(this).attr("href")).offset().top - 65;
			$("html, body").animate({scrollTop:goDiv},300,"swing");

			return false;
		});
	}*/
	
	/* 채용공고 faq */
	function close_dd() {
		$('#faqList dt .subject').removeClass('active');
		$('#faqList dd').slideUp(300).removeClass('open');
	}
	$("#faqList dt .subject").on("click",function(){
		if ( $(this).is('.active') ) {
			close_dd();
		}else {
			close_dd();

			$(this).addClass("active");
			$(this).parent("dt").siblings("dd").slideDown(200).addClass("open");
		}
	});

	/* top 버튼 */
	var	top = {
		init : function(){
			this.actions();
		},
		actions : function(){
			var bntTop  = $(".topBtn");
			var winW,winH;
			var scrollCheck;
			
			$(".topBtn").hide();
			function topScroll(){
				if(  $(window).scrollTop() > 200  ){
					scrollCheck = true;
				} else if(  $(window).scrollTop() < 200 ) {
					scrollCheck = false;
				}
				scrollCheck == true ? bntTop.fadeIn() : bntTop.fadeOut();
			}
			
			function topPos(){
				winW 	= $(window).width();
				winH 	= $(window).height();
				if( winW >= 1200  ){
					bntTop.css({ right : parseInt(((winW-1200)/2)-200) })
				}else if (winW <= 768) {
					bntTop.addClass("ver2");
				}else {
					bntTop.css({ right : 0 })
				}
			}
			
			topPos();
			
			$(window).scroll(function(){
				topScroll();
			});
			
			$(window).resize(function(){
				topPos();
			});
			
			bntTop.find("a").on({
				"click" : function(e){
					$("html,body").stop().animate({ scrollTop : 0 } , 600, "easeOutQuint" );
					e.preventDefault();
				},
				"mouseenter , focusin" : function(){
					$(this).addClass("on");
				},
				"mouseleave , focusout" : function(){
					$(this).removeClass("on");
				}
			});
		}
	}

	top.init();
	$(".topBtn").on("click",function  () {	
		$("html, body").animate({scrollTop:0},600,"easeOutQuint");
		return false; 
	});
});
