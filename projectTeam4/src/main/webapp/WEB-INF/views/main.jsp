<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Paldo</title>
<style>
  table {
    width: 100%;
    border-collapse: collapse;
    margin-left: auto;
    margin-right: auto;
    table-layout:fixed;
  }
  th, td {
  	width=20%;
    padding: 10px;
  }
  th {
  vertical-align: middle;
  }
  td {
  vertical-align: middle;
  word-wrap: break-word;
  }
</style>
<link rel="stylesheet" href="../../resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
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
					<c:if test="${member != null }">
						<!-- 로그인 했을떄 -->
						 <li><a id="gnb_logout_button">로그아웃</a></li>
						<li>마이페이지</li>
						<li><a href="/cart/${member.memberId}"">장바구니</li>
					</c:if>
					<li><a href="/member/notice/list">공지사항</a></li>
				</ul>
			</div>
			<div class="top_area">
				<div class="logo_area">
					<a href="/main"><img src="../../resources/img/logo.jpg"></a>
				</div>
				<div class="search_area">
					<div class="search_wrap">
                		<form id="searchForm" action="/search" method="get">
                			<div class="search_input">
                				<input type="text" name="keyword">
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
			<div class="navi_bar_area">
				<div class="navi_bar_area">
			<div class="dropdown">
			    <button class="dropbtn">술 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<a href="#">소주</a>
			    	<a href="#">막걸리</a>
			    </div>			
			</div>
			<div class="dropdown">
			    <button class="dropbtn">게시판 
			      <i class="fa fa-caret-down"></i>
			    </button>
			    <div class="dropdown-content">
			    	<a href="#">공지사항</a>
			    	<a href="#">문의게시판</a>
			    </div>			
			</div>
		</div>
			</div>
			<div class="content_area">
				<c:set var="i" value="0" /> <c:set var="j" value="5" />
				<table>
				<c:choose>
					<c:when test="${list != null && fn:length(list)>0 }">
					<c:forEach items="${list}" var="list" begin="0" end="9">
						<c:if test="{i%j==0}">
						<tr>
						</c:if>
						<td style="word-break:break-all">
						<a class="move" href='<c:out value="${path}Product/${list.productId}"/>'>
							<c:out value="${list.productName}" />
							</a></td>
						<td class="image">
						<c:out value="${list.uuid }"/>
						</td>
						<c:if test="${i%j==j-1}">
						</tr>
						</c:if>
						<c:set var="i" value="${i+1 }"/>
					</c:forEach>
					</c:when>
					</c:choose>
				</table>
				
			</div>
		</div>
	</div>

	<script>
		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); // ajax 
		});
	</script>

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
	</div>
	<!-- class="footer_nav" -->

	<div class="footer">
		<div class="footer_container">

			<div class="footer_left">
				<img src="../../resources/img/logo.jpg">
			</div>
			<div class="footer_right">
				(주) 팔도주류 대표이사 : 4팀 <br> 사업자등록번호 : ooo-oo-ooooo <br> 대표전화 :
				010-4161-7059 <br> <br> COPYRIGHT(C) <strong>www.paldo.com</strong>
				ALL RIGHTS RESERVED.
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- class="footer" -->

</body>
</html>