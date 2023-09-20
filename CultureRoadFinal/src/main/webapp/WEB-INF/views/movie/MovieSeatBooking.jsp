<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<title>Movie Seat Booking</title>

 <!-- jQuery를 사용한 스크립트 -->
    <script type="text/javascript">
        $(function() {
        	$("#paymentBtn").click(function(){
        	    // 입력 값 체크
        	    var selectedSeatsCount = $("#count").val().replace(/\s/g,"");
        	    if (selectedSeatsCount == "") {
        	        alert("좌석을 선택해 주세요!!!");
        	        $("#count").val("");
        	        $("#count").focus();
        	        return false;
        	    } else {     
        	        var totalPrice = $("#total").val().replace(/\s/g,"");
        	        if (selectedSeatsCount == 0 || totalPrice == "0원 입니다") {
        	            alert("좌석을 선택해 주세요!!!");
        	            return false;
        	        }
        	        
        	        // 선택한 좌석 개수와 가격을 보여줌
        	        var confirmation = confirm("선택하신 좌석 개수는 " + selectedSeatsCount + "가격은 " + totalPrice + " 결제 페이지로 넘어가시겠습니까?");
        	        
        	        if (confirmation) {
        	            // 사용자가 확인을 클릭한 경우, 매핑으로 넘어감
        	            $("#paymentForm").attr({
        	                "method" : "post",
        	                "action" : "/movie/payment"
        	            });
        	            
        	            $("#paymentForm").submit();
        	        } else {
        	            // 사용자가 취소를 클릭한 경우, 현재 페이지에 남음
        	        }
        	    }
        	});



        	
            $(".seat").click(function() {
                // 클릭된 seat 요소에 대한 작업을 수행합니다.
                $(this).toggleClass("selected"); // 클릭 시 "selected" 클래스를 추가 또는 제거하여 배경색 변경

                // 선택한 좌석 수 계산
                var selectedSeats = $(".seat.selected").length;
                $("#count").val(selectedSeats + "개 좌석입니다.");

                // 가격 계산
                var pricePerSeat = 13900; // 1 좌석당 가격
                var totalPrice = selectedSeats * pricePerSeat;

                // 결과를 input 요소에 업데이트
                $("#total").val(totalPrice + "원 입니다");
            });
        });
    </script>



<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	background-color: #242333;
	color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	font-family: 'Lato', sans-serif;
	margin: 0;
}

.screen {
	background-color: #fff;
	height: 70px;
	width: 100%;
	margin: 15px 0;
	transform: rotateX(-45deg);
	box-shadow: 0 3px 10px rgba(255, 255, 255, 0.7);
}

.seat {
	background-color: #444451;
	height: 12px;
	width: 15px;
	margin: 5px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	mar
}

.container {
	perspective: 1000px;
	margin-bottom: 30px;
}

.row {
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
	text-align: center;
	margin-bottom: 10px; /* 필요한 간격으로 조정 */
}

.peplecnt {
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
	text-align: center;
}

/* 선택된 seat의 배경색을 하늘색으로 변경 */
.seat.selected {
	background-color: #00a2ff;
}

/* 마우스 호버 시 확대 효과 적용 */
.seat:hover {
	transform: scale(1.3); /* 1.3배 확대 */
	transition: transform 0.3s ease; /* 확대 효과에 대한 애니메이션 속성 추가 */
}
</style>

</head>
<body>
	<form id="detail" name="detail">
		<input type="hidden" id="id" name="id" value="${movie.id}" />
	</form>

	<div class="movie-container">
		<h2>
			<strong><label for="movie">선택하신 영화는?! :
					${movie.title}</label></strong>
		</h2>
	</div>
	<form></form>
	<div class="container">
		<div class="screen"></div>
		<div>
			<strong><label class="row">인원수에 맞게 자리를 선택하세요.</label></strong>
		</div>
		<br />
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
	</div>
	<form id = "paymentForm">
		<div class = "text">
			<label id = "seating">선택하신 좌석수는!!</label>
			<input type="text" id="count" class="form-control count" name="count" readonly="readonly">
	 	<br />
			<label id = "price">가격은!!</label>
			<input type="text" id="total" class="form-control total" name="total" readonly="readonly">
		</div>
		<button type = "button" id = "paymentBtn" name = "payment" class = "payment" data-num= "${movie.id}">결제하기</button>
	</form>
</body>
</html>