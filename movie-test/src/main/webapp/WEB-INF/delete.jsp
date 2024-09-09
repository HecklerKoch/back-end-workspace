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

	<h1>영화 정보 삭제</h1>
	<form action="/delete" method="post">
	<input type="text" placeholder="영화 제목" name="title">
	<input type="submit" value="지우기">
	</form>
</body>
</html>