<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.contentContainer {
	padding-top: 20px;
	margin-bottom: 30px;
}
/* 전체 컨테이너 스타일링 */
.contentContainer {
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-top:100px;
}

/* 제목 부분 */
.contentTit {
	padding: 15px;
	margin-bottom: 20px;
	border-bottom: 1px solid #ccc;
}

.contentTit h3 {
	color: #333;
}

/* 테이블 스타일링 */
.contentTB .table {
	border-collapse: collapse;
}

.contentTB .table th, .contentTB .table td {
	border: 1px solid #ccc;
	padding: 10px;
}

.contentTB .table-striped tbody tr:nth-of-type(odd) {
	background-color: rgba(0, 0, 0, .05);
}

/* 테이블 행 높이 조절 */
.table-tr-height {
	height: 100px; /* 원하는 높이로 설정 */
}

#replydList {
  width: 100%;
  border-radius: 5px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  margin: 20px 0;
}

/* Style the table */
.table {
  width: 100%;
  border-collapse: collapse;
}

/* Add alternating row colors */
.table-striped tbody tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* Style table headers and cells */
.table th,
.table td {
  padding: 12px 15px;
  text-align: center;
  border: 1px solid #ddd;
}

/* Highlight the row when hovered */
.table-striped tbody tr:hover {
  background-color: #ddd;
}

/* Center the text in cells */
.text-center {
  text-align: center;
}

/* Style for the 'No comments' row */
.tac {
  color: #999;
  font-style: italic;
}

</style>




	<div class="container contentContainer">

		<div class="contentTit page-header">
			<h3 class="text-center">${detail.mv_bo_title }</h3>
		</div>

		<div class="contentTB text-center">
			<table class="table table-bordered table-striped table-hover">
				<tbody>
					<tr>
						<td class="col-md-3">작성자</td>
						<td class="col-md-3 text-start">${detail.user_name }(조회수:
							${detail.mv_bo_readcnt})</td>
						<td class="col-md-3">작성일</td>
						<td class="col-md-3 text-start">${detail.mv_bo_write_date}</td>
					</tr>
					<!-- 이 부분에 추가한 CSS 클래스 적용 -->
					<tr class="table-tr-height">
						<td colspan="4" class="col-md-8 text-start">${detail.mv_bo_content}</td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>

		<!-- 댓글 목록 -->
<%-- 		<%@ include file="mvReply.jsp"%> --%>

