<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <input type="text" name="adminId" value="adminId" readonly=readonly>
    </div>
    <button class="btn">등록</button>
    <button type="button" onclick = "location.href = 'list' ">목록</button>
</form>
</body>
</html>