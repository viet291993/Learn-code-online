<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div>
		<a href="#" class="btn btn-success btn-sm btn-open-modal" data-controller="<c:url value='/Admin/Permission/ListRole/ViewInsert'/>"><i class="fa fa-plus"></i></a>
         <table id="datatable" class="table table-striped table-bordered">
             <thead>
               <tr>
                <th style="width: 1%"></th>  
                <th style="width: 1%">ID </th>
                <th>Tên </th>
                <th>Trạng thái</th>
               </tr>
             </thead>
             <tbody>
                 	<c:forEach items="${ITEMS_LIST}" var="role">
                        <tr>
                            <td style="padding: unset;">
                                <div class="dropdown">
                                    <span class="btn btn-sm btn-delete-all" data-toggle="dropdown"><i class="three-dots fa fa-ellipsis-v dropdown-toggle"></i></span>
                                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                        <li><a class="btn-open-modal" href="javascript:void(0)" data-controller="<c:url value='/Admin/Permission/ListRole/ViewChangePermission/${role.id}'/>">Phân quyền</a></li>
                                        <li><a class="btn-send-ajax" href="javascript:void(0)" data-controller="<c:url value='/Admin/Permission/ListRole/Delete/${role.id}'/>">Xóa quyền</a></li>
                                    </ul>
                                </div>
                            </td>  
                            <td class="td-align-center">${role.id}</td>
                            <td>${role.name}</td>
                            <td class="${role.isActive?'text-success':'text-danger'}">${role.isActive?'Bình thường':'Khóa'}</td>
                        </tr>
                    </c:forEach>
              </tbody>
           </table><!-- end table -->
</div>
<script>
	$('#datatable').DataTable();
</script>
