<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld"%>

<c:choose>
	<c:when test="${ISTRUE == null || ISTRUE == false }">
		<div class="fcn-nav-wrapper">
            <div class="fcn-nav-wrapper__center fcn-progress-container">
                <button data-btn="true" disabled="" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-grey__2CLxsMlHUa-nJ9mXIHOdkK outline__1jukYfNsJOsNuah6o7d8HZ" style="min-width: 6rem;">Trở về</button>
                <div class="fnc-nav__exercise-count">1/${QUESTION_COUNT }</div>
                <button data-btn="true" id="discovery-next" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-yellow__yMHS2uJ7H7WrTgbujzcMr go__14Lq_GXB8ztJnNGJfxZo0L" style="min-width: 6rem;" disabled>Tiếp tục</button>
            </div>
        </div>
	</c:when>
	<c:otherwise>
		<div class="fcn-nav-wrapper">
            <div class="fcn-nav-wrapper__center fcn-progress-container">
                <button data-btn="true" disabled="" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-grey__2CLxsMlHUa-nJ9mXIHOdkK outline__1jukYfNsJOsNuah6o7d8HZ" style="min-width: 6rem;">Trở về</button>
                <div class="fnc-nav__exercise-count">1/${QUESTION_COUNT}</div>
                <button data-btn="true" id="discovery-next" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-yellow__yMHS2uJ7H7WrTgbujzcMr go__14Lq_GXB8ztJnNGJfxZo0L" style="min-width: 6rem;">Tiếp tục</button>
            </div>
        </div>
	</c:otherwise>
</c:choose>