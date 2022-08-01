<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../../../resources/css/admin/productEnroll.css">

<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous">
</script>
<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
</style>
</head>
</head>
<body>

	<%@include file="../includes/admin/header.jsp"%>

	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<scan>상품 등록</scan>
		</div>
		<div class="admin_content_main">
			<form role="form" action="/admin/productEnroll" method="post" id="productForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 아이디</label>
					</div>
					<div class="form_section_content">
						<input name="productId">
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
					<input id="discount_interface" maxlength="2" value="0"> <input
						name="discount" type="hidden" value="0"> <span
						class="step_val">할인 가격 : <span class="span_discount"></span></span>
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
				<label>상품 이미지</label>
			</div>
			<div class="form_section_content">
				<input type="file" name='uploadFile' multiple>
			</div>
			<div class='uploadResult'></div>
			<div class="btn_section">
				<input type="submit">
				<button type="button" onclick="location.href = 'main' ">취소</button>
			</div>
			</form>
		</div>

		<div class="admin_content_wrap">
			<div class="admin_content_subject">
				<span>상품 등록</span>
			</div>
		</div>
	</div>

	<%@include file="../includes/admin/footer.jsp"%>

	<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	$("button[id='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
		
		var str ="";
	$(".uploadResult ul li").each(function(e){
		var jobj = $(obj);
		console.dir(jobj);
		
		str += "<input type='hidden' name = 'imageVO["+i+"].fileName' value ='"+jobj.data("filename")+"'>";
		str += "<input type='hidden' name = 'imageVO["+i+"].uuid' value ='"+jobj.data("uuid")+"'>";
		str += "<input type='hidden' name = 'imageVO["+i+"].uploadPath' value ='"+jobj.data("uploadPath")+"'>";
		str += "<input type='hidden' name = 'imageVO["+i+"].fileFormat' value ='"+jobj.data("fileFormat")+"'>";
		});
		formObj.append(str).submit;
		$("#productForm").submit();
	});
	var regex = new RegExp("(.*?)\.(jpg|png|gif|JPG|PNG|GIF)$");
	var maxSize = 5242880;
	
	function checkExtendsion(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	$("input[type='file']").change(function(e){
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		for(var i = 0; i <files.length; i++){
			if(!checkExtendsion(files[i].name, files[i].size)){
				
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type:'POST',
			dataType: 'json',
			success: function(result){
				console.log(result);
				showUploadResult(result);
			}
		}); //$.ajax
	});
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){retrun;}
		
		var uploadUL = $(".uploadResult ul");
		var str ="";
		
		$(uploadResultArr).each(function(i, obj){
			if(obj.image){
			var fileCallPath = encodeURIComponent( obj.uploadPath+"/"+"s_"+obj.uuid+"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str += "><div>";
			str += "<span> "+obj.fileName+"</span>"
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='imgae' calss='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
			}
		});
		uploadUL.append(str);
	}
	$(".uploadResult").on("click","button",function(e){
		console.log("delete file");
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				alert(result);
				targetLi.remove();
				}
			}); //$.ajax
		});
	});

	
/* 취소 버튼
$("#cancelBtn").click(function(){
	
	location.href="/admin/main;"
	
});
/* 상품 등록 버튼 
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	var str = "";*/
	

/* 할인율 Input 설정 */
$("#discount_interface").on("propertychange change keyup paste input", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='discount']");
	
	let discountRate = userInput.val();					// 사용자가 입력할 할인값
	let sendDiscountRate = discountRate / 100;					// 서버에 전송할 할인값
	let price = $("input[name='price']").val();			// 원가
	let lastPrice = price * (1 - sendDiscountRate);		// 할인가격
	        
	$(".span_discount").html(lastPrice);
	
	discountInput.val(sendDiscountRate);	
	
});	

$("input[name='price']").on("change", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='discount']");
	
	let discountRate = userInput.val();					// 사용자가 입력한 할인값
	let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
	let price = $("input[name='price']").val();			// 원가
	let lastPrice = price * (1 - sendDiscountRate);		// 할인가격
	
	$(".span_discount").html(lastPrice);
	
});

</script>


</body>
</html>