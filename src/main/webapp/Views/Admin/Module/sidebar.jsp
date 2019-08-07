<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>

<!-- START PAGE SIDEBAR -->
<div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="${CONTEXTPATH}/admin" class="site_title"><img src="${CONTEXTPATH}/Resources/Images/favicon.ico" >  <span>Learn code !</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="${CONTEXTPATH}/Resources/Images/admin.png" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Xin chào,</span>
                <h2>${ADMIN.name}</h2>
              </div>
              <div class="clearfix"></div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>${ADMIN.adminRole.name}</h3>
                <ul class="nav side-menu">
		       	<c:set var="MODULE_IN_ROLES" value="${f:filterModuleInRoleList(ADMIN.adminRole.adminModuleInRoles,1)}" />
		        <c:forEach items="${MODULE_IN_ROLES}" var="MODULE_IN_ROLE"> 
		            <c:set var="MODULE" value="${MODULE_IN_ROLE.adminModule}"/>
		            <c:if test="${MODULE.isShow&&!MODULE.isDeleted}">
		                <li class="xn-openable ${MODULE_IN_ROLE.adminModule.id==sessionScope['ADMIN']['MODULE_ACTIVE_PARENT']?'active':''}">
		                   <c:set var="ModuleInRoleList" value="${f:filterModuleInRoleList(ADMIN.adminRole.adminModuleInRoles,MODULE.id)}" />
		                    <a>
		                        <i class="fa ${MODULE_IN_ROLE.adminModule.icon}"> </i> ${MODULE_IN_ROLE.adminModule.name}<c:if  test="${not empty ModuleInRoleList}"> <span class="fa fa-chevron-down"></span></c:if>
		                    </a>
		                    <ul class="nav child_menu">
		                        <c:forEach items="${ModuleInRoleList}" var="childrenModuleInRole">
		                            <c:set value="${childrenModuleInRole.adminModule}" var="childrenModule" />
		                            <c:if test="${childrenModule.isShow&&!childrenModule.isDeleted}">
		                                <li class="${childrenModule.id==sessionScope['ADMIN']['MODULE_ACTIVE']?'active':''}">
		                                    <a data-id="${childrenModule.id}" data-parent="${MODULE_IN_ROLE.adminModule.id}" href='<c:url value="/Admin${MODULE_IN_ROLE.adminModule.controller}${childrenModule.controller}"/>'>
		                                        <i class="fa ${childrenModule.icon}"></i>${childrenModule.name} 
		                                    </a>
		                                </li>
		                            </c:if>
		                        </c:forEach>
		                    </ul>
		                </li>
		            </c:if>
		        </c:forEach>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath}/admin/logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>

<!-- END PAGE SIDEBAR -->