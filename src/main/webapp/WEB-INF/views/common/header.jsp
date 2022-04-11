<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<a class="img_wrap" href="${contextPath}/home.do"><img src="${contextPath}/resources/image/Daangeun_Logo.png"/></a>
<div class="text_wrap">
    <p><span>${member.name}</span> 님, 안녕하세요</p>
        <ul>
            <li class="person_list">
                <img src="${contextPath}/resources/image/baseline_person_outline_black_24dp.png"/>
           <ul>
               <li><a href="${contextPath}/board/sellProduct.do">판매내역</a></li>
               <li><a href="${contextPath}/board/buyProduct.do">구매내역</a></li>
               <li><a href="${contextPath}/board/buying.do">관심목록</a></li>
               <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
           </ul>
       </li>
       <li><img src="${contextPath}/resources/image/outline_question_answer_black_24dp.png"/></li>
       <li><img src="${contextPath}/resources/image/baseline_notifications_none_black_24dp.png"/></li>
    </ul>
</div>