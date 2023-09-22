<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">

	</script>
	<style type="text/css">
     	.contentContainer{padding-top: 20px;
     			height: 100%;
     		}
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
            height: 680px; /* 원하는 높이로 설정 */
        }
     	
    </style>
	

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
				<a class="btn" href="/notice/list">목록</a>
			</div>

		</div>
	</div>
