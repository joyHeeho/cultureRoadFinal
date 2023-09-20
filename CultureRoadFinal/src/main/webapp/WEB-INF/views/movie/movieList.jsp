<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


    <script src="/resources/main/dist/js/ie-emulation-modes-warning.js"></script>



	<script type="text/javascript">
	$(function(){
		$('.dropdown-toggle').dropdown();
		$(".movieDetail").click(function(){
			let id = $(this).attr("data-num");
			console.log("id :", id);
			$("#id").val(id);
			$("#detail").attr({
				method : "get",
				action : "/movieDetail/"+id
			})
			$("#detail").submit();
		})
		
		$("#searchBtn").click(function(){
			$("#search").attr({
				method : "post",
				action : "/movieSearch"
			})
			$("#search").submit();
		})
		 	
		
		//*************드롭다운************
			  let selectedValue = 0;
		      $(".dropdown-item").click(function() {
		    	    const selectedValue = $(this).data("value");

		    	    switch (selectedValue) {
		    	      case 0:
		    	    	  $("#nowmv").show();
		    		      $("#popmv").hide();
		    	        break;

		    	      case 1:
		    	    	  $("#nowmv").hide();
		    		      $("#popmv").show();
		    	        break;

		    	      default:
		    	        break;
		    	    }
		    	  });
		
		
	})
    </script>
    <style type="text/css">
     	.movieDetail{ 
     		height:330px; 
     		width:250px;
     		float: left;
     		margin-right:35px;
     		margin-bottom:40px;
      		
     	} 
     	
    </style>
  </head>

  <body>
	
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
    	<form id="search" name="search" >
			<input type="text" id="title1" name="title1" />
			<button type="button" class="btn" id="searchBtn" name="searchBtn">제목검색</button>
		</form>
    </nav>

	<form id="detail" name="detail" >
		<input type="hidden" id="id" name="id" />
	</form>


	<!-- Begin page content -->
    <div class="contentLayout container" id="main">
    
    
    <div class="dropdown">
	  <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    현재 상영 영화▼
	  </button>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	   <a class="dropdown-item" href="#" data-value="0">현재 상영 영화</a><br/>
	   <a class="dropdown-item" href="#" data-value="1">인기 영화</a>
	  </div>
	</div>
    
     	
     	<div id="nowmv">
		<h1>Now Playing Movies</h1>
			<c:forEach var="movie" items="${movies}">
			<div class="mvimg"><img class="movieDetail" data-num="${movie.id}" src="http://image.tmdb.org/t/p/w500${movie.poster_path }">
			</div>
			</c:forEach>
		</div>
			
			
			
		<div id="popmv">
		<h1>Popular Movies</h1>
			<c:forEach var="movie" items="${movies2}">
			<div class="mvimg"><img class="movieDetail" data-num="${movie.id}" src="http://image.tmdb.org/t/p/w500${movie.poster_path }">
			</div>
			</c:forEach>
		</div>
		
			
			
	</div>

   

<!--     <script src="/resources/dist/js/bootstrap.min.js"></script> -->
  </body>
</html>