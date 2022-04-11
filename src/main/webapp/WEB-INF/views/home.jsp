<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<div class="search_area">
	    <form action="${contextPath}/home.do" name="searchFrm" method="get">
	    	<fieldset>
	            <legend>검색</legend>
	            <table>
	            <tr>
	                <th>카테고리</th>
	                <td>
	                    <select name="category">
	                        <option value="all" selected="selected">전체</option>
	                        <option value="digital">디지털기기</option>
	                        <option value="popular">인기매물</option>
	                        <option value="living">생활가전</option>
	                        <option value="furniture">가구/인테리어</option>
	                        <option value="child">유아동</option>
	                        <option value="processedFood">생활/가공식품</option>
	                        <option value="childBook">유아도서</option>
	                    </select>
	                </td>
	            </tr>
	            <tr>
	                <th>가격</td>
	                <td>
	                	<label for="min_price">최소가격</label>
	                	<label for="max_price">최소가격</label>
	                    <input type="number" name="min_price" id="min_price"/> ~ <input type="number" name="max_price" id="max_price"/> 
	                </td>
	            </tr>
	            <tr>
	                <td>
	                	<label for="itm_name">상품명</label>
	                    <input type="text" placeholder="상품명을 입력하세요." name="itm_name" id="itm_name"/>
	                </td>
	            </tr>
	            <tr class="search">
	                <td>
	                    <input type="submit" value=""/>
	                </td>
	            </tr>
	            </table>
	        </fieldset>
	    </form>    
	    </div>
	    <div class="content">
    		<ul class="item_list">
    			<c:choose>
    				<c:when test="${productsList == null }">
    				<li>
                        등록된 상품이 없습니다.
                    </li>
    				</c:when>
    				<c:otherwise>
    					<c:forEach var="product" items="${productsList}" varStatus="productNum">

			    			<li>
		                         <div class="item_img"><img src="${contextPath}/download.do?productId=${product.productId}&imageFileName=${product.imageFileName}"/></div> 
		                        <div>
		                             <p class="name">${product.title}</p>  
		                             <p class="location"><span>오산동</span><span>5초</span>전</p>
		                             <p class="price"><span>${product.price}</span>원</p> 
		                        </div>
		                    </li>
			    		</c:forEach>
    				</c:otherwise>
    			</c:choose>
    		</ul>
	    </div>
	    <div class="new">
	        <a href="${contextPath}/board/productForm.do"><img src="${contextPath}/resources/image/outline_add_white_24dp.png"/></a>
	    </div>
	    <script type="text/javascript">
        $(document).ready(function(){
           /*  for(var i=0; i<7; i++){
                $('.item_list').append(' <li> '+
                       ' <div class="item_img"><img src="img/buy_item.jpg"/></div>'+
                       '<div>'+
                        ' <p class="name">에어데이즈 KF94 C타입 대형 35장</p>'+
                        '   <p class="location"><span>오산동</span><span>5초</span>전</p>'+
                        '   <p class="price"><span>15,000</span>원</p>'+
                        ' </div>'+
                        '</li>');
            } */

            $('.person_list').mouseover(function(){
               $(this).find('ul').css({'display':'block'}); 
            }).mouseout(function(){
                $(this).find('ul').css({'display':'none'});
            });

            $('nav li').click(function(){
                alert('준비중인 서비스입니다.');
            });
			
            $(".search").find('td').find('input').css({
            	"backgroundImage":"url('${contextPath}/resources/image/outline_search_white_24dp.png')"
            });

        });
    </script>