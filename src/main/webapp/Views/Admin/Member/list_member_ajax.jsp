<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div>
            <table id="datatable" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th style="width: 1%"></th>  
                        <th style="width: 1%;white-space: nowrap">ID </th>
                        <th>Tên học viên</th>
                        <th>Tài khoản</th>
                        <th>Dùng thử </th>
                        <th>PRO </th>
                        <th>Trạng thái </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ITEMS_LIST}" var="menber">
                        <tr>
                            <td style="padding: unset;">
                                <div class="dropdown">
                                    <span class="btn btn-sm btn-delete-all" data-toggle="dropdown"><i class="three-dots fa fa-ellipsis-v dropdown-toggle"></i></span>
                                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                        <li><a class="btn-open-modal" href="javascript:void(0)" data-controller="<c:url value='/Admin/Member/ListMember/ViewEdit/${menber.id}'/>">Sửa</a></li>
                                        <li><a class="btn-send-ajax" href="javascript:void(0)" data-controller="<c:url value='/Admin/Member/ListMember/Block/${menber.id}/${!menber.isActive}'/>">${menber.isActive?'Khóa':'Mở khóa'}</a></li>
                                        <li><a class="btn-send-ajax" href="javascript:void(0)" data-controller="<c:url value='/Admin/Member/ListMember/Delete/${menber.id}'/>">Xóa</a></li>
                                    </ul>
                                </div>
                            </td>
                            <td class="td-align-center">${menber.id}</td>
                            <td>${menber.name}</td>
                            <td>${menber.user.username}</td>
                            <td>${f:generateExpiredDate(menber.trailExpiredDate)}</td>
                            <td>${f:generateExpiredDate(menber.proExpiredDate)}</td>
                            <td class="${menber.isActive?'text-success':'text-danger'}">${menber.isActive?'Bình thường':'Bị khóa'}</td>
                        </tr>
                    </c:forEach>
                </tbody>
             </table>
</div>
<script>
	$('#datatable').DataTable();
</script>
