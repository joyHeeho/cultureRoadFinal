<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common2.jspf" %>
<%@ include file="/WEB-INF/views/admin/common/adminNavHead.jspf" %>
<script type="text/javascript" src="/resources/main/js/jquery-3.7.0.min.js"></script>
<%@ include file="/WEB-INF/views/admin/common/adminNav.jspf" %>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        text-align: center;
        margin-top: 30px;
    }

    table {
        margin: auto;
        border-collapse: collapse;
        width: 80%;
        background-color: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 15px 25px;
        text-align: center;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr {
        transition: background-color 0.3s ease;
        cursor: pointer;
    }

    tr:hover {
        background-color: #ddd;
    }

    @keyframes rowFadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    tr.row {
        animation: rowFadeIn 1s ease;
    }

    tr.selected {
        background-color: #ffa500;
        color: white;
    }

    /* 취소 버튼 스타일 */
    button.cancel-button {
        background-color: #ff0000;
        color: #fff;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 4px;
    }

    button.cancel-button:hover {
        background-color: #cc0000;
    }
    
      .cancelled-payment {
        color: red;
        font-weight: bold;
        background-color: rgba(0, 0, 0, 0.05);
        }
</style>
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
                                <th class="border-top-0">결제 상태</th>
                                <th class="border-top-0">결제 취소</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${details}" var="detail">
                                    <tr class="row" onclick="toggleSelected(this)">
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
                                                <span class="cancelled-payment">결제 취소</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${detail.mvPayStatus eq 1}">
                                                    <button class="cancel-button" onclick="fn_cancel('${detail.mvPaymentId}')">취소</button>
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
        if (confirm("취소하시겠습니까?")) {
            $("#mvPaymentId").val(id);
            $("#frm").attr("action", "/adminpay/paymentCancel");
            $("#frm").submit();
        }
    }

    function toggleSelected(rowElement) {
        rowElement.classList.toggle('selected');
    }
</script>
<footer class="footer text-center"> 2023 문화빛길 </footer>
<script type="text/javascript" src="/resources/main/js/jquery-3.7.0.min.js"></script>
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
