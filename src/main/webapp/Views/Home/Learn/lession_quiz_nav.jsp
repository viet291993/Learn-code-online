<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="wrapper___FtNJJFPKOjBRYeSq7eqS container__xxmPAuPFUsKguF73jKO3Q">
	<div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 contentWrapper__2MvNFVWRnpySbai8R2WkFr">
	    <div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionLeft__1ZxE4qxswlSZVqzj66Yx4I">
	        <a href="<c:url value="/" />" class="logo__1-a_TiXBS6TEV02nagx3gR"><img alt=" logo" class="image__2CSw5dhd1g0C30kO8pF64Z" src="<c:url value="/Resources/Home/img/logo-white.png" />"></a>
	    </div>
			<div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionCenter__10feYk8tZf2FwdvtmnIfrM centerSection__1R92W4oxyC1LUfW_4FNc67">
			    <div class="container__3M91uhwpGTJe92wMn8jAZq">
			        <div class="label__2xFo_wajxXeT2VlZraCjJC">${SELECTED_QUESTION.orderDisplay}/${COUNT_QUESTION }</div>
			        <div class="barContainer__2UtncDC_qTsINg7-8uZ4HF">
			            <div class="under__3KC2mcSalFKogCqsO-Mk9U"></div>
			            <div class="over__1Z--GbqpV9Vo7ozJC5xI0X" style="width: calc(${SELECTED_QUESTION.orderDisplay} * 100% / ${COUNT_QUESTION});"></div>
			        </div>
			    </div>
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
                  </svg><span class="getHelpText__3lxfUyx0H9F4466aJbTTc6">Trợ giúp</span></button>
          </div>
      </div>
  </nav>