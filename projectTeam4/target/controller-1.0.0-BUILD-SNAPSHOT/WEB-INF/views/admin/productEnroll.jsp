<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/admin/productEnroll.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <%@include file="../includes/admin/header.jsp" %>
    
    <div class="admin_content_main">
                    	<form action="/admin/productEnroll" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 아이디</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="productID">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회사 아이디</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="companyId" value="0">
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="productName">
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="stock">
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="price" value="0">
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="discount">
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>최종 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="lastPrice">
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>등록일자</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="regDate">
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>최종 수정일자</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="lastUpdate">
                    			</div>
                    		</div>        		
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>  
    
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                </div>
            
               <%@include file="../includes/admin/footer.jsp" %>
               
               <script>

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/goodsManage"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	enrollForm.submit();
	
});

</script> 
               
</body>
</html>