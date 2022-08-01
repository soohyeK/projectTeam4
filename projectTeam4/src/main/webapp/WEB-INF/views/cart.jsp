<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Paldo</title>
<link rel="stylesheet" href="../../resources/css/cart.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
				<ul class="list">
					 <c:if test="${member == null}">
						<li><a href="/member/login">로그인</a></li>
						<li><a href="/member/join">회원가입</a></li>
					</c:if>
					<!-- 로그인 했을떄 -->
					<c:if test="${member != null }">
						</c:if>
						 <li><a id="gnb_logout_button">로그아웃</a></li>
						<li>마이페이지</li>
					<li>
					<a href="/cart/${member.memberId}">장바구니</a>
					</li>
					<li>
					<a href="/member/notice/list">공지사항</a>
					</li>
				</ul>
			</div>
		<div class="top_area">
			<!-- 로고영역 -->
			<div class="logo_area">
				<a href="/main"><img src="../../resources/img/logo.jpg"></a>
			</div>
			<div class="search_area">
                	<div class="search_wrap">
                		<form id="searchForm" action="/search" method="get">
                			<div class="search_input">
                				<select name="type">
                					<option value="T">상품명</option>
                				</select>
                				<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
			</div>
			<div class="login_area">
					<c:if test="${member == null }">
						<div class="login_button">
							<a href="/member/login">로그인</a>
						</div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>
					<!-- 로그인한 상태 -->
					<c:if test="${member != null }">
						<div class="login_success_area">
							<span>회원 : ${member.memberName}</span>
							<span><a href="/member/logout.do">로그아웃</a></span>
						</div>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
		
<!-- Footer 영역 -->
        <div class="footer_nav">
            <div class="footer_nav_container">
                <ul>
                    <li>회사소개</li>
                    <span class="line">|</span>
                    <li>이용약관</li>
                    <span class="line">|</span>
                    <li>고객센터</li>
                    <span class="line">|</span>
                    <li>광고문의</li>
                    <span class="line">|</span>
                    <li>채용정보</li>
                    <span class="line">|</span>
                </ul>
            </div>
        </div> <!-- class="footer_nav" -->
        
        <div class="footer">
            <div class="footer_container">
                
                <div class="footer_left">
                    <img src="../../resources/img/logo.jpg">
                </div>
                <div class="footer_right">
                    (주) 팔도주류    대표이사 : 4팀
                    <br>
                    사업자등록번호 : ooo-oo-ooooo
                    <br>
                    대표전화 : 010-4161-7059
                    <br>
                    <br>
                    COPYRIGHT(C) <strong>www.paldo.com</strong>    ALL RIGHTS RESERVED.
                </div>
                <div class="clearfix"></div>
            </div>
        </div> <!-- class="footer" -->    


<script>

</script>

</body>
</html>