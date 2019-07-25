<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="panel-body ${f:size(ITEMS_LIST)>0?'panel-body-table':''}">
    <c:choose>        
        <c:when test="${f:size(ITEMS_LIST)==0}">
            <div class="alert alert-danger">
                No result to display!
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-condensed table-hover table-valign-midle">
                <thead>
                    <tr>
                        <th style="width: 1%"></th>  
                        <th style="width: 1%;white-space: nowrap" column="id">ID <span class="${PAGER.orderColumn=='id'?(PAGER.asc?'fa fa-caret-up':'fa fa-caret-down'):''}"></span></th>
                        <th column="name">Tên <span class="${PAGER.orderColumn=='name'?(PAGER.asc?'fa fa-caret-up':'fa fa-caret-down'):''}"></span></th>
                        <th column="isActive">Trạng thái <span class="${PAGER.orderColumn=='isActive'?(PAGER.asc?'fa fa-caret-up':'fa fa-caret-down'):''}"></span></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ITEMS_LIST}" var="role">
                        <tr class="${role.isActive?'':'alert alert-danger'}">
                            <td style="padding: unset;">
                                <div class="dropdown">
                                    <span class="btn btn-sm btn-delete-all" data-toggle="dropdown"><i class="three-dots fas fa-ellipsis-v dropdown-toggle"></i></span>
                                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                        <li><a class="btn-open-modal" href="javascript:void(0)" data-controller="<c:url value='/Admin/Permission/ListRole/ViewChangePermission/${role.id}'/>">Phân quyền</a></li>
                                        <li><a class="btn-send-ajax" href="javascript:void(0)" data-controller="<c:url value='/Admin/Permission/ListRole/Delete/${role.id}'/>">Xóa quyền</a></li>
                                    </ul>
                                </div>
                            </td>  <td class="td-align-center">${role.id}</td>
                            <td>${role.name}</td>
                            <td>${role.isActive?'Bình thường':'Khóa'}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table><!-- end table -->
        </c:otherwise>
    </c:choose>
</div>
<c:if test="${PAGER.totalResult>PAGER.displayPerPage}">
    <div class="panel-footer">        
        <div class="row">
            <div class="col-md-4 col-xs-12">
                <c:if test="${PAGER.totalResult>5}">
                    <label class="control-label">Display: </label>
                    <select class="form-control input-sm btn-change-display-per-page" controller="<c:url value='/Admin/Permission/ListRole?currentPage=1&orderColumn=id&asc=true&displayPerPage='/>">
                        <c:forEach begin="5" step="5" end="50" var="numb">
                            <option ${numb==PAGER.displayPerPage?'selected':''} value="${numb}">${numb}</option>
                        </c:forEach>
                    </select>
                </c:if>
            </div>
            <div class="col-md-8 col-xs-12 text-right"> 
                <ul class="pagination pagination-sm">
                    <li class="${PAGER.currentPage<=1?'hidden':''}">
                        <a href="<c:url value="/Admin/Permission/ListRole?currentPage=1&displayPerPage=${PAGER.displayPerPage}&orderColumn=${PAGER.orderColumn}&asc=${PAGER.asc}"/>"><i class="fa fa-angle-double-left"></i></a>
                    </li>
                    <li class="${PAGER.currentPage<=1?'hidden':''}">
                        <a href="<c:url value="/Admin/Permission/ListRole?currentPage=${PAGER.currentPage-1}&displayPerPage=${PAGER.displayPerPage}&orderColumn=${PAGER.orderColumn}&asc=${PAGER.asc}"/>"><i class="fa fa-angle-left"></i></a>
                    </li>
                    <c:if test="${PAGER.currentPage==2}">
                        <li>
                            <a href="<c:url value="/Admin/Permission/ListRole?currentPage=1&displayPerPage=${PAGER.displayPerPage}&orderColumn=${PAGER.orderColumn}&asc=${PAGER.asc}"/>">1</a>
                        </li>
                    </c:if>
                    <c:if test="${PAGER.currentPage>2}">
                        <c:forEach begin="${PAGER.currentPage-2}" end="${PAGER.currentPage-1}" var="page">
                            <li>
                                <a href="<c:url value="/Admin/Permission/ListRole?currentPage=${page}&displayPerPage=${PAGER.displayPerPage}&orderColumn=${PAGER.orderColumn}&asc=${PAGER.asc}"/>">${page}</a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <li>
                        <a class="active" href="javascript:;">${PAGER.currentPage}</a>
                    </li>                
                    <c:if test="${PAGER.currentPage==PAGER.totalPage-1}">
                        <li>
                            <a href="<c:url value="/Admin/Permission/ListRole?currentPage=${PAGER.totalPage}&displayPerPage=${PAGER.displayPerPage}&orderColumn=${PAGER.orderColumn}&asc=${PAGER.asc}"/>">${PAGER.totalPage}</a>
                        </li>
                    </c:if>
                    <c:if test="${PAGER.currentPage<PAGER.totalPage-1}">
                        <c:forEach begin="${PAGER.currentPage+1}" end="${PAGER.currentPage+2}" var="page">
                            <li>
                                <a href="<c:url value="/Admin/Permission/ListRole?currentPage=${page}&displayPerPage=${PAGER.displayPerPage}&orderColumn=${PAGER.orderColumn}&asc=${PAGER.asc}"/>">${page}</a>
                            </li>
                        </c:forEach> 
                    </c:if>              
                    <li class="${PAGER.currentPage==PAGER.totalPage?'hidden':''}">
                        <a href="<c:url value="/Admin/Permission/ListRole?currentPage=${PAGER.currentPage+1}&displayPerPage=${PAGER.displayPerPage}&orderColumn=${PAGER.orderColumn}&asc=${PAGER.asc}"/>"><i class="fa fa-angle-right"></i></a>
                    </li>
                    <li class="${PAGER.currentPage==PAGER.totalPage?'hidden':''}">
                        <a href="<c:url value="/Admin/Permission/ListRole?currentPage=${PAGER.totalPage}&displayPerPage=${PAGER.displayPerPage}&orderColumn=${PAGER.orderColumn}&asc=${PAGER.asc}"/>"><i class="fa fa-angle-double-right"></i></a>
                    </li>
                </ul> 
            </div>
        </div>
    </div>
</c:if>