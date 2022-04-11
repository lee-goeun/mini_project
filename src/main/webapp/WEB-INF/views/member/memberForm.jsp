<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
 <script type="text/javascript">
        //숫자입력제한
        function numberMaxLength(e){
            if(e.value.length > e.maxLength){
                e.value = e.value.slice(0, e.maxLength);
            }
        }

        $(document).ready(function(){
            
            $('#id, #pwd, #pwdfrm, #name, #fbirthDate').keyup(function(){
                console.log($(this).val())

                if($(this).val() == ""){
                    $(this).siblings('.img').css({'display':'none'});
                }else{
                    console.log('sss',$(this).val())
                    $(this).siblings('.img').css({'display':'block'});
                }
            });

            $('.visibility').click(function(){
                $(this).toggleClass(function(){
                    if($(this).is('.visibility')){
                        $(this).parent('p').siblings('input').prop('type','text');
                        $(this).attr("src","${contextPath}/resources/image/outline_visibility_off_black_24dp.png");
                    }else{
                        $(this).parent('p').siblings('input').prop('type','password');
                        $(this).attr("src","${contextPath}/resources/image/outline_visibility_black_24dp.png");
                    }
                })
                
            });

            $('.img').find('.clear').click(function(){
                $(this).parent('p').siblings('input').val("");
                $(this).parent('p').css({'display':'none'});
            });

            $('form').submit(function(){
                if($('#id').val().length == 0){
                    console.log('this', this);
                    if($('#id').siblings('span').is('.warning')){
                        $('#id').focus();
                        return false;
                    }else{
                        $('#id').focus();
                        $('#id').parent('div').append('<span class="warning">필수입력값입니다.</span>');
                    }
                    
                    return false;
                }
                if($('#pwd').val().length == 0){
                    if($('#pwd').siblings('span').is('.warning')){
                        $('#pwd').focus();
                        return false;
                    }else{
                        $('#pwd').focus();
                        $('#pwd').parent('div').append('<span class="warning">필수입력값입니다.</span>');
                        return false;
                    }
                    
                }
                if($('#pwdfrm').val().length == 0){
                    if($('#pwdfrm').siblings('span').is('.warning')){
                        $('#pwdfrm').focus();
                        return false;
                    }else{
                        $('#pwdfrm').focus();
                        $('#pwdfrm').parent('div').append('<span class="warning">필수입력값입니다.</span>');
                        return false;
                    }
                    
                }

                //비밀번호 불일치시, 유효성 체크
                if($('#pwd').val() != $('#pwdfrm').val()){
                    if($('#pwdfrm').siblings('span').is('.warning')){
                        $('#pwdfrm').parent('div').find('.warning').text('비밀번호를 확인해주세요.');
                        return false;
                    }
                    $('#pwdfrm').parent('div').append('<span class="warning">비밀번호를 확인해주세요.</span>');
                        return false;
                }

                if($('#name').val().length == 0){
                    if($('#name').siblings('span').is('.warning')){
                        $('#name').focus();
                        return false;
                    }else{
                        $('#name').focus();
                        $('#name').parent('div').append('<span class="warning">필수입력값입니다.</span>');
                        return false;
                    }
                    
                }

                if($('#birthDate').val().length != 8){
                    if($('#birthDate').siblings('span').is('.warning')){
                        $('#birthDate').focus();
                        return false;
                    }else{
                        $('#birthDate').focus();
                        $('#birthDate').parent('div').append('<span class="warning">생년월일을 확인해주세요.</span>');
                        return false;
                    }
                    
                }
                
            });
            
            
        });
    </script>
    <div id="wrap">
        <div class="img_wrapper">
            <p><a href="${contextPath}/index.do"><img src="${contextPath}/resources/image/Daangeun_Logo.png"/></a></p>
            <form action="${contextPath}/member/addMember.do" name="memberFrm" method="post">
                <fieldset>
                    <legend>로그인</legend>
                    <div>
                        <label class="id" for="id">아이디</label>
                        <input type="text" name="id" id="id"/>
                        <p class="img">
                            <input type="button" class="db_check" value="중복체크"/>
                            <img class="clear" src="${contextPath}/resources/image/outline_close_black_24dp.png"/>
                        </p>
                    </div>
                    <div>
                        <label class="pwd" for="pwd">비밀번호</label>
                        <input type="password" name="pwd" id="pwd"/>
                        <p class="img">
                            <img class="visibility" src="${contextPath}/resources/image/outline_visibility_black_24dp.png"/>
                            <img class="clear" src="${contextPath}/resources/image/outline_close_black_24dp.png"/>
                        </p>
                        
                    </div>
                    <div>
                        <label class="pwdfrm" for="pwdfrm">비밀번호 확인</label>
                        <input type="password" name="pwdfrm" id="pwdfrm"/>
                        <p class="img">
                            <img class="visibility" src="${contextPath}/resources/image/outline_visibility_black_24dp.png"/>
                            <img class="clear" src="${contextPath}/resources/image/outline_close_black_24dp.png"/>
                        </p>
                    </div>
                    <div>
                        <label class="name" for="name">닉네임</label>
                        <input type="text" name="name" id="name"/>
                        <p class="img">
                            <input type="button" class="db_check" value="중복체크"/>
                            <img class="clear" src="${contextPath}/resources/image/outline_close_black_24dp.png"/>
                        </p>
                    </div>
                 <%--    <div>
                        <label class="birthDate" for="birthDate">생년월일</label>
                        <input class="form-control" type="number" name="birthDate" id="birthDate" maxlength="8" placeholder="숫자8자리로 입력해주세요(예 : 19950104)" oninput="numberMaxLength(this);"/>
                        <p class="img"><img class="clear" src="${contextPath}/resources/image/outline_close_black_24dp.png"/></p>
                    </div> --%>
                    <input class="btn" type="submit" value="가입하기"/>
                </fieldset>
            </form>
        </div>
    </div>