<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="modal modal-insert-customer" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="modal-title">
                    <div class="content-title">
                        <h3 class="text-center">Thêm mới khóa học</h3>
                    </div>
                </div>
            </div>
            <form id="form-insert" class="form-insert form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Course/ListCourse/Insert'/>">
                <div class="modal-body"> 
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Tên khóa học</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" required name="name" class="form-control" placeholder="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="form-group clearfix">
                        <button type="button" class="btn btn-danger btn-sm pull-left" data-dismiss="modal"><span aria-hidden="true">Đóng</span><span class="sr-only">Close</span></button>
                        <button type="submit" class="btn btn-success btn-sm pull-right">Lưu <i class="fa fa-check fa-right"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    var validate = $('#form-insert').validate({
        submitHandler: function () {
            var url = $('#form-insert').attr('action');
            var data = $('#form-insert').serializeObject();
            sendAjax(url, 'POST', data, function (data) {
                $('#myModal').modal('hide');
                openAlert(data.value, function () {
                    reloadAjaxContent();
                });
            });
        }
    });
</script>
