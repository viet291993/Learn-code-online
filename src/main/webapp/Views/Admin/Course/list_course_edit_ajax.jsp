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
                        <h3 class="text-center">Sửa thông tin khóa học</h3>
                    </div>
                </div>
            </div>
            <form id="form-insert-course" class="form-insert form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Course/ListCourse/Edit'/>">
                <div class="modal-body">
                   <input type="hidden" name="id" value="${SELECTED_LANGUAGE.id}"> 
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Tên khóa học</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" required name="name" class="form-control" placeholder="" value="${SELECTED_LANGUAGE.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Ngôn ngữ</label>
                        <div class="col-sm-9">
                        	<select class="form-control" required name="languageID">
                                <option value="" selected disabled>--Lựa chọn ngôn ngữ--</option>
                                <c:forEach items="${f:findAllLanguage()}" var="language">
                                    <option  ${SELECTED_LANGUAGE.language.id==language.id?'selected':''} value='${language.id}'>${language.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Miêu tả</label>
                        <div class="col-sm-9">
                            <textarea type="text" id="description" required name="description" class="form-control" placeholder="" >${SELECTED_LANGUAGE.description}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Nội dung</label>
                        <div class="col-sm-9">
                            <textarea id="content" required name="content" class="form-control" placeholder="" >${SELECTED_LANGUAGE.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Điều kiện</label>
                        <div class="col-sm-9">
                            <input type="text" id="prerequisite"  name="prerequisite" class="form-control" placeholder="" value="${SELECTED_LANGUAGE.prerequisite}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Thời gian hoàn thành</label>
                        <div class="col-sm-9">
                            <input type="text" id="timeToComplete" required name="timeToComplete" class="form-control" placeholder="" value="${SELECTED_LANGUAGE.timeToComplete}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-3">Đường dẫn</label>
                        <div class="col-sm-9">
                            <input type="text" id="nameAscii" required name="nameAscii" class="form-control" placeholder="" value="${SELECTED_LANGUAGE.nameAscii}">
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
    $('#form-insert-course').validate({
        submitHandler: function () {
            var course = JSON.stringify($('#form-insert-course').serializeObject());
            var url = $('#form-insert-course').attr('action');
            $.ajax({
                url: url,
                type: 'POST',
                data: course,
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
