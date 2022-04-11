<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}<tiles:getAsString name = "css"  ignore="true"/>" />
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<tiles:insertAttribute name="script" ignore="true"/>
<body>
	<div class="wrap">
	<header>
		<tiles:insertAttribute name="header"/>
	</header>
	<nav>
		<tiles:insertAttribute name="side"/>
	</nav>
	<section>
		<tiles:insertAttribute name="body"/>
	</section>
	</div>
</body>
</html>