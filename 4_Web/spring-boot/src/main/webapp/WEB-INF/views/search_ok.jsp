<%@page import="com.kh.model.vo.Client"%>
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

	<h1>조회 결과</h1>
	<ul>
	<li>아이디 : ${client.id}</li>
	<li>비밀번호 : ${client.password}</li>
	<li>이름 : ${client.name}</li>	
	</ul>
	<a href="/">메인 화면으로 돌아가기</a>
	
	<%--  --%>
	

	
	
</body>
</html>