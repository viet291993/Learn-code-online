<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <div data-testid="course-landing-page" id="course-landing-page">
            <header class="header__24U-03TosybsS_ZhgIhsYj" style="background-color:#2daaa6">
                <h1>${SELECTED_COURSE.name }</h1>
                <p data-testid="header-course-description">${SELECTED_COURSE.description }</p><a data-btn="true" aria-label="Start Course" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-brand-yellow__31ZfgMUoWJYXQdeJ8yGfRp large__3uWKqXQr23vJ_9n9mwRvVa round__1_1AZP9jaqNLqK0tnoeljL courseResumeButton__1Lkbl-B6WWX_GzxTFOWkhe" href="https://www.codecademy.com/courses/learn-java/projects/planting-a-tree">Start</a>
                <div class="resetProgress__3FYBz5-A5jzIDQnJg31RYl">
                    <div>
                        <div>
                            <button data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-red__QyPlW8b4Oy99ink1-on-u resetProgressLinkResumeCard__24LOR1KVm4RlFF39QuWSGw resetProgressLinkResumeCard__24LOR1KVm4RlFF39QuWSGw">
                                <svg class="resetIconResumeCard__fEBiHC4FnHYTPDVggvd2e" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                                    <title>Reset Icon</title>
                                    <path d="M5.338 10.91A6.752 6.752 0 0 1 12 5.25c1.868 0 3.533.776 4.748 2.003l-3.623 3.622H21V3l-2.644 2.644A8.953 8.953 0 0 0 12 3c-4.621 0-8.488 3.426-9 7.91m15.724 2.265a6.752 6.752 0 0 1-6.648 5.575c-1.867 0-3.532-.776-4.747-2.003l3.622-3.622H3.076V21l2.644-2.644A8.953 8.953 0 0 0 12.076 21 9.002 9.002 0 0 0 21 13.177"></path>
                                </svg>Bắt đầu lại</button>
                        </div>
                    </div>
                </div><img class="courseIllustration__3nG5af2j-TXTOqx3dn-FqW" alt="" src="./learn-java_files/f02953df130afa2970368518512a7c17.svg">
                <div class="headerBottom__1eUZ5-QpIM5ar-aH5au1U6"></div>
            </header>
            <main>
                <div>
                    <div class="tabList__2cRbpLztk3CK7jPnclKGXX tabList__2v-8dufmBsPqOtclVbG65p" role="tablist">
                        <div class="tabListItem__2NrccqVnkbz44Qdf6e4xyP tab__3LdM-pM3qninJC4JLyRICk" role="tab"><a style="cursor: pointer;" id="open-tab1" class="tab__3sX2dLC4TWp-hBQdDG1EgM" tabindex="0">Tổng quan</a></div>
                        <div class="tabListItem__2NrccqVnkbz44Qdf6e4xyP tab__3LdM-pM3qninJC4JLyRICk" role="tab"><a style="cursor: pointer;" id="open-tab2" class="tab__3sX2dLC4TWp-hBQdDG1EgM active__3cSws4ldJeInwIv08Jzasn activeTab__QnOp-brFz8ywOpyUhQZrG" tabindex="0">Giáo trình</a></div>
                    </div>
                    <div id="tab1" aria-labelledby="09600917875963011-0" role="tabpanel" style="display: none;">
                        <div>
                            <section class="overview__2OQdNuDXcNUf8E7S23Z9P_">
                                <div class="overviewWrapper__1JqlocP92xaRJzLLGge2cZ">
                                    <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA" style="padding: 50px;">${SELECTED_COURSE.content }</div>
                                </div>
                                <aside class="infoBox__1yWJoYd9Y14dLx01BziXjl">
                                    <p>Có<span class="peopleCount__1OuKnXcUo3OQgMPVaOZciT">69</span>người đã tham gia vào khóa học này</p>
                                    <div>
                                        <dl class="timeToComplete__1tcjB1aeG_L46ty_L6-_yR"><dt>Thời gian hoàn thành</dt>
                                            <dd>${SELECTED_COURSE.timeToComplete }</dd>
                                        </dl>
                                        <dl class="prerequisites__ZBCzxqHt6r8qvOyMHobb2"><dt>Điều kiện yêu cầu</dt>
                                            <dd>
                                            <c:choose>
                                            	<c:when test="${SELECTED_COURSE.prerequisite != null }">${SELECTED_COURSE.prerequisite}</c:when>
                                            	<c:otherwise>Không</c:otherwise>
                                            </c:choose>
                                            </dd>
                                        </dl>
                                    </div>
                                </aside>
                            </section>
                        </div>
                    </div>
                    <div id="tab2" aria-labelledby="07576024032441087-1" role="tabpanel" style="display:block">
                        <div class="syllabusPanel__fDIOofnbLoAnncmKBJneT">
                            <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD">
                                <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD expanded__1VmApvvGZVaQse7iZanRGs unit__3RntiOH92_C2Qz3AFIp9QP">
                                <!-- syllabus & lession -->
                                <c:forEach items="${SELECTED_COURSE.syllabuses}" var="syllabus" varStatus="status">
	                                    <button id="lession-${status.index + 1}" type="button" aria-label="Expand content" event="click" class="asButton__2u5u6yOsjyO99GaSdsS57u">
	                                        <div class="flex__1yBdRTf7dKVh6F1j8s6UAN row__12sg7l47Z-L70Kq32xNRKN align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY unitHeader__1yXffLbR_sV4mwToocJ8Xy">
	                                            <div class="flex__1yBdRTf7dKVh6F1j8s6UAN fld__1lkEljAOUEzoBVQlPgKCJS fls-0__2hUsBtoXJhMGVKLwE3QgdU align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY unitIndex__OWfiBC_oDCvQw6uLMqmuw">${status.index + 1}</div>
	                                            <div class="flex__1yBdRTf7dKVh6F1j8s6UAN fld__1lkEljAOUEzoBVQlPgKCJS flg-1__2QlG6XML9yB21LiA8VvVGD fls-1__Gdu1tuqfmON3ow5GWhqwh col__DIiQrF0Z1S7t-hWOmyXlD justify-center__NtC5FX5Z0p2mFDtXTk_mY unitName__1bz3SLz8wptF6ohnryfiuL">
	                                                <div class="noWrap__2HJBWz6VT42GH46vZrVrJ7">${syllabus.name}</div>
	                                            </div>
	                                            <div class="flex__1yBdRTf7dKVh6F1j8s6UAN align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY accordionToggle__1bkA7_yKB7yx8ZO8Ro31z4"><img id="lession-img-${status.index + 1}" src="<c:url value="/Resources/Home/img/arrow-down.png" />"></div>
	                                        </div>
	                                    </button>
	                                    <div id="lession-detail-${status.index + 1}" style="display: none;">
	                                		<c:forEach items="${syllabus.lessions}" var="lession" varStatus="statusLession">
		                                        <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD syllabusUnit__10EUlvRO8oRDLfREo981BY">
		                                            <div class="">
		                                                <div data-testid="content-item-lesson">
		                                                    <a class="noUnderline__1SC6_eVwcicCvkuSVbHlDb link__2aU7OvXJmLyj20kEMPY18r" href="<c:url value="/learn/${SELECTED_COURSE.nameAscii}/${lession.nameAscii}" />" event="click">
		                                                        <div class="flex__1yBdRTf7dKVh6F1j8s6UAN row__12sg7l47Z-L70Kq32xNRKN align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY contentListItem__3XlHMY6-cpoNhB9a64yI3o" title="Hello World">
		                                                            <div class="flex__1yBdRTf7dKVh6F1j8s6UAN fld__1lkEljAOUEzoBVQlPgKCJS flg-0__1I1lefM6nHriAFrjkgeffs fls-0__2hUsBtoXJhMGVKLwE3QgdU align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY nextContainer__3Gt_cIMxZOJot0nwwtXtUA"></div>
		                                                            <div class="flex__1yBdRTf7dKVh6F1j8s6UAN fld__1lkEljAOUEzoBVQlPgKCJS flg-0__1I1lefM6nHriAFrjkgeffs fls-0__2hUsBtoXJhMGVKLwE3QgdU align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY container__2fm_JH_BgwPPv53QI1LeT_">
		                                                                <div class="
		                                                                <c:if test="${statusLession.last}">
		                                                                	up__a7VljbOGTzfSGlKlhuufW
		                                                                </c:if>
		                                                                <c:if test="${not statusLession.last}">
		                                                                	both__3SYyjWPkbsFxo-pO2ALEDs
		                                                                </c:if>
		                                                                
		                                                                 connector__1jtIxzXAys-m2BJuyOdf-Q"></div>
		                                                                <div class="flex__1yBdRTf7dKVh6F1j8s6UAN align-center__3pP1dhYX-0GkrkR1JBXNzk justify-center__NtC5FX5Z0p2mFDtXTk_mY icon__1wdclztRIZxK0s8ZfPk-H5"><em name="editor" class="i__1n_wxJKd0dxJmK7QpTmi97 ikona-editor__1xvxxW8zm9GJMFZv5SCgPd"></em></div>
		                                                            </div>
		                                                            <div class="fld__1lkEljAOUEzoBVQlPgKCJS flg-0__1I1lefM6nHriAFrjkgeffs fls-1__Gdu1tuqfmON3ow5GWhqwh title__x95mVsb3MaTbet73DiRPf">${lession.name}</div>
		                                                            <div class="fld__1lkEljAOUEzoBVQlPgKCJS flg-1__2QlG6XML9yB21LiA8VvVGD fls-0__2hUsBtoXJhMGVKLwE3QgdU shortDescription__3HWv-l9SjQqtl9_doL3BH_">${lession.lessionType.name}</div>
		                                                        </div>
		                                                    </a>
		                                                </div>             
		                                            </div>
		                                        </div>
											</c:forEach>
										</div>
								</c:forEach>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <div class="courseResume__1wY7WQdQEbjdupYt_Q3aGN" style="background-color:#2daaa6"><a data-btn="true" aria-label="Start Course" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-brand-yellow__31ZfgMUoWJYXQdeJ8yGfRp large__3uWKqXQr23vJ_9n9mwRvVa round__1_1AZP9jaqNLqK0tnoeljL courseResumeButton__1Lkbl-B6WWX_GzxTFOWkhe" href="https://www.codecademy.com/courses/learn-java/projects/planting-a-tree">Start</a></div>
        </div>
        <script>
        	<c:forEach items="${SELECTED_COURSE.syllabuses}" varStatus="status">
	        	$("#lession-${status.index + 1}").click(function(e) {
		            e.preventDefault();
		            e.stopPropagation();
		            if ($('#lession-detail-${status.index + 1}').is(":visible") === false) {
		                $('#lession-detail-${status.index + 1}').show("100");
		                $("#lession-img-${status.index + 1}").attr('src', '<c:url value="/Resources/Home/img/arrow-up.png"/>');
		            } else {
		                $('#lession-detail-${status.index + 1}').hide("100");
		                $("#lession-img-${status.index + 1}").attr('src', '<c:url value="/Resources/Home/img/arrow-down.png"/>');
		            }
		        });
        	</c:forEach>
        	$('#lession-detail-1').show("100");
        	$("#lession-img-1").attr('src', '<c:url value="/Resources/Home/img/arrow-up.png"/>');
        	$('#open-tab1').click(function(e) {
    	            e.preventDefault();
    	            e.stopPropagation();
    	            $('#tab1').show('100');
    	            $('#tab2').hide('100');
    	            $('#open-tab1').attr('class', 'tab__3sX2dLC4TWp-hBQdDG1EgM active__3cSws4ldJeInwIv08Jzasn activeTab__QnOp-brFz8ywOpyUhQZrG');
    	            $('#open-tab2').attr('class', 'tab__3sX2dLC4TWp-hBQdDG1EgM');
            	});
            	$('#open-tab2').click(function(e) {
       	            e.preventDefault();
       	            e.stopPropagation();
       	            $('#tab2').show('100');
       	            $('#tab1').hide('100');
       	        	$('#open-tab2').attr('class', 'tab__3sX2dLC4TWp-hBQdDG1EgM active__3cSws4ldJeInwIv08Jzasn activeTab__QnOp-brFz8ywOpyUhQZrG');
 	            	$('#open-tab1').attr('class', 'tab__3sX2dLC4TWp-hBQdDG1EgM');
                });
	    </script>