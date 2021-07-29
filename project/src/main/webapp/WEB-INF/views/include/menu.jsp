<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 세션변수가 존재하면 -->
<div style="text-align: right;" id="fm-header">
	<c:choose>
		<c:when test="${sessionScope.userid == null }">
			<a href="${path}/login/login.do">Login</a> |
		<a href="${path}/admin/login.do">Admin Login</a> |
		<a href="${path}/member/join.do">Join</a> | 
		
	</c:when>
		<c:otherwise>
		${sessionScope.name}님이 로그인중입니다.<br>
		<a href="${path}/login/logout.do">Logout</a>|
		<%
		if (!session.getAttribute("userid").equals("admin")) {
		%>
			<a href="${path}/good/list.do">My Restaurants</a>|
		<%
			}
			%>
		</c:otherwise>
	</c:choose>
</div>
