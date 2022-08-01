<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/admin/notice/list.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
</style>
</head>
<body>
	<h1>목록페이지입니다.</h1>

	<div class="table_wrap">
		<c:if test="${listCheck != 'empty' }">
			<table class="author_table">
				<thead>
					<tr>
						<th class="boardid_width">번호</th>
						<th class="title_width">제목</th>
						<th class="adminid_width">작성자</th>
						<th class="regdate_width">작성일</th>
						<th class="lastupdate_width">수정일</th>
					</tr>
				</thead>
				<c:forEach items="${list}" var="sboard">
					<tr>
						<td><c:out value="${sboard.boardId}" /></td>
						<td>
							<a class="move" href='<c:out value="${sboard.boardId}"/>'>
							<c:out value="${sboard.boardTitle}" /></a>
						</td>
						<td><c:out value="${sboard.adminId}" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd"
								value="${sboard.regDate}" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd"
								value="${sboard.lastUpdate}" /></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<c:if test="${listCheck == 'empty'}">
			<div class="table_empty">등록된 게시글이 없습니다.</div>
		</c:if>
	</div>
	<!-- 검색 영역 -->
	<div class="search_wrap">
		<form id="searchForm" action="/member/notice/list" method="get">
			<div class="search_input">
				<select name='type'>
					<option value=""
						<c:out value="${pageMaker.criNo.type == null?'selected' : '' }"/>>--</option>
					<option value="T"
						<c:out value="${pageMaker.criNo.type eq'T'?'selected' : '' }"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.criNo.type eq'C'?'selected' : '' }"/>>내용</option>
					<option value="W"
						<c:out value="${pageMaker.criNo.type eq'W'?'selected' : '' }"/>>작성자</option>
					<option value="TC"
						<c:out value="${pageMaker.criNo.type eq'TC'?'selected' : '' }"/>>제목
						or 내용</option>
					<option value="TWC"
						<c:out value="${pageMaker.criNo.type eq'TWC'?'selected' : '' }"/>>전체</option>
				</select> <input type='text' name='keyword'
					value='<c:out value="${pageMaker.criNo.keyword}"/>' /> <input
					type='hidden' name='pageNum'
					value='<c:out value="${pageMaker.criNo.pageNum}"/>' /> <input
					type='hidden' name='amount'
					value='<c:out value="${pageMaker.criNo.amount }"/>' />
				<button class='btn search_btn'>검색</button>
			</div>
		</form>
	</div>
	<div class="pageMaker_wrap">

		<ul class="pageMaker">

			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageMaker_btn prev"><a
					href="${pageMaker.startPage - 1}">이전</a></li>
			</c:if>

			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="num">
				<li class="pageMaker_btn ${pageMaker.criNo.pageNum == num ? "active":""}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageMaker_btn next"><a
					href="${pageMaker.endPage + 1 }">다음</a></li>
			</c:if>

		</ul>

	</div>
	<form id="moveForm" action="/member/notice/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.criNo.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.criNo.amount}">
		<input type='hidden' name='type' value='<c:out value="${pageMaker.criNo.type }"/>'>
		<input type="hidden" name="keyword" value="${pageMaker.criNo.keyword}">
	</form>


	<script>
		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

				if (result === '') {
					return;
				}

				if (result === "enrol success") {
					alert("등록이 완료되었습니다.");
				}

			}

		});
		let moveForm = $('#moveForm');

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();
		});

		var serachForm = $("#searchForm");

		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {


			$("#searchForm button").on("click", function(e) {
				if (!searchForm.find("option:selected").val()) {
					alert("검색 종류를 선택하세요.")
					return false;
				}
				if (!searchForm.find("input[name='keyword']").val()) {
					alert("키워드를 입력하세요.");
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();

				searchForm.submit();
			});
		});
		$(".move").on("click", function(e){
			e.preventDefault();
			moveForm.append("<input type='hidden' name='boardId' value='"+$(this).attr("href")+"'>");
			moveForm.attr("action", "/member/notice/get");
			moveForm.submit();
			
		});
	</script>

</body>
</html>