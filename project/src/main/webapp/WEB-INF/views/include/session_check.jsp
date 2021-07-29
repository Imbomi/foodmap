<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션에 저장된 userid 값을 가져옴
String userid=(String)session.getAttribute("userid");
if(userid==null){ // null이면 
%>
	<script>
		alert("please log in first");
		location.href="${path}/main/login.do";
	</script>	
<%
}

%>