<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="modal modal-insert-customer" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="modal-title">
                    <div class="content-title">
                        <h3 class="text-center">Phân quyền</h3>
                    </div>
                </div>
            </div>
            <form class="change-permission-form" action="<c:url value="/Admin/Permission/ListRole/ChangePermission/${CURRENT_ROLE}" />">
                <div class="modal-body">
                    <div class="module-role-list">
                        <ul id="tree" class="tree">
                            <li>
                                <label class="ml-5">
                                    <span class="module-checkbox"><input hidden="" type="checkbox" class="external" checked/></span>
                                    <span>ROOT</span>
                                </label>
                                <ul>
                                    <c:forEach items="${MODULES}" var="MODULE"> 
                                        <c:if test="${!MODULE.isDeleted}">
                                            <li>
                                                <label>
                                                    <span class="module-checkbox"><input class="checckbox" type="checkbox" value="${MODULE.id}" ${f:checkModuleInrole(MODULE_IN_ROLES_CHECK,MODULE.id)?'checked':''} /></span>
                                                    <span>${MODULE.name}</span>
                                                </label> 
                                                <ul>                                                    
                                                    <c:forEach items="${MODULE.adminModules}" var="childrenModule">
                                                        <c:if test="${!childrenModule.isDeleted}">
                                                            <li>
                                                                <label>
                                                                    <span class="module-checkbox"><input class="checckbox" type="checkbox" value="${childrenModule.id}" ${f:checkModuleInrole(MODULE_IN_ROLES_CHECK,childrenModule.id)?'checked':''} /></span>
                                                                    <span>${childrenModule.name}</span>
                                                                </label>
                                                            </li>                                                            
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </li>
                                        </c:if>
                                    </c:forEach>                                    
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="module-role-action clearfix">
                        <button class="btn btn-danger pull-left" type="reset">Hủy bỏ <i class="fa fa-times fa-right"></i></button>
                        <button class="btn btn-primary btn-change-permission pull-right" type="button">Lưu <i class="fa fa-check fa-right"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $('.btn-change-permission').unbind('click');
    $('.btn-change-permission').click(function (e) {
        e.preventDefault();
        var checkedBoxs;
        var data = [];
        checkedBoxs = $('.module-role-list').find('input[type="checkbox"]:not(.external):not(.select-all):checked');
        checkedBoxs.each(function (i, target) {
            data.push(parseInt($(target).val()));
        });
        var url = $('.change-permission-form').attr('action');
        if (typeof url !== 'undefined') {
            $.ajax({
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                },
                url: url,
                type: 'POST',
                data: JSON.stringify(data),
                success: function (data) {
                    $('#myModal').modal('hide');
                    openAlert(data.value, function () {
                    reloadAjaxContent();
                    });
                }, error: function () {
                    openAlert(null, function () {
                    	new PNotify({
                            title: 'Lỗi',
                            text: 'Đã xảy ra lỗi. Vui lòng thử lại sau!',
                            type: 'error',
                            hide: true,
                            styling: 'bootstrap4'
                        });
                        reloadAjaxContent();
                    });
                }
            });
        }
    });
</script>