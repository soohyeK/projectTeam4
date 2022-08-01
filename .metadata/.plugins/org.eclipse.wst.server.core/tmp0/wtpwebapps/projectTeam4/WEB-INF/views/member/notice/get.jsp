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
	<h1>게시판 상세</h1>
	<form role="form" action="get" method="get">
		<div class="form-group">
			<label>Title</label>
			<input name="boardTitle"  value='<c:out value="${sBoardVO.boardTitle}"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>content</label>
			<textarea rows="3" name="boardContent" readonly="readonly">
		    	<c:out value="${sBoardVO.boardContent }" />
		    </textarea>
		</div>
		<div class="input_wrap">
			<label>Writer</label>
			<input name="adminId" value='<c:out value="${sBoardVO.adminId }"/>' readonly="readonly">
		</div>
		<button type="button" onclick = "location.href = 'list' ">목록</button>	
	</form>
	
</body>
</html>