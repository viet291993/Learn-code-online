<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fcn-grid" style="cursor: auto;">
		                <div id="discovery-resize-03" class="fcn-slot fcn-slot--no-top-neighbor fcn-slot--no-bottom-neighbor fcn-slot--no-left-neighbor" data-fcn-arrangement="03" style="position: absolute; top: 0%; right: 66.6667%; bottom: 0%; left: 0%;">
		                    <div class="fcn-component enabled">
		                        <div class="overlay"></div>
		                        <div class="container__1Z7pU69YKoxYmpT4T8KGv2">
		                            <div class="header__Ve5FKhy0YGrns6fHSkk3W">
		                                <div class="flex__1yBdRTf7dKVh6F1j8s6UAN align-center__3pP1dhYX-0GkrkR1JBXNzk learn-header"><em id="" class="i__1n_wxJKd0dxJmK7QpTmi97 ikona-learn__MskULcpfDsdM13Z-V16AO headerIcon__3PJznhF504VDDQyiK5lQKy" name="learn"></em>Kiến thức</div>
		                            </div>
	                                <div class="body__2PR9z5i74C175ogXEKU0k8">
	                                    <div class="bodyParentHeading__1m1O75h8NDE_hVVsRNZxHs">${SELECTED_QUESTION.lession.name}</div>
	                                    <h1 class="bodyHeading__2BpaNnfKeJ3alTJNTkzJ94">${SELECTED_QUESTION.title}</h1>
	                                    <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA">
	                                        ${SELECTED_QUESTION.content}
	                                    </div>
	                                </div>
		                            <c:if test="${SELECTED_QUESTION.instructions != null}">
		                            	<div class="header__Ve5FKhy0YGrns6fHSkk3W">
			                                <div class="flex__1yBdRTf7dKVh6F1j8s6UAN align-center__3pP1dhYX-0GkrkR1JBXNzk learn-header"><em class="i__1n_wxJKd0dxJmK7QpTmi97 ikona-instructions__1jJAc700jGA7WBpQP6Okrd headerIcon__3PJznhF504VDDQyiK5lQKy" name="instructions"></em>Các yêu cầu</div>
			                            </div>
			                            <c:forEach items="${SELECTED_QUESTION.instructions}" var="instruction">
		                                	<div class="fcn-checkpoint">
		                                		${instruction.orderDisplay}. ${instruction.content}
		                                	</div>
	                                	</c:forEach>
	                                	<div id="hint" class="hint__s8UXcPBvebZWKmIHL1iLP">
										    <div id="hint-hide">
											    <div tabindex="0" role="button" class="hintHeader__37FqgQufkkRJl73jUwOXHm"><span class="hintHeaderText__1MR48kqXc3rdYpE7fM4M5D">Bạn gặp khó khăn? Xem gợi ý</span>
												    <svg class="toggleArrow__2D6AroyBnTfjYy2VEhFome" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
												        <path d="M20.293 7.293l1.414 1.414L12 18.414 2.293 8.707l1.414-1.414L12 15.586z"></path>
												    </svg>
												</div>
											</div>
										    <div id="hint-display" style="display: none;">
											    <div tabindex="0" role="button" class="hintHeader__37FqgQufkkRJl73jUwOXHm"><span class="hintHeaderText__1MR48kqXc3rdYpE7fM4M5D">Gợi ý cho bạn</span>
											        <svg class="toggleArrow__2D6AroyBnTfjYy2VEhFome toggleArrowOpen__3jSBRFD3ww6Khp-ePDK9ck" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
											            <path d="M20.293 7.293l1.414 1.414L12 18.414 2.293 8.707l1.414-1.414L12 15.586z"></path>
											        </svg>
											    </div>
											    <div class="spacing-tight__YTkj-JgyxXu1yRjOr_AFW markdown__9IJtFiBid4n5zXkbY44GA hintBody__Xlfb7YxNNyRdyb2SB9sb1">
											        <c:forEach items="${SELECTED_QUESTION.instructions}" var="instruction">
											        	${instruction.orderDisplay}. ${instruction.hint}
											        </c:forEach>
											    </div>
										    </div>
										</div>
	                                </c:if>
		                        </div>
		                    </div>
		                </div>
		                <div id="discovery-resize-14" class="fcn-slot fcn-slot--no-top-neighbor fcn-slot--no-bottom-neighbor" data-fcn-arrangement="14" style="position: absolute; top: 0%; right: 33.3333%; bottom: 0%; left: 33.3333%;">
		                    <div class="fcn-component enabled">
		                        <div class="overlay"></div>
		                        <div class="mainContainer__3O-RLBkFmh3eEUCeghKrhE">
		                            <div></div>
		                            <div class="edFToolLayoutContainer__bluSQDfautRGFZdw97pdD">
		                                <div class="fileTool__22Kyh8cEtVVu2McNwH1YT0 fileToolClosed__3u2atJ23DaeXp7m0ZJ8dYu"></div>
		                                <div class="editor layoutCollapsed__3p1JrXw3YdUkz-6Oxzh7JF">
		                                    <div class="fcn-component-header">
		                                        <div class="tabsOffSet__1Qw3ZoAvr9hwatPCHvW8i6">
		                                            <div class="fcn-tabs"><span tabid="0" size="100" overflow="true" class="fcn-tabs__tab fcn-tabs__tab--can-close fcn-button fcn-button--tab fcn-button--tab--active" style="max-width: 200px; width: 100%;"><div style="margin: 0 auto; text-align: center;">${SELECTED_QUESTION.fileName }</div></span>
			                                            <span id="i-expand" class="fcn-tabs__tab fcn-tabs__tab--align-right fcn-button fcn-button--tab fcn-button--tab--inactive fcn-control" data-cue="discovery-fullscreen" overflow="false" align="right">
			                                            	<div class="i-expand"></div>
			                                            </span>
			                                            <span id="i-collapse" class="fcn-tabs__tab fcn-tabs__tab--align-right fcn-button fcn-button--tab fcn-button--tab--inactive fcn-control" data-cue="discovery-fullscreen" overflow="false" align="right" style="display: none;">
			                                            	<div class="i-collapse"></div>
			                                            </span>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="editor-container">
		                                        <div class="editor__tkUjOZxm52udSrxaZUvoy defaults__1l9bk0Z91YqvzRByZKNgHF cc__1zsV8w8Rj_vs2ayVLJ-2x cmeditor__2Gxggo8GsvlSZS4rMGa1zE">
													<textarea id="editor" style="display: none;">${SELECTED_QUESTION.defaultCode}</textarea>
		                                        </div>
		                                    </div>
		                                    <div class="editor-footer-container">
		                                        <div class="fcn-tabs-container">
		                                            <div class="editor-footer__buttons">
		                                                <div class="editorFooter__3vMXEva7_RFPU2uMCO-X_H">
		                                                    <button data-btn="true" id="run-button" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-royalblue__cmhl9gYeQYbhg700HyvAF go__14Lq_GXB8ztJnNGJfxZo0L square__fTcUrfxP7tA0687PS87sH" style="min-width: 80px;"><span id="run-text">Run</span><div id="spinner" class="fcn-spinner" style="display: none;"></div></button>
		                                                    
		                                                    <div class="ResetWorkspaceControl__88z6jsIn6PfE5Pau4k-ll" style="opacity: 1; margin-top: 0px;"><span class="cta__2mjuuxJjh22qJC_GiTMSh7">Reset Exercise</span>
		                                                        <div class="ctaArrow__h5q8WAhe0BF1Ki1ae5bVq"></div><span class="fcn-tabs__tab fcn-button fcn-button--tab fcn-button--tab--inactive fcn-control" style="max-width: 200px;"><em name="reset" class="i__1n_wxJKd0dxJmK7QpTmi97 ikona-reset__6zP8SKTPXuSiJ_cOkhap8"></em></span></div>
		                                                    <div class="copyContentControl__2_nJWm5SAnjrPglBWCDFCU" style="opacity: 1; margin-top: 0px;"><span class="cta__11uZvWt-AkTuaIfgAOUIFu">Copy to Clipboard</span>
		                                                        <div class="ctaArrow__3AaRLFxB4fIS4anpFOkhD7"></div><span class="fcn-tabs__tab fcn-button fcn-button--tab fcn-button--tab--inactive fcn-control" overflow="false" data-testid="copy-content-control" style="max-width: 200px;"><svg width="20" height="20" fill="currentColor" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Copy Icon</title><g id="Artboard" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><path id="Shape-Copy-10" fill="currentColor" fill-rule="nonzero" d="M9.998379,21.9999784 L3.26666667,21.9999784 C2.56710598,21.9999784 2,21.4138784 2,20.6908875 L2,5.30713778 C2,4.58414684 2.56710598,3.99804688 3.26666667,3.99804688 L5.00292969,3.99804688 L5.00292969,1.95534557 C5.00292969,1.71434859 5.19196502,1.51898193 5.42515191,1.51898193 L5.6428079,1.51898193 L5.81309449,1.51898193 C6.04628138,1.51898193 6.23531671,1.32361528 6.23531671,1.0826183 L6.23531671,0.875387397 C6.23531671,0.391924287 6.61453975,3.3759661e-13 7.08233507,3.37507799e-13 L11.7036892,3.37701584e-13 C12.1714846,3.37612773e-13 12.5507076,0.391924287 12.5507076,0.875387397 L12.5507076,1.0826183 C12.5507076,1.32361528 12.7397429,1.51898193 12.9729298,1.51898193 L13.5777778,1.51898193 C13.8109647,1.51898193 14,1.71434859 14,1.95534557 L14,3.99804688 L15.7339742,3.99804687 C16.4335349,3.99804687 17.0006409,4.58414684 17.0006409,5.30713778 L17.0006409,12 L19.995707,12.0140173 C20.999125,12.0140173 21.995707,13.0147497 21.995707,14.0189306 L21.995707,21.8321991 C21.995707,23.037184 21.0497185,24.0140173 19.883784,24.0140173 L12.047671,24 C11.047671,24 9.998379,23.0023499 9.998379,21.9999784 Z M10,14.0048523 C10,13 10.998271,12.0011902 11.998271,12.0011902 L15.9967651,12.0011902 L15.9967651,5 L14,5 C14,5.07353384 14,5.12868422 14,5.16545114 C14,5.20476165 14,5.34251528 14,5.57871205 C14,5.81970903 13.8131869,6.01507568 13.58,6.01507568 L5.41954848,6.01507568 C5.18636159,6.01507568 4.99732626,5.81970903 4.99732626,5.57871205 C4.99732626,5.3354985 4.99732626,5.19248228 4.99732626,5.14966338 C4.99732626,5.11640485 4.99732626,5.06651706 4.99732626,5 L3.00126139,5 L3.00126139,21 L10,21 L10,14.0048523 Z M12.0033722,13.0029602 C11.5058746,13.0029602 11.0033722,13.4975891 11.0033722,14.0043945 L11.0033722,22 C11.0033722,22.5 11.5010529,23.0023499 12.0033722,23.0023499 L19.9968872,23.0023499 C20.4968872,23.0023499 21.0003052,22.4987793 21.0003052,22 L21.0003052,14.0043945 C21.0003052,13.5012817 20.4968872,13.0029602 19.9968872,13.0029602 L12.0033722,13.0029602 Z M16.9967651,17.0003052 L18.4996948,17.0003052 C18.9996948,17.0003052 19.4970703,17.4970703 19.4970703,18.0003052 C19.4970703,18.5050703 18.9994812,18.9970703 18.4996948,18.9970703 L16.9967651,18.9970703 L16.9967651,20.5 C16.9967651,21 16.5,21.4973755 15.9967651,21.4973755 C15.492,21.4973755 15,20.9997864 15,20.5 L15,18.9970703 L13.4996948,18.9970703 C12.9996948,18.9970703 12.4996948,18.4970703 12.4996948,18.0003052 C12.4996948,17.50354 12.9996948,17.0003052 13.4996948,17.0003052 L15,17.0003052 L15,15.5 C15,15 15.5,14.5 15.9967651,14.5 C16.4935303,14.5 16.9967651,15 16.9967651,15.5 L16.9967651,17.0003052 Z"></path></g></svg><span class="copyMessage__1gNCMHDjjjn5QWMgoeBnlE" data-testid="copy-content-control-message"></span></span>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <input type="hidden" id="reloadController" value="<c:url value='/learn/ajax'/>">
		                <div id="discovery-resize-25" class="fcn-slot fcn-slot--no-top-neighbor fcn-slot--no-right-neighbor fcn-slot--no-bottom-neighbor" data-fcn-arrangement="25" style="position: absolute; top: 0%; right: 0%; bottom: 0%; left: 66.6667%;">
		                    <div class="fcn-component enabled">
		                        <div class="overlay"></div>
		                        <div style="height: 100%;">
		                            <div class="fcn-terminal-container">
		                                <div class="fcn-terminal fcn-terminal--active jqconsole ajax-content">
		                                    <c:import url="/Views/Home/Learn/lession_project_ajax_result.jsp" />
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <script>
		            var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
						lineNumbers: true,
						scrollbarStyle: "simple",
						lineWrapping: true,
						matchBrackets: true,
						autoCloseBrackets: true,
						autoCloseTags: true,
						mode: "${SELECTED_QUESTION.lession.syllabus.course.language.codeMirror}"
					  });
					  editor.setOption("theme", "custom");
					  var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
					  CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
					  
					  $("#run-button").click(function(e) {
						    e.preventDefault();
						    $("#run-text").attr('style', 'display: none;');
						    $("#spinner").attr('style', 'display: block;');
						    $("button#run-button").attr('disabled', '');
						    $.ajax({
						        type: "POST",
						        url: "<c:url value="/learn/execute" />",
						        data: {
						        	code: editor.getValue(),
						        	questionId: ${SELECTED_QUESTION.id}
						        },
						        success: function(result) {
						        	reloadAjaxContent();
						        	reloadAjaxContent2();
						        	$("#run-text").attr('style', 'display: block;');
								    $("#spinner").attr('style', 'display: none;');
								    $("button#run-button").removeAttr('disabled')
						        }
						    });
						});
					  
					    $("#hint").click(function(e) {
						    e.preventDefault();
						    if ($("#hint").hasClass("hintOpen__RsbfmDvRC3hFZypEL9yov")) {
						    	$("#hint").removeClass("hintOpen__RsbfmDvRC3hFZypEL9yov");
						    	$("#hint-hide").attr("style", "display: block;");
						    	$("#hint-display").attr("style", "display: none;");
						    } else {
						    	$("#hint").addClass("hintOpen__RsbfmDvRC3hFZypEL9yov");
						    	$("#hint-hide").attr("style", "display: none;");
						    	$("#hint-display").attr("style", "display: block;");
						    }
						});
					    
					    function reloadAjax4() {
				        	$.ajax({
						        type: "POST",
						        url: "<c:url value="/learn/next/ajax2" />",
						        data: {
						        	nameAscii: "${SELECTED_QUESTION.lession.syllabus.course.nameAscii}",
						        	nameAscii2: "${SELECTED_QUESTION.lession.nameAscii}",
						        	questionId: ${SELECTED_QUESTION.orderDisplay + 1}
						        },
						        success: function(result) {
						        	reloadAjaxContent4();
						        }
						    });
				        }
		            </script>
		   <script>
			$("#i-expand").click(function() {
				$("#discovery-resize-03").attr('style', 'position: absolute; top: 0%; right: 95.6667%; bottom: 0%; left: 0%;');
				$("#discovery-resize-14").attr('style', 'position: absolute; top: 0%; right: 4.33333%; bottom: 0%; left: 4.33333%;');
				$("#discovery-resize-25").attr('style', 'position: absolute; top: 0%; right: 0%; bottom: 0%; left: 95.6667%;');
				$("#i-expand").attr('style', 'display: none;');
				$("#i-collapse").removeAttr('style');
			});
			
			$("#i-collapse").click(function() {
				$("#discovery-resize-03").attr('style', 'position: absolute; top: 0%; right: 66.6667%; bottom: 0%; left: 0%;');
				$("#discovery-resize-14").attr('style', 'position: absolute; top: 0%; right: 33.3333%; bottom: 0%; left: 33.3333%;');
				$("#discovery-resize-25").attr('style', 'position: absolute; top: 0%; right: 0%; bottom: 0%; left: 66.6667%;');
				$("#i-collapse").attr('style', 'display: none;');
				$("#i-expand").removeAttr('style');
			});
		</script>