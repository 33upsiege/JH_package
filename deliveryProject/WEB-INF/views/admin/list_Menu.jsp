<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet"  href="../css/admin.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<div id="listMenu">
	<table class="menu_table">
		<tr>
			<th>
				<select name="category" id="searchMenu">
					<option value="">카테고리</option>
					<option value="버거">버거</option>
					<option value="음료">음료</option>
					<option value="사이드메뉴">사이드</option>
				</select>
			</th>
			<th>코드</th>
			<th>이미지</th>
			<th>이름</th>
			<th>가격</th>
			<th>상세설명1</th>
			<th>상세설명2</th>
			<th>레시피</th>
			<th>총판매량</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="list" items="${menuList}">
		<tr>
			<td>${list.mCategory}</td>
			<td>${list.mCode}</td>
			<td>
				<c:choose>
				<c:when test="${list.mCategory=='버거'}">
					<img src="../images/${list.mImg}.jpg" width="50px;"/>
				</c:when>
				<c:when test="${list.mCategory=='사이드메뉴' || list.mCategory=='음료'}">
					<img src="../images/product/${list.mImg}.png" width="50px;"/>
				</c:when>
				</c:choose>
			</td>
			<td>${list.mName}</td>
			<td><fmt:formatNumber value="${list.mPrice}" pattern="###,###" /></td>
			<td>${list.mContent1}</td>
			<td>${list.mContent2}</td>
			<td>${list.mRecipe}</td>
			<td>${list.mTotalSalesAmount}</td>
			<td><input type="button"  data-delBtn="${list.mCode}" value="삭제" class="delBtn"></td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>