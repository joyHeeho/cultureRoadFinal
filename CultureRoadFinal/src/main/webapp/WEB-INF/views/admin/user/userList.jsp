<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
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
$(function() {
    /* 검색 후 검색 대상과 검색 단어 출력 */
    let word="<c:out value='${UserLoginVO.keyword}' />";
    let value="";
    if(word!=""){
       $("#keyword").val("<c:out value='${UserLoginVO.keyword}' />");
       $("#search").val("<c:out value='${UserLoginVO.search}' />");
    }
    
    /* 입력 양식 enter 제거 */
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

    /* 검색 대상이 변경될 때마다 처리 이벤트 */
    $("#search").change(function() {
       if ($("#search").val() == "all") {
          $("#keyword").val("전체목록을 조회합니다.");
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

    $(".paginate_button a").click(function(e) {
       e.preventDefault();
       $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
       goPage();
    })
    
 });
 
 
 function goPage() {
    if ($("#search").val() == "all") {
       $("#keyword").val("");
    }

    $("#f_search").attr({
       "method" : "get",
       "action" : "/admin/user/userList"
    });
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
				<div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
				</div>
				<div class="tab-content tab-transparent-content">
					<!-- 여기서부터 user출력할거고 userSearch는 유저검색기능이댜아아ㅏ -->
					<div id="boardSearch"> <!-- class="text-right" -->
						<form id="f_search" name="f_search"><!--  class="form-inline" -->
							<div class="form-group">
							<%-- 페이징 처리를 위한 파라미터 --%>
							<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.uvo.pageNum}"> 
							<input type="hidden" name="amount" id="amount" value="${pageMaker.uvo.amount}">
							<label>검색조건</label> 
							<select id="search" name="search"><!--  class="form-control"> -->
								<option value="all">전체</option>
								<option value="userId">아이디</option>
								<option value="userName">이름</option>
								<option value="userStatus">회원상태</option>
							</select>
							<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control" />
							<button type="button" id="searchData" class="btn btn-success">검색</button>
				</div>
			</form>
		</div>
					<!-- userList시작 -->
					<div id="userList">
						<table summary="유저 리스트">
							<thead id="thead">
								<tr>
									<th data-value="user_no" >회원번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>생년월일</th>
									<th>가입일</th>
									<th>회원상태</th>
								</tr>
							</thead>
							<tbody id="list">
								<c:choose>
									<c:when test="${not empty userInfo}">
										<c:forEach var="user" items="${userInfo}" varStatus="status">
											<tr class="text-center" data-num="${user.userNo}">
												<td>${user.userNo}</td>
												<td>${user.userId}</td>
												<td>${user.userName}</td>
												<td>${user.userEmail}</td>
												<td>${user.userBirth}</td>
												<td>${user.userDate}</td>
												<td>${user.userStatus}</td>
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
					
		<%--==================== 페이징 출력 시작 ====================--%>
	<%-- 	<div class="text-center">
			<ul class="pagination">
				<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage - 1 }">Previous</a></li>
				</c:if>

				<!-- 바로가기 번호 출력 -->
				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li
						class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':'' }">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
		==================== 페이징 출력 종료 ==================== --%>
				</div>
			</div>
		</div>
	</div>
			<jsp:include page="../main/footer.jsp" />
</div>

	

			