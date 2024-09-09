<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

	<a href="/">영화 목록</a>
	<a href="/add">영화 정보 추가</a>
	
	<h1>영화 목록</h1>
	
	<table>
	<tr>
	<td>제목</td>
	<td>장르</td>
	<td>영화배우</td>
	</tr>
	<c:forEach items="${List}" var="movie">
		<tr>
			<td>${movie.title}</td>
			<td>${movie.genre}</td>
			<td>${movie.actor}</td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>