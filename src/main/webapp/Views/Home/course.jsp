<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${LIST_COURSE}" var="course">
		Name: ${course.name}<br/>
		<c:forEach items="${course.syllabuses}" var="syllabus">
			Name: ${syllabus.id}<br/>
		</c:forEach>
	</c:forEach>
</body>
</html>