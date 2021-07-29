<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>
	<%
	pageContext.setAttribute("newLineChar", "\n");
	%>

	<c:forEach var="row" items="${list}">
		<c:set var="str"
			value="${fn:replace(row.replytext, ' ','&nbsp; &nbsp;') }" />
		<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />
		<li>
			<div class="comment">
				<div class="img-thumbnail border-0 p-0 d-none d-md-block">
					<img class="avatar" alt="" src="/project/images/user.png">
				</div>
				<div class="comment-block">
					<div class="comment-arrow"></div>
					<span class="comment-by"> <strong>${row.name}(<fmt:formatDate
								value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /> )
					</strong> <span class="float-right"> <c:if
								test="${sessionScope.userid == row.replyer }">
								<input type="button" id="btnModify" class="btn btn-light btn-sm"
									value="Modify" onclick="showModify('${row.reply_idx}')">
							</c:if>
					</span>
					</span>
					<p>${str}</p>
				</div>
			</div>
		</li>
	</c:forEach>
		<ul class="pagination justify-content-center float-center">
			<c:if test="${pager.curBlock > 1}">
				<a class="page-link"
					href="javascript:listReply('${pager.prevPage}')"> <i
					class="fas fa-angle-left"></i>
				</a>&nbsp;
</c:if>
			<c:forEach var="num" begin="${pager.blockBegin}"
				end="${pager.blockEnd}">
				<c:choose>
					<c:when test="${num == pager.curPage}">
						<span class="page-link" style="color: red"> ${num}&nbsp;</span>
					</c:when>
					<c:otherwise>
						<!-- 현재 페이지가 아닐 때 -->
						<a class="page-link" href="javascript:listReply('${num}')">${num}</a>&nbsp;
</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pager.curBlock <= pager.totBlock}">
				<a class="page-link"
					href="javascript:listReply('${pager.nextPage}')"><i
					class="fas fa-angle-right"></i></a>&nbsp;
</c:if>
		</ul>
</body>
</html>