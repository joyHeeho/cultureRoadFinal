<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<style>
	
	 table{
	 	max-width:800px;
	 	font-size:12px;
	 	width:800px;
	 	height:1000px;
	 	margin:auto;
	 }
/* 	 rgb(173, 216, 230); */

	button{
	    background-color: rgb(130, 171, 255);
        color: white; 
        border: none; 
        padding: 5px 10px; 
        border-radius: 20%; 
        cursor: pointer; 
        margin-bottom:3px;
	 
	 }
	 
 	 .a { 
 	 	overflow-wrap: break-word;
 	 	margin-left:30px;
 	 	margin-right:100px;
 	 	height: 50px; /* 허용할 최대 높이 */ 
 	    overflow: hidden; /* 초과하는 내용을 숨김 */ 
 	    text-overflow: ellipsis; /* 텍스트 끝에 생략 부호 (...) 표시 */ 
  	    white-space: nowrap;   
 	} 
 

        #q::before {
        	margin-left:80px;
        	margin-right:20px;
        	float:left;
            content: "Q";
            font-weight: bold;
            color:   rgb(180, 180, 250);
            font-size:27px;
          
        }
        
         #a::before {
         	margin-right:20px;
         	float:left;
            content: "↳A";
            font-weight: bold;
            color:  rgb(210, 210, 240);
            font-size:27px;
        }
        
         tr.answer td {
        	max-width: 300px;
		    padding: 20px; 
		    overflow-wrap: break-word;
		    height:100px; 
		}
        
	

	
</style>

<script type="text/javascript">
	$(function(){
		
	    // 모든 답변 숨기기
	    $("[id^=answer-]").hide();
	
		$(document).on("click", ".text-center[data-target]", function() {
	        var targetId = $(this).data("target");
// 	        $("#" + targetId).toggle(); // 해당 답변 표시 또는 숨김
	        
	        var answerElement = $("#" + targetId);
	        
	        // 해당 답변이 null이 아닌 경우에만 토글
	        if (answerElement.length > 0 && answerElement.text().trim() !== "") {
	            answerElement.toggle(); // 해당 답변 표시 또는 숨김
	        }
	       });
		

		//페이지 번호 버튼
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
		

	})
		function goPage(){
			$("#f_search").attr({
				"method":"get",
				"action":"/admin/qna/qnaAdmin"
			})
				$("#f_search").submit();
		}
	
	$(document).ready(function () {
	    // 초기에는 체크박스가 선택되지 않았으므로 전체 글을 보여줍니다.

	    // 체크박스 상태가 변경될 때마다 리스트 필터링 함수를 호출합니다.
	    $("#answerchk").on("change", function () {
	        filterList();
	    });
	});

	function filterList() {
	    var chkcnf = $("#answerchk").is(":checked"); // 체크박스가 선택되었는지 확인

	    // 각 글의 답변 여부에 따라 필터링합니다.
	    $(".goAnswer").each(function () {
	        var $row = $(this); //goAnswer의 테이블 행
	        var anschk = $row.find("td:eq(1)").find("span").length > 0;
								//두번째 열의 td요소의 span을 찾는다
								
	        // 체크박스가 선택된 경우 + 글이 답변이 있는 경우 숨김
	        if (chkcnf && anschk) {
	        	 $row.hide();
	        } else {
	            $row.show();
	        }
	    });
	}
	
		
</script>

<title>게시판 리스트</title>

</head>
<body>
	<div class="container">

		<form id="f_search" name="f_search" class="form-inline">
		<%-- 페이징 처리를 위한 파라미터 --%>
			<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
		</form>
		<div id="qnaList" class="table-height">
			<table summary="게시판 리스트" class="table" >
				<thead>
					<tr>
						<th data-value="qna_id" class="order text-center" >글번호</th>
						<th class="text-center">답변여부</th>
						<th class="text-center col-md-6" >답변</th>
						<th >작성자</th>
						<th data-value="answer_date" class="text-center">작성일</th>
						
						<th colspan="2"><input type="checkbox" id="answerchk" name="answerchk" value="1">답변x만</th>
					</tr>
				</thead>
				<tbody id="list" class="table-striped">
					<c:choose>
						<c:when test="${not empty qnaList}" >
							<c:forEach var="qna" items="${qnaList}" varStatus="status"> 
								<tr class="text-center goAnswer">
 									<td>${qna.qna_id}</td>
 									<td>
										<c:if test="${qna.answer ne null}"><span style="color:gray;">답변완료</span></c:if>
									</td>
									<td class="text-center a" data-target="answer-${qna.qna_id}" data-num="${qna.qna_id}" style="max-width:300px"> 
										${qna.question}
									</td>
									<td class="name"> ${qna.user_id}</td>
									<td> ${qna.question_date}</td>
										
									<td><form action="/admin/qna/deleteQna" method="post">
							            <input type="hidden" name="qna_id"  value="${qna.qna_id}">
							            <button  type="submit">삭제</button>
							        </form>
							       
							        <form action="/admin/qna/answerForm" method="get">
							            <input type="hidden" name="qna_id" value="${qna.qna_id}">
							            <button type="submit" class="answerBtn" data-num="${qna.qna_id}">답변</button>
							        </form>
							        </td>
								</tr>
								<tr class="text-left answer" id="answer-${qna.qna_id}"  style=" background-color: rgb(250, 250, 255);">
									<td colspan=6 class="text-left" >
											<div>
												<span id="q">${qna.question}</span><br/><br/>
												<span id="a">${qna.answer} <span style="float: right; margin-right:20px;">${qna.answer_date}</span></span>
											</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="5" class="tac text-center">등록된 게시글이 없음</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		
		
			<%-- ================ 페이징 출력 시작 ================ --%>
		<div class="text-center">
			<ul class="pagination">
			
				<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage - 1 }">Previous</a>
					</li>
				</c:if>
				
				<!-- 바로가기 번호 출력 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':'' }">
						<a href="${num}">${num}</a>
					</li>	
				</c:forEach>
				
				
				<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage + 1 }">Next</a>
					</li>
				</c:if>
				
			</ul>
		</div>
		
		</div>
		<%-- ================ 리스트 종료 ================ --%>

		<%-- ================ 글쓰기 버튼 ================ --%>
		
	</div>
		
</body>
</html>