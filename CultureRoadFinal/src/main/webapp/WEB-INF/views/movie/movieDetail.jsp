<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<title>Movie culture</title>
<!-- 부트스트랩 CSS CDN -->

<style>
.moreInformation, #review1, #review2 {
	display: none;
}

/* 버튼과 내용을 가로로 나열 */
.button-container {
	display: flex;
	flex-direction: row;
	justify-content: space-between; /* 간격을 동일하게 설정 */
	align-items: flex-start; /* 버튼과 내용을 위쪽에 정렬 */
}

#item-template, #item-template2 {
	display: none;
}
</style>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 버튼 요소 가져오기
						const movieDetailBtn = $("#movieDetail");
						const oneLineReviewBtn = $("#oneLineReview");
						const ExpectationsBtn = $("#Expectations");

						// 컨텐츠 요소 가져오기
						const movieDetailContent = $(".moreInformation:not(#review1):not(#review2)");
						const oneLineReviewContent = $("#review1");
						const ExpectationsContent = $("#review2");

						// 영화 상세 정보 버튼 클릭 시
						movieDetailBtn.click(function() {
							// 영화 상세 정보 컨텐츠를 표시하고 다른 컨텐츠를 숨김
							movieDetailContent.show();
							oneLineReviewContent.hide();
							ExpectationsContent.hide();
						});

						// 한줄평 버튼 클릭 시
						oneLineReviewBtn.click(function() {
							// 한줄평 컨텐츠를 표시하고 다른 컨텐츠를 숨김
							movieDetailContent.hide();
							oneLineReviewContent.show();
							ExpectationsContent.hide();
						});

						// 기대평 버튼 클릭 시
						ExpectationsBtn.click(function() {
							// 기대평 컨텐츠를 표시하고 다른 컨텐츠를 숨김
							movieDetailContent.hide();
							oneLineReviewContent.hide();
							ExpectationsContent.show();
						});
					});

	$(function() {
		$("#choiceBtn").click(function() {
			let id = $(".btn-primary").attr("data-num");
			console.log("id :", id);
			$("#detail").attr({
				method : "post",
				action : "/MovieSeatBooking/" + id
			});
			$("#detail").submit();
		});

		$("#searchBtn").click(function() {
			$("#search").attr({
				method : "post",
				action : "/movieSearch"
			});
			$("#search").submit();
		});
	});
</script>
</head>

<body class="d-flex flex-column min-vh-100">
	<jsp:include page="/WEB-INF/views/mainTemplate/header.jsp"/>
	<br />
	<br />
	<br />
	<br />
	<form id="detail1" name="detail">
		<input type="hidden" id="id" name="id" value="${movie.id}" />
	</form>

	<div class="container mt-5">
		<form id="detail">
			<div class="row">
				<div class="col-md-6">
					<img src="http://image.tmdb.org/t/p/w500${movie.backdrop_path}"
						alt="${movie.title}" class="img-fluid">
					<h1 class="movieTitle">${movie.title}</h1>
				</div>
				<div class="col-md-6">
					<h3 class="overview">영화 내용 요약</h3>
					${movie.overview}
					<jsp:include page="Test.jsp" />
					<div>
						<button type="button" name="choiceBtn" id="choiceBtn"
							class="btn btn-primary" data-num="${movie.id}">좌석 및 인원
							선택</button>
					</div>
				</div>
			</div>
			<div class="button-container">
				<button type="button" id="movieDetail" name="movieDetail"
					class="btn btn-info">영화 상세 정보</button>
				<button type="button" id="oneLineReview" name="oneLineReview"
					class="btn btn-info">한줄평</button>
				<!-- 				<button type="button" id="Expectations" name="Expectations" -->
				<!-- 					class="btn btn-info">기대평</button> -->
			</div>
			<div class="moreInformation">
				<h3 class="movieReleaseDate"
					style="border: 2px solid; width: 280px;">개봉일 :
					${movie.release_date}</h3>
				<h3 class="movieRating" style="border: 2px solid; width: 280px;">
					평점 : <span class="badge bg-warning text-dark"> <c:choose>
							<c:when test="${movie.vote_average <= 2.0}">★</c:when>
							<c:when test="${movie.vote_average <= 4.0}">★★</c:when>
							<c:when test="${movie.vote_average <= 6.0}">★★★</c:when>
							<c:when test="${movie.vote_average <= 8.0}">★★★★</c:when>
							<c:when test="${movie.vote_average <= 10.0}">★★★★★</c:when>
							<c:otherwise>평점 없음</c:otherwise>
						</c:choose>
					</span>
				</h3>

				<h3 class="genre">장르 :</h3>
				<ul class="list-inline">
					<c:forEach items="${movie.genres}" var="genre">
						<li class="list-inline-item"><span class="badge bg-secondary">${genre.name}</span></li>
					</c:forEach>
				</ul>
			</div>
		</form>
		<div id="review1">
			<jsp:include page="movieDetailComent.jsp" />
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/mainTemplate/footer.jsp"/>
</body>
</html>


