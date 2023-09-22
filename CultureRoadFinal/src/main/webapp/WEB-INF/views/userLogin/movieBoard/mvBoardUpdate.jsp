<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<title>게시글 수정</title>
<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/movie/mvBoard";
		});
		
		$("#updateBtn").click(function() {
			if(!chkData("#mv_bo_title", "제목을")) return;
			else if(!chkData("#mv_bo_content", "내용을")) return;
			
			else{
// 				if($("#file").val()!="") {
// 					if(!chkFile($("#file"))) return;
// 				}
// 				enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
				$("#updateForm").attr({
					"method":"post",
// 					"enctype":"multipart/form-data", 
					"action":"/movie/mvBoardUpdate"
				});
				$("#updateForm").submit();
			}
		});
		
	})
</script>

</head>
<body class="d-flex flex-column min-vh-100">
		<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>
		
	<div class="container">
			
			<div class="text-center">
				<form class="form-horizontal" id="updateForm" name="updateForm">
					<table class="table table-bordered">
						<colgroup><col width="20%" /><col width="80%" /></colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left">
									<input type="text" class="form-control" id="user_name" name="user_name" value="${userLogin.userName }" readonly>
									<input type="hidden" id="user_no" name="user_no" value="${userLogin.userNo }" />
									<input type="hidden" id="mv_bo_num" name="mv_bo_num" value="${update.mv_bo_num }" />
								</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td class="text-left">
									<input type="text" class="form-control" id="mv_bo_title" name="mv_bo_title" value="${update.mv_bo_title }">
								</td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left">
									<textarea rows="10" cols="10" class="form-control" style="resize: none" name="mv_bo_content" id="mv_bo_content" rows="8">${update.mv_bo_content }</textarea>
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<td>파일첨부</td> -->
<!-- 								<td class="text-left"> -->
<!-- 									<input type="file" id="file" name="file"> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</tbody>
					</table>
					
					<div class="contentBtn text-right">
						<button type="button" id="updateBtn" name="updateBtn" class="btn btn-success">저장</button>
						<button type="button" id="listBtn" name="listBtn" class="btn btn-success">목록</button>
					</div>
				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/mainTemplate/footer.jsp"%>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<title>게시글 수정</title>
<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/movie/mvBoard";
		});
		
		$("#updateBtn").click(function() {
			if(!chkData("#mv_bo_title", "제목을")) return;
			else if(!chkData("#mv_bo_content", "내용을")) return;
			
			else{
// 				if($("#file").val()!="") {
// 					if(!chkFile($("#file"))) return;
// 				}
// 				enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
				$("#updateForm").attr({
					"method":"post",
// 					"enctype":"multipart/form-data", 
					"action":"/movie/mvBoardUpdate"
				});
				$("#updateForm").submit();
			}
		});
		
	})
</script>

</head>
<body class="d-flex flex-column min-vh-100">
		<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>
		
	<div class="container">
			
			<div class="text-center">
				<form class="form-horizontal" id="updateForm" name="updateForm">
					<table class="table table-bordered">
						<colgroup><col width="20%" /><col width="80%" /></colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left">
									<input type="text" class="form-control" id="user_name" name="user_name" value="${userLogin.userName }" readonly>
									<input type="hidden" id="user_no" name="user_no" value="${userLogin.userNo }" />
									<input type="hidden" id="mv_bo_num" name="mv_bo_num" value="${update.mv_bo_num }" />
								</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td class="text-left">
									<input type="text" class="form-control" id="mv_bo_title" name="mv_bo_title" value="${update.mv_bo_title }">
								</td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left">
									<textarea rows="10" cols="10" class="form-control" style="resize: none" name="mv_bo_content" id="mv_bo_content" rows="8">${update.mv_bo_content }</textarea>
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<td>파일첨부</td> -->
<!-- 								<td class="text-left"> -->
<!-- 									<input type="file" id="file" name="file"> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</tbody>
					</table>
					
					<div class="contentBtn text-right">
						<button type="button" id="updateBtn" name="updateBtn" class="btn btn-success">저장</button>
						<button type="button" id="listBtn" name="listBtn" class="btn btn-success">목록</button>
					</div>
				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/mainTemplate/footer.jsp"%>
</body>
>>>>>>> refs/remotes/origin/feature/login
</html>