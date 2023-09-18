<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	
	<script type="text/javascript">
	
	 function isUserPwValid(userPw) {
	     let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{9,20}$/;
	     
	     if (regex.test(userPw)) {
	         // 유효성 검사 통과
	          alert("적합한 비밀번호입니다.");
	         pwCheckPassed = true;
	     } else {
	    	 alert("사용할 수 없는 비밀번호 입니다. 소문자, 대문자, 숫자, 특수문자를 조합하여 9~20자 내외로 입력하세요.");
	         $("#userPw").val(""); 
	         $("#userPwConfirm").val(""); 
	         $("#userPw").focus();
	     }
	 }
	 
	function userPwEquals(userPw, userPwConfirm) {
		if(userPw === userPwConfirm) {
			$("#newPwForm").attr({
				"method" : "post",
				"action" : "/userLogin/updatePw"
			});
			$("#newPwForm").submit();
		} else {
			alert("비밀번호와 비밀번호 확인이 같지 않습니다. 다시 입력해 주세요.");
			$("#userPw").val(""); 
	        $("#userPwConfirm").val(""); 
	        $("#userPw").focus();
		}
	}
	
		$(function(){
			$("#cancelBtn").click(function(){
				location.href="userLogin/loginUser";
			})
			
			$("#newPwBtn").click(function(){
				let userId = $("#userId").val();
				let userPw = $("#userPw").val();
				let userPwConfirm = $("#userPwConfirm").val();
				if(!chkData("#userId","아이디를")) return;
	            else if(!chkData("#userPw","새로운 비밀번호를")) return;
	            else if(!chkData("#userPwConfirm","비밀번호 확인을")) return;
	            else {
	            	isUserPwValid(userPw);
	            	userPwEquals(userPw, userPwConfirm)
	            }
			});
		});
		
	</script>

	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
			</div>
			<form id="newPwForm">
				<label>아이디</label>
				<input type="text" id="userId" name="userId" />
				<label>새로운 비밀번호 입력</label>
				<input type="password" id="userPw" name="userPw" />
				<label>비밀번호 확인</label>
				<input type="password" id="userPwConfirm" name="userPwConfirm" />
				<button type="button" id="newPwBtn" name="newPwBtn">비밀번호 업데이트</button>
				<button type="button" id="cancelBtn" name="cancelBtn">취소</button>
			</form>
		</div>
	</body>
</html>