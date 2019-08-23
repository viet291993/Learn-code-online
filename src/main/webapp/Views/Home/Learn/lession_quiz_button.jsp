<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${IS_TRUE != null && IS_TRUE == true }">
		<div class="container__36jSDfZIHaBt6OZ7dpxSd8">
		    <div id="quiz-shadow" class="gradient__2bgdYmOM4_blAOC2ImA1lW"></div>
		    <div class="container__2ZkNUvVpS2bqFetXuLBHoA">
		    	<div id="img-gotit" style="opacity: 1; transform: translateY(0%) translateZ(0px); display: none;">
				    <div class="youGotItContainer__2Xp8XstvIMAIyAlI32WBwe" data-testid="check-answer-correct"><img src="<c:url value="/Resources/Home/img/gotit.png" />" class="youGotItImage__1KFUGqLGx1i_s7XE_Kn9bS" /></div>
				</div>
		        <div id="answer" class="checkAnswer__3C7xBIy14T7r2Ayg-nFIAJ" style="z-index: 100;">
		            <button id="check-answer" data-btn="true" data-testid="check-answer-cta" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-blue__34yXHhvi2t651Fi7QF1Zjx block__3MKGyKYuSM5G_QH33nSE7J">Tiếp tục</button>
		        </div>
		    </div>
		</div>
		<script>
			$("#img-gotit").fadeIn("1000");
		</script>
	</c:when>
	
	<c:when test="${IS_TRUE != null && IS_TRUE == false}">
		<div class="container__36jSDfZIHaBt6OZ7dpxSd8">
		    <div id="quiz-shadow" class="gradient__2bgdYmOM4_blAOC2ImA1lW"></div>
		    <div class="container__2ZkNUvVpS2bqFetXuLBHoA">
		    	<c:if test="${SELECTED_QUESTION.description != null}">
		    		<div style="opacity: 1; transform: translateY(0%) translateZ(0px);">
					    <div class="answerFeedback__f1Y4hvKmOc4yK7pc4BPIX" data-testid="check-answer-incorrect">
					        <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA markdownContainer__1wQOy7lHeAaUv9IXHzOlfc">
					            <p>${SELECTED_QUESTION.description }</p>
					        </div>
					    </div>
					</div>
		    	</c:if>
		        <div id="answer" class="checkAnswer__3C7xBIy14T7r2Ayg-nFIAJ" style="z-index: 100;">
		            <button id="check-answer" data-btn="true" data-testid="check-answer-cta" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-blue__34yXHhvi2t651Fi7QF1Zjx block__3MKGyKYuSM5G_QH33nSE7J">Tiếp tục</button>
		        </div>
		    </div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="container__36jSDfZIHaBt6OZ7dpxSd8">
		    <div id="quiz-shadow" class="gradient__2bgdYmOM4_blAOC2ImA1lW" style="display: none;"></div>
		    <div class="container__2ZkNUvVpS2bqFetXuLBHoA">
		        <div id="answer" class="checkAnswer__3C7xBIy14T7r2Ayg-nFIAJ" style="display: none; z-index: 100;">
		            <button id="check-answer" data-btn="true" data-testid="check-answer-cta" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-blue__34yXHhvi2t651Fi7QF1Zjx block__3MKGyKYuSM5G_QH33nSE7J">Kiểm tra</button>
		        </div>
		    </div>
		</div>
		<script>
			$('#check-answer').click(function(e) {
				e.preventDefault();
				var answer;
				$(".answer__10-7SUQvwpIXkWp66wqf_S").each(function(index, value) {
					if ($(this).hasClass('answerSelected__1OCPaURJB2HRb-MRTzg_Uj')) {
						answer = $(this).attr('id');
						return;
					}
				});
				$.ajax({
			        type: "POST",
			        url: "<c:url value="/learn/quiz" />",
			        data: {
			        	answer: answer,
			        	questionId: ${SELECTED_QUESTION.id}
			        },
			        success: function(result) {
			        	reloadAjaxContent();
			        	reloadAjaxContent2();
			        }
			    });
			});
		</script>
	</c:otherwise>
</c:choose>