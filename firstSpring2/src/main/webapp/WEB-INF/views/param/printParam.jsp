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
	<c:out value="${notice.no }"/>, <c:out value="${notice.title }"/>
<%-- 	<c:out value="${member.no }"/> --%>
</body>
</html>