<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal modal-insert-customer" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="modal-title">
                    <div class="content-title">
                        <h3 class="text-center">Cập nhật module</h3>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <form id="form-edit-module" class="form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Permission/ListModule/Edit'/>">
                    <input type="hidden" name="id" value="${MODULE_EDIT.id}">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Tên</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" required name="name" value="${MODULE_EDIT.name}" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Đường dẫn</label>
                        <div class="col-sm-9">
                            <input type="text" id="controller" required name="controller" value="${MODULE_EDIT.controller}" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Class Icon</label>
                        <div class="col-sm-9">
                            <input type="text" id="icon" name="icon" class="form-control" value="${MODULE_EDIT.icon}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Thứ tự</label>
                        <div class="col-sm-9">
                            <input type="number" id="cssClass" name="orderNumber" class="form-control" value="${MODULE_EDIT.orderNumber}">
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
    $('#form-edit-module').validate({
        submitHandler: function () {
            var data = JSON.stringify($('#form-edit-module').serializeObject());
            var url = $('#form-edit-module').attr('action');
            $.ajax({
                url: url,
                type: 'POST',
                data: data,
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

