<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/admin/memberEnroll.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>

<body>
	<%@include file="../includes/admin/header.jsp" %>
	
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>회원 등록</span></div>	
                     <div class="admin_content_main">
                    	<form action="/admin/memberEnroll.do" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회원 아이디</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name=memberID>
                    				 <span id="warn_memberID">아이디를 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회원 비밀번호</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name=memberPW>
                    				 <span id="warn_memberPW">비밀번호를 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회원 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name=memberName>
                    				 <span id="warn_memberName">회원 이름을 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회원 생년월일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name=memberBirth>
                    				 <span id="warn_memberBirth">생년월일을 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회원 이메일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name=memberEmail>
                    				 <span id="warn_memberEmail">이메일을 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회원 주소1</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name=memberAdd1>
                    				 <span id="warn_memberAdd1">첫번째 주소를 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회원 주소2</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="memberAdd2">
                    				<span id="warn_memberAdd2">두번째 주소를 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>회원 전화번호</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="memberTel">
                    				<span id="warn_memberTel">전화번호를 입력 해주세요.</span>
                    			</div>
                    		</div>
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>
                </div>
                
                	<script>        
            /* 등록 버튼 */
            $("#enrollBtn").click(function(){    
                /* 검사 통과 유무 변수 */
                let memberIDCheck = false;           
                let memberPWCheck = false;      
                let memberNameCheck = false;      
                let memberBirthCheck = false;       
                let memberEmailCheck = false;           
                let memberAdd1Check = false;           
                let memberAdd2Check = false;       
                let memberTelCheck = false;          
             
                /* 입력값 변수 */
                let memberID = $('input[name=memberID]').val();      
                let memberPW = $('input[name=memberPW]').val();       
                let memberName = $('input[name=memberName]').val();
                let memberBirth = $('input[name=memberBirth]').val();
                let memberEmail = $('input[name=memberEmail]').val();
                let memberAdd1 = $('input[name=memberAdd1]').val();
                let memberAdd2 = $('input[name=memberAdd2]').val();
                let memberTel = $('input[name=memberTel]').val();
                /* 공란 경고 span태그 */
                let wMemberID = $('#warn_memberID');      
                let wMemberPW = $('#warn_memberPW');       
                let wMemberName = $('#warn_memberName');
                let wMemberBirth = $('#warn_memberBirth');
                let wMemberEmail = $('#warn_memberEmail');
                let wMemberAdd1 = $('#warn_memberAdd1');
                let wMemberAdd2 = $('#warn_memberAdd2');
                let wMemberTel = $('#warn_memberTel');
                
                /* 아이디 공란 체크 */
                if(memberId ===''){
                    wMemberID.css('display', 'block');
                    memberIdCheck = false;
                } else{
                    wMemberID.css('display', 'none');
                    memberIdCheck = true;
                }
                
                /* 비밀번호 공란 체크 */
                if(memberPW ===''){
                    wMemberPW.css('display', 'block');
                    memberPWCheck = false;
                } else{
                    wMemberPW.css('display', 'none');
                    memberPWCheck = true;
                }    
                
                /* 회원 이름 공란 체크 */
                if(memberName ===''){
                    wMemberName.css('display', 'block');
                    memberNameCheck = false;
                } else{
                    wMemberName.css('display', 'none');
                    memberNameCheck = true;
                }  
                
                /* 생년월일 공란 체크 */
                if(memberBirth ===''){
                    wMemberBirth.css('display', 'block');
                    memberBirthCheck = false;
                } else{
                    wMemberBirth.css('display', 'none');
                    memberBirthCheck = true;
                }    

                /* 이메일 공란 체크 */
                if(memberEmail ===''){
                    wMemberEmail.css('display', 'block');
                    memberEmailCheck = false;
                } else{
                    wMemberEmail.css('display', 'none');
                    memberEmailCheck = true;
                }    
                
                /* 주소1 공란 체크 */
                if(memberAdd1 ===''){
                    wMemberAdd1.css('display', 'block');
                    memberAdd1Check = false;
                } else{
                    wMemberAdd1.css('display', 'none');
                    memberAdd1Check = true;
                }    
                
                /* 주소2 공란 체크 */
                if(memberAdd2 ===''){
                    wMemberAdd2.css('display', 'block');
                    memberAdd2Check = false;
                } else{
                    wMemberAdd2.css('display', 'none');
                    memberAdd2Check = true;
                }  
                
                /* 전화번호 공란 체크 */
                if(memberTel ===''){
                    wMemberTel.css('display', 'block');
                    memberTelCheck = false;
                } else{
                    wMemberTel.css('display', 'none');
                    memberTelCheck = true;
                }    
              
                /* 최종 검사 */
                if(memberIDCheck && memberPWCheck && memberNameCheck && memberBirthCheck && memberEmailCheck
                		 && memberAdd1Check && memberAdd2Check && memberTelCheck){
                    $("#enrollForm").submit();    
                } else{
                    return;
                }
                
            });
        
</script>   
               
               <%@include file="../includes/admin/footer.jsp" %>
    
 
</body>
</html>