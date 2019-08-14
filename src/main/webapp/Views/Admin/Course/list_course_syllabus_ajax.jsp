<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="module-role-list">
	<ul id="treeview" class="list-group">
		<li class="list-group-item active">
			<label><span>${COURSE.name}</span><a class="btn-open-modal text-success" title="Thêm mới giáo trình"
						data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ViewInsert/${COURSE.id}"/>">
						<i class="fa fa-plus-circle"></i></a>
			</label>
		</li>	
				<c:forEach items="${COURSE.syllabuses}" var="SYLLABUS">
					<div class="syllabus">
						<li class="list-group-item">
							<label> <span>${SYLLABUS.orderDisplay}. ${SYLLABUS.name}</span>
									<a title="Thêm mới bài học" class="btn-open-modal text-success" data-controller="<c:url value="/Admin/Course/ListCourse/Lession/ViewInsert/${SYLLABUS.id}"/>"><i class="fa fa-plus-circle"></i></a>
									<a title="Sửa giáo trình" class="btn-open-modal text-warning" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ViewEdit/${SYLLABUS.id}"/>"><i class="fa fa-edit"></i></a>
									<a title="Thêm mới bài học" class="text-primary btn-send-ajax" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ChangeStatus/${SYLLABUS.id}"/>"><i class="fa ${SYLLABUS.isActive?'fa-lock':'fa-unlock'}"></i></a>
									<a title="Xóa giáo trình" class="text-danger btn-send-ajax" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/Delete/${SYLLABUS.id}"/>"><i class="fa fa-trash"></i></a>
							</label>
						</li>
							<div class="lession">
								<c:forEach items="${SYLLABUS.lessions}" var="LESSION">
										<li class="list-group-item pl-52">
										<label> 
													<span>${SYLLABUS.orderDisplay}.${LESSION.orderDisplay}. ${LESSION.name} </span>
												<c:if test="${LESSION.isPro}">
													<span class="label label-primary">PRO</span>
												</c:if>	
													<span class="text-dark">  -  ${LESSION.lessionType.name}</span> 
													<a title="Thêm mới câu hỏi" class="btn-open-modal text-success" data-controller="<c:url value="/Admin/Course/ListCourse/Question/ViewInsert/${LESSION.id}"/>"><i class="fa fa-plus-circle"></i></a>
													<a class="btn-open-modal text-warning" data-controller="<c:url value="/Admin/Course/ListCourse/Lession/ViewEdit/${LESSION.id}"/>"><i class="fa fa-edit"></i></a>
													<a class="text-primary btn-send-ajax" data-controller="<c:url value="/Admin/Course/ListCourse/Lession/ChangeStatus/${LESSION.id}"/>"><i class="fa ${LESSION.isActive?'fa-lock':'fa-unlock'}"></i></a>
													<a class="text-danger btn-send-ajax" data-controller="<c:url value="/Admin/Course/ListCourse/Lession/Delete/${LESSION.id}"/>"><i class="fa fa-trash"></i></a>
										</label>
										</li>
								</c:forEach>
							</div>	
					</div>
				</c:forEach>
	</ul>
</div>
<script>
$('#treeview').treeview();
</script>
