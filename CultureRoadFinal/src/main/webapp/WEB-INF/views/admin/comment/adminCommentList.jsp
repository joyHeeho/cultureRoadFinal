<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>
<style>
table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
  text-align : center; 
}
  
#thead {
  font-weight: bold;
  color: #fff;
  background: #212741;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;

  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
</style>
<script>
	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력 */
		let word = "<c:out value='${AdminCommentVO.keyword}' />";
		let value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${AdminCommentVO.keyword}' />");
			$("#search").val("<c:out value='${AdminCommentVO.search}' />");

			if ($("#search").val() != 'mv_co_content') {
				//:conteains() 는 특정 텍스트를 포함한 요소 반환
				if ($("#search").val() == 'title')
					value = "#list tr td.goDetail";
				else if ($("#search").val() == 'user_name')
					value = "#list tr td.name";
				console.log($(value + ":contains('" + word + "')").html());

				// $("#list tr td.goDetail:contains('노력')").html() => <span class='required'>노력</span>에 대한 명언
				$(value + ":contains('" + word + "')").each(
						function() {
							let regex = new RegExp(word, 'gi');
							$(this).html(
									$(this).html().replace(
											regex,
											"<span class='required'>" + word
													+ "</span>"));
						});
			}
		}

		/* 입력 양시 enter 제거 */
		$("#keyword").bind("keydown", function(event) {
			if (event.keyCode == 13) {
				event.preventDefault();
			}
		});

		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 목록 조회합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		})

		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkData("#keyword", "검색어를"))
					return;
			}
			$("#pageNum").val(1); //페이지 초기화
			goPage();
		})

		$(".goDetail").click(function() {
			let mv_co_num = $(this).parents("tr").attr("data-num");
			$("#mv_co_num").val(mv_co_num);

			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/admincommentDetail"
			});
			$("#detailForm").submit();
		});

		$(".paginate_button a").click(
				function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val(
							$(this).attr("href"));
					goPage();
				})

	});

	function goPage() {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}

		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/admincommentList"
		});
		$("#f_search").submit();
	}
</script>

</head>
<body>
	<c:if test="${empty adminLogin}">
		<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
	</c:if>
	<c:if test="${not empty adminLogin}">

		<!--     <div class="container board-container"> -->
		<!-- 여기는 꼭 들어가야하는 부분 밑에 주석까지!!! 그리고 맨 밑에 푸터 참고해주세요. -->
		<jsp:include page="../main/main.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="d-xl-flex justify-content-between align-items-start">
					<h2 class="text-dark font-weight-bold mb-2">한줄평 관리</h2>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div
							class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
						</div>
						<div class="tab-content tab-transparent-content">

							<!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->
							<div class="container" >
								<!-- 상세 페이지로 이동할 때 값을 저장할 폼 -->
								<form id="detailForm">
									<input type="hidden" id="mv_co_num" name="mv_co_num" />
								</form>
							
								<!-- 검색 기능 -->
								<div id="boardSearch" class="d-flex justify-content-end"><!-- class="text-right mt-4"  -->
									<form id="f_search" name="f_search" class="form-inline">
										<div class="d-inline-flex text-end">
											<input type="hidden" name="pageNum" id="pageNum"
												value="${pageMaker.cvo.pageNum}"> <input
												type="hidden" name="amount" id="amount"
												value="${pageMaker.cvo.amount}"> <label class="mr-2"></label>
											<select id="search" name="search"  class="form-control form-control-sm w-auto">
												<option value="all">전체</option>
												<option value="title">영화제목</option>
												<option value="mv_co_comment">한줄평 내용</option>
												<option value="user_name">작성자</option>
											</select> <input type="text" name="keyword" id="keyword"
												value="검색어를 입력하세요" class="form-control form-control-sm w-auto" />
											<button type="button" id="searchData" class="btn btn-success">검색</button>
										</div>
									</form>
								</div>

								<!-- 리스트 -->
								<div id="boardList" class="mt-4">
									<table>
										<thead id="thead">
											<tr>
												<th>글번호</th>
												<th>영화 제목</th>
												<th>한줄평 내용</th>
												<th>작성자</th>
												<th>작성일</th>
											</tr>
										</thead>
										<tbody id="list" >
											<!-- 데이터 출력 -->
											<c:choose>
												<c:when test="${not empty adminCommentList}">
													<c:forEach var="comment" items="${adminCommentList}"
														varStatus="status">
														<tr class="text-center" data-num="${comment.mv_co_num}">
															<td>${comment.mv_co_num}</td>
															<td class="goDetail text-left">${comment.title}</td>
															<td class="text-left">${comment.mv_co_content}</td>
															<td class="name">${comment.user_name}</td>
															<td class="text-left">${comment.mv_co_write_date}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="6" class="text-center">등록된 게시글이 존재하지
															않습니다.</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>

								<!-- 페이징 -->
								<div class="text-center mt-4">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li class="page-item"><a class="page-link"
												href="${pageMaker.startPage - 1}" aria-label="Previous"><span
													aria-hidden="true">&laquo;</span></a></li>
										</c:if>
										            <!-- 바로가기 번호 출력 -->
            <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
               <li class="page-item ">
                  <a class="btn btn-outline-secondary ${paging.cvo.pageNum == num ? 'active':'' }" href="${num}">${num }</a>
               </li>
            </c:forEach>
										<c:if test="${pageMaker.next}">
											<li class="page-item"><a class="page-link"
												href="${pageMaker.endPage + 1}" aria-label="Next"><span
													aria-hidden="true">&raquo;</span></a></li>
										</c:if>
									</ul>
								</div>

								<script>
		    // 페이지 변경 함수
		    function changePage(pageNum) {
		        $("#f_search").find("input[name='pageNum']").val(pageNum);
		        goPage();
		    }
		</script>

							</div>
							<!--  여기도 꼭 넣어주세요!!!!!!!!!!!!! -->
						</div>
					</div>
				</div>

			</div>
			<jsp:include page="../main/footer.jsp" />
		</div>
	</c:if>
</body>

</html>