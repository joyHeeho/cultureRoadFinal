<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
		$(function(){

			$("#delCancelBtn").click(function(){
				location.href="/userLogin/myPage";
			}) 
			$("#delAccountBtn").click(function(){
				location.href="/userLogin/enterPw2"
			})
		})
	</script>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
			</div>
			<form>
				<h3>탈퇴하시겠습니까?</h3>
				<button type="button" id="delCancelBtn" name="delCancelBtn">취소</button>
				<button type="button" id="delAccountBtn" name="delAccountBtn">탈퇴</button>
			</form>
		</div>
	</body>
</html>