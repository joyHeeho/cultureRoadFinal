<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>결제 취소</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <style>
    body {
      background: linear-gradient(to right, #ff9999, #ffcc99);
    }
    .container {
      background: rgba(255, 255, 255, 0.9);
      border-radius: 20px;
      box-shadow: 0 8px 32px rgba(0,0,0,0.2);
      overflow: hidden;
      margin-top: 3rem;
      padding: 2rem;
    }
    h1 {
      color: #ff6666;
      padding: 20px;
      text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
    }
    .card {
      border: none;
      background-color: transparent;
      border-radius: 10px;
      box-shadow: 0 6px 10px rgba(0,0,0,0.1);
    }
    .card-header {
      background: linear-gradient(to bottom right, #ff6666, #ff9966);
      color: #ffffff;
      text-transform: uppercase;
      letter-spacing: 1px;
      padding: 15px;
      border: none;
      border-radius: 0;
    }
    .card-body {
      padding: 0;
    }
    .btn-cancel {
      background-color: #ff6666;
      color: white;
      border: none;
      padding: 8px 20px;
      border-radius: 5px;
      cursor: pointer;
    }
    .btn-cancel:hover {
      background-color: #ff4d4d;
    }
  </style>
  
</head>

<body>
  <div class="container">
    <h1 class="text-center mb-5"><i class="fas fa-times-circle"></i> 결제 취소</h1>
    <div class="card">
      <div class="card-header">
        취소 정보
      </div>
      <div class="card-body">
        <div class="mb-3">
          <strong>결제번호:</strong> 12345
        </div>
        <div class="mb-3">
          <strong>결제 ID:</strong> ORD123
        </div>
        <div class="mb-3">
          <strong>유저 ID:</strong> USER456
        </div>
        <div class="mb-3">
          <strong>취소 사유:</strong> 고양이가 결제잘못눌렀어요
        </div>
        <div>
          <button class="btn-cancel" data-bs-toggle="modal" data-bs-target="#cancelConfirmationModal">결제 취소</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Cancel Confirmation Modal -->
  <div class="modal fade" id="cancelConfirmationModal" tabindex="-1" aria-labelledby="cancelConfirmationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="cancelConfirmationModalLabel">결제 취소 확인</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>정말로 결제를 취소하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-cancel">결제 취소</button>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script> //결제취소 스크립트
function cancelPayment(mvPaymentId) {
    // 서버에 결제 취소를 요청
    $.ajax({
        type: "POST",
        url: "/payment/cancel",
        data: JSON.stringify({ mvPaymentId: mvPaymentId }),
        contentType: "application/json",
        success: function(response) {
            if(response.status === "success") {
                alert("환불 처리가 완료되었습니다.");
            } else {
                alert("환불 처리 실패: " + response.message);
            }
        }
    });
}
  
  //결제취소 버튼
  document.addEventListener("DOMContentLoaded", function() {
    var cancelPaymentBtn = document.querySelector(".btn-cancel");
    cancelPaymentBtn.addEventListener("click", function() {
        // 여기에서 아임포트 결제 취소 API를 호출하고 서버에 알릴 수 있습니다.
        var paymentId = "1"; // 실제로는 결제 ID를 동적으로 가져와야 합니다.
        cancelPayment(paymentId); // 예를 들어 이런 식으로 함수를 호출함.
    });
});
  
// //   메인이동
// 	    document.addEventListener("DOMContentLoaded", function() {
// 	        var cancelPaymentBtn = document.querySelector(".btn-cancel");
// 	        cancelPaymentBtn.addEventListener("click", function() {
// 	            window.location.href = "http://localhost:9090";
// 	        });
// 	    });

  </script>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
