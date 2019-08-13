<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>Danh sách ngôn ngữ</h2>
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
				<div class="ajax-content">
					<a href="#" class="btn btn-success btn-sm btn-open-modal" data-toggle="tooltip" data-placement="top"  data-original-title="Thêm khóa học mới" data-controller="<c:url value='/Admin/Course/Setting/Language/ViewInsert'/>"><i class="fa fa-plus"></i></a>
	                <div>
			         <table id="table" class="table table-striped table-hover">
			             <thead>
			               <tr>
			                <th style="width: 1%">ID </th>
			                <th>Tên ngôn ngữ</th>
			                <th style="width: 20%"></th>  
			               </tr>
			             </thead>
			             <tbody>
			                 	<c:forEach items="${LIST_LANGUAGE}" var="language">
			                        <tr>
			                            <td class="td-align-center">${language.id}</td>
			                            <td>${language.name}</td>
			                        	<td>
			                        		<a class="btn btn-warning btn-sm " data-toggle="tooltip" data-placement="top"  data-original-title="Sửa ngôn ngữ" href="/Admin/Course/Setting/Language/Edit/${language.id}"><i class="fa fa-edit"></i></a>
			                                <a class="btn btn-danger btn-sm  btn-send-ajax" data-toggle="tooltip" data-placement="top"  data-original-title="Xóa ngôn ngữ" href="javascript:void(0)" data-controller="<c:url value='/Admin/Course/Setting/Language/Delete/${language.id}'/>"><i class="fa fa-trash"></i></a>
			                        	</td>
			                        </tr>
			                    </c:forEach>
			              </tbody>
			           </table>
					</div> 
	          </div>
			</div>
		</div>
		
		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>Danh sách kiểu bài học</h2>
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
					<div class="ajax-content">
						<a href="#" class="btn btn-success btn-sm btn-open-modal" data-toggle="tooltip" data-placement="top"  data-original-title="Thêm khóa học mới" data-controller="<c:url value='/Admin/Course/Setting/LessionType/ViewInsert'/>"><i class="fa fa-plus"></i></a>
	                    <div>
				         <table id="table" class="table table-striped table-hover">
				             <thead>
				               <tr>
				                <th style="width: 1%">ID </th>
				                <th>Tên kiểu bài học</th>
				                <th style="width: 20%"></th>  
				               </tr>
				             </thead>
				             <tbody>
				                 	<c:forEach items="${LIST_LESSIONTYPE}" var="lessiontype">
				                        <tr>
				                            <td class="td-align-center">${lessiontype.id}</td>
				                            <td>${lessiontype.name}</td>
				                        	<td>
				                        		<a class="btn btn-warning btn-sm " data-toggle="tooltip" data-placement="top"  data-original-title="Sửa khóa học" href="/Admin/Course/Setting/LessionType/Edit/${lessiontype.id}"><i class="fa fa-edit"></i></a>
				                                <a class="btn btn-danger btn-sm  btn-send-ajax" data-toggle="tooltip" data-placement="top"  data-original-title="Xóa khóa học" href="javascript:void(0)" data-controller="<c:url value='/Admin/Course/Setting/LessionType/Delete/${lessiontype.id}'/>"><i class="fa fa-trash"></i></a>
				                        	</td>
				                        </tr>
				                    </c:forEach>
				              </tbody>
				           </table><!-- end table -->
						</div> 
	               </div>
			</div>
		</div>	