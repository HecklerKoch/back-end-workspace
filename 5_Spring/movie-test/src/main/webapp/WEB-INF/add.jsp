<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<h1>영화 정보 추가</h1>
	<form action="/add" method="post">
	<input type="text" placeholder=" 영화 제목 입력" name="title">
	<input type="text" placeholder=" 영화 장르 입력" name="genre">
	<input type="text" placeholder=" 영화 배우들 입력" name="actor">
	<input type="submit" value="영화 추가">
	</form>
</body>
</html>