<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div class="modal  modal-insert-customer" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="modal-title">
                    <div class="content-title">
                        <h3 class="text-center">Thêm mới câu hỏi</h3>
                    </div>
                </div>
            </div>
            <form id="form-insert-question" class="form-insert form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Course/ListCourse/Question/Insert'/>">
                <div class="modal-body"> 
                	<div class="" role="tabpanel" data-example-id="togglable-tabs">
                	<input type="hidden" name="lessionType" value="${SELECTED_LESSION.lessionType.code}">
                      <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <li role="question" class="active"><a href="#tab_question" id="question-tab" role="tab" data-toggle="tab" aria-expanded="true">Câu hỏi </a>
                        </li>
                        <c:if test="${SELECTED_LESSION.lessionType.code != 'Q' && SELECTED_LESSION.lessionType.code != 'A'}">
                        <li role="instruction" class=""><a href="#tab_instruction"  id="instruction-tab" role="tab" data-toggle="tab" aria-expanded="false">Yêu cầu</a>
                        </li>
                        </c:if>
                        <c:if test="${SELECTED_LESSION.lessionType.code == 'Q'}">
                        <li role="quiz" class=""><a href="#tab_quiz"  id="quiz-tab" role="tab" data-toggle="tab" aria-expanded="false">Trắc nhiệm</a>
                        </li>
                        </c:if>
                      </ul>
                      
                     <!--  content  -->
                      <div id="myTabContent" class="tab-content">
                      
                   	<!-- Question -->
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_question" aria-labelledby="question-tab">
		                  <input type="hidden" name="lession" value='${SELECTED_LESSION.id}' >  
		                    <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Tiêu đề</label>
		                        <div class="col-sm-9">
		                            <input type="text" id="title" required name="title"  class="form-control" placeholder="">
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Mô tả</label>
		                        <div class="col-sm-9">
		                            <textarea  id="description" required name="description"  class="form-control" placeholder=""></textarea>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="content" class="control-label col-sm-3">Nội dung</label>
		                        <div class="col-sm-9">
		                            <textarea  id="content" required name="content"  class="form-control editor" placeholder=""></textarea>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Tên file</label>
		                        <div class="col-sm-9">
		                            <input type="text" id="fileName" required name="fileName"  class="form-control" placeholder="">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Code mặc định</label>
		                        <div class="col-sm-9">
		                            <textarea  id="defaultCode" required name="defaultCode" rows="7" class="form-control" placeholder=""></textarea>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="control-label col-sm-3">Thứ tự</label>
		                        <div class="col-sm-9">
		                            <input type="number" id="cssClass" name="orderDisplay" value="0" class="form-control" >
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label class="control-label col-sm-3">Hiển thị</label>
		                        <div class="col-sm-9">
		                            <input type="checkbox" id="isActive" name="isActive">
		                        </div>
		                    </div>
                        </div>
                        
                        <!-- Instruction -->
                        <c:if test="${SELECTED_LESSION.lessionType.code != 'Q' && SELECTED_LESSION.lessionType.code != 'A'}">
                        <div role="tabpanel" class="tab-pane fade" id="tab_instruction" aria-labelledby="instruction-tab">
                          <div class="accordion" id="instruction" role="tablist" aria-multiselectable="false">
		                    
		                  </div>
		                    <a id="addInstruction" class="text-info pl-65" href="javascript:void(0)"><i class="fa fa-plus" ></i> Thêm yêu cầu mới</a>
                        </div>
                        </c:if>
                        
                        <!-- Quiz -->
                        <c:if test="${SELECTED_LESSION.lessionType.code == 'Q'}">
                        	<div role="tabpanel" class="tab-pane fade" id="tab_quiz" aria-labelledby="quiz-tab">
		                        <div id="quiz">
		                        </div>
			                    <a id="addQuiz" class="text-info pl-65" href="javascript:void(0)"><i class="fa fa-plus" ></i> Thêm đáp án mới</a>
	                        </div>
                        </c:if>
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
    $('#form-insert-question').validate({
        submitHandler: function () {
            var objData = $('#form-insert-question').serializeObject();
            <c:if test="${SELECTED_LESSION.lessionType.code != 'Q' && SELECTED_LESSION.lessionType.code != 'A'}">
           		objData['listInstruction'] = getListInstruction();
            </c:if>
            <c:if test="${SELECTED_LESSION.lessionType.code == 'Q'}">
           		objData['listQuiz'] = getListQuiz();
            </c:if>
            var data = JSON.stringify(objData);
            console.log(data);
            var url = $('#form-insert-question').attr('action');
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
    
    function getListInstruction() {
        var list = [];
        $('#instruction').find('.panel').each(function (i, target) {
			var inputID = $(target).children('input:first');
			var nameID = inputID.data('name');
			var inputOrder = $(target).find('input:last');
			var nameOrder = inputOrder.data('name');
			var text = '{"'+nameID+'":"'+inputID.val()+'"';
        	$(target).find('textarea').each(function (i, target) {
				text += ',"'+$(target).data('name')+'":"'+$(target).val()+'"';
			})
			text +=',"'+nameOrder+'":"'+inputOrder.val()+'"}'
			var obj = JSON.parse(text);
			list.push(obj);
        });
        return list;
 	}
    
    function getListQuiz() {
        var list = [];
        $('#quiz').find('.form-group').each(function (i, target) {
			var text = '{';
        	$(target).find('input').each(function (i, target) {
        		if(i>0){
        			text+= ',';
        		}
				text += '"'+$(target).data('name')+'":"'+($(target).attr('type')=='radio'?$(target).is(':checked'):$(target).val())+'"';
			})
			text +='}'
			var obj = JSON.parse(text);
			list.push(obj);
        });
        return list;
 	}
    
    $(document).on('click', '.deleteInstruction', function () {
    	$(this).parents('div .panel').remove();
    });
    
    $(document).on('click', '.deleteQuiz', function () {
    	$(this).parents('div .form-group').remove();
    });
    
    editorCK();
</script>
