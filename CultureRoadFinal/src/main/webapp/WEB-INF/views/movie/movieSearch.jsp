<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


 <script src="/resources/main/dist/js/ie-emulation-modes-warning.js"></script>


	<script type="text/javascript">
	$(function(){
		$(".movieDetail").click(function(){
			let id = $(this).parents("tr").attr("data-num");
			console.log("id :", id);
			$("#id").val(id);
			$("#detail").attr({
				method : "get",
				action : "/movieDetail/"+id
			})
			$("#detail").submit();
		})
	})
    </script>
    <style type="text/css">
    		.movieDetail{ 
    		height:330px; 
    		width:250px;
     	} 

    </style>
  </head>

  <body>
	

	<form id="detail" name="detail" >
		<input type="hidden" id="id" name="id" />
	</form>

	<!-- Begin page content -->
    <div class="contentLayout container" id="main">
     	<!-- 메인  -->
		<h1>Searching Movies</h1>
		<table class="table">
			<c:forEach var="movie" items="${movies}">
			<tr data-num="${movie.id}">
					<td rowspan="3"><img class="movieDetail" src="http://image.tmdb.org/t/p/w400${movie.poster_path }"></td>
					<td class="overview">
						제목: ${movie.title}
					</td>
			</tr>		
			<tr>
				<td class="overview">
					개봉일: ${movie.release_date}
				</td>	
			</tr>
			<tr>	
				<td class="overview">
					개요: ${movie.overview}
				</td>
			</tr>		
			</c:forEach>
		
		</table>
	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!-- <script src="/dist/js/ie10-viewport-bug-workaround.js"></script> -->
  </body>
</html>
