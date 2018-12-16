<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>google chart API</title>

<!-- <script src="https://code.jquery.com/jquery-latest.js"></script> -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$(".chart_button").on("click", function() {
		var year = $("#year option:selected").val().slice(0,4);
		
		if($("#month option:selected").val().length==2){
			var month = $("#month option:selected").val().slice(0,1);
		}else{
			var month = $("#month option:selected").val().slice(0,2);
		}
		
		$.ajax({
			url : '../admin_stock/saleschartlist',
			type : "post",//get,post방식
			dataType : 'json',
			data : {
				year : year,
				month : month
			},
			success : function(list, status, xhr) {//성공시 실행 data=받아오는data
			
				var salesArray = [];
				salesArray.push(['Year', 'Sales']);
			    $(list).each(function(idx,ele){
			    	google.charts.load('current', {'packages':['corechart']});
				    google.charts.setOnLoadCallback(drawChart);
					
					function drawChart() {
						
						var newSales = [ele.sales_payment_date, Number.parseInt(ele.order_all_price)];
						
						salesArray.push(newSales);

						var data = google.visualization.arrayToDataTable(salesArray);

						var options = {
						  	 title: '매출 차트',
						   	 curveType: 'function',
						     legend: { position: 'bottom' }
						};

						var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
						chart.draw(data, options);
					}
			    })// end each

			}, // end success
			error : function(xhr, status, error) {//실패시 실행
				console.log(error);
			}
		}); // end ajax
	});// end chart click
});// end document



</script>
</head>
<body>
<br><br>
<div style="float: left;   margin: auto 0;   margin-left: 20%;">
<input type="button" value="차트" class="chart_button"/>
	<select id="year">
		<option>2017년</option>
		<option>2018년</option>
	</select>
	<select id="month">
		<option>1월</option>
		<option>2월</option>
		<option>3월</option>
		<option>4월</option>
		<option>5월</option>
		<option>6월</option>
		<option>7월</option>
		<option>8월</option>
		<option>9월</option>
		<option>10월</option>
		<option>11월</option>
		<option>12월</option> 
	</select>
</div>

	<div id="curve_chart"
		style="width: 900px; height: 500px; float: left;   margin: auto 0;"></div>
</body>
</html>
