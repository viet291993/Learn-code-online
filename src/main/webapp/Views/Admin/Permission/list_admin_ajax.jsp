<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div>
			<a href="#" class="btn btn-success btn-sm btn-open-modal" data-controller="<c:url value='/Admin/Permission/ListAdmin/ViewInsert'/>"><i class="fa fa-plus"></i></a>
            <table id="datatable" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th style="width: 1%"></th>  
                        <th style="width: 1%;white-space: nowrap">ID </th>
                        <th>Tên </th>
                        <th>Tên đăng nhập </th>
                        <th>Quyền </th>
                        <th>Trạng thái </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ITEMS_LIST}" var="admin">
                        <tr>
                            <td style="padding: unset;">
                                <div class="dropdown">
                                    <span class="btn btn-sm btn-delete-all" data-toggle="dropdown"><i class="three-dots fa fa-ellipsis-v dropdown-toggle"></i></span>
                                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                        <li><a class="btn-open-modal" href="javascript:void(0)" data-controller="<c:url value='/Admin/Permission/ListAdmin/ViewEdit/${admin.id}'/>">Sửa</a></li>
                                        <li><a class="btn-open-modal" href="javascript:void(0)" data-controller="<c:url value='/Admin/Permission/ChangePassword?id=${admin.id}'/>">Đổi mật khẩu</a></li>
                                        <li><a class="btn-send-ajax" href="javascript:void(0)" data-controller="<c:url value='/Admin/Permission/ListAdmin/Block/${admin.id}/${!admin.isActive}'/>">${admin.isActive?'Khóa':'Mở khóa'}</a></li>
                                        <li><a class="btn-send-ajax" href="javascript:void(0)" data-controller="<c:url value='/Admin/Permission/ListAdmin/Delete/${admin.id}'/>">Xóa</a></li>
                                    </ul>
                                </div>
                            </td>
                            <td class="td-align-center">${admin.id}</td>
                            <td>${admin.name}</td>
                            <td>${admin.user.username}</td>
                            <td>${admin.adminRole.name}</td>
                            <td class="${admin.isActive?'text-success':'text-danger'}">${admin.isActive?'Bình thường':'Bị khóa'}</td>
                        </tr>
                    </c:forEach>
                </tbody>
             </table>
</div>
<script>
	$('#datatable').DataTable();
</script>
