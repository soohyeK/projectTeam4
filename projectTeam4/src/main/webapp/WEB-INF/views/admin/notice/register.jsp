<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String adminId = (String)session.getAttribute("adminId"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>게시판 등록</h1>
 <form action="register" method="post">
    <div class="input_wrap">
        <label>Title</label>
        <input name="boardTitle">
    </div>
    <div class="input_wrap">
        <label>Content</label>
        <textarea rows="3" name="boardContent"></textarea>
    </div>
    <div class="input_wrap">
        <label>Writer</label>
        <input type="text" name="adminId" value=<%=adminId%> readonly=readonly>
    </div>
    <button class="btn">등록</button>
    <button type="button" onclick = "location.href = 'list' ">목록</button>
</form>
<script>
 $(document).ready(function(){
	var formObj = $("#frm");
//	
//	$("button[data-oper='register']").on("click", function(e){
//		if(!formObj.find("input[name='boardtitle']").val()){
//			alert("제목을 입력하세요.");
//			return false;
//	}
//		if(!formObj.find("input[name='boardcontent']").val()){
//			alert("내용을 입력하세요.");
//			return false;
//	}
//		e.preventDefault();
//		formObj.submit();
//	});
//	
	$("button[data-oper ='list']").on("click",function(e){
		formObj.attr("action", "list").attr("method", "get");
		formObj.empty
		formObj.submit();
	});
});
	</script>
</body>
</html>