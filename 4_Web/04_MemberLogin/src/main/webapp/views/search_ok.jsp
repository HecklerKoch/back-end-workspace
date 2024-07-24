<%@page import="Client.vo.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Client client = (Client) request.getAttribute("search"); 
	if(client!=null) {
	%>
	<h1>조회 결과</h1>
	<ul>
	<li>아이디 : <%=client.getId() %></li>
	<li>비밀번호 : <%=client.getPassword() %></li>
	<li>이름 : <%=client.getName() %></li>	
	</ul>
	<% } else { request.getRequestDispatcher("/views/search_fail.jsp").forward(request, response);
	} %>
</body>
</html>