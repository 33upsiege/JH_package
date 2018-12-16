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
	$(".insert_product_button").on("click",function(){
		
		var name = $(".insert_product_name").val();
		var amount = $(".insert_product_amount").val();
		var mamount = $(".insert_product_minimum_amount").val();
		var eamount = $(".insert_product_e_amount").val();
		var cost = $(".insert_product_e_cost").val();
		
		$.ajax({
			url:"stockinsert",
			type:"post",
			dataType:"text",
			headers : {
				'Content-Type' : 'application/json'
			},
			data : JSON.stringify({
				product_name : name,
				product_amount : amount,
				product_minimum_amount : mamount,
				product_e_amount : eamount,
				product_e_cost : cost
			}),
			success : function(data,status,xhr){
				console.log("StockInsert success");
			},
			error : function(xhr,status,error){
				console.log(error);
			}
		})// end ajax
		
		location.reload();
	})// end product_insert click
})

</script>
</head>
<body>
	<form>
		<table class="StockInsert">
			<tr>
				<th>재료명</th>
				<th>현재 수량</th>
				<th>필요 최소 수량</th>
				<th>입고된 날짜</th>
				<th>입고된 수량</th>
				<th>재료 원가</th>
			</tr>
				<tr>
					<td><input type="text" class="insert_product_name"></td>
					<td><input type="text" class="insert_product_amount"></td>
					<td><input type="text" class="insert_product_minimum_amount"></td> 
					<td><input type="text" class="insert_product_enter_date" readonly="readonly" value="현재 날짜로 자동 입력" style="text-align: center;"></td>
					<td><input type="text" class="insert_product_e_amount" readonly="readonly" value="0" style="text-align: center;"></td>
					<td><input type="text" class="insert_product_e_cost"></td>
				</tr>
		</table>
		<br>
		<input type="button" value="추가" class="insert_product_button">
	</form>
</body>
</html>