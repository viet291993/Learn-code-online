<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Learn code</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/Resources/Images/favicon.ico"/>" />
		    
		<script src="<c:url value="/Resources/shared/js/jquery-2.2.4.min.js"/>"></script>
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/65.54ab6f1fdbffb97caaae.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/92.b0ca2c49a6d3e4f35cbc.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/116.45c94b376e545cb4c285.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/133.de70b8e4058477231cd7.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/138.06b3522d6a165918162f.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/32.c2e56ddc298af3dce9de.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/58.6ff98e61647629431562.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/78.7e8787fe44d119620a42.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/131.74912557737408671566.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/136.e9aeb5e6bd4793363f2c.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/139.58a541e5d9ee32970687.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/173.ce2f59d12a3d0378a60c.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/176.605f6fe264edbc371735.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/4.4569a586897cd0f00d6b.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/6.b6e2f512d248c3d19cda.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/10.1731936010866a73edf3.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/21.50272209b500e6da1140.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/110.dc93540d473951e0b1cb.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/0.834129a31aa84bdadb07.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/2.5a9bea9b44395294cf1f.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/1.a758190cc4232e11e584.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/7.6784dff96cc20f365e01.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/16.89bfff06cfca5a9fa50e.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/18.258c486ee3fb1db73a8a.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/19.05c23bf84f96a8653e36.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/24.cf9b762005b507f28872.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/33.ef4f8bf1c45a70c96d4e.chunk.css" />">
	    <link data-chunk="portal-scenes-Dashboard" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/portal-scenes-Dashboard.485139fc2e0a6cbb6ee5.chunk.css" />">
	    <link data-chunk="DashboardHeader" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/DashboardHeader.9ab93621ff9c5b83b96c.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/23.98c46a006dd97e6b7fc8.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/26.1d7b37ebaf4c3cd7f0c5.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/46.7f073534d3dcf0b2ec46.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/51.f7da5aa48a63b01405d8.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/54.a5c8c55fe600594be00e.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/68.4d25fc59927673d76475.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/81.fd345d65b9b33ef2b195.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/137.cf6c9951e6cb1425f0f2.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/183.ad1170accd5b44f36c4b.chunk.css" />">
	    <link data-chunk="Today" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/Today.acbf756449f1b55c3f04.chunk.css" />">
	    <link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/59.1de3ee7702429c781aac.chunk.css" />">
		<link data-chunk="portal" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/131.2f9e644121267febf4a0.chunk.css" />">
		<link data-chunk="portal-scenes-CoursePages-CourseLandingPage" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/31.eaba1b55c7e27d905e67.chunk.css" />">
		<link data-chunk="portal-scenes-CoursePages-CourseLandingPage" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/25.b439532de703944b80bf.chunk.css" />">
		<link data-chunk="portal-scenes-CoursePages-CourseLandingPage" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/71.d8a38b3b0b64ef2adf13.chunk.css" />">
		<link data-chunk="portal-scenes-CoursePages-CourseLandingPage" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/168.8055efce2c7b97c93002.chunk.css" />">
		<link data-chunk="portal-scenes-CoursePages-CourseLandingPage" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/182.8568951dca9ec5b778b5.chunk.css" />">
		<link data-chunk="portal-scenes-CoursePages-CourseLandingPage" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/portal-scenes-CoursePages-CourseLandingPage.f5eed3c6a7c736cd5f24.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/93.47bff29bf446ee34544a.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/114.3f084dfb41d1e1a3cf80.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/69.45214f5047bee175b0de.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/80.35a241d1db754e08fa68.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/96.40cca148aac6178147ef.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/112.6935c054176f3a62a017.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/147.ea4a780c80a2b836eaf7.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/176.517988f27f5ab80c5e96.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/corporate-scenes-Landing.49c78a6a6bb9daec6472.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/141.6850b1254c419c10a10b.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/117.d90da474ed7e38418585.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/143.0049802d33aabeb3d3a8.chunk.css" />">
		<link data-chunk="corporate-scenes-Landing" rel="stylesheet" href="<c:url value="/Resources/Home/shared/css/corporate-scenes-LogIn.bd18520b3432b9589489.chunk.css" />">
	</head>
		<body>
	            <%@include file="/Views/Home/Panel/header.jsp" %>
	            <!-- THONG BAO -->
	            <!-- <div>
	                <div class="butterbar js-butterbar butterbar--always-show" data-persist="m_butterbar">
	                    <div class="butterbar__message">
	                    </div>
	                </div>
	            </div> -->
	            <!-- START PAGE CONTENT -->
	            <t:insertAttribute name="Content" ignore="true" />
	            <div class="footerContainer__1lX4xMFd1eOmayhSXXv_V7" role="contentinfo">
	                <div class="legalLocalDivider__3R_kPtdcnK2Bmxt58p1-xC"></div>
	                <div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4">
	                    <div class="legalLocalContainer__svIS7zurAcagN3R_mnPB0">
	                        <div class="legalLinks__15oguwSH9xMtUWyzrt11tz"><a class="legalLink__Sm_XiNRw9HAHKjAJ1oviH" href="#/policy">Privacy Policy</a><span class="divider__1k3N_s0H2aR9vPHGQYVh43"></span><a class="legalLink__Sm_XiNRw9HAHKjAJ1oviH" href="#/terms">Terms</a></div>
	                        <div class="madeIn__uLbnO-9RYq5yUowYUjl55">Dự án 2<span aria-label="love" class="helloFellowKids__3iZ3CrhjPJ6VfdUDLNFA-d" role="img"> ❤️</span>by VHH ©
	                            <!-- -->2019
	                            <!-- -->LearnCode</div>
	                    </div>
	                </div>
	            </div>
	            
	            <div id="menu-profile" style="display: none;" class="overlay__3LeDG7tuQrrJdjPm8agkmx fixed__1dVANA0vWS60mCGpsRBU8T type-transparent__19iohvkXZv5eOsVMRAvvLQ"><div id="profile-position" align="right" offset="20" class="content__fQv0JV6LGGkYLrzWHtg7t popover__2vSb5RYj187vezgJCHUZI1 below-right__XT76WV7zCz6PFSFnddn2A" style="top: 74px; z-index: 50;;"><div><div class="" style="opacity: 1;"><div class="shadow__3DzEF2DlOL8n2FXGHNWRBW"><div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD menu__e94OfrzcqoePgW_YvhDCp"><nav><div><a class="menuItem__1XAsFXFqLByEK4sD6lx3za no-underline" href="/profiles/me">Hồ sơ của tôi</a><a data-testid="edit-account-link" class="menuItem__1XAsFXFqLByEK4sD6lx3za no-underline" href="/account" id="edit-account-link">Cài đặt tài khoản</a><a data-testid="help-link" class="menuItem__1XAsFXFqLByEK4sD6lx3za no-underline" href="/help" id="help-link">Help</a><a data-testid="sign-out-link" class="menuItem__1XAsFXFqLByEK4sD6lx3za no-underline" href="<c:url value="/logout" />" id="sign-out-link">Đăng xuất</a></div></nav></div></div></div></div></div></div>
	            
	    <script>
	        $('#nav-search').hide();
	        $("#header-search").click(function(e) {
	            e.preventDefault();
	            e.stopPropagation();
	            if ($('#nav-search').is(":visible") === false) {
	                $('#nav-search').show("100");
	            } else {
	                $('#nav-search').hide("100");
	            }
	        });
	
	        $("#header-search-dropdown").click(function(e) {
	            e.preventDefault();
	            e.stopPropagation();
	            $('#nav-search').show();
	        });
	
	        $(document).click(function() {
	            $('#nav-search').hide("100");
	            $("#menu-profile").fadeOut("100");
	        });
	
	        $('#close-menu-mobile').hide();
	
	        $("#open-menu-mobile").click(function(e) {
	            e.preventDefault();
	            e.stopPropagation();
	            $('#nav-mobile').show("100");
	            $('#open-menu-mobile').hide();
	            $('#close-menu-mobile').show();
	        });
	
	        $("#close-menu-mobile").click(function(e) {
	            e.preventDefault();
	            e.stopPropagation();
	            $('#nav-mobile').hide("100");
	            $('#close-menu-mobile').hide();
	            $('#open-menu-mobile').show();
	        });
	        
	        $("#button-avatar").click(function(e) {
	        	e.preventDefault();
	            e.stopPropagation();
	            var temp = $("#header-avatar").position().left;
	            var width = 83;
	            var left = temp + width;
	            $("#profile-position").attr("style", "top: 74px; left: " + left + "px");
	            $("#menu-profile").fadeIn("100");
	        });
	    </script>
	
	</body>
</html>