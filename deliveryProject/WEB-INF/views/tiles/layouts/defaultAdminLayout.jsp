<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet"  href="../css/admin.css" type="text/css"  />
<link rel="stylesheet"  href="../css/admin_stock.css" type="text/css"  />
</head>
  
<body>
    <header id="header">
        <tiles:insertAttribute name="header" />
    </header>
    
	<menu id="menu">
		 <tiles:insertAttribute name="menu" />
	</menu>
    
    <section id="body">
        <tiles:insertAttribute name="body" />
    </section>
	
</body>
</html>
