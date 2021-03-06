<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<input type="hidden" id="reloadController" value="<c:url value='/Admin/Course/ListCourse/Ajax'/>">
<div class="">
	<div class="page-title">
		<div class="title_left">
			<h3>Quản lý khóa học </h3>
		</div>
	</div>
	<div class="clearfix"></div>

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>Danh sách khóa học</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Settings 1</a></li>
								<li><a href="#">Settings 2</a></li>
							</ul></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
				<a href="#" class="btn btn-success btn-sm btn-open-modal" data-toggle="tooltip" data-placement="top"  data-original-title="Thêm khóa học mới" data-controller="<c:url value='/Admin/Course/ListCourse/ViewInsert'/>"><i class="fa fa-plus"></i></a>
				<div class="ajax-content">
                    <c:import url="/Views/Admin/Course/list_course_ajax.jsp"/> 
                </div>
				</div>
			</div>
		</div>
	</div>
</div>