<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/admin/notice/board";
		});
		
		$("#insertBtn").click(function() {
			if(!chkData("#noc_title", "제목을")) return;
			else if(!chkData("#noc_content", "내용을")) return;
			
			else{
// 				if($("#file").val()!="") {
// 					if(!chkFile($("#file"))) return;
// 				}
// 				enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
				$("#insertForm").attr({
					"method":"post",
// 					"enctype":"multipart/form-data", 
					"action":"/admin/notice/noticeInsert"
				});
				$("#insertForm").submit();
			}
		});
		
	})
</script>


		
	<div class="container">
			
			<div class="text-center">
				<form class="form-horizontal" id="insertForm" name="insertForm">
					<table class="table table-bordered">
						<colgroup><col width="20%" /><col width="80%" /></colgroup>
						<tbody>
							<tr>
								<td>글제목</td>
								<td class="text-left">
									<input type="hidden" id="manager_no" name="manager_no" value="${adminLogin.managerNo }" />
									<input type="text" class="form-control" id="noc_title" name="noc_title">
								</td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left">
									<textarea rows="30" cols="10" class="form-control" style="resize: none" name="noc_content" id="noc_content" rows="8"></textarea>
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
