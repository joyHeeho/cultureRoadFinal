<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<%@ include file="/WEB-INF/views/common/common.jspf" %>--%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>






.table {
	border: none;
	margin: 0;
}

.table th {
	border: none;
}

.table tbody tr {
	border: none;
	border-bottom: 1px solid #ccc;
}


  .cancelled-payment {
        color: red;
        font-weight: bold;
        background-color: rgba(0, 0, 0, 0.05);
        }
</style>
	<c:if test="${empty userLogin}">
		<script type="text/javascript">
			$(document).ready(function() {
				let userNo = ${userLogin.userNo};
				alert("로그인 후에 결제 내역을 확인할 수 있습니다.");
				window.location.href = "/user/loginUser"; // 로그인 페이지 URL로 변경
				console.log(userNo);
			})
		</script>
	</c:if>
</head>
<body>

	<div class="container my-5 p-5">
		<h1 class="text-center mb-5">
			<i class="fas fa-receipt"></i> 주문 내역
		</h1>
		<img src="/resources/main/img/Get.jpg" alt="바코드"/>
		<img src="/resources/main/img/Get.jpg" alt="포스터"/>
		<form method="post" id="frm">
			<c:forEach items="${orderDetails}" var="orderDetail">
				<div class="card">
					<div class="card-header">주문 정보</div>
					<div class="card-body">
						<input type="hidden" id="mvPaymentId" name="mvPaymentId">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">주문번호</th>
									<td>${orderDetail.mvOrderId}</td>
								</tr>
								<tr>
									<th scope="row">주문아이디</th>
									<td>${orderDetail.mvPaymentId}</td>
								</tr>
								<tr>
									<th scope="row">유저번호</th>
									<td>${orderDetail.userNo}</td>
								</tr>
								<tr>
									<th scope="row">인원수</th>
									<td>${orderDetail.mvHeadcnt}</td>
								</tr>
								<tr>
									<th scope="row">금액</th>
									<fmt:parseNumber value="${orderDetail.mvHeadcnt}"
										var="mvHeadCnt" />
									<fmt:parseNumber value="${orderDetail.mvPrice}" var="mvPrice" />
									<td>${mvPrice * mvHeadCnt}</td>
								</tr>
								<tr>
									<th scope="row">상영날짜</th>
									<fmt:parseDate var="dateString" value="${orderDetail.mvDate}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<td><fmt:formatDate value="${dateString}"
											pattern="yyyy년 MM월 dd일 HH시" /></td>
								</tr>
								<tr>
									<th scope="row">결제 상태</th>
									<td><c:choose>
											<c:when test="${orderDetail.mvPayStatus eq 1}">
							                    결제 완료
						                    </c:when>
											<c:when test="${orderDetail.mvPayStatus eq 2}">
							                <span class="cancelled-payment">결제 취소</span>

						                    </c:when>
										</c:choose></td>
								</tr>

							</tbody>
						</table>
						<c:if test="${orderDetail.mvPayStatus eq 1}">
							<div class="text-center mt-4">
								<button id="cancelPaymentBtn" class="btn btn-danger"
									type="button" onclick="fn_cancel('${orderDetail.mvPaymentId}')">
									<i class="fas fa-times-circle"></i> 결제 취소
								</button>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</form>
	</div>

	<script>
		// 취소
		function fn_cancel(id) {
			if (confirm("취소하시겠습니까?")) {
				$("#mvPaymentId").val(id);
				$("#frm").attr("action", "/payment/cancel");
				$("#frm").submit();
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
