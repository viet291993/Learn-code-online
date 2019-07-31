<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="module-role-list">
	<ul id="tree">
		<li>
			<label><span>ROOT</span><a class="btn-open-modal text-success" title="Thêm mới module con cho module này"
						data-controller="<c:url value="/Admin/Permission/ListModule/ViewInsert/1"/>">
						<i class="fa fa-plus-circle"></i></a>
			</label>
			<ul>
				<c:forEach items="${MODULES}" var="MODULE">
					<c:if test="${!MODULE.isDeleted}">
						<li><label> <span>${MODULE.name}</span>
									<a class="btn-open-modal text-success" data-controller="<c:url value="/Admin/Permission/ListModule/ViewInsert/${MODULE.id}"/>"><i class="fa fa-plus-circle"></i></a>
									<a class="btn-open-modal text-warning" data-controller="<c:url value="/Admin/Permission/ListModule/ViewEdit/${MODULE.id}"/>"><i class="fa fa-edit"></i></a>
									<a class="text-primary btn-send-ajax" data-controller="<c:url value="/Admin/Permission/ListModule/ChangeStatus/${MODULE.id}"/>"><i class="fa ${MODULE.isShow?'fa-lock':'fa-unlock'}"></i></a>
									<a class="text-danger btn-send-ajax" data-controller="<c:url value="/Admin/Permission/ListModule/Delete/${MODULE.id}"/>"><i class="fa fa-trash"></i></a>
							</label>
							<ul>
								<c:forEach items="${MODULE.adminModules}" var="childrenModule">
									<c:if test="${!childrenModule.isDeleted}">
										<li><label> <span>${childrenModule.name}</span>
													<a class="btn-open-modal text-warning" data-controller="<c:url value="/Admin/Permission/ListModule/ViewEdit/${childrenModule.id}"/>"><i class="fa fa-edit"></i></a>
													<a class="text-primary btn-send-ajax" data-controller="<c:url value="/Admin/Permission/ListModule/ChangeStatus/${childrenModule.id}"/>"><i class="fa ${childrenModule.isShow?'fa-lock':'fa-unlock'}"></i></a>
													<a class="text-danger btn-send-ajax" data-controller="<c:url value="/Admin/Permission/ListModule/Delete/${childrenModule.id}"/>"><i class="fa fa-trash"></i></a>
										</label></li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</li>
	</ul>
</div>
<script>
$('#tree').treed({openedClass:'glyphicon glyphicon-expand', closedClass:'glyphicon glyphicon-collapse-down'});
</script>