<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="modal modal-insert-customer" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="modal-title">
                    <div class="content-title">
                        <h3 class="text-center">Sửa thông tin tài khoản</h3>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <form id="form-insert-module" class="form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Permission/ListAdmin/Edit'/>">
                    <input type="hidden" name="id" value="${SELECTED_ADMIN.id}">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Tên</label>
                        <div class="col-sm-9">
                            <input type="text" id="nameDataWarehouse" name="name" required  class="form-control" value="${SELECTED_ADMIN.name}" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Tên đăng nhập</label>
                        <div class="col-sm-9">
                            <input type="text" id="nameDataWarehouse" name="username" required  class="form-control" value="${SELECTED_ADMIN.user.username}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Quyền quản trị</label>
                        <div class="col-sm-9">
                            <select class="form-control" required name="adminRoleId">
                                <option disabled>---${SELECTED_ADMIN.adminRole.name}---</option>
                                <c:forEach items="${f:findAllAvailableRoleAdmin()}" var="role">
                                    <option ${SELECTED_ADMIN.adminRole.id==role.id?'selected':''} value='${role.id}'>${role.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group text-center clearfix">
                        <button type="button" class="  btn btn-danger btn-sm pull-left" data-dismiss="modal"><span aria-hidden="true">Đóng</span><span class="sr-only">Close</span></button>
                        <button type="submit" class="btn btn-success btn-sm pull-right">Lưu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $('#form-insert-module').validate({
        submitHandler: function () {
            var data = JSON.stringify($('#form-insert-module').serializeObject());
            var url = $('#form-insert-module').attr('action');
            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                contentType: 'application/json',
                success: function (data) {
                    openAlert(data.value, function () {
                        reloadAjaxContent();
                        if (data.key) {
                            $('#myModal').modal('hide');
                        }
                    });
                }, error: function () {
                    openAlert(null, function () {
                    	new PNotify({
                            title: 'Đã xảy ra lỗi !',
                            text: 'Vui lòng thử lại sau!',
                            type: 'error',
                            styling: 'bootstrap3'
                        });
                        reloadAjaxContent();
                    });
                }
            });
        }
    });
</script>
