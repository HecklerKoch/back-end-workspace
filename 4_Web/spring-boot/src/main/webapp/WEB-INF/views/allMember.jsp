<%@page import="com.kh.model.vo.Client"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 보기</h1>
	<a href="/">메인 페이지로 이동</a>
	<table border="1">
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	</tr>
	<c:forEach var="c" items="${list}">
		<tr>
			<td>${c.id}</td>
			<td>${c.password}</td>
			<td>${c.name}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>