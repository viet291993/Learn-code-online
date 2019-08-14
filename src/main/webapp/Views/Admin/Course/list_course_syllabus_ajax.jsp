<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="module-role-list">
	<ul id="treeview" class="list-group">
		<li class="list-group-item active">
			<label><span>${COURSE.name}</span><a class="btn-open-modal text-success" title="Thêm mới giáo trình mới"
						data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ViewInsert/${COURSE.id}"/>">
						<i class="fa fa-plus-circle"></i></a>
			</label>
		</li>	
				<c:forEach items="${COURSE.syllabuses}" var="SYLLABUS">
					<div class="syllabus">
						<li class="list-group-item">
							<label> <span>${SYLLABUS.orderDisplay}. ${SYLLABUS.name}</span>
									<a class="btn-open-modal text-success" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ViewInsert/${SYLLABUS.id}"/>"><i class="fa fa-plus-circle"></i></a>
									<a class="btn-open-modal text-warning" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ViewEdit/${SYLLABUS.id}"/>"><i class="fa fa-edit"></i></a>
									<a class="text-primary btn-send-ajax" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ChangeStatus/${SYLLABUS.id}"/>"><i class="fa ${MODULE.isShow?'fa-lock':'fa-unlock'}"></i></a>
									<a class="text-danger btn-send-ajax" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/Delete/${SYLLABUS.id}"/>"><i class="fa fa-trash"></i></a>
							</label>
						</li>
							<div class="lession">
								<c:forEach items="${SYLLABUS.lessions}" var="LESSION">
										<li class="list-group-item pl-52">
										<label> <span>${SYLLABUS.orderDisplay}.${LESSION.orderDisplay}. ${LESSION.name}</span>
													<a class="btn-open-modal text-warning" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ViewEdit/${childrenModule.id}"/>"><i class="fa fa-edit"></i></a>
													<a class="text-primary btn-send-ajax" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/ChangeStatus/${childrenModule.id}"/>"><i class="fa ${childrenModule.isShow?'fa-lock':'fa-unlock'}"></i></a>
													<a class="text-danger btn-send-ajax" data-controller="<c:url value="/Admin/Course/ListCourse/Syllabus/Delete/${childrenModule.id}"/>"><i class="fa fa-trash"></i></a>
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
