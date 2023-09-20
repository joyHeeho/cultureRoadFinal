<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
	let word = "<c:out value='${noticeVO.keyword}'/>"; 
	if(word!=""){
		$("#keyword").val('<c:out value='${noticeVO.keyword}'/>');
		$("#keyword").focus();
		$("#search").val('<c:out value='${noticeVO.search}'/>');
		
		if($("#search").val()!='noc_content'){
			//:contais() 는 특정 텍스트를 포함한 요소 반환
			if($("#search").val()=='noc_title') value = "#list tr td.goDetail";
			console.log($(value+":contains('"+word+"')").html());
			$(value+":contains('"+word+"')").each(function (){
				let regex = new RegExp(word, 'gi');
				$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
			})
		}
	}
	
	
	$(".goDetail").click(function(){
		let noc_num = $(this).parents("tr").attr("data-num");
		console.log("noc_num :", noc_num);
		$("#noc_num").val(noc_num);
		$("#detail").attr({
			method : "post",
			action : "/admin/notice/noticeDetail"
		})
		$("#detail").submit();
	})
	
	$(".deleteBtn").click(function(){
		let noc_num = $(this).attr("data-num");
		if(confirm("삭제 하시겠습니까?")){
		$("#noc_num").val(noc_num);
		$("#detail").attr({
			method : "post",
			action : "/admin/notice/noticeDelete"
		})
		$("#detail").submit();
		}
	})
	
	$("#searchData").click(function() {
		if(!chkData("#keyword", "검색어를")) return;
		else {
			$("#pageNum").val(1); //페이지 초기화
			goPage(); 
		}
	})

	$("#keyword").bind("keydown", (e) => {
		if(e.keyCode ==13) {
			e.preventDefault();
		}
	})
	$("#search").change(() => {
		$("#keyword").focus();
	})
	
	$(".page-item a").click(function(e) {
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		goPage();
	})
	
	$("#insertForm").click(function(){
		location.href="/admin/notice/noticeInserForm"
	})
})
function goPage(){
	$("#f_search").attr({
		"method":"get",
		"action":"/admin/notice/board"
	})
		$("#f_search").submit();
}
	</script>
	
	<style type="text/css">
     	.required{ color: red; background-color:  yellow;}
		textarea{resize: none;}

		#f_search { margin-top : 20px}
		.required {
    color: #ffffff;  /* 글자색 */
    background-color: #ff5733;  /* 배경색 */
    padding: 3px;  /* 패딩 */
    border-radius: 3px;  /* 모서리 둥글게 */
}

/* 테이블과 관련된 스타일 */
.table-striped {
    border-collapse: collapse;  
}

.table-striped th {
    background-color: #f2f2f2;  
    color: #333;  
}

.table-striped td {
    border: 1px solid #ddd;  
    padding: 8px;  
}

/* 검색 버튼 스타일 */
.btn-primary {
    background-color: #007bff;  
    border: none;  
    color: white;  
    padding: 12px 20px;  
    cursor: pointer;  
}

.pagination .page-item a {
    color: black;  
    float: left;  
    padding: 8px 16px;  
    text-decoration: none;  
}

.pagination .page-item.active a {
    background-color: #007bff;  
    color: white;  
}

.pagination .page-item a:hover:not(.active) {
    background-color: #ddd;
}
.goDetail {
cursor : pointer;
}
.pagination{
	padding-top:30px;
}
    </style>
<!--         <div class="contentTit page-header"> -->
	
    <div class="container">
		<div id="boardSearch" class="d-flex justify-content-end"> 
		<form id="f_search" name="f_search" class="form-inline">
			<%-- 페이징 처리를 위한 파라미터 --%>
			<input type="hidden" name="pageNum" id="pageNum" value="${paging.cvo.pageNum }">
			<input type="hidden" name="amount" id="amount" value="${paging.cvo.amount }">
			<div class="column">
			<div class="d-inline-flex text-start">
				<input type="button" class="btn btn-success text-start" id="insertForm" name="inserForm" value="공지작성">
			</div>
			<div class="d-inline-flex text-end">
				 <select id="search" name="search"  class="form-control form-control-sm w-auto">
							<option value="noc_title">제목</option>
							<option value="noc_content">내용</option>
				</select>
				<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control form-control-sm w-auto" />
				<button type="button" id="searchData" class="btn btn-primary ">검색</button>
			</div>
			</div>
		</form>
		</div>
		<br />
		
		<form id="detail" name="detail">
			<input type="hidden" id="noc_num" name="noc_num" />
		</form>

		<div id="boardList" class="table-height noticeboard">
			<table summary="게시판 리스트" class="table table-striped" >
				<thead>
					<tr>
						<th data-value="b_num" class="order text-center col-md-1" >글번호</th>
						<th class="text-center col-md-5">글제목</th>
<!-- 						<th class="text-center col-md-2">작성자</th> -->
						<th data-value="b_date" class="order col-md-1">작성일</th>
						<th class="text-center col-md-1">조회수</th>
						<th class="text-center col-md-1">관리자</th>
						
					</tr>
				</thead>
				<tbody id="list" class="table-striped" >
					<c:choose>
						<c:when test="${not empty notice}" >
							<c:forEach var="notice" items="${notice}" varStatus="status"> 
								<tr class="text-center" data-num="${notice.noc_num}">
 									<td>${notice.noc_num}</td>
									<td class="goDetail text-start"> ${notice.noc_title} </td>
<!-- 									<td class="name">관리자</td> -->
									<td class="text-start"> ${notice.noc_write_date}</td>
									<td class="text-center">${notice.readcnt}</td>
									<td class="text-center">
										<input data-num="${notice.noc_num }" type="button" class="deleteBtn btn" value="삭제">
									</td>
									
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="5" class="tac text-center">등록된 게시글이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- ================ 리스트 종료 ================ --%>
		<%-- ================ 페이징 출력 ================ --%>
		<div class="d-flex justify-content-center">
			<ul class="pagination">
				<!-- 이전 바로가기 10개 존재 여부 확인 -->
				<c:if test="${paging.prev }">
					<li class="page-item">
						<a class="page-link" href="${paging.initpage}">처음으로</a>
					</li>
					<li class="page-item previous">
						<a class="page-link" href="${paging.startPage -1}">이전</a>
					</li>
				</c:if>
				
				<!-- 바로가기 번호 출력 -->
				<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
					<li class="page-item ${paging.cvo.pageNum == num ? 'active':'' }">
						<a class="page-link" href="${num}">${num }</a>
					</li>
				</c:forEach>
				
				<!-- 다음 바로가기 10개 존재 여부 확인 -->
				<c:if test="${paging.next }">
					<li class="page-item next">
						<a class="page-link" href="${paging.endPage+1 }">다음</a>
					</li>
				</c:if>
			</ul>	
		</div>

	</div>

    
    
    
    
    
    