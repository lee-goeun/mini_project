<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<div class="page_name">
        중고거래 글쓰기
    </div>
    <form action="${contextPath}/board/addNewProduct.do" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>상품등록</legend>
            <div>
                <input class="btn" type="submit" value="완료"/>
            </div>
            <div class="pic_area">
                <label class="imageFileName" for="imageFileName">사진</label>
                <input type="file" name="imageFileName" id="imageFileName" onchange="readURL(this);"/>
                <p><span>1</span>/10</p>
                <ul>
                    <li><img id="preview" src="#"/><p></p></li>
                </ul>
            </div>
            <div>
                <label class="title" for="title">제목</label>
                <input type="text" name="title" id="title" placeholder="제목"/>
                
            </div>
            <div>
                <label class="category" for="category">카테고리</label>
                <select name="category">
                    <option value="all" selected="selected">카테고리</option>
                    <option value="digital">디지털기기</option>
                    <option value="popular">인기매물</option>
                    <option value="living">생활가전</option>
                    <option value="furniture">가구/인테리어</option>
                    <option value="child">유아동</option>
                    <option value="processedFood">생활/가공식품</option>
                    <option value="childBook">유아도서</option>
                </select>
            </div>
            <div>
                <label class="price" for="price">가격</label>
                <input type="number" name="price" id="price" placeholder="가격(선택사항)"/>
            </div>
            <div>
                <label class="content" for="content">내용</label>
                <textarea placeholder="올릴 게시글 내용을 작성해주세요."></textarea>
            </div>
            
        </fieldset>
    </form>
    <script type="text/javascript">
    function readURL(input){
    	if(input.files && input.files[0]){
    		var reader = new FileReader();
    		reader.onload = function(e){
    			$('#preview').attr('src', e.target.result);
    		}
    		reader.readAsDataURL(input.files[0]);
    	}
    }
    $(document).ready(function(){
    	$(".imageFileName").css({
        	"backgroundImage":"url('${contextPath}/resources/image/outline_photo_camera_black_24dp.png')"
        });
    });
    </script>