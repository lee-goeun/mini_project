<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<ul>
    <li><a href="#none"><img src="${contextPath}/resources/image/outline_maps_home_work_black_24dp.png"/>동네생활</a></li>
    <li><a href="#none"><img src="${contextPath}/resources/image/outline_place_black_24dp.png"/>내 근처</a></li>
</ul>