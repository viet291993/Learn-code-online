<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<input type="hidden" id="reloadController" value="<c:url value='/Admin/Course/Setting/Ajax'/>">
<div class="">
	<div class="page-title">
		<div class="title_left">
			<h3>Cài đặt khóa học </h3>
		</div>
	</div>
	<div class="clearfix"></div>

	<div class="row">
		 <c:import url="/Views/Admin/Course/setting_course_ajax.jsp"/> 	
	</div>				
</div>
				
						
				
			