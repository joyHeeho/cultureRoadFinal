<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%> 
<script type="text/javascript">
$(function(){
	let word = "<c:out value='${movieReplyVO.keyword}'/>"; 
	if(word!=""){
		$("#keyword").val('<c:out value='${movieReplyVO.keyword}'/>');
		$("#keyword").focus();
		$("#search").val('<c:out value='${movieReplyVO.search}'/>');
	}
	
	$(".hiddenBtn").click(function(){
		let mv_re_num = $(this).attr("data-num");
		let mv_re_hidden = $(this).attr("data-hidden");
		$("#mv_re_num1").val(mv_re_num);
		if(mv_re_hidden == 1) {
			$("#mv_re_hidden").val(0);
		}else{
			$("#mv_re_hidden").val(1);
		}
		$("#hidden").attr({
			method : "post",
			action : "/admin/reply/mvReplyHidden"
		})
		$("#hidden").submit();
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
})

function goPage(){
	$("#f_search").attr({
		"method":"get",
		"action":"/admin/reply/all"
	})
		$("#f_search").submit();
}
	</script>
	
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
         <h2 class="text-dark font-weight-bold mb-2">댓글 관리</h2>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div
               class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
            </div>
            <div class="tab-content tab-transparent-content">

<!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->
    
    <div class="container board-container">

	<div id="boardSearch" class="d-flex justify-content-end">
		<form id="f_search" name="f_search" class="form-inline">
			<%-- 페이징 처리를 위한 파라미터 --%>
			<input type="hidden" name="pageNum" id="pageNum"
				value="${paging.cvo.pageNum}"> <input type="hidden"
				name="amount" id="amount" value="${paging.cvo.amount}">
			<div class="d-inline-flex text-end">
				<label></label> <select id="search" name="search"
					class="form-control form-control-sm w-auto">
					<option value="user_name">유저명</option>
					<option value="mv_re_content">내용</option>
					<option value="mv_bo_num">게시글번호</option>
				</select> <input type="text" name="keyword" id="keyword"
					placeholder="검색어를 입력하세요"
					class="form-control form-control-sm w-auto" />
				<button type="button" id="searchData" class="btn btn-success btn-md">검색</button>
			</div>
		</form>
	</div>
	<br />
		
		<form id="hidden" name="hidden">
			<input type="hidden" id="mv_re_num1" name="mv_re_num" />
			<input type="hidden" id="mv_re_hidden" name="mv_re_hidden" />
			<input type="hidden" name="pageNum" id="pageNum" value="${paging.cvo.pageNum}">
		</form>
		<form id="insert" name="insert">
			<input type="hidden" id="user_name" name="user_name" />
		</form>

		<div id="boardList" class="table-height noticeboard">
			<table summary="댓글 리스트" >
				<thead id="thead">
					<tr>
						<th data-value="mv_re_num" class="order text-center col-md-1" >댓글번호</th>
						<th data-value="mv_re_num" class="order text-center col-md-1" >게시글번호</th>
						<th class="text-center col-md-5">내용</th>
						<th class="text-center col-md-1">작성자</th>
						<th data-value="mv_re_date" class="order col-md-1 text-center">작성일</th>
						<th class="text-center col-md-1">관리자</th>
						
					</tr>
				</thead>
				<tbody id="list" class="table-striped" >
					<c:choose>
						<c:when test="${not empty mvReply}" >
							<c:forEach var="mvReply" items="${mvReply}" varStatus="status"> 
								<tr class="text-center" data-num="${mvReply.mv_re_num}">
 									<td>${mvReply.mv_re_num}</td>
 									<td>${mvReply.mv_bo_num}</td>
									<td class="goContent text-start"> ${mvReply.mv_re_content}</td>
									<td class="name">${mvReply.user_name }</td>
									<td class="text-center"> ${mvReply.mv_re_write_date}</td>
									<td class="text-center">
										<c:if test="${mvReply.mv_re_hidden == 0 }">
											<span data-num="${mvReply.mv_re_num }" data-hidden="${mvReply.mv_re_hidden}" class="hiddenBtn text-center" >숨김</span>
										</c:if>
										<c:if test="${mvReply.mv_re_hidden == 1 }">
											<span data-num="${mvReply.mv_re_num }" data-hidden="${mvReply.mv_re_hidden}" class="hiddenBtn text-center" style="color: red;">해제</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="6" class="tac text-center">등록된 댓글이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- ================ 리스트 종료 ================ --%>
		<%-- ================ 페이징 출력 ================ --%>
		<div class="d-flex justify-content-center">
			<ul class="pagination ">
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
                       <!-- 바로가기 번호 출력 -->
            <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
               <li class="page-item ">
                  <a class="btn btn-outline-secondary ${paging.cvo.pageNum == num ? 'active':'' }" href="${num}">${num }</a>
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
    
<!--  여기도 꼭 넣어주세요!!!!!!!!!!!!! -->
            </div>
         </div>
      </div>

   </div>
         <jsp:include page="../main/footer.jsp" />
</div>
</c:if>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
	let word = "<c:out value='${movieBoardVO.keyword}'/>"; 
	if(word!=""){
		$("#keyword").val('<c:out value='${movieBoardVO.keyword}'/>');
		$("#keyword").focus();
		$("#search").val('<c:out value='${movieBoardVO.search}'/>');
		
		if($("#search").val()!='mv_bo_content'){
			//:contais() 는 특정 텍스트를 포함한 요소 반환
			if($("#search").val()=='mv_bo_title') value = "#list tr td.goDetail";
			console.log($(value+":contains('"+word+"')").html());
			$(value+":contains('"+word+"')").each(function (){
				let regex = new RegExp(word, 'gi');
				$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
			})
		}
	}
	
	$(".hiddenBtn").click(function(){
		let mv_bo_num = $(this).attr("data-num");
		let mv_bo_hidden = $(this).attr("data-hidden");
		$("#mv_bo_num1").val(mv_bo_num);
		if(mv_bo_hidden == 1) {
			$("#mv_bo_hidden").val(0);
		}else{
			$("#mv_bo_hidden").val(1);
		}
		$("#hidden").attr({
			method : "post",
			action : "/admin/movie/mvBoardHidden"
		})
		$("#hidden").submit();
	})

	
	$(".goDetail").click(function(){
		let mv_bo_num = $(this).parents("tr").attr("data-num");
		console.log("mv_bo_num :", mv_bo_num);
		$("#mv_bo_num").val(mv_bo_num);
		$("#mv_bo_hidden").val();
		$("#detail").attr({
			method : "get",
			action : "/admin/movie/mvBoardDetail"
		})
		$("#detail").submit();
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
})

function goPage(){
	$("#f_search").attr({
		"method":"get",
		"action":"/admin/movie/mvBoard"
	})
		$("#f_search").submit();
}
	</script>
	
	<style type="text/css">
     	.required{ color: red; background-color:  yellow;}
		textarea{resize: none;}
		.noticeboard{
					height: 550px;
				}
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
	margin-bottom:50px;
}
.hiddenBtn{cursor : pointer;}
    </style>
 
    
    <div class="container board-container">

	<div id="boardSearch" class="d-flex justify-content-end">
		<form id="f_search" name="f_search" class="form-inline">
			<%-- 페이징 처리를 위한 파라미터 --%>
			<input type="hidden" name="pageNum" id="pageNum"
				value="${paging.cvo.pageNum}"> <input type="hidden"
				name="amount" id="amount" value="${paging.cvo.amount}">
			<div class="d-inline-flex text-end">
				<label></label> <select id="search" name="search"
					class="form-control form-control-sm w-auto">
					<option value="user_name">유저명</option>
					<option value="mv_bo_content">내용</option>
				</select> <input type="text" name="keyword" id="keyword"
					placeholder="검색어를 입력하세요"
					class="form-control form-control-sm w-auto" />
				<button type="button" id="searchData" class="btn btn-primary">검색</button>
			</div>
		</form>
	</div>
	<br />
		
		<form id="detail" name="detail">
			<input type="hidden" id="mv_bo_num" name="mv_bo_num" />
		</form>
		<form id="hidden" name="hidden">
			<input type="hidden" id="mv_bo_num1" name="mv_bo_num" />
			<input type="hidden" id="mv_bo_hidden" name="mv_bo_hidden" />
			<input type="hidden" name="pageNum" id="pageNum" value="${paging.cvo.pageNum}">
		</form>
		<form id="insert" name="insert">
			<input type="hidden" id="user_name" name="user_name" />
		</form>

		<div id="boardList" class="table-height noticeboard">
			<table summary="게시판 리스트" class="table table-striped" >
				<thead>
					<tr>
						<th data-value="mv_bo_num" class="order text-center col-md-1" >댓글번호</th>
						<th class="text-center col-md-5">내용</th>
						<th class="text-center col-md-1">작성자</th>
						<th data-value="mv_bo_date" class="order col-md-1 text-center">작성일</th>
						<th class="text-center col-md-1">관리자</th>
						
					</tr>
				</thead>
				<tbody id="list" class="table-striped" >
					<c:choose>
						<c:when test="${not empty mvReply}" >
							<c:forEach var="mvReply" items="${mvReply}" varStatus="status"> 
								<tr class="text-center" data-num="${mvReply.mv_re_num}">
 									<td>${mvReply.mv_re_num}</td>
									<td class="text-start"> ${mvReply.mv_re_content}</td>
									<td class="name">${mvReply.user_name }</td>
									<td class="text-center"> ${mvReply.mv_re_write_date}</td>
									<td class="text-center">
										<c:if test="${mvReply.mv_re_hidden == 0 }">
											<span data-num="${mvReply.mv_re_num }" data-hidden="${mvReply.mv_re_hidden}" class="hiddenBtn text-center" >숨김</span>
										</c:if>
										<c:if test="${mvReply.mv_re_hidden == 1 }">
											<span data-num="${mvReply.mv_re_num }" data-hidden="${mvReply.mv_re_hidden}" class="hiddenBtn text-center" style="color: red;">해제</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="5" class="tac text-center">등록된 댓글이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- ================ 리스트 종료 ================ --%>
		<%-- ================ 페이징 출력 ================ --%>
		<div class="d-flex justify-content-center">
			<ul class="pagination ">
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
    
>>>>>>> refs/remotes/origin/feature/login
