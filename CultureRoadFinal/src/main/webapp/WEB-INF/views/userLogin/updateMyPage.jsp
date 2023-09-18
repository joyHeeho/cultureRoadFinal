<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	<script type="text/javascript">
	let pwCheckPassed = false;
    let emailCheckPassed = false;
    let phoneCheckPassed = false;
    
	function isUserPwValid(userPw, userPwConfirm) {
		let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{9,20}$/;
		
		if (regex.test(userPw)) {
		// 유효성 검사 통과
			if(userPw == userPwConfirm){
				$("#msg1").text("적합한 비밀번호입니다.");
					pwCheckPassed = true;	
				} else {
					$("#msg1").text("입력된 비밀번호가 같지 않습니다.").css("color", "red");
					$("#userPw").val("");
					$("#userPwConfirm").val("");
					$("#userPw").focus();
				}     
		} else {
			$("#msg1").text("사용할 수 없는 비밀번호 입니다. 소문자, 대문자, 숫자, 특수문자를 조합하여 9~20자 내외로 입력하세요.").css("color", "red");
			$("#userPw").val(""); // 비밀번호 필드를 비웁니다.
			$("#userPwConfirm").val("");
			$("#userPw").focus();
		}
	}
	
	 function isUserEmailValid(userEmail) {
		 $.ajax({
			url: "/userLogin/sendRandomString",
			type: "post",
			dataType: "text",
			data: {
				userEmail: userEmail
			},success : function(randomString) {
				if(userEmail!=""){
					//서버로부터 받은 응답을 처리
					console.log(randomString);
					alert("인증번호가 발송되었습니다.");
					emailCheckPassed = false;
					$("#emailConfirm").click(function(){
						console.log($("#emailChkText").val());
						if($("#emailChkText").val() === randomString){
							alert("인증되었습니다.");
							emailCheckPassed = true;
						}else{
							alert("인증번호를 다시 입력해 주세요.");
						}
						console.log("randomString:" + randomString + "사용자 입력값 : " + $("#emailChkText").val());
					})
				}	
			}, error : function(){
				alert("이메일을 정확하게 입력해 주세요.");
			}
		})
	}
	 
	function phoneConfirm(to){
		$.ajax({
			url : "/sms/send",
			type : "post",
			data : {
				to : to 
			},success : function(response){
				console.log(response.statusName);
				if(response.statusName == "success"){
					$("#phoneConfirm").click(function(){
						console.log(response.createSmsKey);
						let phoneChkText = $("#phoneChkText").val();
						if(response.createSmsKey === phoneChkText) {
							phoneCheckPassed = true;
							alert("전화번호 인증 성공");
							phoneCheckPassed = true;
						}else {
							alert("인증번호가 틀렸습니다.");	
							$("#phoneChkText").val("");
						}
					})
				}
			}
		})
	}	
	
	$(function(){
		
		
	    $("#sendEmail").click(function(){
			let userEmail = $("#userEmail").val();	//사용자가 입력한 이메일 
	    	isUserEmailValid(userEmail);
	    });
	   
	    $("#phoneChk").click(function(){
	    	let to = $("#userPhone").val();
	    	phoneConfirm(to);
	    });
	    	
		$("#cancelBtn").click(function(){
			location.href="/userLogin/main";
		});
		
		$("#updateMyPageBtn").click(function () {
			let userPw = $("#userPw").val();
		    let userPwConfirm = $("#userPwConfirm").val();

		    // 비밀번호 유효성 검사
		    if (userPw.length > 0) {
		    	isUserPwValid(userPw, userPwConfirm);
				if (!pwCheckPassed) {
					alert("비밀번호를 다시 확인해 주세요.");
					return; // 유효성 검사 실패 시 함수 종료
					}
		        }
		        // 이메일 또는 핸드폰 인증이 완료되었는지 확인
			if (emailCheckPassed || phoneCheckPassed || userPw.length > 0) {
		            // 폼 제출
				$("#myPageForm").attr({
					"method": "post",
					"action": "/userLogin/updateMyPage"
				});
				$("#myPageForm").submit();
			} else {
				alert("비밀번호, 이메일 또는 핸드폰 인증이 완료되지 않았습니다.");
		        }
		    });
	});//$함수 종료
			

	</script>
	
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
			</div>
			<c:if test="${empty userLogin}">
				<form class="form-signin" id="loginForm">
				<h1>로그인을 해주세용</h1>
				</form>
			</c:if>
			<c:if test = "${not empty userLogin}">
				<form id="myPageForm"> 
					<div>
						<label>이름</label>
						<label>${userLogin.userName}</label>				
					</div>
					<div>
						<label>아이디</label>
 		                <input type="hidden" id="userId" name="userId" value="${userLogin.userId}">
						<label>${userLogin.userId}</label>
					</div>
					<div>
						<label>비밀번호</label>
						<input type="password" id="userPw" name="userPw" maxlength="20" placeholder="비밀번호를 입력해 주세요." />
						<label>비밀번호 확인</label>
						<input type="password" id="userPwConfirm" name="userPwConfirm" />
						<button type="button" id="pwChk" name="pwChk">비밀번호체크</button>
						<span id="msg1"></span>			
					</div>
					<div>
						<label>이메일</label>
						<input type="email" id="userEmail" name="userEmail" />
						<button type="button" id="sendEmail" name="sendEmail">인증 요청</button>
						<label>인증코드 입력</label>
						<input type="text" id="emailChkText" name = "emailChkText" />
						<button type="button" id="emailConfirm" name ="emailConfirm">인증 확인</button>
					</div>
					<div>
						<label>전화번호</label>
						<input type="text" id="userPhone" name="userPhone"/>
						<button type="button" id="phoneChk" name="phoneChk">인증 요청</button>
						<br/>
						<input type="text" id="phoneChkText" name="phoneChkText" />
						<button type="button" id="phoneConfirm" name="phoneConfirm">인증 확인</button>
					</div>
					<div>
						<label>생년월일</label>
						<label>${userLogin.userBirth }</label>
					</div>
					<div>
						<label>가입일</label>
						<label>${userLogin.userDate }</label>
					</div>
					<button type="button" id="updateMyPageBtn" name="updateMyPageBtn">수정 완료</button>
					<button type="button" id="cancelBtn" name="cancelBtn">메인페이지로</button>
				</form>
			</c:if> 
		</div>	
	</body>
</html>