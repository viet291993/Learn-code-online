<%@page import="com.poly.utils.StaticEnum"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/functions.tld" prefix="f"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>

<c:set var="ADMIN_ID" value="${sessionScope['ADMIN']['ADMIN_ID']}"/>
<c:set var="ADMIN" value="${f:findAdminById(ADMIN_ID)}"/>
<c:choose>    
    <c:when test="${cookie.adminLang.value!=null}">
        <c:set var="LANG" value="${cookie.adminLang.value}"/>
    </c:when>
    <c:otherwise>
        <c:set var="LANG" value="${StaticEnum.LANGUAGE_DEFAULT_CODE}"/>
    </c:otherwise>
</c:choose>
<c:set value="${WEBSITE_CONFIGS[LANG]}" var="WEBSITE_CONFIG" scope="request" />

<!DOCTYPE html>
<html lang="en">
<head>
		 <!-- META SECTION -->
		<title>Learn code | Admin Page</title>    
 		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" type="image/x-icon" href="/Resources/shared/img/favicon.ico" />
        <!-- END META SECTION -->
        
        
         <!-- Bootstrap -->
	    <link href="Resources/Admin/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	    
	    <!-- Font Awesome -->
	    <link href="Resources/Admin/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	    <!-- NProgress -->
	    <link href="Resources/Admin/vendors/nprogress/nprogress.css" rel="stylesheet">
	
	    <!-- Custom Theme Style -->
	    <link href="Resources/Admin/build/css/custom.min.css" rel="stylesheet">

</head>
<body class="nav-md">
 		<!-- START PAGE CONTAINER -->
 		<div class="container body">
 			<div class="main_container">
 				<!-- START PAGE SLIDEBAR -->
       			<div class="col-md-3 left_col">
            		<%@include file="/Views/Admin/Module/sidebar.jsp" %>
            	</div>
            	<!-- END PAGE SLIDEBAR -->
            
            	<!-- START PAGE NAVIGATION -->
            	<div class="top_nav">
            		<%@include file="/Views/Admin/Module/navigation.jsp" %>
            	</div>
            	<!-- END PAGE NAVIGATION -->
            	
            	<!-- START PAGE CONTENT -->
            	<div id="content" class="right_col" role="main">
            		<t:insertAttribute name="Content" ignore="true" />
            	</div>
            	<!-- END PAGE CONTENT -->
            	
            	<!-- footer content -->
		        <footer>
		          <div class="pull-right">
		            Learn code online</a>
		          </div>
		          <div class="clearfix"></div>
		        </footer>
        <!-- /footer content -->
            	
        	</div>
        </div>
        <!-- END PAGE CONTAINER -->

        <!-- MESSAGE BOX-->
       <!--  <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out-alt"></span> Đăng <strong>Xuất</strong> ?</div>
                    <div class="mb-content">
                        <p>Bạn có chắc chắn bạn muốn đăng xuất?</p>                    
                        <p>Nhấn Không nếu bạn muốn tiếp tục công việc. Nhấn Có để đăng xuất người dùng hiện tại.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="/CellxAdmin/Logout" class="btn btn-success btn-lg">Có</a>
                            <button class="btn btn-default btn-lg mb-control-close">Không</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- END MESSAGE BOX-->

        <!-- START PRELOADS -->
        <audio id="audio-alert" src="Resources/Admin/build/audio/alert.mp3" preload="auto"></audio>
        <audio id="audio-fail" src="Resources/Admin/build/audio/fail.mp3" preload="auto"></audio>
        <!-- END PRELOADS -->     
        
        <!-- START SCRIPTS -->
        <!-- START TEMPLATE -->
        <script src="Resources/Admin/build/js/plugins.js" type="text/javascript"></script>
        <script src="Resources/Admin/build/js/actions.js" type="text/javascript"></script>
        <script src="Resources/Admin/build/js/main.js" type="text/javascript"></script>
        <!-- END TEMPLATE -->
        <!-- END SCRIPTS -->        
        
         <!-- jQuery -->
	    <script src="Resources/Admin/vendors/jquery/dist/jquery.min.js"></script>
	    <!-- Bootstrap -->
	    <script src="Resources/Admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	    <!-- FastClick -->
	    <script src="Resources/Admin/vendors/fastclick/lib/fastclick.js"></script>
	    <!-- NProgress -->
	    <script src="Resources/Admin/vendors/nprogress/nprogress.js"></script>
	    
	    <!-- Custom Theme Scripts -->
	    <script src="Resources/Admin/build/js/custom.min.js"></script>              
</body>
</html>