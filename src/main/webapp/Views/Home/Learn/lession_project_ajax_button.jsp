<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld"%>

<c:choose>
	<c:when test="${ISTRUE == null || ISTRUE == false }">
		<div class="fcn-nav-wrapper">
            <div class="fcn-nav-wrapper__center fcn-progress-container">
                <button data-btn="true" disabled="" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-grey__2CLxsMlHUa-nJ9mXIHOdkK outline__1jukYfNsJOsNuah6o7d8HZ" style="min-width: 6rem;">Trở về</button>
                <div class="fnc-nav__exercise-count">${SELECTED_QUESTION.orderDisplay}/${QUESTION_COUNT }</div>
                <button data-btn="true" id="next-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-yellow__yMHS2uJ7H7WrTgbujzcMr go__14Lq_GXB8ztJnNGJfxZo0L" style="min-width: 6rem;" disabled>Tiếp tục</button>
            </div>
        </div>
	</c:when>
	<c:otherwise>
		<div class="fcn-nav-wrapper">
            <div class="fcn-nav-wrapper__center fcn-progress-container">
                <button data-btn="true" disabled="" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-grey__2CLxsMlHUa-nJ9mXIHOdkK outline__1jukYfNsJOsNuah6o7d8HZ" style="min-width: 6rem;">Trở về</button>
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