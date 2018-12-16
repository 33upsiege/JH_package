<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="../css/admin.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<body>
<div id="addMenu">
	<form action="addMenu" method="post" enctype="multipart/form-data" >
		<div>
			<ul>
				<li>카테고리 
					<select id="goods_category" name="mCategory">
						<option>버거</option>	
						<option>음료</option>	
						<option>사이드</option>	
					</select>
				</li>
				<li>
					이미지 <input type="file" name="theFile" id="imgInp"/> 
					<div class="img_wrap">
						<img id="blah"/>
					</div>
				</li>
				<li>
					제품명 <input type="text" id="goods_name" name="mName">
				</li>
				<li>
					가격 <input type="text" id="goods_price" name="mPrice">
				</li>
				<li>레시피</li>
				<li>
					<c:forEach var="stock" items="${stockList}">
						<input type="checkbox" value="${stock.pName}" name="recipes"> ${stock.pName}
					</c:forEach>
				</li>
				<li>상세설명1</li>
				<li>
					<div>
						<textarea class="content1" rows="10px" cols="90px" name="mContent1"></textarea>
					</div>
				</li>
				<li>상세설명2</li>
				<li>
					<div>
						<textarea class="content2" rows="10px" cols="90px" name="mContent2"></textarea>
					</div>
				</li>
			</ul>
			<input type="submit" value="저장">
			<input type="reset" value="취소"> 
		</div>
	</form>
</div>
</body>
</html>