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
                        <h3 class="text-center">Sửa giáo trình</h3>
                    </div>
                </div>
            </div>
            <form id="form-insert-syllabus" class="form-insert form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Course/ListCourse/Syllabus/Edit'/>">
                <div class="modal-body"> 
                <input type="hidden" name="id" value="${SELECTED_SYLLABUS.id}"> 
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Tên giáo trình</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" required name="name" value="${SELECTED_SYLLABUS.name}" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Miêu tả</label>
                        <div class="col-sm-9">
                            <textarea  id="description" required name="description"  class="form-control" placeholder="">${SELECTED_SYLLABUS.description}</textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3">Khóa học</label>
                        <div class="col-sm-9">
                            <label class="control-label"><b class="bold-red"> ${SELECTED_COURSE.name}</b></label>
                            <input type="hidden" class="form-control" name="course" value='${SELECTED_SYLLABUS.course.id}' readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Thứ tự</label>
                        <div class="col-sm-9">
                            <input type="number" id="cssClass" name="orderDisplay" class="form-control" value="${SELECTED_SYLLABUS.orderDisplay}">
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
    $('#form-insert-syllabus').validate({
        submitHandler: function () {
            var syllabus = JSON.stringify($('#form-insert-syllabus').serializeObject());
            var url = $('#form-insert-syllabus').attr('action');
            $.ajax({
                url: url,
                type: 'POST',
                data: syllabus,
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
