<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="">
	<div class="page-title">
		<div class="title_left">
			<h3>Nhật ký hoạt động</h3>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>Nhật ký hoạt động</h2>
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
					<div>
		            <table id="datatable" class="table table-striped table-bordered">
		                <thead>
		                    <tr>
		                        <th>Ngày</th>
		                        <th>Tên quản trị viên</th>
		                        <th>Nội dung</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <c:forEach items="${ITEMS_LIST}" var="log">
		                        <tr>
		                            <td>${log.createdDate}</td>
		                            <td>${log.admin.name}</td>
		                            <td>${log.logContent}</td>
		                        </tr>
		                    </c:forEach>
		                </tbody>
		             </table>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>