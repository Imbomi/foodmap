<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script>
	$(document).ready(function() {
		//댓글 삭제 버튼 클릭
		$("#btnReplyDelete").click(function() {
			$.ajax({
				type : "delete",
				url : "${path}/reply/delete/${dto.reply_idx}",
				success : function(result) {
					if (result == "success") {
						alert("삭제되었습니다.");
						$("#modifyReply").hide();
						listReply("1");
					}
				}
			});
		});
		//댓글 수정 버튼 클릭
		// put : 전체 수정, patch : 일부 수정
		$("#btnReplyUpdate").click(function() {
			var replytext = $("#detail_replytext").val();
			$.ajax({
				type : "put",
				url : "${path}/reply/update/${dto.reply_idx}",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					replytext : replytext
				}),
				dataType : "text",
				success : function(result) {
					if (result == "success") {
						//댓글 목록 갱신
						listReply("1");
						//div 숨김 처리
						$("#modifyReply").hide();
					}
				}
			});
		});
		//닫기 버튼 클릭
		$("#btnReplyClose").click(function() {
			//$("#modifyReply").css("visibility", "hidden");
			$("#modifyReply").hide();
		});
	});
</script>

</head>
<body>
	Editing <span style="font-style:italic;">${dto.replyer}</span> 's comment.
	<br>
	<!-- 댓글 번호 -->
	<textarea maxlength="1000" placeholder="Please enter your review."
		rows="4" class="form-control" id="detail_replytext" required>${dto.replytext}</textarea>
	<div style="text-align: center;">
		<!-- 본인의 댓글만 수정,삭제가 가능하도록 처리 -->
		<c:if test="${sessionScope.userid == dto.replyer }">
			<button id="btnReplyUpdate" type="button"
				class="btn btn-light btn-sm">수정</button>
			<button id="btnReplyDelete" type="button"
				class="btn btn-light btn-sm">삭제</button>
		</c:if>
		<button id="btnReplyClose" type="button" class="btn btn-light btn-sm">닫기</button>
	</div>
</body>
</html>