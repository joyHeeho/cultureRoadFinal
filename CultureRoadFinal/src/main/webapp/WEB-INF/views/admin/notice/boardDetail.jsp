<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">
	$(function(){
		$("#updateBtn").click(function(){
			$("#updateFrom").attr({
				"method":"post",
				"action":"/admin/notice/noticeUpdateForm"
			});
			$("#updateFrom").submit();
		})
	})
	</script>
	<style type="text/css">
     	.contentContainer{padding-top: 20px;}
     	        /* 전체 컨테이너 스타일링 */
        .contentContainer {
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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
            background-color: rgba(0,0,0,.05);
        }

        /* 테이블 행 높이 조절 */
        .table-tr-height {
            height: 100px; /* 원하는 높이로 설정 */
        }
     	
    </style>
	
<!-- 	</head> -->
<!-- 	<body class="d-flex flex-column min-vh-100"> -->

  
	<div class="container contentContainer">

		<div class="contentTit page-header">
			<h3 class="text-center" >${detail.noc_title }</h3>
		</div>

		<div class="contentTB text-center">
			<table class="table table-bordered table-striped table-hover">
				<tbody>
					<tr>
						<td class="col-md-3">작성자</td>
						<td class="col-md-3 text-start">관리자 (조회수: ${detail.readcnt})</td>
						<td class="col-md-3">작성일</td>
						<td class="col-md-3 text-start">${detail.noc_write_date}</td>
					</tr>
					<!-- 이 부분에 추가한 CSS 클래스 적용 -->
					<tr class="table-tr-height">
						<td colspan="4" class="col-md-8 text-start">${detail.noc_content}</td>
					</tr>
				</tbody>
			</table>
			<div class="text-end">
				<a class="btn" id="updateBtn" >수정</a>
				<a class="btn" href="/admin/notice/board">목록으로</a>
			</div>
			<form id="updateFrom">
				<input type="hidden" id="noc_num" name="noc_num" value="${detail.noc_num }" />
			</form>
		</div>
	</div>
