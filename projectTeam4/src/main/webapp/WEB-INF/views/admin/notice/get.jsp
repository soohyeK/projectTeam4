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
		<c:if test="${adminId eq sBoardVO.adminId }">
		<button type="button" onclick = "location.href = '${path}modify?boardId=<c:out value="${sBoardVO.boardId}"/>' ">수정</button>
		</c:if>
		<button type="button" onclick = "location.href = 'list' ">목록</button>
		
		<form id="infoForm" action="modify" method="get">
			<input type="hidden" id="boardId" name="boardId" value='<c:out value="${sBoardVO.boardId}"/>'>
			<input type="hidden" name="pageNum" value="${pageMaker.criNo.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.criNo.amount}">
			<input type='hidden' name='type' value='<c:out value="${pageMaker.criNo.type }"/>'>
			<input type="hidden" name="keyword" value="${pageMaker.criNo.keyword}">
		</form>  

		<form id="moveForm" action="admin/notice/modify" method="get">
			<input type='hidden' id='boardId' name='boardId' value="${sBoardVO.boardId}">
		</form> 
	</form>
<script>
$(document).ready(function(){
	
	let infoForm = $('infoForm');
	
	var moveForm = $("#moveForm");
	$("button[data-oper='modify']").on("click", function(e){
	operFrom.attr("action", "admin/notice/modify").submit();	
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		moveForm.append("<input type='hidden' name='boardId' value='"+$(this).attr("href")+"'>");
		moveForm.attr("action", "/admin/notice/modify");
		moveForm.submit();
});
	
</script>	
</body>
</html>