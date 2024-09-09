<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/">영화 목록</a>
	<a href="/add">영화 정보 추가</a>
	<a href="/delete">영화 정보 삭제</a>
	
	<form action="/update" method="post">
	<input type="text" placeholder="제목으로 영화 찾기" name="title">
	<input type="submit" value="찾기!">
	</form>
</body>
</html>