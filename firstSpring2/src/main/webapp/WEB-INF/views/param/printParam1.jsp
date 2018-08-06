<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전달 값 확인</title>
</head>
<body>
	글번호 : <c:out value="${notice.no }"/><br>
	제목 : <c:out value="${notice.title }"/><br>
	내용 : <c:out value="${notice.content }"/><br>
	작성자 : <c:out value="${notice.writer }"/><br>
	조회수 : <c:out value="${notice.count }"/><br>
	작성일 : <c:out value="${notice.date }"/><br>
</body>
</html>