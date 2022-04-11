<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">
 	var loginConfirm ="<c:out value='${param.result}'/>";
 	if(loginConfirm=='loginFailed'){
		window.onload=function(){
			alert('아이디나 비밀번호가 틀렸습니다. 다시 입력해주세요.');
		}
    } 
    $(document).ready(function(){
    	
        $('#id, #pwd').keyup(function(){
            $(this).siblings('.img').css({'display':'block'});

            if($(this).val() == ""){
                $(this).siblings('.img').css({'display':'none'});
            }
        });

        $('.img').click(function(){
            $(this).siblings('input').val("");
            $(this).css({'display':'none'});
        });

        $('form').submit(function(){
            if($('#id').val().length == 0){
                $('#id').focus();
                return false;
            }
            if($('#pwd').val().length == 0){
                $('#pwd').focus();
                return false;
            }
        });
    });
</script>
<div id="wrap">

    <div class="img_wrapper">
        <p><a href="${contextPath}/index.do"><img src="${contextPath}/resources/image/Daangeun_Logo.png"/></a></p>
        <form action="${contextPath}/member/login.do" method="post">
            <fieldset>
                
                <legend>로그인</legend>
                <div>
                    <label class="id" for="id"><img alt="id" src="${contextPath}/resources/image/baseline_person_black_24dp.png"/></label>
                    <input type="text" name="id" id="id"/>
                    <p class="img"><img src="${contextPath}/resources/image/outline_close_black_24dp.png"/></p>
                </div>
                <div>
                    <label class="pwd" for="pwd"><img alt="password" src="${contextPath}/resources/image/baseline_lock_black_24dp.png"/></label>
                    <input type="password" name="pwd" id="pwd"/>
                    <p class="img"><img src="${contextPath}/resources/image/outline_close_black_24dp.png"/></p>
                </div>
                <input class="btn" type="submit" value="로그인"/>
            </fieldset>
        </form>
    </div>
</div>