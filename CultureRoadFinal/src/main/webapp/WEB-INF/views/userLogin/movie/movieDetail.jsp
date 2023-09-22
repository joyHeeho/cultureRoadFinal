<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<title>Movie culture</title>

<style>
.header-area.header-sticky {
	min-height: 80px;
	background-color: #212741;
	height: 130px !important;
	position: fixed !important;
	top: 0 !important;
	left: 0;
	right: 0;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.15) !important;
}

.moreInformation, #review1 {
	display: none;
}

section.simple-cta {
	background-color: white;
}

#item-template {
	display: none;
}
</style>

<script type="text/javascript">

	$(document).ready(function() {
		const movieDetailBtn = $("#movieDetail");
		const oneLineReviewBtn = $("#oneLineReview");

		const movieDetailContent = $(".moreInformation");
		const oneLineReviewContent = $("#review1");

		movieDetailBtn.click(function() {
			movieDetailContent.show();
			oneLineReviewContent.hide();
		});

		oneLineReviewBtn.click(function() {
			movieDetailContent.hide();
			oneLineReviewContent.show();
		});
	});

	$(function() {
		$("#choiceBtn").click(function() {
			let id = $(".btn-primary").attr("data-num");
			console.log("id :", id);
			console.log("title :", title);
			$("#detail").attr({
				method : "post",
				action : "/MovieSeatBooking/" + id
			});
			$("#detail").submit();
		});
	});
</script>

</head>

<body>

	<form id="detail1" name="detail">
		<input type="hidden" id="id" name="id" value="${movie.id}" /> <input type="hidden" id="title" name="title" value="${movie.title}" />
	</form>

	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="../../index.jsp" class="logo"> <img src="/resources/main/image/logo.png" alt="">
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#top" class="active">Main</a></li>
							<li class="scroll-to-section"><a href="#search">Search</a></li>
							<li class="scroll-to-section"><a href="#movie">Ranking</a></li>
							<li class="has-sub"><a href="javascript:void(0)">Movie</a>
								<ul class="sub-menu">
									<li><a href="about-us.jsp">Movie List</a></li>
									<li><a href="our-services.jsp">Movie Board</a></li>
									<li><a href="contact-us.jsp">Reservation</a></li>
								</ul></li>
							<li class="scroll-to-section"><a href="#bestComment">BestComment</a></li>
							<li><a href="">Notice</a> <c:choose>
									<c:when test="${empty userLogin}">
										<li><a href="/userLogin/signUpForm">회원가입</a></li>
										<li><a href="/userLogin/loginUser">로그인</a></li>
									</c:when>
									<c:when test="${not empty userLogin}">
										<li><a href="/userLogin/myPage">마이페이지</a></li>
										<li><a href="/userLogin/logout">로그아웃</a></li>
									</c:when>
								</c:choose>
						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->
	<br />
	<br />
	<br />
	<br />
	<form id="detail">
		<section class="top-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="left-image">
							<img src="http://image.tmdb.org/t/p/w500${movie.poster_path}" alt="${movie.title}" class="img-fluid">
						</div>
					</div>
					<div class="col-lg-6 align-self-center">
						<div class="accordions is-first-expanded">
							<article class="accordion">
								<div class="accordion-head">
									<span>${movie.overview}</span>
								</div>
							</article>
							<article class="accordion">
								<div class="accordion-head">
									<div class="accordion-head">
										<h1>영화날짜 선택</h1>
										<jsp:include page="SelectReservationDate.jsp" />
									</div>
								</div>
							</article>
							<article class="accordion">
								<div>
									<button type="button" name="choiceBtn" id="choiceBtn" class="btn btn-primary" data-num="${movie.id}">좌석 및 인원 선택</button>
								</div>
							</article>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="simple-cta">
			<div class="container">
				<div class="row">
					<div class="col-lg-5">
						<h4>
							<em>영화 상세정보</em> 및 <strong>한줄평</strong> <br> 선택하세요.
						</h4>
					</div>
					<div class="col-lg-10">
						<div class="buttons">
							<div class="green-button">
								<button type="button" id="movieDetail" name="movieDetail" class="btn btn-info">영화 상세 정보</button>
							</div>
							<div class="orange-button">
								<button type="button" id="oneLineReview" name="oneLineReview" class="btn btn-info">한줄평</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<br>
		<div class="moreInformation">
			<div class="card border-info mb-3" style="max-width: 18rem;">
				<div class="card-header bg-info text-white">개봉일</div>
				<div class="card-body">
					<h5 class="card-title">${movie.release_date}</h5>
				</div>
			</div>

			<div class="card border-warning mb-3" style="max-width: 18rem;">
				<div class="card-header bg-warning">평점</div>
				<div class="card-body">
					<h5 class="card-title">
						<span class="badge bg-warning text-dark"> <c:choose>
								<c:when test="${movie.vote_average <= 2.0}">★</c:when>
								<c:when test="${movie.vote_average <= 4.0}">★★</c:when>
								<c:when test="${movie.vote_average <= 6.0}">★★★</c:when>
								<c:when test="${movie.vote_average <= 8.0}">★★★★</c:when>
								<c:when test="${movie.vote_average <= 10.0}">★★★★★</c:when>
								<c:otherwise>평점 없음</c:otherwise>
							</c:choose>
						</span>
					</h5>
				</div>
			</div>

			<div class="card border-success mb-3" style="max-width: 18rem;">
				<div class="card-header bg-success text-white">장르</div>
				<div class="card-body">
					<ul class="list-group list-group-flush">
						<c:forEach items="${movie.genres}" var="genre">
							<li class="list-group-item">${genre.name}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="card border-success mb-3" style="max-width: 18rem;">
				<div class="card-header bg-success text-white">장르</div>
				<div class="card-body">
					<ul class="list-group list-group-flush">
						<c:forEach items="${movies}" var="movie" varStatus="loop">
							<c:if test="${loop.index < 5}">
								<img src="http://image.tmdb.org/t/p/w500${movie.profile_path}" alt="${movie.name}" class="img-fluid">
								<li class="list-group-item">${movie.name}/ ${movie.character}</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>



	</form>
	<div id="review1">
		<jsp:include page="movieDetailComent.jsp" />
	</div>
	<br>
	<br>
	<jsp:include page="../../mainTemplate/footer.jsp" />

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/main/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="/resources/main/assets/js/isotope.min.js"></script>
	<script src="/resources/main/assets/js/owl-carousel.js"></script>

	<script src="/resources/main/assets/js/tabs.js"></script>
	<script src="/resources/main/assets/js/swiper.js"></script>
	<script src="/resources/main/assets/js/custom.js"></script>
	<script>
		var interleaveOffset = 0.5;

		var swiperOptions = {
			loop : true,
			speed : 1000,
			grabCursor : true,
			watchSlidesProgress : true,
			mousewheelControl : true,
			keyboardControl : true,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev"
			},
			on : {
				progress : function() {
					var swiper = this;
					for (var i = 0; i < swiper.slides.length; i++) {
						var slideProgress = swiper.slides[i].progress;
						var innerOffset = swiper.width * interleaveOffset;
						var innerTranslate = slideProgress * innerOffset;
						swiper.slides[i].querySelector(".slide-inner").style.transform = "translate3d("
								+ innerTranslate + "px, 0, 0)";
					}
				},
				touchStart : function() {
					var swiper = this;
					for (var i = 0; i < swiper.slides.length; i++) {
						swiper.slides[i].style.transition = "";
					}
				},
				setTransition : function(speed) {
					var swiper = this;
					for (var i = 0; i < swiper.slides.length; i++) {
						swiper.slides[i].style.transition = speed + "ms";
						swiper.slides[i].querySelector(".slide-inner").style.transition = speed
								+ "ms";
					}
				}
			}
		};

		var swiper = new Swiper(".swiper-container", swiperOptions);
	</script>
</body>
</html>