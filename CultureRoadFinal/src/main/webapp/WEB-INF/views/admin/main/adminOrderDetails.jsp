<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common2.jspf" %>
<%@ include file="/WEB-INF/views/admin/common/adminNavHead.jspf" %>
<%@ include file="/WEB-INF/views/admin/common/adminNav.jspf" %>
<style>
    /* 페이지 스타일 추가 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container-fluid {
        padding: 20px;
    }

    .white-box {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    table.table {
        border-collapse: collapse;
        width: 100%;
    }

    table.table th,
    table.table td {
        padding: 12px 15px;
        text-align: left;
    }

    table.table th {
        background-color: #f2f2f2;
    }

    .text-nowrap {
        white-space: nowrap;
    }

    /* 버튼 스타일 추가 */
    button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 4px;
    }

    button:hover {
        background-color: #0056b3;
    }
    
    
</style>
<script type="text/javascript">
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<div class="white-box">
				<h3 class="box-title">Basic Table</h3>
				<p class="text-muted">Add class <code>.table</code></p>
				<div class="table-responsive">
					<form id="frm" method="post">
						<input type="hidden" id="mvPaymentId" name="mvPaymentId">
						<table class="table text-nowrap">
							<thead>
							<tr>
								<th class="border-top-0">주문번호</th>
								<th class="border-top-0">주문아이디</th>
								<th class="border-top-0">유저번호</th>
								<th class="border-top-0">인원수</th>
								<th class="border-top-0">금액</th>
								<th class="border-top-0">상영날짜</th>
								<th class="border-top-0">상태</th>
								<th class="border-top-0">결제 취소</th>
							</tr>
							</thead>
							<tbody>
								<c:forEach items="${details}" var="detail">
									<tr>
										<td>${detail.mvOrderId}</td>
										<td>${detail.mvPaymentId}</td>
										<td>${detail.userNo}</td>
										<td>${detail.mvHeadcnt}</td>
										<td>
											<fmt:parseNumber value="${detail.mvHeadcnt}" var="mvHeadCnt"/>
											<fmt:parseNumber value="${detail.mvPrice}" var="mvPrice"/>
											${mvPrice * mvHeadCnt}
										</td>
										<td>
											<fmt:parseDate var="dateString" value="${detail.mvDate}" pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate value="${dateString}" pattern="yyyy년 MM월 dd일 HH시" />
										</td>
										<td>
											<c:choose>
												<c:when test="${detail.mvPayStatus eq 1}">
													결제 완료
												</c:when>
												<c:when test="${detail.mvPayStatus eq 2}">
													결제 취소
												</c:when>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${detail.mvPayStatus eq 1}">
													<button onclick="fn_cancel('${detail.mvPaymentId}')">취소</button>
												</c:when>
												<c:when test="${detail.mvPayStatus eq 2}">
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
    // 취소
    function fn_cancel(id) {
        if(confirm("취소하시겠습니까?")) {
            $("#mvPaymentId").val(id);
            $("#frm").attr("action", "/adminpay/paymentCancel");
            $("#frm").submit();
        }
    }
</script>
<footer class="footer text-center"> 2023 문화빛길 
</footer>


<script src="/resources/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="/resources/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/app-style-switcher.js"></script>
<!--Wave Effects -->
<script src="/resources/js/waves.js"></script>
<!--Menu sidebar -->
<script src="/resources/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="/resources/js/custom.js"></script>

</body>
</html>