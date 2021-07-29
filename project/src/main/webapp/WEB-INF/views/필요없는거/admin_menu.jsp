<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 세션변수가 존재하면 -->
<div style="text-align: right;" id="fm-header">
	<c:choose>
		<c:when test="${sessionScope.userid == null }">
			<a href="/web_project/fm/fm_login.jsp">Login</a> |
		<a href="/web_project/fm/fm_admin-login.jsp">Admin Login</a> |  
		<a href="/web_project/admin_servlet/logout.do">Like Restaurants</a>  |
		
	</c:when>
		<c:otherwise>
		${sessionScope.name}님이 로그인중입니다.
		<a href="${path}/admin_servlet/logout.do">Logout</a>  |
			<a href="/web_project/admin_servlet/logout.do">Like Restaurants</a>  |
		<a href="/web_project/fm/fm_mypage-check.jsp">My Info</a>  |
	</c:otherwise>
	</c:choose>
	<!-- <button class="btn header-btn-collapse-nav" data-toggle="collapse"
		data-target=".fm-header">
		<i class="fas fa-bars"></i>
	</button> -->
</div>
