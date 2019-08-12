<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<div>
         <table id="table" class="table table-striped table-hover">
             <thead>
               <tr>
                <th style="width: 1%">ID </th>
                <th>Tên ngôn ngữ</th>
                <th style="width: 20%"></th>  
               </tr>
             </thead>
             <tbody>
                 	<c:forEach items="${LIST_LANGUAGE}" var="language">
                        <tr>
                            <td class="td-align-center">${language.id}</td>
                            <td>${language.name}</td>
                        	<td>
                        		<a class="btn btn-warning btn-sm " data-toggle="tooltip" data-placement="top"  data-original-title="Sửa khóa học" href="/Admin/Course/ListCourse/Edit/${course.id}"><i class="fa fa-edit"></i></a>
                                <a class="btn btn-danger btn-sm  btn-send-ajax" data-toggle="tooltip" data-placement="top"  data-original-title="Xóa khóa học" href="javascript:void(0)" data-controller="<c:url value='/Admin/Course/ListCourse/Delete/${role.id}'/>"><i class="fa fa-trash"></i></a>
                        	</td>
                        </tr>
                    </c:forEach>
              </tbody>
           </table><!-- end table -->
</div>
