<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Learn</title>
<%@include file="/Views/Home/Import/codemirror_js.jsp" %>
<body>
	<!-- header -->
	<section class="platform">
		<div class="francine">
			<header class="headerCompact">
				<nav class="wrapper dark">
					<div class="contentContainerWide contentContainer contentWrapper">
						<!-- menu -->
						<div class="section sectionLeft">
							<div class="headerList">
								<div class="headerListItem">
									<a href="/" class="logo"> <img class="image" src="" />
									</a>
								</div>
							</div>
						</div>
						<div class="section sectionCenter">
							<a class="headerTitle headerTitleLink"> Learn Java </a>
						</div>
						<div class="section sectionRight">
							<div class="headerList">
								<div class="headerListItem"></div>
							</div>
						</div>
					</div>
				</nav>
			</header>
			<!-- content -->
			<div class="fcn-grid" style="cursor: auto;">
				<div id="selection-left"
					class="fcn-slot fcn-slot--no-top-neighbor fcn-slot--no-bottom-neighbor fcn-slot--no-left-neighbor"
					style="position: absolute; top: 0%; right: 66.6667%; bottom: 0%; left: 0%;">
					<div class="fcn-component enable">
						<div class="overlay"></div>
						<div class="container">
							<div class="header-content">
								<div class="flex align-center learn-header">Learn</div>
							</div>
							<div class="body">
								<div class="bodyParentHeading">
									<!-- Lession name -->
									Hello World
								</div>
								<h1 class="bodyHeading">
									<!-- Lession title -->
									Hello Java File!
								</h1>
								<div class="spacing-tight">
									${SELECTED_QUESTION.instruction}</div>
							</div>
						</div>
					</div>
				</div>
				<div id="selection-center"
					class="fcn-slot fcn-slot--no-top-neighbor fcn-slot--no-bottom-neighbor"
					style="position: absolute; top: 0%; right: 33.3333%; bottom: 0%; left: 33.3333%;">
					<div class="fcn-component enable">
						<div class="overlay"></div>
						<div class="mainContainer">
							<div class="edFToolLayoutContainer">
								<div class="editor layoutCollapsed noNavigator">
									<div class="fcn-component-header">
										<div class="tabsOffSet">
											<div class="fcn-tabs">
												<span tabid="0" size="100" overflow="true"
													class="fcn-tabs__tab fcn-button fcn-button--tab fcn-button--tab--active"
													style="max-width: 200px; width: 100%;">HelloYou.java</span>
												<span id="i-expand"
													class="fcn-tabs__tab fcn-tabs__tab--align-right fcn-button fcn-button--tab fcn-button--tab--inactive fcn-control fcn-max-width"
													align="right">
													<div class="i-expand"></div>
												</span> <span id="i-collapse"
													class="fcn-tabs__tab fcn-tabs__tab--align-right fcn-button fcn-button--tab fcn-button--tab--inactive fcn-control fcn-max-width"
													align="right" style="display: none;">
													<div class="i-collapse"></div>
												</span>
											</div>
										</div>
									</div>
									<div class="editor-container">
										<div class="editor cmeditor">
											<textarea id="editor" style="display: none;">${SELECTED_QUESTION.defaultCode}</textarea>
										</div>
									</div>
									<div class="editor-footer-container">
										<div class="fcn-tabs-container">
											<div class="editor-footer__buttons">
												<div class="editorFooter">
													<a class="basicBtn btn btn-royalblue square" id="run">Run</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" id="reloadController"
					value="<c:url value='/learn/ajax'/>">
				<div class="ajax-content">
					<c:import url="/Views/Home/Learn/lession_project_ajax.jsp" />
				</div>
			</div>
			<nav class="wrapper footer">
				<div class="contentContainerWide contentContainer contentWrapper">
					<!--
						<div class="section sectionLeft">
							<div class="tab">
								<button type="button" title="Hello world" class="button"><span class="burger"></span><span class="exerciseTitle">Hello world</span></button>
							</div>
						</div>
						-->
					<div class="section sectionCenter">
						<div class="fcn-nav-wrapper">
							<div class="fcn-nav-wrapper__center fcn-progress-container">
								<button data-btn="true" class="basicBtn btn btn-grey outline"
									style="min-width: 6rem;">Back</button>
								<div class="fnc-nav__exercise-count">1/1</div>
								<button data-btn="true" id="discovery-next" disabled=""
									class="basicBtn btn btn-yellow" style="min-width: 6rem;">Next</button>
							</div>
						</div>
					</div>
					<!--
						<div class="section sectionRight">
							<button data-btn="true" class="basicBtn btn btn-white flat helpButton" style="min-width: 6rem;"></button>
						</div>
						-->
				</div>
			</nav>
		</div>
	</section>
	<script>
			$("#i-expand").click(function() {
				$("#selection-left").attr('style', 'position: absolute; top: 0%; right: 95.6667%; bottom: 0%; left: 0%;');
				$("#selection-center").attr('style', 'position: absolute; top: 0%; right: 4.33333%; bottom: 0%; left: 4.33333%;');
				$("#selection-right").attr('style', 'position: absolute; top: 0%; right: 0%; bottom: 0%; left: 95.6667%;');
				$("#i-expand").attr('style', 'display: none;');
				$("#i-collapse").removeAttr('style');
			});
			
			$("#i-collapse").click(function() {
				$("#selection-left").attr('style', 'position: absolute; top: 0%; right: 66.6667%; bottom: 0%; left: 0%;');
				$("#selection-center").attr('style', 'position: absolute; top: 0%; right: 33.3333%; bottom: 0%; left: 33.3333%;');
				$("#selection-right").attr('style', 'position: absolute; top: 0%; right: 0%; bottom: 0%; left: 66.6667%;');
				$("#i-collapse").attr('style', 'display: none;');
				$("#i-expand").removeAttr('style');
			});
		</script>
	<script>
		  var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
			lineNumbers: true,
			scrollbarStyle: "simple",
			lineWrapping: true,
			matchBrackets: true,
			autoCloseBrackets: true,
			autoCloseTags: true,
			mode: "text/x-java"
		  });
		  editor.setOption("theme", "custom");
		  var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
		  CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
		  /* editor.getDoc().setValue(''); */
		  
		  $("#run").click(function(e) {
			    e.preventDefault();
			    $.ajax({
			        type: "POST",
			        url: "<c:url value="/learn/execute" />",
			        data: { 
			        	code: editor.getDoc().getValue()
			        },
			        success: function(result) {
			        	reloadAjaxContent();
			        }
			    });
			});
		</script>
</body>
</html>