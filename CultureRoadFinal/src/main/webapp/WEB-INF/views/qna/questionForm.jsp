<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/qna/qnaList";
		});
		

		
		$("#writeBtn").click(function() {
			if (!chkData("#question", "내용을")) return;
			else{
				$("#writeForm").attr({
					"method":"post",
					"action":"/qna/insertQna"
				});
				$("#writeForm").submit();
			}
		})
		
		
		 $("#cs_open").on("change", function () {
			 $("#writeForm").attr({
					"method":"post",
					"action":"/qna/secretQna"
				});
				$("#writeForm").submit();   
		    });
		
		
		
	})
</script>

<title>글 작성</title>
	</head>
	<body>
		<div class="container">
			
			<div class="text-center">
				<form class="form-horizontal" id="writeForm">
					<table class="table table-bordered">
						<colgroup><col width="20%" /><col width="80%" /></colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left">
									<input type="text" class="form-control" id="user_id" name="user_id" value="${userLogin.userId}" readonly >
								</td>
							</tr>

							<tr>
								<td>글내용</td>
								<td class="text-left">
									<textarea rows="10" cols="10" class="form-control" style="resize: none" name="question" id="question" rows="8"></textarea>
								</td>
							</tr>

						</tbody>
					</table>
					
					<div class="contentBtn text-center">
						<input type="checkbox" name="cs_open" id="cs_open" value="1" class="radio" /><span class="ml_10">비공개로 표시합니다</span><br/><br/>
						<button type="button" id="writeBtn" name="writeBtn" class="btn btn-secondary">저장</button>
						<button type="button" id="cancelBtn" name="cancelBtn" class="btn btn-secondary">취소</button>
						<button type="button" id="listBtn" name="listBtn" class="btn btn-secondary">목록</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>