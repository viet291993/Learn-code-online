<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${IS_TRUE != null && IS_TRUE == true }">
		<c:forEach items="${LIST_QUIZ}" var="quiz" varStatus="status">
         	<div id="${quiz.id}" class="answer__10-7SUQvwpIXkWp66wqf_S <c:if test="${quiz.isTrue}">correct__31olAPDSEUokD9R7dsahWi</c:if>">
              <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA darkTheme__LoN8s5sxrbPRCul3yYBYh">
                  <p>${quiz.answer}</p>
              </div>
          </div>
         </c:forEach>
	</c:when>
	
	<c:when test="${IS_TRUE != null && IS_TRUE == false }">
		<c:forEach items="${LIST_QUIZ}" var="quiz" varStatus="status">
         	<div id="${quiz.id}" class="answer__10-7SUQvwpIXkWp66wqf_S <c:if test="${quiz.isTrue}">correctNotSelected__29UjEBVd1V9GKHPIdld45v</c:if> <c:if test="${quiz.id == ANSWER_ID}">incorrect__2l8o8zx18QQoWtVEyhnKuM</c:if>">
              <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA darkTheme__LoN8s5sxrbPRCul3yYBYh">
                  <p>${quiz.answer }</p>
              </div>
          </div>
         </c:forEach>
	</c:when>
	
	<c:otherwise>
		<c:forEach items="${LIST_QUIZ}" var="quiz" varStatus="status">
        	<button id="${quiz.id}" class="answer__10-7SUQvwpIXkWp66wqf_S" data-testid="multiple-choice-answer-0" type="button">
             <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA darkTheme__LoN8s5sxrbPRCul3yYBYh">
                 <p>${quiz.answer }</p>
             </div>
         </button>
        </c:forEach>
        <script>
		$('.answer__10-7SUQvwpIXkWp66wqf_S').click(function(e) {
			e.preventDefault();
			$("#quiz-shadow").show("1000");
			var answer = $(this).attr('id');
			$("#answer").fadeIn('5000');
			$(".answer__10-7SUQvwpIXkWp66wqf_S").each(function(index, value) {
				if (answer == $(this).attr('id'))
					$(this).addClass('answerSelected__1OCPaURJB2HRb-MRTzg_Uj');
				else
					$(this).removeClass('answerSelected__1OCPaURJB2HRb-MRTzg_Uj');
			});
		});
		</script>
	</c:otherwise>
</c:choose>