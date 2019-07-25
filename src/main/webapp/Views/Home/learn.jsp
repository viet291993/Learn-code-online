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
	List course
	<c:forEach items="${LIST_COURSE}" var="course">
		<li>Name: ${course.name}<br />
		</li>
		<li>Description: ${course.description}<br />
		</li>
		<li>Name Ascii: ${course.nameAscii}<br />
		</li>
	</c:forEach>
</body>
</html>