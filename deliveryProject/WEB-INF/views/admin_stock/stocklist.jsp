<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#all_product_check").on("click",function(){
		if($("#all_product_check").prop("checked")) {
			$(".product_check").prop("checked",true);
			} else { 
			$(".product_check").prop("checked",false); 
			}
	});
	
	$(".product_delete").on("click",function(){
		
		$(".product_check").each(function(idx,ele){

			var code;
			code = ele.value;
			
			if($("#product_check"+code).prop("checked")){
				$.ajax({
					url : 'stockdelete',
					type : "post",//get,post방식
					dataType : 'text',
					headers : {
						'Content-Type' : 'application/json'
					// 아래의 JSON 을 넘겨주기위해서는 이게 꼭 필요하다.
					},
					data : JSON.stringify({
						product_code : code
					}),
					success : function(data, status, xhr) {//성공시 실행 data=받아오는data
						console.log("Stock_Modify success");
					},
					error : function(xhr, status, error) {//실패시 실행
						console.log(error);
					}
				}); // end ajax
			}// end if
		})// end each
		location.reload();
	})
	
	
	//수정버튼 클릭시 class="find_check"(label 자식 클래스)에 id 속성 추가.
	$(".product_ma_button").on("click",function(){
		var id = $(this).attr('id');
		$(".list_product_minimum_amount").attr('id',id);
	
	});
	
	
	$(".product_ma_modify").on("click",function(){
		var code = $(".list_product_minimum_amount").attr('id').slice(5);
		var mamount = $(".list_product_minimum_amount").val();

		$.ajax({
			url : "stockMamountModify",
			type : "post",
			dataType : "text",
			headers : {
				'Content-Type' : 'application/json'
			},
			data : JSON.stringify({
				product_minimum_amount : mamount,
				product_code : code
			}),
			success : function(data,status,xhr){
				console.log("stockMamountModify success");
			},
			error : function(xhr,status,error){
				console.log(error);
			}
		})// end ajax
		
		location.reload();
	})
})

</script>
</head>
<body>
	<form>
		<table class="StockListTB">
			<tr>
				<th><input type="checkbox" name="all_product_check" id="all_product_check" value="재료명">재료명</th>
				<th>현재 수량</th>
				<th>필요 최소 수량</th>
				<th>입고된 날짜</th>
				<th>입고된 수량</th>
				<th>재료 원가</th>
			</tr>

			
			<c:forEach var="result" items="${Stocklist}" varStatus="status">
			<input type="hidden" name="num" value="${result.product_code}" class="product_code">
				<tr>
					<td><input type="checkbox" name="product_check" class="product_check" id="product_check${result.product_code}" value="${result.product_code}">${result.product_name}</td>
					<td id="product_amount">${result.product_amount}</td>
					<td id="product_m_amount">
					<div class="product_ma_wrap">
					<label id="test_${result.product_code}" for="product_ma_modal" class="product_ma_button">${result.product_minimum_amount} <p class="product_ma_comment">수량 클릭하여 수정 가능</p></label>
					</div>
					</td>
					<td>${result.product_enter_date}</td>
					<td>${result.product_e_amount}</td>
					<td><fmt:formatNumber value="${result.product_e_cost}" type="currency" /> <br>
					( 총액 : <fmt:formatNumber value="${result.product_amount * result.product_e_cost}" type="currency" /> ) </td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<div style="float: left;   margin: auto 0;">
		<input type="button" value="삭제" class="product_delete">
		<a href="../index" class="management_home_button">홈 가기 </a>
		</div>
	</form>

	<!-- 모달 윈도우창 -->
	<input type="checkbox" id="product_ma_modal" class="product_ma_hidden">
	<div class="product_ma_box_modal">
		<label for="product_ma_modal" class="product_ma_closer">x</label>
		<div class="product_ma_text">
			<form>
				<table class="StockInsert">
					<tr>
						<th>필요 최소 수량</th>
					</tr>
					<tr>
						<td><input type="text" class="list_product_minimum_amount"></td>
					</tr>
				</table>
				<br> <input type="button" value="수정" class="product_ma_modify">
			</form>
		</div>
	</div>

</body>
</html>