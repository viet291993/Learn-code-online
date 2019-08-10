<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="modal modal-insert-customer" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="modal-title">
                    <div class="content-title">
                        <h3 class="text-center">Create Administrator</h3>
                    </div>
                </div>
            </div>
            <form class="form-horizontal" id="form-insert-admin" novalidate method="POST" action="<c:url value='/Admin/Permission/ListAdmin/Insert'/>">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Tên</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userName" class="control-label col-sm-3">Tên đăng nhập</label>
                        <div class="col-sm-9">
                            <input type="text" id="userName" name="userName" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label col-sm-3">Mật khẩu</label>
                        <div class="col-sm-9">
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Quyền quản trị</label>
                        <div class="col-sm-9">
                            <select class="form-control" required name="adminRoleID">
                                <option value="" selected disabled>--Lựa chọn quyền quản trị--</option>
                                <c:forEach items="${f:findAllAvailableRoleAdmin()}" var="role">
                                    <option value='${role.id}'>${role.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="form-group text-center clearfix">
                        <button type="button" class="  btn btn-danger btn-sm pull-left" data-dismiss="modal"><span aria-hidden="true">Đóng</span><span class="sr-only">Close</span></button>
                        <button type="submit" class="btn btn-sm btn-success pull-right">Lưu <i class="fa fa-check fa-right"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $('#form-insert-admin').validate({
        submitHandler: function () {
            var customer = JSON.stringify($('#form-insert-admin').serializeObject());
            var url = $('#form-insert-admin').attr('action');
            $.ajax({
                url: url,
                type: 'POST',
                data: customer,
                contentType: 'application/json',
                success: function (data) {
                    $('#myModal').modal('hide');
                    openAlert(data.value, function () {
                        reloadAjaxContent();
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