<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
	<h1> 상세보기 테스트</h1>
	<form role="form" action="get" method="get">
		<table border="1">
		<th>정보</th>
		<th>데이터</th>
		<tr>
			<td>상품명</td>
			<td><c:out value="${dVo.productName }"/></td>
		</tr>
		<tr>
			<td>생산지</td>
			<td><c:out value="${dVo.location }"/></td>
		</tr>
		<tr>
			<td>도수</td>
			<td><c:out value="${dVo.alcohol }"/></td>
		</tr>
		<tr>
			<td>코멘트</td>
			<td><c:out value="${dVo.productContent}"/></td>
		</tr>
		</table>
		<button type="button" onclick = "location.href = '/main' ">목록</button>
	</form> 
</body>
</html>