<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">zz
	$(function(){
	    /** 기본 덧글 목록 불러오기 */
	    let id = ${movie.id};
	    let title = "${movie.title}";
	    listAll(id);
	
	    /** 글입력을 위한 Ajax 연동 처리 */
		$(document).on("click", "#commentInsertBtn", function(){
		    let insertUrl = "/comment/commentInsert";
		
		    // Check if user is logged in
		    if (!"${userLogin.userName}") {
		        alert("로그인을 하고 이용해주시기 바랍니다.");
		        window.location.href = "/userLogin/loginUser";
		        return;
		    }
		
		    let value = JSON.stringify({
		        id: id,
		        title: title,
		        user_name: $("#user_name").val(),
		        mv_co_content: $("#mv_co_content").val()
		    });
	        $.ajax({
	            url: insertUrl,
	            type: "post",   // 전송 시 method 방식
	            headers: {
	                "Content-Type": "application/json"
	            },
	            dataType: "text",
	            data: value,
	            error: function(xhr, textStatus, errorThrown){  // 실행시 오류가 발생하였을 경우
	                alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
	                //alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요.");   
	            },
	            beforeSend: function(){   // 전송 전 유효성 체크
	                if (!checkForm("#user_name", "작성자를")) return false; // checkForm() 함수는 placeholder 속성을 이용하여 사용
	                else if (!checkForm("#mv_co_content", "한줄평을")) return false;
	            },
	            success: function(result){   // 서버로부터 응답코드 200으로 정상 처리가 되었을 경우
	                if (result == "SUCCESS"){
	                    alert("댓글 등록이 완료 되었습니다.");
	                    dataReset();      // 입력폼 초기화
	                    listAll(id);
	                }
	            }
	        });
	    });
	
	    /* 비밀번호 확인없이 수정버튼 제어 */
	    $(document).on("click", "button[data-btn='upBtn']", function(){
	        let panel = $(this).parents("div.panel");
	        let mv_co_num = panel.attr("data-num");
	        updateForm(mv_co_num, panel);
	    });
	
	    //수정중 취소버튼 event
	    $(document).on("click","button[class='btn btn-success resetBtn']",function(){
	        $("#mv_co_content, #user_name").val("");
	        dataReset();
	    });
	
	    /** 수정을 위한 Ajax 연동 처리 */
	    $(document).on("click","#commentUpdateBtn", function(){
	        let mv_co_num = $(this).attr("data-mv_co_num");
	        $.ajax({
	            url: '/comment/'+mv_co_num,
	            type: 'put',
	            headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "PUT"
	            },
	            data: JSON.stringify({
	                mv_co_content: $("#mv_co_content").val()
	            }),
	            dataType: 'text',
	            error: function(xhr, textStatus, errorThrown){
	                alert(textStatus + "(HTTP-" + xhr.status + " / " + errorThrown + ")");
	            },
	            beforeSend: function(){
	                if (!checkForm("#mv_co_content", "한줄평을")) return false;
	            },
	            success: function(result){
	                console.log("result:" + result);
	                if (result == "SUCCESS"){
	                    alert("댓글 수정이 완료되었습니다.");
	                    dataReset();
	                    listAll(id);
	                }
	            }
	        });
	    });
	
	    /* 비밀번호 확인없이 삭제버튼 제어 */
	    $(document).on("click","button[data-btn='delBtn']",function(){
	        let mv_co_num = $(this).parents("div.panel").attr("data-num");
	        deleteBtn(id, mv_co_num);
	    });
	}); // 최상위 $ 종료
	
	function dataReset(){
	    $("#commentForm").each(function(){
	        this.reset();
	    });
	
// 	    $("#user_name").prop("readonly", false);
	    $("#commentForm button[type='button']").removeAttr("data-mv_co_num");
	    $("#commentForm button[type='button']").attr("id","commentInsertBtn");
	    $("#commentForm button[type='button'].sendBtn").html("저장");
	    $("#commentForm button[type='button'].resetBtn").detach();
	}
	
	function deleteBtn(id, mv_co_num) {
	    if (confirm("선택하신 한줄평을 삭제하시겠습니까?")) {
	        $.ajax({
	            url: '/comment/' + mv_co_num,
	            type: 'delete', //method - get(조회-R)/post(입력-C)/put(수정-U)/delete(삭제-D) 명시
	            headers: {
	                "X-HTTP-Method-Override": "DELETE"
	            },
	            dataType: 'text',
	            error: function(xhr, textStatus, errorThrown) { //실행시 오류가 발생하였을 경우
	                alert(textStatus + "(HTTP-" + xhr.status + " / " + errorThrown + ")");
	            },
	            success: function(result) {
	                if (result == "SUCCESS") {
	                    alert("댓글 삭제가 완료되었습니다.");
	                    listAll(id);
	                }
	            }
	        });
	    }
	}
	
	/* 댓글 목록을 보여주는 함수 */
	function listAll(id) {
	    $(".comment").detach(); //detach():선택한 요소를 DOM트리에서 삭제.
	    let url = "/comment/all/" + id;
	    $.getJSON(url, function(data) { //data = [{...r_num:1,r_name:"홍길동"...},{...}]
	        $(data).each(function(index) {
	            let mv_co_num = this.mv_co_num;
	            let user_name = this.user_name;
	            let mv_co_content = this.mv_co_content;
	            let mv_co_write_date = this.mv_co_write_date;
	            mv_co_content = mv_co_content.replace(/(\r\n|\r|\n)/g, "<br/>");
	
	            template(mv_co_num, user_name, mv_co_content, mv_co_write_date);
	        });
	    }).fail(function(){
	        alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
	    });
	}
	
	/* 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
	function template(mv_co_num, user_name, mv_co_content, mv_co_write_date){
	    let $div = $("#reviewList");
	
	    let $element = $("#item-template").clone().removeAttr('id');
	    $element.attr("data-num", mv_co_num);
	    $element.addClass("comment");
	    $element.find('.panel-heading > .panel-title > .name').html(user_name);
	    $element.find('.panel-heading > .panel-title > .date').html(" / " + mv_co_write_date);
	    $element.find('.panel-body').html(mv_co_content);
	
	    $div.append($element);
	    }
	
	    /* 수정 폼 화 */
	    function updateForm(mv_co_num, panel){
	        $("#commentForm .resetBtn").detach();
	
	        $("#user_name").val(panel.find(".panel-title .name").html());
	        $("#user_name").prop("readonly", true);
	
	        let content = panel.find(".panel-body").html();
	        content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'); 
	        $("#mv_co_content").val(content);
	
	        $("#commentForm button[type='button']").attr("id", "commentUpdateBtn");
	        $("#commentForm button[type='button']").attr("data-mv_co_num", mv_co_num);
	        $("#commentForm button[type='button']").html("수정");
	
	        let resetButton = $("<button type='button' class='btn btn-success resetBtn'>");
	        resetButton.html("취소");
	
	        $("#commentForm .sendBtn").after(resetButton);
	
	    }
    </script>

</head>
<body>
	<div id="commentContainer">
		<%-- 댓글 입력 화면 --%>
		<form id="commentForm" name="commentForm" class="mt-4">
			<div class="row align-items-center">
				<div class="col-md-3">
					<label for="user_name">작성자</label> <input type="text" name="user_name" id="user_name" maxlength="5" class="form-control" value="${userLogin.userName}" readonly="readonly" />
				</div>
				<div class="col-md-6">
					<label for="mv_co_content">댓글내용</label> <input type="text" name="mv_co_content" id="mv_co_content" class="form-control" />
				</div>
				<div class="col-md-3">
					<button type="button" id="commentInsertBtn" class="btn btn-success">저장</button>
				</div>
			</div>
		</form>
		<br>
		<%-- 리스트 영역 --%>
		<div id="reviewList">
			<div id="item-template" class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="name"></span> <span class="date"></span>
						<button type="button" data-btn="upBtn" class="btn btn-danger">수정하기</button>
						<button type="button" data-btn="delBtn" class="btn btn-danger">삭제하기</button>
					</h3>
				</div>
				<div class="panel-body"></div>
			</div>
		</div>


	</div>
</body>
</html>