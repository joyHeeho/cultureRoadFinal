<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<title>메인화면</title>
<script type="text/javascript">
	$(function() {
		$(".movieDetail").click(function() {
			let id = $(this).parents("tr").attr("data-num");
			console.log("id :", id);
			$("#id").val(id);
			$("#detail").attr({
				method : "post",
				action : "/movieDetail/" + id
			})
			$("#detail").submit();
		})
	})
    </script>
    <style type="text/css">
     	.movieDetail{ 
      		height: 540px; 
      		width : 380px; 
     	} 
    </style>
  </head>

  <body class="d-flex flex-column min-vh-100">
		<%@ include file="/WEB-INF/views/template/nav.jsp"%>
	

	<form id="detail" name="detail" >
		<input type="hidden" id="id" name="id" />
	</form>

	<!-- Begin page content -->
    <div class="contentLayout container" id="main">
     	<!-- 메인  -->
		<h1>Searching Movies</h1>
		<table class="table">
			<c:forEach var="movie" items="${movies}">
			<tr data-num="${movie.id}"><td>
				<img class="movieDetail" src="http://image.tmdb.org/t/p/w400${movie.poster_path }">
			</td></tr>				
			</c:forEach>
		
		</table>
	</div>

		<%@ include file="/WEB-INF/views/template/footer.jsp"%>
  </body>
</html>
