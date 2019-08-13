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
                        <h3 class="text-center">Sửa thông tin học viên</h3>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <form id="form-insert-module" class="form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Member/ListMember/Edit'/>">
                    <input type="hidden" name="id" value="${MODULE_EDIT.id}">
                    <div class="form-group">
                        <label class="control-label col-sm-3">Tên</label>
                        <div class="col-sm-9">
                            <input type="text" id="nameDataWarehouse" name="name" required  class="form-control" value="${MODULE_EDIT.name}" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Tên đăng nhập</label>
                        <div class="col-sm-9">
                            <input type="text" id="nameDataWarehouse" name="username" required  class="form-control" value="${MODULE_EDIT.user.username}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Email</label>
                        <div class="col-sm-9">
                            <input type="text" id="nameDataWarehouse" name="email" required  class="form-control" value="${MODULE_EDIT.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Địa chỉ</label>
                        <div class="col-sm-9">
                            <input type="text" id="nameDataWarehouse" name="address" required  class="form-control" value="${MODULE_EDIT.address}" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Ngày hết hạn dùng thử</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="trailExpiredDate" placeholder="dd-MM-yyyy" value="${f:formatDate(MODULE_EDIT.trailExpiredDate)}" 
                                   pattern="(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))-(?:(?:0[1-9]|1[0-2])-(?:19|20)[0-9]{2}|^$" 
                                   title="dd-MM-yyyy"/>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3">Ngày hết hạn PRO</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" name="proExpiredDate" placeholder="dd-MM-yyyy" value="${f:formatDate(MODULE_EDIT.proExpiredDate)}" 
                                   pattern="(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))-(?:(?:0[1-9]|1[0-2])-(?:19|20)[0-9]{2}|^$" 
                                   title="dd-MM-yyyy"/>
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
