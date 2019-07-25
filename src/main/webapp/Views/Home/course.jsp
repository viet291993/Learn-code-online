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
	Course detail
	<c:forEach items="${SELECTED_COURSE.syllabuses}" var="syllabus">
		<ul>
			<li>Syllabus: ${syllabus.name}<br />
				<ul>
					<c:forEach items="${syllabus.lessions}" var="lession">
						<li>Lession: <a href="${SELECTED_COURSE.nameAscii}/${lession.nameAscii}">${lession.name}</a></li>
					</c:forEach>
				</ul>
			</li>
		</ul>
	</c:forEach>
	
</body>
</html>