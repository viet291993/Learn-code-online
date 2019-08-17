<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld"%>

<c:choose>
	<c:when test="${IS_DONE != null || IS_DONE == true }">
		<div class="fcn-nav-wrapper">
            <div class="fcn-nav-wrapper__center fcn-progress-container">
                <button id="back-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-grey__2CLxsMlHUa-nJ9mXIHOdkK outline__1jukYfNsJOsNuah6o7d8HZ" style="min-width: 6rem;" <c:if test="${SELECTED_QUESTION.orderDisplay == 1}">disabled</c:if>><span id="back-text">Trở lại</span><div id="back-spinner" class="fcn-spinner" style="display: none;"></div></button>
                <div class="fnc-nav__exercise-count">${SELECTED_QUESTION.orderDisplay}/${QUESTION_COUNT }</div>
                <button id="up-next" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-yellow__yMHS2uJ7H7WrTgbujzcMr go__14Lq_GXB8ztJnNGJfxZo0L" style="min-width: 6rem;">Bài tiếp theo</button>
            </div>
        </div>
        
        <div id="next-lession" class="ReactModalPortal" style="display: none;">
		    <div class="overlay__3VZoRx506F-jSuvoxLwSVd overlay__3f7BlbFSDRX-N5byPemb-j " style="z-index: 15;">
		        <div id="content-next-lession" class="ReactModal__Content ReactModal__Content--after-open" tabindex="-1" role="dialog" aria-label="Modal">
		            <div class="modalContent__2nyerWJYwhtqNMxqgzbzMr">
		                <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY content__1ojEb6ooWclJkE10bA3_aq">
		                    <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY header__1lY5PGR9R_3xu9eMm7KZ9y">
		                        <span class="preTitle__1c3wf7Bnosw0QriOAfTqbP">Tiếp theo: ${NEXT_LESSION.lessionType.name }</span>
		                        <h1 class="title__2LFXEG36prOki6bVnxFVPV">${NEXT_LESSION.name }</h1>
		                    </div>
		                    <p class="description__3cgsIkECuQhOg3L4r5uUTG">${NEXT_LESSION.description }
		                    </p>
		                    <!-- <a data-btn="true" data-testid="cta-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-yellow__yMHS2uJ7H7WrTgbujzcMr large__3uWKqXQr23vJ_9n9mwRvVa button__Zt57SVQQmQdjciVsAfogV" href="">Upgrade to Pro</a> -->
		                    <a data-btn="true" data-testid="cta-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-yellow__yMHS2uJ7H7WrTgbujzcMr large__3uWKqXQr23vJ_9n9mwRvVa button__Zt57SVQQmQdjciVsAfogV" href="<c:url value="/learn/${NEXT_LESSION.syllabus.course.nameAscii}/${NEXT_LESSION.nameAscii}"/>">Bắt đầu ngay</a></div>
		            </div>
		            <button class="screenReaderOnly__1SyakAQGSIs3AM051DW1dt" type="button">Close and return to main application</button>
		        </div>
		    </div>
		</div>
		
        <script>
        $('#next-lession').hide();
        
	        $("#up-next").click(function(e) {
	        	e.preventDefault();
	        	 e.stopPropagation();
	    		$("#next-lession").show();
	    	});
	        
	        $("#content-next-lession").click(function(e) {
	        	e.preventDefault();
	        	 e.stopPropagation();
	    		$("#next-lession").show();
	    	});
	        
	        $(document).click(function() {
	            $('#next-lession').hide("100");
	        });
        </script>
	</c:when>

	<c:when test="${ISTRUE == null || ISTRUE == false }">
		<div class="fcn-nav-wrapper">
            <div class="fcn-nav-wrapper__center fcn-progress-container">
                <button id="back-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-grey__2CLxsMlHUa-nJ9mXIHOdkK outline__1jukYfNsJOsNuah6o7d8HZ" style="min-width: 6rem;" <c:if test="${SELECTED_QUESTION.orderDisplay == 1}">disabled</c:if>><span id="back-text">Trở lại</span><div id="back-spinner" class="fcn-spinner" style="display: none;"></div></button>
                <div class="fnc-nav__exercise-count">${SELECTED_QUESTION.orderDisplay}/${QUESTION_COUNT }</div>
                <button id="next-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-yellow__yMHS2uJ7H7WrTgbujzcMr go__14Lq_GXB8ztJnNGJfxZo0L" style="min-width: 6rem;" disabled>Tiếp tục</button>
            </div>
        </div>
	</c:when>
	<c:otherwise>
		<div class="fcn-nav-wrapper">
            <div class="fcn-nav-wrapper__center fcn-progress-container">
                <button id="back-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-grey__2CLxsMlHUa-nJ9mXIHOdkK outline__1jukYfNsJOsNuah6o7d8HZ" style="min-width: 6rem;" <c:if test="${SELECTED_QUESTION.orderDisplay == 1}">disabled</c:if>><span id="back-text">Trở lại</span><div id="back-spinner" class="fcn-spinner" style="display: none;"></div></button>
                <div class="fnc-nav__exercise-count">${SELECTED_QUESTION.orderDisplay}/${QUESTION_COUNT}</div>
                <button id="next-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-yellow__yMHS2uJ7H7WrTgbujzcMr go__14Lq_GXB8ztJnNGJfxZo0L" style="min-width: 6rem;"><span id="next-text">Tiếp tục</span><div id="next-spinner" class="fcn-spinner" style="display: none;"></div></button>
            </div>
        </div>
        <script>
        $("#next-button").click(function(e) {
        	e.preventDefault();
		    $("#next-text").attr('style', 'display: none;');
		    $("#next-spinner").attr('style', 'display: block;');
		    $("button#next-button").attr('disabled', '');
		    $.ajax({
		        type: "POST",
		        url: "<c:url value="/learn/next" />",
		        data: {
		        	nameAscii: "${SELECTED_QUESTION.lession.syllabus.course.nameAscii}",
		        	nameAscii2: "${SELECTED_QUESTION.lession.nameAscii}",
		        	questionId: ${SELECTED_QUESTION.orderDisplay + 1}
		        },
		        success: function(result) {
		        	reloadAjaxContent3();
				    reloadAjax4();
		        }
		    });
		});
        </script>
	</c:otherwise>
</c:choose>
<c:if test="${SELECTED_QUESTION.orderDisplay != 1}">
<script>
$("#back-button").click(function(e) {
	e.preventDefault();
    $("#back-text").attr('style', 'display: none;');
    $("#back-spinner").attr('style', 'display: block;');
    $("button#back-button").attr('disabled', '');
    $.ajax({
        type: "POST",
        url: "<c:url value="/learn/next" />",
        data: {
        	nameAscii: "${SELECTED_QUESTION.lession.syllabus.course.nameAscii}",
        	nameAscii2: "${SELECTED_QUESTION.lession.nameAscii}",
        	questionId: ${SELECTED_QUESTION.orderDisplay - 1}
        },
        success: function(result) {
        	reloadAjaxContent3();
		    reloadAjax4_2();
        }
    });
});
</script>
</c:if>