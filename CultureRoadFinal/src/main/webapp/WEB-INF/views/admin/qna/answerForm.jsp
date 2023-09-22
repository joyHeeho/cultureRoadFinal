<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<style>
	@charset "UTF-8";

	#item-template{
		display: none;
	}
	.answerform{
		margin:auto;
		width:800px;
		background-color:lightgray;
	}
	table{
		margin:auto;	
	
	}
	#question{
		overflow-wrap: break-word;
		width:600px;
		height:200px;
	}
/* 	#btn{ */
/* 		text-align:center;	 */
/* 	} */
	td{
		text-align:center;
	
	}

	
</style>
<script type="text/javascript">


$(function(){
		
		$("#cancelBtn").click(function(){
			$("#reviewList").each(function(){
				this.reset();
			});
		})
		
		$("#answerBtn").click(function() {
			if (!chkData("#answer", "내용을")) return;
			else{
				$("#reviewList").attr({
					"method":"post",
					"action":"/admin/qna/updateAnswer"
				});
				$("#reviewList").submit();
			}
		})
		
	})

</script>

<div class="answerform">
        <form name="comment-form" id="reviewList">
        	<input type="hidden" name="qna_id" value="${qvo.qna_id}" />
            <input type="hidden" name="managerId" value="${adminLogin.managerId}">
			<input type="hidden" name="answer_date" value="${qvo.answer_date}" />	
        	<table>
        		<tr>
                	<td>작성자:</td>
                	<td style="float:left"><input type="text" class="form-control" name="user_id" value="${qvo.user_id}" readonly/></td>
                </tr>	
				<tr>                	
                	<td>질문:</td>
                	<td>
						<textarea name="question" class="form-control" id="question" readonly>${qvo.question}</textarea>
           			</td>
           		</tr>
           		   
           		 <tr> 
           		 	<td colspan="2">
           		  		<textarea name="answer" id="answer" class="form-control" rows="3" placeholder="관리자 답변을 입력하세요">${qvo.answer}</textarea>
				 	</td>
				 </tr>	
				 <tr>
				 	<td colspan="2" id="btn"><button type="button" id="answerBtn" class="btn btn-light answerBtn">답변</button>
				 					<button type="reset" class="btn btn-secondary" >취소</button>
				 	</td>
				 </tr>
       		</table>
        </form>
 
 </div>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<style>
	@charset "UTF-8";

	#item-template{
		display: none;
	}
	.answerform{
		margin:auto;
		width:800px;
		background-color:lightgray;
	}
	table{
		margin:auto;	
	
	}
	#question{
		overflow-wrap: break-word;
		width:600px;
		height:200px;
	}
/* 	#btn{ */
/* 		text-align:center;	 */
/* 	} */
	td{
		text-align:center;
	
	}

	
</style>
<script type="text/javascript">


$(function(){
		
		$("#cancelBtn").click(function(){
			$("#reviewList").each(function(){
				this.reset();
			});
		})
		
		$("#answerBtn").click(function() {
			if (!chkData("#answer", "내용을")) return;
			else{
				$("#reviewList").attr({
					"method":"post",
					"action":"/admin/qna/updateAnswer"
				});
				$("#reviewList").submit();
			}
		})
		
	})

</script>

<div class="answerform">
        <form name="comment-form" id="reviewList">
        	<input type="hidden" name="qna_id" value="${qvo.qna_id}" />
            <input type="hidden" name="managerId" value="${adminLogin.managerId}">
			<input type="hidden" name="answer_date" value="${qvo.answer_date}" />	
        	<table>
        		<tr>
                	<td>작성자:</td>
                	<td style="float:left"><input type="text" class="form-control" name="user_id" value="${qvo.user_id}" readonly/></td>
                </tr>	
				<tr>                	
                	<td>질문:</td>
                	<td>
						<textarea name="question" class="form-control" id="question" readonly>${qvo.question}</textarea>
           			</td>
           		</tr>
           		   
           		 <tr> 
           		 	<td colspan="2">
           		  		<textarea name="answer" id="answer" class="form-control" rows="3" placeholder="관리자 답변을 입력하세요">${qvo.answer}</textarea>
				 	</td>
				 </tr>	
				 <tr>
				 	<td colspan="2" id="btn"><button type="button" id="answerBtn" class="btn btn-light answerBtn">답변</button>
				 					<button type="reset" class="btn btn-secondary" >취소</button>
				 	</td>
				 </tr>
       		</table>
        </form>
 
 </div>
>>>>>>> refs/remotes/origin/feature/login
