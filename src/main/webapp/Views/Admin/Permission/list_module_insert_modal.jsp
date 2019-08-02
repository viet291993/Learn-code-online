<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="modal modal-insert-customer" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="modal-title">
                    <div class="content-title">
                        <h3 class="text-center">Thêm mới module</h3>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <form id="form-insert-module" class="form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Permission/ListModule/Insert'/>">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Tên</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" required name="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Đường dẫn</label>
                        <div class="col-sm-9">
                            <input type="text" id="controller" required name="controller" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Module cha</label>
                        <div class="col-sm-9">
                            <label class="control-label"><b class="bold-red">${MODULE_PARENT.name}</b></label>
                            <input type="hidden" class="form-control" name="module" value='${MODULE_PARENT.id}' readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Class Icon</label>
                        <div class="col-sm-9">
                            <input type="text" id="icon" name="icon" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Thứ tự</label>
                        <div class="col-sm-9">
                            <input type="number" value="0" id="cssClass" name="orderNumber" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Hiển thị</label>
                        <div class="col-sm-9">
                            <input type="checkbox" id="isShow" checked name="isShow">
                        </div>
                    </div>
                    <div class="form-group text-center clearfix">
                        <button type="reset" class="btn btn-danger btn-sm pull-left">Nhập lại</button>
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
            console.log(data);
            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                contentType: 'application/json',
                success: function (data) {
                	console.log(data);
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
