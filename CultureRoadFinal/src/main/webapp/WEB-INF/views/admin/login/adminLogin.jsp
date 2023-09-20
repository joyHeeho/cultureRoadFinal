<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	<script type="text/javascript">
		function resetData(){
			$("#managerId").val("");
			$("#managerPw").val("");
			$("#managerId").focus();
		}
	
		$(function(){
			$("#loginBtn").click(function(){
				let managerId = $("#managerId").val();
				let managerPw = $("#managerPw").val();
					$.ajax({
						type : "post",
						url : "/admin/login",
						data : {managerId : managerId, managerPw : managerPw},
						success : function(result) {
							if(result === "1") {
								$("#loginForm").attr({
									method : "post",
									action : "/admin/loginProcess"
								})
								$("#loginForm").submit();
								} else {
								alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
								resetData();
							}
						}, error : function(){
							alert("서버오류");
						}
					});
				})
		})
	</script>
	</head>
	<body>
		<div class="container">
			
			<div>
				<c:if test="${empty adminLogin}">
					<div class="logo">
						<h2>관리자 로그인</h2>
					</div>
					<form id="loginForm">
						<div>
							<label>아이디</label> <input type="text" name="managerId" id="managerId">
						</div>
						<div>
							<label>비밀번호</label> <input type="password" name="managerPw" id="managerPw">
						</div>
						<button type="button" id="loginBtn" name="loginBtn">로그인</button>
						<button type="button" id="cancelBtn" name="cancelBtn">취소</button>
					</form>
				</c:if>
				<c:if test="${not empty adminLogin}">
					
					 <a href="/admin/main" class="btn-success">관리자 페이지</a>
				</c:if>
			</div>
		</div>	
	</body>
</html>


