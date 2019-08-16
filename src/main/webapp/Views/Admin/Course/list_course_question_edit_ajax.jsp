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
                        <h3 class="text-center">Sửa câu hỏi</h3>
                    </div>
                </div>
            </div>
            <form id="form-insert-question" class="form-insert form-horizontal" novalidate method="POST" action="<c:url value='/Admin/Course/ListCourse/Question/Edit'/>">
                <div class="modal-body"> 
                	<div class="" role="tabpanel" data-example-id="togglable-tabs">
                	<input type="hidden" name="lessionType" value="${SELECTED_QUESTION.lession.lessionType.code}">
                      <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <li role="question" class="active"><a href="#tab_question" id="question-tab" role="tab" data-toggle="tab" aria-expanded="true">Câu hỏi </a>
                        </li>
                        <c:if test="${SELECTED_QUESTION.lession.lessionType.code != 'Q' && SELECTED_QUESTION.lession.lessionType.code != 'A'}">
                        <li role="instruction" class=""><a href="#tab_instruction"  id="instruction-tab" role="tab" data-toggle="tab" aria-expanded="false">Yêu cầu</a>
                        </li>
                        </c:if>
                        <c:if test="${SELECTED_QUESTION.lession.lessionType.code == 'Q'}">
                        <li role="quiz" class=""><a href="#tab_quiz"  id="quiz-tab" role="tab" data-toggle="tab" aria-expanded="false">Trắc nhiệm</a>
                        </li>
                        </c:if>
                      </ul>
                      
                     <!--  content  -->
                      <div id="myTabContent" class="tab-content">
                      
                   	<!-- Question -->
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_question" aria-labelledby="question-tab">
                          <input type="hidden" name="id" value="${SELECTED_QUESTION.id}">
		                  <input type="hidden" name="lession" value='${SELECTED_QUESTION.lession.id}' >  
		                    <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Tiêu đề</label>
		                        <div class="col-sm-9">
		                            <input type="text" id="title" name="title" value="${SELECTED_QUESTION.title}" class="form-control" placeholder="">
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Mô tả</label>
		                        <div class="col-sm-9">
		                            <textarea  id="description"  name="description"  class="form-control" placeholder="">${SELECTED_QUESTION.description}</textarea>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Nội dung</label>
		                        <div class="col-sm-9">
		                            <textarea  id="content"  name="content"  class="form-control" placeholder="">${SELECTED_QUESTION.content}</textarea>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Tên file</label>
		                        <div class="col-sm-9">
		                            <input type="text" id="fileName"  name="fileName" value="${SELECTED_QUESTION.fileName}" class="form-control" placeholder="">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="name" class="control-label col-sm-3">Code mặc định</label>
		                        <div class="col-sm-9">
		                            <textarea  id="defaultCode"  name="defaultCode"  class="form-control" placeholder="">${SELECTED_QUESTION.defaultCode}</textarea>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="control-label col-sm-3">Thứ tự</label>
		                        <div class="col-sm-9">
		                            <input type="number" id="cssClass" name="orderDisplay" class="form-control" value="${SELECTED_QUESTION.orderDisplay}">
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label class="control-label col-sm-3">Hiển thị</label>
		                        <div class="col-sm-9">
		                            <input type="checkbox" ${SELECTED_QUESTION.isActive?"checked":""} id="isActive" name="isActive">
		                        </div>
		                    </div>
                        </div>
                        
                        <!-- Instruction -->
                        <c:if test="${SELECTED_QUESTION.lession.lessionType.code != 'Q' && SELECTED_QUESTION.lession.lessionType.code != 'A'}">
                        <div role="tabpanel" class="tab-pane fade" id="tab_instruction" aria-labelledby="instruction-tab">
                         <a class="btn btn-success btn-sm btn-open-modal panel-title" href="javascript:void(0)" id="addInstruction">Thêm yêu cầu mới</a>
                          <div class="accordion" id="instruction" role="tablist" aria-multiselectable="false">
		                    <c:forEach items="${SELECTED_QUESTION.instructions}" var="INSTRUCTION" varStatus="loop">
		                      <div class="panel">
		                        <a class="panel-heading" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapse${loop.index}" aria-expanded="true" aria-controls="collapseOne">
		                          <h4 class="panel-title">Yêu cầu ${INSTRUCTION.orderDisplay} <i class="fa fa-trash pull-right deleteInstruction"></i></h4>
		                        </a>
		                        <input type="hidden" data-name="insID" value="${INSTRUCTION.id}">
		                        <div id="collapse${loop.index}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" aria-expanded="true" style="">
		                          <div class="panel-body">
		                          	<div class="form-group">
				                        <label for="name" class="control-label col-sm-3">Nội dung</label>
				                        <div class="col-sm-9">
				                            <textarea  id="insContent" required data-name="insContent"  class="form-control" placeholder="">${INSTRUCTION.content}</textarea>
				                        </div>
				                    </div>
				                    <div class="form-group">
				                        <label for="name" class="control-label col-sm-3">Hướng dẫn</label>
				                        <div class="col-sm-9">
				                            <textarea  id="insHint" required data-name="insHint"  class="form-control" placeholder="">${INSTRUCTION.hint}</textarea>
				                        </div>
				                    </div>
				                    <div class="form-group">
				                        <label for="name" class="control-label col-sm-3">Code yêu cầu</label>
				                        <div class="col-sm-9">
				                            <textarea  id="insRequiredCode"  data-name="insRequiredCode"  class="form-control" placeholder="">${INSTRUCTION.requiredCode}</textarea>
				                        </div>
				                    </div>		
				                    <div class="form-group">
				                        <label for="name" class="control-label col-sm-3">Kết quả</label>
				                        <div class="col-sm-9">
				                            <textarea  id="insResult"  data-name="insResult"  class="form-control" placeholder="">${INSTRUCTION.result}</textarea>
				                        </div>
				                    </div>
				                     <div class="form-group">
				                        <label class="control-label col-sm-3">Thứ tự</label>
				                        <div class="col-sm-9">
				                            <input type="number" id="insOrderDisplay" data-name="insOrderDisplay" class="form-control" value="${INSTRUCTION.orderDisplay}">
				                        </div>
				                    </div>		
		                          </div>
		                        </div>
		                      </div>
		                    </c:forEach>
		                  </div>
                        </div>
                        </c:if>
                        
                        <!-- Quiz -->
                        <c:if test="${SELECTED_QUESTION.lession.lessionType.code == 'Q'}">
	                        <div role="tabpanel" class="tab-pane fade" id="tab_quiz" aria-labelledby="quiz-tab">
		                        <div id="quiz">
		                        <c:forEach items="${SELECTED_QUESTION.quizs}" var="QUIZ" varStatus="loop">
		                        	<div class="form-group">
		                                <input type="radio" data-name="isTrue"  ${QUIZ.isTrue?'checked':''} class="col-sm-2 mt-10"  name="Quiz">
		                            	<div class="col-sm-7">
		                            		<input type="text" class="form-control" data-name="answer" value="${QUIZ.answer}">
		                            		<input type="hidden" data-name="quizId" value="${QUIZ.id}">
		                            	</div>
		                            	<a class="text-danger" href="javascript:void(0)"><i class="fa fa-trash deleteQuiz col-sm-3 pt-10"></i></a>
		                            	
		                          	</div>
		                        </c:forEach>
		                        </div>
			                    <a id="addQuiz" class="text-info" href="javascript:void(0)"><i class="fa fa-plus" ></i> Thêm đáp án mới</a>
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
            <c:if test="${SELECTED_QUESTION.lession.lessionType.code != 'Q' && SELECTED_QUESTION.lession.lessionType.code != 'A'}">
           		objData['listInstruction'] = getListInstruction();
            </c:if>
            <c:if test="${SELECTED_QUESTION.lession.lessionType.code == 'Q'}">
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
    
</script>
