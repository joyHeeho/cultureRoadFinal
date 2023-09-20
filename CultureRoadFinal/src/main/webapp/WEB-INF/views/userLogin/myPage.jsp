<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		$(function(){
			$("#updateMyPageBtn").click(function(){
				location.href="/userLogin/enterPw";
			})
			$("#deleteAccountBtn").click(function(){
				location.href="/userLogin/enterPw2";
			})
			$("#mainPageBtn").click(function(){
				location.href="/userLogin/main";
			})
			$("#myOrderListBtn").click(function(){
				location.href="/userLogin/myOrderList";
			})
		})
	</script>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg" style="width: 50%;">
			</div>
			<c:if test="${empty userLogin}">
				<form class="form-signin" id="loginForm">
				<h1>로그인을 해주세용</h1>
				</form>
			</c:if> 
			
			<c:if test = "${not empty userLogin}">
				<form id="myPage"> 
					<div>
						<label>이름</label>
						<label>${userLogin.userName}</label>				
					</div>
					<div>
						<label>아이디</label>
						<label>${userLogin.userId}</label>
					</div>
					<div>
						<label>이메일</label>
						<label>${userLogin.userEmail}</label>
					</div>
					<div>
						<label>전화번호</label>
						<label>${userLogin.userPhone}</label>
					</div>
					<div>
						<label>생년월일</label>
						<label>${userLogin.userBirth }</label>
					</div>
					<div>
						<label>가입일</label>
						<label>${userLogin.userDate }</label>
					</div>
					<button type="button" id="updateMyPageBtn" name="updateMyPageBtn">정보 수정</button>
					<button type="button" id="mainPageBtn" name="mainPageBtn">메인페이지로</button>
					<button type="button" id="deleteAccountBtn" name="deleteAccountBtn">회원탈퇴</button>
					<button type="button" id="myOrderListBtn" name="myOrderListBtn">나의 예매내역</button>
				</form>
			</c:if>	
		</div>		
		
		
		
	</body>
</html>