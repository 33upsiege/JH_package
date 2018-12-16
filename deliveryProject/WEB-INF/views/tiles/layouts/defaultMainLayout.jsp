<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tiles:getAsString name="title" /></title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"  href="css/sub.css" type="text/css"  />
<link rel="stylesheet"  href="css/common.css" type="text/css"  />
<script src="<c:url value="/js/js1.js"/>" ></script>
</head>
  
<body>
    <header id="header">
        <tiles:insertAttribute name="header" />
    </header>
    
    <section id="body">
        <tiles:insertAttribute name="body" />
    </section>

    <footer id="footer">
        <tiles:insertAttribute name="footer" />
    </footer>
</body>
</html>
