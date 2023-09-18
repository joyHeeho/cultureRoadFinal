<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
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

				            $("#emailConfirm").click(function(){
								console.log($("#emailChkText").val());
									if($("#emailChkText").val() === randomString){
				        				alert("인증되었습니다.");
				        				$("#findIdEmailForm").attr({
				        					"method" : "post",
				        					"action" : "/userLogin/findId"
				        				})
				        				$("#findIdEmailForm").submit();
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
	
		$(function(){
			$("#emailConfirmForm").hide();
				
			$("#findIdEmBtn").click(function(){
				if(!chkData("#userName","이름을")) return;
	            else if(!chkData("#userEmail","이메일을")) return;
	            else if(!chkData("#userBirth","생년월일을")) return;
				else{
					let userName = $("#userName").val();
					let userBirth = $("#userBirth").val();
					let userEmail = $("#userEmail").val();	
					$.ajax({
						url : "/userLogin/personalInfoEmail",
						type : "post",
						dataType : "text",
						data : {
							userName : userName, userBirth : userBirth, userEmail : userEmail
						},
						success : function(result) {
							if(result === "같다") {
								alert("회원정보가 일치합니다. 이메일 인증을 진행합니다.");
								$("#emailConfirmForm").show();
							} else {
								alert("회원정보가 일치하지 않습니다.");
							}
						}, error : function() {
							alert("서버 오류");
						}
					});	//ajax 끝
				}
			});	//findIdEmBtn 눌렀을 때
			
			$("#cancelBtn").click(function(){
				location.href="/userLogin/loginUser";
			});	//취소버튼 누르면 다시 로그인창으로 갈 수 있게
			
			$("#sendEmail").click(function(){		//인증번호보내기 버튼 누르기
		    	let userEmail = $("#userEmail").val();	//사용자가 입력한 이메일 
		    	isUserEmailValid(userEmail);
		    });
		}) //$(function(){})함수 끝
		
	</script>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
			</div>
			<form id="findIdEmailForm">
				<div>
					<label>이름</label>	
					<input type="text" id="userName" name="userName" placeholder="이름을 입력하세요"/>
				</div>
				<div>
					<label>생년월일</label>
					<input type="text" id="userBirth" name="userBirth" />
				</div>
				<div>
					<label>이메일</label>
					<input type="text" id="userEmail" name="userEmail"  placeholder="가입시 등록한 이메일을 입력하세요" />
				</div>
				<button type="button" id="findIdEmBtn" name="findIdEmBtn">확인</button>
				<button type="button" id="cancelBtn" name="cancelBtn">취소</button>
			</form>
			<form id="emailConfirmForm">
				<button type="button" id="sendEmail" name="sendEmail">인증 요청</button>
				<label>인증코드 입력</label>
				<input type="text" id="emailChkText" name = "emailChkText" />
				<button type="button" id="emailConfirm" name ="emailConfirm">인증 확인</button>
			</form>
		</div>
	</body>
</html>