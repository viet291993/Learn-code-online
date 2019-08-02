<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<input type="hidden" id="reloadController" value="<c:url value='/Admin/Permission/ListAdmin/Ajax'/>">
<div class="">
	<div class="page-title">
		<div class="title_left">
			<h3>Trang chủ </h3>
		</div>
	</div>
	<div class="clearfix"></div>
	<c:import url="/Views/Admin/Home/dashboard_ajax.jsp"/>
</div>