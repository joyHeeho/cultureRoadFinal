<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Omitted for brevity -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script type="text/javascript" src="/resources/main/js/jquery-3.7.0.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>결제 페이지</title>
    <script>
        $(document).ready(function () {
            const IMP = window.IMP;
            IMP.init("imp15631721");

            $("#btn").click(function () {
                const headCnt = $("#headCnt").val();
                processPayment(headCnt);
            });
        });

        function makeMerchantUid() {
            const today = new Date();
            return today.getHours() + today.getMinutes() + today.getSeconds() + today.getMilliseconds();
        }

        function ajaxCall(url, data, successMessage, failMessage) {
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function (response) {
                    if (response.status === "success") {
                        alert(successMessage);
                    } else {
                        alert(failMessage + ": " + response.message);
                    }
                }
            });
        }
        function processPayment(headCnt) {
            const merchantUid = makeMerchantUid();
            const paymentData = {
                pg: 'html5_inicis',
                pay_method: 'card',
                merchant_uid: merchantUid,
                name: '문화빛길',
                amount:headCnt * 100,
//                 amount: ${movie.price} ,
                buyer_email: 'kimju@co.kr',
                buyer_name: '문화빛길',
                buyer_tel: '010-1234-5678',
                buyer_addr: '서울특별시 강남구 삼성동',
                buyer_postcode: '123-456'
            };
            IMP.request_pay(paymentData, function (rsp) {
                if (rsp.success) {
                    const saveData = {
                    	
                        userNo:${userLogin.userNo} ,
                        mvCode: /*$.movieId}*/12345,
                        mvHeadcnt: headCnt,
                        mvPrice: headCnt * 100,
                        mvDate: rsp.merchant_uid,
                        mvPayStatus: 1,
                    };
                    ajaxCall("/payment/ajax/save", saveData, "결제성공 + 데이터가 성공적으로 저장되었습니다.", "데이터 저장 실패");
                } else {
                    alert("결제 에러: " + rsp.error_msg);
                }
            });
        }
    </script>
<style>
    .big-text {
      font-size: 2rem; /* 글씨 크기 늘림 */
    }
    .bigger-card {
      width: 70%; /* 카드 너비 늘림 */
      margin: auto; /* 중앙정렬 */
    }
    .card {
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* 카드에 그림자 효과 */
      transition: 0.3s; /* 트랜지션 효과 */
    }
    .card:hover {
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.4); /* 카드에 마우스 오버 시 그림자 효과 */
    }
    body {
	background: linear-gradient(to right, #87CEEB, #E0FFFF);
	 }
</style>

</head>
<body>

<div class="container mt-5">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <div class="card">
        <div class="card-header">
          <h4 class="text-center big-text">결제하기</h4>
        </div>
        <div class="card-body">
          <form>
            <div class="form-group">
              <label for="headCnt" class="big-text">인원 수 선택</label>
              <select id="headCnt" class="form-control big-text">
                <c:forEach begin="1" end="5" step="1" var="i">
                  <option value="${i}">${i}명</option>
                </c:forEach>
              </select>
            </div>
            <button type="button" id="btn" class="btn btn-primary btn-block big-text">결제하기</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- 부트스트랩 및 jQuery JS -->

<script type="text/javascript" src="/resources/main/js/jquery-3.7.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>