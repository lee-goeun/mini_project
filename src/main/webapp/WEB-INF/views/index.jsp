<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<div id="wrap">
    <div class="img_wrapper">
        <p><img src="${contextPath}/resources/image/Daangeun_Logo_vertical.png"/></p>
       <div class="text_wrapper">
       
           당신 근처의 당근마켓<br/>
           <p>내 동네를 설정하고<br/>
               당근마켓을 시작해보세요.</p>
       </div>
       
   </div>
   <div class="btn">
       <a href="${contextPath}/member/memberForm.do">시작하기</a>
   </div>
   <p class="login">이미 계정이 있나요? <a href="${contextPath}/member/loginForm.do">로그인</a></p>
</div>