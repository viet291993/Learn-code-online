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
                        <h3 class="text-center">Thêm mới bài học</h3>
                    </div>
                </div>
            </div>
            <form id="form-insert-lession" class="form-insert form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Course/ListCourse/Lession/Insert'/>">
                <div class="modal-body"> 
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Tên bài học</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" required name="name" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Miêu tả</label>
                        <div class="col-sm-9">
                            <textarea  id="description" required name="description" class="form-control" placeholder=""></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3">Khóa học</label>
                        <div class="col-sm-9">
                            <label class="control-label"><b class="bold-red"> ${SELECTED_LESSION.syllabus.course.name}</b></label>
                            <input type="hidden" class="form-control" name="course" value='${SELECTED_LESSION.syllabus.course.id}' readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Giáo trình</label>
                        <div class="col-sm-9">
                            <label class="control-label"><b class="bold-red"> ${SELECTED_LESSION.syllabus.name}</b></label>
                            <input type="hidden" class="form-control" name="syllabus" value='${SELECTED_LESSION.syllabus.id}' readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Kiểu bài học</label>
                        <div class="col-sm-9">
                        	<select class="form-control" required name="lessionType">
                                <option value="" selected disabled>--Lựa chọn kiểu bài học--</option>
                                <c:forEach items="${f:findAllLessionType()}" var="lessionType">
                                    <option value='${lessionType.id}'>${lessionType.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Đường dẫn</label>
                        <div class="col-sm-9">
                            <input type="text" id="nameAscii" required name="nameAscii" class="form-control" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">Thứ tự</label>
                        <div class="col-sm-9">
                            <input type="number" id="cssClass" name="orderDisplay" class="form-control" value="0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">PRO</label>
                        <div class="col-sm-9">
                            <input type="checkbox" id="isPro" name="isPro">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-sm-3">Hiển thị</label>
                        <div class="col-sm-9">
                            <input type="checkbox" id="isActive" name="isActive">
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
    $('#form-insert-lession').validate({
        submitHandler: function () {
            var lession = JSON.stringify($('#form-insert-lession').serializeObject());
            var url = $('#form-insert-lession').attr('action');
            $.ajax({
                url: url,
                type: 'POST',
                data: lession,
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
