<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<title>게시판 입력</title>
<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/movie/mvboard";
		});
		
		$("#insertBtn").click(function() {
			if(!chkData("#mv_bo_title", "제목을")) return;
			else if(!chkData("#mv_bo_content", "내용을")) return;
			
			else{
// 				if($("#file").val()!="") {
// 					if(!chkFile($("#file"))) return;
// 				}
// 				enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
				$("#insertForm").attr({
					"method":"post",
// 					"enctype":"multipart/form-data", 
					"action":"/movie/mvBoardInsert"
				});
				$("#insertForm").submit();
			}
		});
		
	})
</script>
<style>
.container-insert{
	margin-top:150px;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
		<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>
		
	<div class="container container-insert">
			
			<div class="text-center">
				<form class="form-horizontal" id="insertForm" name="insertForm">
					<table class="table table-bordered">
						<colgroup><col width="20%" /><col width="80%" /></colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left">
									<input type="text" class="form-control" id="b_name" name="b_name" value=${userLogin.userName } readonly>
									<input type="hidden" id="user_no" name="user_no" value="${userLogin.userNo }" />
								</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td class="text-left">
									<input type="text" class="form-control" id="mv_bo_title" name="mv_bo_title">
								</td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left">
									<textarea rows="10" cols="10" class="form-control" style="resize: none" name="mv_bo_content" id="mv_bo_content" rows="8"></textarea>
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
						<button type="button" id="insertBtn" name="insertBtn" class="btn btn-success">게시글작성</button>
						<button type="button" id="listBtn" name="listBtn" class="btn btn-success">목록으로</button>
					</div>
				</form>
			</div>
		</div>


		
		<%@ include file="/WEB-INF/views/mainTemplate/footer.jsp"%>
</body>
</html>