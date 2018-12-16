<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:if test="${! empty rmesg}">
  <script type="text/javascript">
    alert('${rmesg}');
    location.replace="ReservationUI";
  </script>
</c:if>	
 
<h1>에러페이지 입니다</h1>

<a href="index.jsp">메인가기</a>