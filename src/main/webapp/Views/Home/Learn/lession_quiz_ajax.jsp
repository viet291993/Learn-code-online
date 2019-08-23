<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="react-root" data-react-class="PlatformRouter">
	    <section data-testid="platform-page" class="platform__2wPufOUWAR_i_cz8ZEknBS">
	        <c:import url="/Views/Home/Learn/lession_quiz_nav.jsp" />
	        <div class="container__2-8VOPaA031ycPslzGbMCq">
	            <div class="container__2ZkNUvVpS2bqFetXuLBHoA assessmentContainer__2c-hykrF8Z4rZtvaI_Rpfr">
	                <div>
	                    <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA darkTheme__LoN8s5sxrbPRCul3yYBYh title__1LSXbz8gGigHcyOZLK-21d">
	                        ${SELECTED_QUESTION.content}
	                    </div><span class="CodeBlock__1F3rKYW3tV11w2KEKvALNg wrap__1LR6hOLkoUYCHqQeJFO6HA defaults__1l9bk0Z91YqvzRByZKNgHF cc__1zsV8w8Rj_vs2ayVLJ-2x undefined codeBlock__3BmC2Ep4l-IJw14DpH9DAF">
	                    <c:if test="${SELECTED_QUESTION.defaultCode != null}">
	                    	<div class="CodeMirror">${SELECTED_QUESTION.defaultCode}</div>
	                    </c:if>
	                </span>
	                <input type="hidden" id="reloadController" value="<c:url value='/learn/quiz2'/>">
					<div class="ajax-content">
	                	<c:import url="/Views/Home/Learn/lession_quiz_answer.jsp" />
	                </div>
	                </div>
	        </div>
	</div>
	<input type="hidden" id="reloadController2" value="<c:url value='/learn/quiz3'/>">
	<div class="ajax-content-2">
		<c:import url="/Views/Home/Learn/lession_quiz_button.jsp" />
	</div>
	
	</section>
	</div>
	<style>
		.CodeMirror {
			overflow: hidden!important;
			padding: 0.5rem 1rem;
		}
		
		.CodeBlock__1F3rKYW3tV11w2KEKvALNg .CodeMirror {
			padding: 5px 16px;
		}
		
		.CodeMirror-scroll {
			overflow: hidden!important;
		}
	</style>
		<script>
		
		$('.CodeMirror').each(function() {
		    
		    var $this = $(this),
		        $code = $this.html(),
		        $unescaped = $('<div/>').html($code).text();
		   
		    $this.empty();
		
		    CodeMirror(this, {
		        value: $unescaped,
		        mode: 'text/x-java',
		        lineNumbers: false,
				lineWrapping: true,
				matchBrackets: true,
				autoCloseBrackets: true,
				autoCloseTags: true,
		        readOnly: true
		    });
			    
		});
		</script>