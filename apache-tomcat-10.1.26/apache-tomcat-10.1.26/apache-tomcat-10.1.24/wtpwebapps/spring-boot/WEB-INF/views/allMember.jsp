<%@page import="com.kh.model.vo.Client"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 보기</h1>
	<a href="/">메인 페이지로 이동</a>
		<% ArrayList<Client> list = (ArrayList<Client>)request.getAttribute("allList");%>
	<table border="1">
	<tr>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	</tr>
	<% for(Client c : list) { %>
		  <tr>
		  <td><%=c.getId() %></td>
		  <td><%=c.getPassword() %></td>
		  <td><%=c.getName() %></td>
		  </tr>
		  <% } %>
	</table>
</body>
</html>