<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Movie Seat Booking</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 <style type="text/css">
        body {
            background-color: #242333;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            font-family: 'Lato', sans-serif;
        }

        .screen-container {
            height: 70px;
            width: 800px;
            margin: 15px 0;
        }

        .screen {
            background-color: #fff;
            height: 100%;
            width: 100%;
            transform: rotateX(-45deg);
            box-shadow: 0 3px 10px rgba(255, 255, 255, 0.7);
        }

.seat {
	background-color: #444451;
	height: 40px;
	width: 40px;
	margin: 5px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.5em;
	cursor: pointer;
}

.container {
	perspective: 1000px;
	margin-bottom: 30px;
}

.row {
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	margin-bottom: 10px;
}

/* 선택된 seat의 배경색을 하늘색으로 변경 */
.seat.selected {
	background-color: #00a2ff;
}

/* 마우스 호버 시 확대 효과 적용 */
.seat:hover {
	transform: scale(1.4);
	transition: transform 0.3s ease;
}
</style>
</head>
<body>

	<form id="paymentForm">
		<input type="hidden" id="id" name="id" value="${movie.id}" /> <input type="hidden" id="id" name="id" value="${movie.id}" />
		<div class="movie-container">
			<h2>
				<strong><label for="movie" style="color: white;">선택하신 영화는?! : ${movie.title}</label></strong>
			</h2>

			<c:out value="선택한 날짜: ${param.selectedDate}" />
		</div>

		<div class="container">
			<div class="screen"></div>
			<div>
				<strong><label class="row">인원수에 맞게 자리를 선택하세요.</label></strong>
			</div>
			<br />
			<div class="row">
				<div class="seat" id="seat1">A1</div>
				<div class="seat" id="seat2">A2</div>
				<div class="seat" id="seat3">A3</div>
				<div class="seat" id="seat4">A4</div>
				<div class="seat" id="seat5">A5</div>
				<div class="seat" id="seat6">A6</div>
				<div class="seat" id="seat7">A7</div>
				<div class="seat" id="seat8">A8</div>
			</div>
			<div class="row">
				<div class="seat" id="seat9">B1</div>
				<div class="seat" id="seat10">B2</div>
				<div class="seat" id="seat11">B3</div>
				<div class="seat" id="seat12">B4</div>
				<div class="seat" id="seat13">B5</div>
				<div class="seat" id="seat14">B6</div>
				<div class="seat" id="seat15">B7</div>
				<div class="seat" id="seat16">B8</div>
			</div>
			<div class="row">
				<div class="seat" id="seat17">C1</div>
				<div class="seat" id="seat18">C2</div>
				<div class="seat" id="seat19">C3</div>
				<div class="seat" id="seat20">C4</div>
				<div class="seat" id="seat21">C5</div>
				<div class="seat" id="seat22">C6</div>
				<div class="seat" id="seat23">C7</div>
				<div class="seat" id="seat24">C8</div>
			</div>
			<div class="row">
				<div class="seat" id="seat25">D1</div>
				<div class="seat" id="seat26">D2</div>
				<div class="seat" id="seat27">D3</div>
				<div class="seat" id="seat28">D4</div>
				<div class="seat" id="seat29">D5</div>
				<div class="seat" id="seat30">D6</div>
				<div class="seat" id="seat31">D7</div>
				<div class="seat" id="seat32">D8</div>
			</div>
			<div class="row">
				<div class="seat" id="seat33">E1</div>
				<div class="seat" id="seat34">E2</div>
				<div class="seat" id="seat35">E3</div>
				<div class="seat" id="seat36">E4</div>
				<div class="seat" id="seat37">E5</div>
				<div class="seat" id="seat38">E6</div>
				<div class="seat" id="seat39">E7</div>
				<div class="seat" id="seat40">E8</div>
			</div>
			<div class="row">
				<div class="seat" id="seat41">F1</div>
				<div class="seat" id="seat42">F2</div>
				<div class="seat" id="seat43">F3</div>
				<div class="seat" id="seat44">F4</div>
				<div class="seat" id="seat45">F5</div>
				<div class="seat" id="seat46">F6</div>
				<div class="seat" id="seat47">F7</div>
				<div class="seat" id="seat48">F8</div>
			</div>
		</div>


		<div class="text">
			<label id="seating">선택하신 좌석수는!!</label> <input type="text" id="count" class="form-control count" name="seatCount" readonly="readonly"> <br /> <label id="price">가격은!!</label> <input type="text" id="total" class="form-control total" name="pricetotal" readonly="readonly">
		</div>
		<button type="button" id="paymentBtn" name="payment" class="payment" data-num="${movie.id}">결제하기</button>
	</form>
	<!-- jQuery를 사용한 스크립트 -->
	<script type="text/javascript">
	$(function() {
	    let selectedSeats = []; // 배열을 생성하여 선택한 좌석 ID를 저장

	    $("#paymentBtn").click(function() {
	        // 입력 값 체크
	        if (selectedSeats.length === 0) {
	            alert("좌석을 선택해 주세요!!!");
	            return false;
	        } else {
	            // 선택한 좌석 개수와 가격을 보여줌
	            let confirmation = confirm("선택하신 좌석 개수는 " + selectedSeats.length + "개 가격은 " + calculateTotalPrice(selectedSeats) + "원 입니다. 결제 페이지로 넘어가시겠습니까?");

	            if (confirmation) {
	                // 사용자가 확인을 클릭한 경우, 매핑으로 넘어감
	                $("#paymentForm").attr({
	                    "method": "post",
	                    "action": "/movie/payment"
	                });

	                // 선택한 좌석 ID 배열을 숨겨진 입력 필드에 설정
	                $("#paymentForm").append('<input type="hidden" name="selectedSeats" value="' + selectedSeats.join(',') + '">');

	                $("#paymentForm").submit();
	            } else {
	                // 사용자가 취소를 클릭한 경우, 현재 페이지에 남음
	            }
	        }
	    });

	    $(".seat").click(function() {
	        // 클릭된 seat 요소에 대한 작업을 수행합니다.
	        $(this).toggleClass("selected"); // 클릭 시 "selected" 클래스를 추가 또는 제거하여 배경색 변경

	        // 선택한 좌석의 ID를 배열에 추가 또는 제거
	        let seatId = $(this).attr("id");
	        let index = selectedSeats.indexOf(seatId);
	        if (index !== -1) {
	            selectedSeats.splice(index, 1); // 선택 취소 시 배열에서 제거
	        } else {
	            selectedSeats.push(seatId); // 선택 시 배열에 추가
	        }

	        // 선택한 좌석 수 계산
	        $("#count").val(selectedSeats.length + "개 좌석입니다.");

	        // 가격 계산 및 업데이트
	        $("#total").val(calculateTotalPrice(selectedSeats) + "원 입니다");
	    });

	    function calculateTotalPrice(seats) {
	        let pricePerSeat = 13900; // 1 좌석당 가격
	        return seats.length * pricePerSeat; // 총 가격 계산
	    }
	});

	</script>


</body>
</html>
