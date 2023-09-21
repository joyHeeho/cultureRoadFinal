<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

	<style>
		.logo{
				margin : 0px auto;
				width: 20%;
			}
	</style>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
			</div>
			<div>
				<c:if test = "${not empty userLogin}">
					<form id="myOrderList">
						<label>아이디</label>		
						<label>${userLogin.id }</label>				
						<label>${userLogin.mvPaymentId}</label>
						<label>${userLogin.mvCode }</label>
						<label>${userLogin.mvPayStatus }</label>
						<label>${userLogin.mvOrderDate }</label>
						<label>${userLogin.headCnt }</label>
						<label>${userLogin.date }</label>
						<label>${userLogin.mvPrice }</label>
					</form>
				</c:if>
			</div>
		</div>
	</body>
</html>