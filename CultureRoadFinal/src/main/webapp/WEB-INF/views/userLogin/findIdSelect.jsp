<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function(){
			$("#findIdEmail").click(function(){
				location.href="/userLogin/findIdEmailForm";
			})
			
			$("#findIdPhone").click(function(){
				location.href="/userLogin/findIdPhoneForm";
			})
		})	
	</script>
	</head>
	<body>
		<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
		</div>
		<h1>아이디 찾기</h1>
		<button type="button" id="findIdEmail">이메일로 찾기</button>
		<button type="button" id="findIdPhone">전화번호로 찾기</button>
	</body>
</html>