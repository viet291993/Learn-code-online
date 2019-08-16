<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld"%>
<nav id="footer-lession" class="wrapper___FtNJJFPKOjBRYeSq7eqS footer__1avEDx0U9uPTksme12z8GJ footer__2U7JCwWxuXWkT-dpDR3Kyt">
 <div class="contentContainerWide__1saqfFL04Txxk0GXDnyXPu contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 contentWrapper__2MvNFVWRnpySbai8R2WkFr">
     <div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionLeft__1ZxE4qxswlSZVqzj66Yx4I">
         <div class="tab__8U8Y2bEbIRpEBFu3Mrga8">
             <button id="button-menu-lession" type="button" class="button__3QyyZ7VfF20gYLvlba4bzy"><span class="burger__4P7-7iPTdceddCJKQSFUg"></span><span data-cue="course-navigator" class="exerciseTitle__DMOI_fKuWDiNeRfuuknlN">${SELECTED_QUESTION.orderDisplay}. ${SELECTED_QUESTION.title}</span></button>
         </div>
     </div>
     <input type="hidden" id="reloadController2" value="<c:url value='/learn/ajax2'/>">
     <div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionCenter__10feYk8tZf2FwdvtmnIfrM ajax-content-2">
         <c:import url="/Views/Home/Learn/lession_project_ajax_button.jsp" />
     </div>
     <div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionRight__2x_UrYa_JCgcfdfLU2FgeF">
         <button data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-white__1e0kCCItRnEi-EDNpmLuX1 flat__Gbu0EzdU2yQr9B87Peh09 helpButton__1jE9h5zuXz0tdagtnkPFgl" style="min-width: 6rem;">
                <svg width="22" height="22" fill="currentColor" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <title>Float Icon</title>
                    <g fill-rule="evenodd">
                        <path d="M5.227 8.631L8.18 10.44a4.134 4.134 0 0 0 .268 3.66L5.51 15.886a7.578 7.578 0 0 1-.284-7.256zm2.886-3.12a7.575 7.575 0 0 1 7.774 0l-1.788 2.937a4.132 4.132 0 0 0-4.198 0L8.113 5.511zm7.259 13.26a7.582 7.582 0 0 1-6.741.002l1.808-2.953a4.14 4.14 0 0 0 3.133-.005l1.8 2.957zm3.119-2.886l-2.933-1.796a4.134 4.134 0 0 0 .261-3.65l2.954-1.808a7.578 7.578 0 0 1-.282 7.254z"></path>
                        <path d="M12 16.125a4.125 4.125 0 1 1 0-8.25 4.125 4.125 0 0 1 0 8.25zm0-.917a3.208 3.208 0 1 0 0-6.416 3.208 3.208 0 0 0 0 6.416z" fill-rule="nonzero"></path>
                        <path d="M12 20.25a8.25 8.25 0 1 1 0-16.5 8.25 8.25 0 0 1 0 16.5zm0-1.833a6.417 6.417 0 1 0 0-12.834 6.417 6.417 0 0 0 0 12.834z" fill-rule="nonzero"></path>
                    </g>
                </svg><span class="getHelpText__3lxfUyx0H9F4466aJbTTc6">Get Help</span></button>
            <div></div>
        </div>
    </div>
</nav>
<div class="ReactModalPortal" id="menu-lession" style="z-index: 13;">
	    <div class="overlay__3VZoRx506F-jSuvoxLwSVd">
	        <div class="ReactModal__Content ReactModal__Content--after-open" tabindex="-1" role="dialog" aria-label="Modal">
	            <div class="modalContent__2nyerWJYwhtqNMxqgzbzMr">
	                <div id="content-menu-lession" class="modal__300H-z8Emtp72To9jo_ZSJ ">
	                    <div>
	                        <div class="courseNavButtonContainer__1_gUv3bTN8HAQQf58MIDeP"><a href="/learn/learn-java" class="courseNavButton__2PvUR3d_4qWLyQfxjVCQN3"><span class="leftArrowIcon___-pCF5NI_CCZZ-qpS3uZ1 new-cc-icon icon-heavyleftarrow"></span>${SELECTED_LESSION.name }</a></div>
	                        <div>
	                            <h1 class="heading__32zZOICnFS_W6-JZlLrX2y">${SELECTED_QUESTION.title }</h1>
	                            <!-- <h3 class="subheading__rVwyi7V09bKM8slOtu_0E">LESSON</h3> -->
	                            <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA description__31qWax7kNh79yVS9bXfg3z">
	                                <p>${SELECTED_QUESTION.description }</p>
	                            </div>
	                            <section class="exerciseSection__1HM1WD1vDQSTvLlS5WmosL">
	                                <div class="groupHeading__3uTQEYNxl6MJgzXZZ13yw9">Bài tập
	                                </div>
	                                <c:forEach items="${SELECTED_LESSION.questions}" var="question" varStatus="status">
	                                	<button class="navButton__ZnqfRpK9Q_YnPIBDOqHmg completedListItem__1eHiHnR2W0vFWdZk6zSmIu<c:if test="${SELECTED_QUESTION.orderDisplay == question.orderDisplay}"> activeListItem__1WDYeFpcYdIS35PyYU08C</c:if>">
	                                    	<div class="listItemTitle__3NeTJtrYNQfK-bf7JqWTlG">${status.index + 1}. ${question.title }</div><i class="navButtonIcon__3CZM0V7800cC4DShLnggjR fcn-icon fcn-icon-checkmark"></i></button>
	                                </c:forEach>
	                                
	                                <!-- <button class="navButton__ZnqfRpK9Q_YnPIBDOqHmg completedListItem__1eHiHnR2W0vFWdZk6zSmIu">
	                                    <div class="listItemTitle__3NeTJtrYNQfK-bf7JqWTlG">1. Introduction to Java</div><i class="navButtonIcon__3CZM0V7800cC4DShLnggjR fcn-icon fcn-icon-checkmark"></i></button>
	                                <button class="navButton__ZnqfRpK9Q_YnPIBDOqHmg completedListItem__1eHiHnR2W0vFWdZk6zSmIu activeListItem__1WDYeFpcYdIS35PyYU08C">
	                                    <div class="listItemTitle__3NeTJtrYNQfK-bf7JqWTlG">2. Hello Java File!</div><i class="navButtonIcon__3CZM0V7800cC4DShLnggjR fcn-icon fcn-icon-checkmark"></i></button>
	                                <button class="navButton__ZnqfRpK9Q_YnPIBDOqHmg">
	                                    <div class="listItemTitle__3NeTJtrYNQfK-bf7JqWTlG">3. Commenting Code</div><i class="navButtonIcon__3CZM0V7800cC4DShLnggjR fcn-icon fcn-icon-inProgress"></i></button>
	                                <button class="navButton__ZnqfRpK9Q_YnPIBDOqHmg lockedListItem__3ypfptVCWmhSnn9dgtue5B">
	                                    <div class="listItemTitle__3NeTJtrYNQfK-bf7JqWTlG">4. Semicolons and Whitespace</div><i class="navButtonIcon__3CZM0V7800cC4DShLnggjR fcn-icon fcn-icon-lock"></i></button>
	                                <button class="navButton__ZnqfRpK9Q_YnPIBDOqHmg lockedListItem__3ypfptVCWmhSnn9dgtue5B">
	                                    <div class="listItemTitle__3NeTJtrYNQfK-bf7JqWTlG">5. Compilation: Catching Errors</div><i class="navButtonIcon__3CZM0V7800cC4DShLnggjR fcn-icon fcn-icon-lock"></i></button>
	                                <button class="navButton__ZnqfRpK9Q_YnPIBDOqHmg lockedListItem__3ypfptVCWmhSnn9dgtue5B">
	                                    <div class="listItemTitle__3NeTJtrYNQfK-bf7JqWTlG">6. Compilation: Creating Executables</div><i class="navButtonIcon__3CZM0V7800cC4DShLnggjR fcn-icon fcn-icon-lock"></i></button>
	                                <button class="navButton__ZnqfRpK9Q_YnPIBDOqHmg lockedListItem__3ypfptVCWmhSnn9dgtue5B">
	                                    <div class="listItemTitle__3NeTJtrYNQfK-bf7JqWTlG">7. Java Review: Putting It All Together</div><i class="navButtonIcon__3CZM0V7800cC4DShLnggjR fcn-icon fcn-icon-lock"></i></button> -->
	                            </section>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <button class="screenReaderOnly__1SyakAQGSIs3AM051DW1dt" type="button">Close and return to main application</button>
	        </div>
	    </div>
	</div>
	
	<script>
		    $('#menu-lession').hide();
		    
	        $("#button-menu-lession").click(function(e) {
	            e.preventDefault();
	            e.stopPropagation();
	            if ($('#menu-lession').is(":visible") === false) {
	                $('#menu-lession').show("100");
	                $("#button-menu-lession").addClass("active__3G23BnUo54b_LohtzReol1 close__2pot0AW8lJ8x-K9dxddXaS");
	            } else {
	                $('#menu-lession').hide("100");
	                $("#button-menu-lession").removeClass("active__3G23BnUo54b_LohtzReol1 close__2pot0AW8lJ8x-K9dxddXaS");
	            }
	        });
	        
	        $("#content-menu-lession").click(function(e) {
	            e.preventDefault();
	            e.stopPropagation();
	            $('#menu-lession').show();
	        });
	        
	        $(document).click(function() {
	            $('#menu-lession').hide("100");
	            $("#button-menu-lession").removeClass("active__3G23BnUo54b_LohtzReol1 close__2pot0AW8lJ8x-K9dxddXaS");
	        });
		</script>