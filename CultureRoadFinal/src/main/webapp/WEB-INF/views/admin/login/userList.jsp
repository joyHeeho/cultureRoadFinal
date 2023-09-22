<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table {
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	text-align: center;
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
	border-bottom: 1px solid rgba(0, 0, 0, .1);
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
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
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
}
</style>

<script type="text/javascript">
$(function(){
	let word = "<c:out value='${userLoginVO.keyword}'/>"; 
	if(word!=""){
		$("#keyword").val('<c:out value='${userLoginVO.keyword}'/>');
		$("#keyword").focus();
		$("#search").val('<c:out value='${userLoginVO.search}'/>');
	}
	
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
	
	$("#search").change(function(){
		if($("#search").val() == "all") {
			$("#keyword").val("전체 목록을 조회합니다.")
		} else if($("#search").val() !="all") {
			$("#keyword").val("");
			$("#keyword").focus();
		}
	})
	
	$("#searchData").click(function() {
         if ($("#search").val() != "all") {
            if (!chkData("#keyword", "검색어를"))
               return;
         }
         $("#pageNum").val(1); //페이지 초기화
         goPage();
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
		"action":"/admin/user/userInfo"
	})
		$("#f_search").submit();
}
	</script>
<jsp:include page="../main/main.jsp" />
<div class="main-panel">
	<div class="content-wrapper">
		<div class="d-xl-flex justify-content-between align-items-start">
			<h2 class="text-dark font-weight-bold mb-2">유저관리 성공하고싶어요.</h2>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div
					class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
				</div>
				<div class="tab-content tab-transparent-content">
					<!-- 여기서부터 user출력할거고 userSearch는 유저검색기능이댜아아ㅏ -->
					<div id="userSearch" class=text-right">
						<form id="f_search" name="f_search">
							<%-- 페이징 처리를 위한 파라미터 --%>
							<input type="hidden" name="pageNum" id="pageNum" value="${paging.cvo.pageNum}">
							<input type="hidden" name="amount" id="amount" value="${paging.cvo.amount}">
							<div>
								<label></label> 
								<select id="search" name="search" class="form-control">
									<option value="all">전체</option>
									<option value="user_name">이름</option>
									<option value="user_id">아이디</option>
								</select> 
								<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" />
								<button type="button" id="searchData" class="btn btn-primary">검색</button>
							</div>
						</form>
					</div>
					<br />
					
					<!-- userList시작 -->
					<div id="userList">
						<table summary="유저 리스트">
							<thead id="thead">
								<tr>
									<th data-value="user_no">회원번호</th>
									<th data-value="user_id">아이디</th>
									<th data-value="user_name">이름</th>
									<th>이메일</th>
									<th>생년월일</th>
									<th>가입일</th>
									<th>탈퇴여부</th>
								</tr>
							</thead>
							<tbody id="list">
								<c:choose>
									<c:when test="${not empty userInfo}">
										<c:forEach var="user" items="${userInfo}" varStatus="status">
											<tr class="text-center" data-num="${user.user_no}">
												<td>${user.user_no}</td>
												<td>${user.user_id}</td>
												<td>${user.user_name}</td>
												<td>${user.user_email}</td>
												<td>${user.user_birth}</td>
												<td>${user.user_date}</td>
												<td>${user.user_delete}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">등록된 회원정보가 없습니다.</td>
										</tr>
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
								<li class="page-item"><a class="page-link"
									href="${paging.initpage}">처음으로</a></li>
								<li class="page-item previous"><a class="page-link"
									href="${paging.startPage -1}">이전</a></li>
							</c:if>

							<!-- 바로가기 번호 출력 -->
							<c:forEach var="num" begin="${paging.startPage }"
								end="${paging.endPage }">
								<li
									class="page-item ${paging.cvo.pageNum == num ? 'active':'' }">
									<a class="page-link" href="${num}">${num }</a>
								</li>
							</c:forEach>

							<!-- 다음 바로가기 10개 존재 여부 확인 -->
							<c:if test="${paging.next }">
								<li class="page-item next"><a class="page-link"
									href="${paging.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>

				</div>
			</div>
		</div>

	</div>
			<jsp:include page="../main/footer.jsp" />
</div>

	

			