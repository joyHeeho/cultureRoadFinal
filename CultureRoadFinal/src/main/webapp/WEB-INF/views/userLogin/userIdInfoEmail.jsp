<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

	<script type="text/javascript">
	$(function(){
		$("#loginUser").click(function(){
			location.href="/userLogin/loginUser";
		});
		
		$("#pwReset").click(function(){
			location.href="/userLogin/findPwEmailForm";
		})
	
	})
	
	</script>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
			</div>
			<c:if test="${empty userIdInfo}">
				<form class="form-signin" id="loginForm">
				<h1>로그인을 해주세용</h1>
				</form>
			</c:if> 
			
			<c:if test = "${not empty userIdInfo}">
				<form> 
					${userIdInfo.userName}님의 아이디는 ${userIdInfo.userId}입니다.
					가입일은 ${userIdInfo.userDate}입니다.
					<button type="button" id="loginUser">로그인</button>
					<button type="button" id="pwReset">비밀번호 재설정</button>
				</form>
			</c:if>
		</div>
	</body>
</html>