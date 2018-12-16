/* *******************************************************
 * filename : nav.js
 * description : 네비게이션 및 사이드바 active 등 메뉴에 관련된 JS
 * date : 2017-05-30
******************************************************** */

var dep1;
var dep2;

jQuery(function($){
	$gnbList = $("#gnb > ul");
	$gnbDep = $(".gnb-2dep");

	// 오버하거나 포커스가 있을경우 활성화
	$gnbList.children("li").on("mouseenter click focusin",function(){
		//$(this).addClass("on");

		var carState = "open";
		var navPosition = $(this).children("a").position().left;
		var navWidth = $(this).children("a").outerWidth();/* bar 길이 li의 길이와 같게 */
		if ( $(this).index() == 0 ) {/* navPosition + 숫자  : 여기서 숫자는 이동 길이 (nav li의 넓이/2 길이에서 막대 길이/2를 더한 정도의 길이) */
			$(".nav-on-icon").children("span").show().stop().animate({left:navPosition-1,width:navWidth},400,"easeOutCubic");
		}else {
			$(".nav-on-icon").children("span").show().stop().animate({left:navPosition-1,width:navWidth},400,"easeOutCubic");
		}
	}).on("mouseleave click focusout", function(){
		//$(this).removeClass("on");
		$(".nav-on-icon").children("span").hide();
	});
	
	
	// SNB ON
	if ( dep1> 0 && dep2> 0 ) {
		$gnbList.children("li").eq(dep1-1).addClass("on").children(".gnb-2dep").children("li").eq(dep2-1).addClass("on");
		$(".snb").children("li").eq(dep2-1).addClass("on");
		// hover로 li 백그라운드 변경
		if ($gnbList.children("li").hasClass("on")) {
			$gnbList.children("li:not(.on)").on('mouseenter focusin',function  () {
				$gnbList.children("li").removeClass("on");
			}).on('mouseleave focusout',function  () {
				$gnbList.children("li").eq(dep1-1).addClass("on");
			})
		}
	}

	/* SNB 2DEPTH 오픈하기 */ 
	$(".snb > li:has('ul')").children("a").click(function(event){
		/* 2dep가 열려있을때 	*/	
		if ( $(this).parent("li").hasClass("active") ){ 
			$(this).parent("li").removeClass("active");
			$(this).siblings("ul").slideUp(400);					
		}
		/* 2dep가 닫혀있을때 */
		else{	  
			$(".snb > li").has("ul").each(function() {
				if ( $(this).hasClass("active") ){
					$(this).removeClass("active");
					$(this).children("ul").slideUp(400);
				}
			});	
			$(this).parent("li").addClass("active");
			$(this).siblings("ul").slideDown(400);
		}
		return false;
	});

	var menu_lang = $gnbList.children("li").eq(dep1-1).find("li").length;
	$(".sub-page-loc.page-prev > p a em").html($gnbList.children("li").eq(dep1-2).text().toUpperCase());
	$(".sub-page-loc.page-next > p a em").html($gnbList.children("li").eq(dep1).text().toUpperCase());
	$(".sub-page-loc.page-prev > p a").attr("href",$gnbList.children("li").eq(dep1-2).children("a").attr("href"));
	$(".sub-page-loc.page-next > p a").attr("href",$gnbList.children("li").eq(dep1).children("a").attr("href"));
	$(".sub-page-loc.page-prev > p a img").attr("src",'../images/layout/sub_loc'+dep1+'_1.png');
	$(".sub-page-loc.page-next > p a img").attr("src",'../images/layout/sub_loc'+dep1+'_2.png');

	if ( dep1 == 4 ) {
		$(".sub-page-loc.page-next > p a em").html('HOME').addClass("point");
		$(".sub-page-loc.page-next > p a").attr("href","/index.php");
	}else if ( dep1 == 1 ) {
		$(".sub-page-loc.page-prev > p a em").html('HOME').addClass("point");
		$(".sub-page-loc.page-prev > p a").attr("href","/index.php");
	}
});
