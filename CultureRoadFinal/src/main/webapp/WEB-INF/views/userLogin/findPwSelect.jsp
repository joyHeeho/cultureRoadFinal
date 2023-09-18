<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function(){
			$("#findPwEmail").click(function(){
				location.href="/userLogin/findPwEmailForm";
			})
			
			$("#findPwPhone").click(function(){
				location.href="/userLogin/findPwPhoneForm";
			})
		})	
	</script>
	</head>
	<body>
		<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
		</div>
		<h1>비밀번호 찾기</h1>
		<button type="button" id="findPwEmail">이메일로 찾기</button>
		<button type="button" id="findPwPhone">전화번호로 찾기</button>
	</body>
</html>