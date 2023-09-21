<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />


<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<style>
.culture_day {
	color: red; /* 텍스트 색상을 변경할 수 있습니다. */
	font-weight: bold; /* 텍스트 굵기를 변경할 수 있습니다. */
	:
}
</style>

<body>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Launch static backdrop modal</button>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">


					<div class="container">
						<div id="div_calendar" style="width: 700px;">
							<div>
								<!-- <input type="hidden" onclick="changeMonth(-1);" id="fa1" value="" /> -->
								<button type="button" onclick="changeMonth(-1);">
									<i class="fa fa-chevron-left" id="fa1"></i>
								</button>
								<input type="text" id="year" value="2020" style="width: 80px; display: initial;" class="form-control" readonly="readonly" /> <select id="month" class="form-control" style="width: 80px; display: initial;" onchange="changeMonth();">
									<option value="1">1월</option>
									<option value="2">2월</option>
									<option value="3">3월</option>
									<option value="4">4월</option>
									<option value="5">5월</option>
									<option value="6">6월</option>
									<option value="7">7월</option>
									<option value="8">8월</option>
									<option value="9">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select>
								<!-- <input type="button" onclick="changeMonth(1);" id="fa2" value="" /> -->
								<button type="button" onclick="changeMonth(1);">
									<i class="fa fa-chevron-right" id="fa2"></i>
								</button>
							</div>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>일</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th>토</th>
									</tr>
								</thead>
								<tbody id="tb_body"></tbody>
							</table>
						</div>
						<table>
							<tr>
								<th>예약옵션</th>
							</tr>
							<tr>
								<td>영화 예매일</td>
								<td id="input_date"></td>
							</tr>
						</table>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Understood</button>
				</div>
			</div>
		</div>
	</div>

	<script>
				
		let date = new Date();
		let y = date.getFullYear();
		let m = ('0' + (date.getMonth() + 1)).slice(-2);
		let d = ('0' + date.getDate()).slice(-2);
		let today = document.getElementById("input_date");
		today.innerHTML = y + '-' + m + '-' + d;

		// 날짜 선택을 제한할 최소 날짜 설정 (오늘 이후)
		let minDate = new Date(y, m - 1, d);

		// 이전 날짜 비활성화 함수
		function disablePastDates(date) {
			return date >= minDate;
		}

		$("#fa1").val((Number(m) - 1) + "월");
		$("#fa2").val((Number(m) + 1) + "월");

		function checkLeapYear(year) {
			if (year % 400 == 0) {
				return true;
			} else if (year % 100 == 0) {
				return false;
			} else if (year % 4 == 0) {
				return true;
			} else {
				return false;
			}
		}

		function getFirstDayOfWeek(year, month) {
			if (month < 10)
				month = "0" + month;

			return (new Date(year + "-" + month + "-01")).getDay();
		}

		function changeYearMonth(year, month) {
			let month_day = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

			if (month == 2) {
				if (checkLeapYear(year))
					month_day[1] = 29;
			}

			let first_day_of_week = getFirstDayOfWeek(year, month);
			let arr_calendar = [];
			for (let i = 0; i < first_day_of_week; i++) {
				arr_calendar.push("");
			}

			for (let i = 1; i <= month_day[month - 1]; i++) {
				arr_calendar.push(String(i));
			}

			let remain_day = 7 - (arr_calendar.length % 7);
			if (remain_day < 7) {
				for (let i = 0; i < remain_day; i++) {
					arr_calendar.push("");
				}
			}

			renderCalendar(arr_calendar);
		}

		function renderCalendar(data) {
			let h = [];
			for (let i = 0; i < data.length; i++) {
				if (i == 0) {
					h.push('<tr>');
				} else if (i % 7 == 0) {
					h.push('</tr>');
					h.push('<tr>');
				}

				if (data[i] === "") {
					h.push('<td></td>');
				} else {
					let day = Number(data[i]);
					let selectedDate = new Date(current_year,
							current_month - 1, day);

					if (disablePastDates(selectedDate)) {
						// 새로운 부분: 매달 마지막 수요일인 경우 배경색 빨간색, 글자색 하얀색 및 "문화가 있는 날" 추가
						if (isLastWednesday(selectedDate)) {
							const text = '문화가 있는 날';
							h
									.push('<td class="t_day last-wednesday" id="day' + data[i] + '" style="cursor:pointer;background-color:red;color:white; font-size: 14px; width: 105px;">'
											+ data[i]
											+ '<br>'
											+ '<strong>'
											+ text + '</strong>' + '</td>');
						} else {
							h.push('<td class="t_day" id="day' + data[i]
									+ '" onclick="setDate(' + data[i]
									+ ');" style="cursor:pointer;">' + data[i]
									+ '</td>');
						}
					} else {
						h
								.push('<td class="t_day" id="day' + data[i] + '" style="cursor:not-allowed;">'
										+ data[i] + '</td>');
					}
				}
			}

			h.push('</tr>');

			$("#tb_body").html(h.join(""));
			for (let i = 1; i <= $(".t_day").text().length; i++) {
				if (d == i && m == current_month && y == current_year) {
					$("#day" + i).css("backgroundColor", "#E6FFFF");
				}
			}
		}

		function isLastWednesday(date) {
			const dayOfWeek = date.getDay();
			const year = date.getFullYear();
			const month = date.getMonth();

			const lastDayOfMonth = new Date(year, month + 1, 0).getDate();

			for (let day = lastDayOfMonth; day > 0; day--) {
				const dayOfWeek = new Date(year, month, day).getDay();
				if (dayOfWeek === 3) {
					return date.getDate() === day;
				}
			}

			return false;
		}

		function getLastWednesdayDate(date) {
			const year = date.getFullYear();
			const month = date.getMonth();

			// 현재 달의 마지막 날짜를 가져옵니다.
			const lastDayOfMonth = new Date(year, month + 1, 0).getDate();

			// 현재 달의 마지막 날짜부터 시작하여 수요일인 날짜를 찾습니다.
			for (let day = lastDayOfMonth; day > 0; day--) {
				const dayOfWeek = new Date(year, month, day).getDay();
				if (dayOfWeek === 3) {
					return day;
				}
			}

			return -1; // 수요일을 찾지 못한 경우
		}

		function setDate(day) {//선택할 날짜 가져가기
			// $(".t_day").css("backgroundColor", "white");
			$("#day" + day).css("backgroundColor", "#E6FFFF");
			let text_month = current_month;
			if (day < 10)
				day = "0" + day;
			if (current_month < 10)
				text_month = "0" + text_month;

			$("#date_text").text(current_year + "-" + text_month + "-" + day);

			$("#input_date").html(current_year + "-" + text_month + "-" + day);
			//$("#div_calendar").hide();

		}

		function changeMonth(diff) {
			if (diff == undefined) {
				current_month = parseInt($("#month").val());
			} else {
				current_month = current_month + diff;

				if (current_month == 0) {//전년도로 바뀜
					current_year = current_year - 1;
					current_month = 12;
				} else if (current_month == 13) {//다음년로 바뀜
					current_year = current_year + 1;
					current_month = 1;
				}
			}

			loadCalendar();
			if ((current_month) == Number(m)) {
				$("#fa1").prop("type", "hidden");
				//$("#fa1").css("visibility", "hidden");
			} else {
				$("#fa1").prop("type", "button");
				//$("#fa1").css("visibility", "visible");
			}
			if ((current_month) == (Number(m) + 1)) {
				$("#fa2").prop("type", "hidden");
				//$("#fa2").css("visibility", "hidden");
			} else {
				$("#fa2").prop("type", "button");
				//$("#fa2").css("visibility", "visible");
			}
		}

		function loadCalendar() {
			$("#year").val(current_year);
			$("#month").val(current_month);
			changeYearMonth(current_year, current_month);

			let previous_month = current_month - 1
			let next_month = current_month + 1
			if (previous_month === 0) {
				$("#fa1").val(12 + "월");
				//$("#fa1").text(12 + "월");
			} else {
				$("#fa1").val(previous_month + "월");
				//$("#fa1").text(previous_month + "월");
			}

			if (next_month === 13) {
				$("#fa2").val(1 + "월");
				//$("#fa2").text(1 + "월");   
			} else {
				$("#fa2").val(next_month + "월");
				//$("#fa2").text(next_month + "월");
			}

		}

		let current_year = (new Date()).getFullYear();
		let current_month = (new Date()).getMonth() + 1;

		$("#year").val(current_year);
		$("#month").val(current_month);

		changeYearMonth(current_year, current_month);
	</script>
</body>
</html>
