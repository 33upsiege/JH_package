<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="goods" items="${list}">
<li>
	<a href="productInfo?menu_code=${goods.menu_code}">
		<img src="images/product/${goods.menu_img}.jpg" alt="" />
	<span>${goods.menu_name}</span>
	</a>
	
	<p class="delivery-list-phrase">${goods.menu_content_1}</p>
	<p class="delivery-list-price">${goods.menu_price}</p>
		
		<span class="mn-cart">
			<a href="">카트담기</a>
		</span>
		<span class="mn-cart bdnone">
			<a href="addPurchase">바로주문</a>
		</span>
	
	</li>
</c:forEach>