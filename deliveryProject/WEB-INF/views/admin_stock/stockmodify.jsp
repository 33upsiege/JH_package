<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <script type="text/javascript" src="js/jquery-3.3.1.js"></script> -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		// 수정 버튼 이벤트
		$(".Update").on("click", function() {
			var code = $(this).attr("data-seq");
			var amount = $("#Stock_stock" + code).val();

			$.ajax({
				url : 'stockmodify',
				type : "post",//get,post방식
				dataType : 'text',
				headers : {
					'Content-Type' : 'application/json'
				// 아래의 JSON 을 넘겨주기위해서는 이게 꼭 필요하다.
				},
				data : JSON.stringify({
					product_code : code,
					product_amount : amount
				}),
				success : function(data, status, xhr) {//성공시 실행 data=받아오는data
					console.log("Update success");
				},
				error : function(xhr, status, error) {//실패시 실행
					console.log(error);
				}
			});// end ajax
			location.reload();
		});// end .Update click

		// + 버튼 이벤트
		$(".Update_Plus").on("click", function() {

			var code = $(this).attr("data-seq");
			var amount = $("#Stock_stock" + code).val();

			$.ajax({
				url : "stockmodifyplus",
				type : "post",
				datatype : "text",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					product_code : code,
					product_amount : amount
				}),
				success : function(data, status, xhr) {
					console.log("Update_Plus success");
				},
				error : function(data, status, error) {
					console.log(error);
				}

			})// end ajax
			location.reload();
		});// end .Update_Plus click

		$(".All_Update").on("click", function() {

			$(".Stock_Text").each(function(idx, ele) {
				var amount_value = $(ele).val();
				var amount_id = ele.id;
				if (!!amount_value) {
					console.log(amount_id.slice(11));
					console.log(amount_value);

					$.ajax({
						url : 'stockmodify',
						type : "post",//get,post방식
						dataType : 'text',
						headers : {
							'Content-Type' : 'application/json'
						// 아래의 JSON 을 넘겨주기위해서는 이게 꼭 필요하다.
						},
						data : JSON.stringify({
							product_code : amount_id.slice(11),
							product_amount : amount_value
						}),
						success : function(data, status, xhr) {//성공시 실행 data=받아오는data
							console.log("Stock_Modify success");
						},
						error : function(xhr, status, error) {//실패시 실행
							console.log(error);
						}
					}); // end ajax
				}// end if
			})// end .Stock_Text
			location.reload();
		});// end .All_Update click

		
		$(".All_Update_Plus").on("click",function(){
			$(".Stock_Text").each(function(idx, ele) {
				var amount_value = $(ele).val();
				var amount_id = ele.id;
				if (!!amount_value) {

					$.ajax({
						url : 'stockmodifyplus',
						type : "post",//get,post방식
						dataType : 'text',
						headers : {
							'Content-Type' : 'application/json'
						// 아래의 JSON 을 넘겨주기위해서는 이게 꼭 필요하다.
						},
						data : JSON.stringify({
							product_code : amount_id.slice(11),
							product_amount : amount_value
						}),
						success : function(data, status, xhr) {//성공시 실행 data=받아오는data
							console.log("Stock_Modify success");
						},
						error : function(xhr, status, error) {//실패시 실행
							console.log(error);
						}
					}); // end ajax
				}// end if
			})// end .Stock_Text
			location.reload();
		})
	});
</script>
<form>
	<table class="StockModify">
		<tr>
			<!-- 				<th>상품번호</th> -->
			<th>재료명</th>
			<th>재고 수정 값</th>
		</tr>
		<c:forEach var="result" items="${Stocklist}" varStatus="status">
			<input type="hidden" value="${result.product_code}"
				class="Stock_product_code">
			<tr>
				<td>${result.product_name}</td>
				<td><input type="text" id="Stock_stock${result.product_code}"
					class="Stock_Text"> <input type="button"
					data-seq="${result.product_code}" value="+" class="Update_Plus">
					<input type="button" data-seq="${result.product_code}" value="수정"
					class="Update"></td>
			</tr>
		</c:forEach>
	</table>
	<br> <input type="button" value="전체 수정" class="All_Update">
	<input type="button" value="전체 +" class="All_Update_Plus">
</form>
