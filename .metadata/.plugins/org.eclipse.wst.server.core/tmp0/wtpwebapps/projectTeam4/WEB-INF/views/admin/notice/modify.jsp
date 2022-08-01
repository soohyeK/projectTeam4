<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<body>
<h1>게시판 수정</h1>
 <form role="form" action="modify" method="post">
    <div class="input_wrap">
        <label>Title</label>
        <input name="boardTitle" value='<c:out value="${sBoardVO.boardTitle}"/>'>
    </div>
    <div class="input_wrap">
        <label>Content</label>
        <textarea rows="3" name="boardContent"><c:out value="${sBoardVO.boardContent }" /></textarea>
    </div>
    <div class="input_wrap">
        <label>Writer</label>
        <input type="text" name="adminId" value='<c:out value="${sBoardVO.adminId}"/>' readonly=readonly>
    </div>
    <button type="submit">등록</button>
    <button type="button" onclick = "location.href = 'list' ">목록</button>
    <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
     <form id="moveForm" method="get">
 		<input type="hidden" name="boardId" value="${sBoardVO.boardId}">
 	</form>
</form>
<script>
 $(document).ready(function(){
	var formObj = $("form");
	$("button[data-oper ='remove']").on("click",function(e){
		e.preventDefault();
		formObj.attr("action", "delete");
		formObj.attr("method", "post");
		formObj.submit();
	});
});
 </script>
</body>
</html>