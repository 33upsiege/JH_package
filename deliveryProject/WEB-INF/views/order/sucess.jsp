<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/kakao.min.js" />"></script>
	
<script type="text/javascript">


window.opener.location.href="addOrderConfirm2";    //부모창 reload


window.close();    //현재 팝업창 Close


</script>

	
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>   성공 </P>
<button onclick="javascript:self.close()">OK</button>
<script>


</script>
</body>
</html>
