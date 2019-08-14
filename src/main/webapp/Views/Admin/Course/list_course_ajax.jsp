<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div>
         <table id="datatable" class="table table-striped table-bordered">
             <thead>
               <tr>
                <th style="width: 1%">ID </th>
                <th>Tên khóa học</th>
                <th>Ngôn ngữ</th>
                <th>Trạng thái</th>
                <th style="width: 15%"></th>  
               </tr>
             </thead>
             <tbody>
                 	<c:forEach items="${ITEMS_LIST}" var="course">
                        <tr>
                            <td class="td-align-center">${course.id}</td>
                            <td>${course.name}</td>
                            <td>${course.language.name}</td>
                            <td class="${course.isActive?'text-success':'text-danger'}">${course.isActive?'Bình thường':'Khóa'}</td>
                        	<td>
                        		<a class="btn btn-success btn-xs " data-toggle="tooltip" data-placement="top"  data-original-title="Thêm giáo trình cho khóa học" href="${CONTEXTPATH}/Admin/Course/ListCourse/Syllabus/${course.id}"><i class="fa fa-plus"></i></a>
                        		<a class="btn btn-warning btn-xs btn-open-modal" data-toggle="tooltip" data-placement="top"  data-original-title="Sửa khóa học" href="#"  data-controller="<c:url value='/Admin/Course/ListCourse/ViewEdit/${course.id}'/>"><i class="fa fa-edit"></i></a>
                                <a class="btn btn-danger btn-xs  btn-send-ajax" data-toggle="tooltip" data-placement="top"  data-original-title="Xóa khóa học" href="javascript:void(0)" data-controller="<c:url value='/Admin/Course/ListCourse/Delete/${role.id}'/>"><i class="fa fa-trash"></i></a>
                        	</td>
                        </tr>
                    </c:forEach>
              </tbody>
           </table><!-- end table -->
</div>
<script>
	$('#datatable').DataTable();
</script>
