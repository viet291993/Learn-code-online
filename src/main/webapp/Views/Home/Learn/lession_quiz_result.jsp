<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="react-root" data-react-class="PlatformRouter">
<nav class="wrapper___FtNJJFPKOjBRYeSq7eqS container__xxmPAuPFUsKguF73jKO3Q">
	<div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 contentWrapper__2MvNFVWRnpySbai8R2WkFr">
	    <div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionLeft__1ZxE4qxswlSZVqzj66Yx4I">
	        <a href="<c:url value="/" />" class="logo__1-a_TiXBS6TEV02nagx3gR"><img alt=" logo" class="image__2CSw5dhd1g0C30kO8pF64Z" src="<c:url value="/Resources/Home/img/logo-white.png" />"></a>
	    </div>
			<div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionCenter__10feYk8tZf2FwdvtmnIfrM centerSection__1R92W4oxyC1LUfW_4FNc67">
			    <div class="">
			        <div style="color: white; font-weight: bold;">${SELECTED_COURSE.name}</div>
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
    <section data-testid="platform-page" class="platform__2wPufOUWAR_i_cz8ZEknBS">
        <div class="container__1j_Jh3oHry524iTMO2t7QE">
            <div class="container__2ZkNUvVpS2bqFetXuLBHoA">
                <div class="container__2bhRIK2RY9nDogMq3bvB4i">
                    <h2 class="title__2O09iAwbPeXf_Tfxr0UmQr">Điểm trắc nghiệm</h2>
                    <div class="scorecardContainer__1brwwXVZR01B-hrH1i0rc5">
                        <div>
                            <h2 class="quizScorePercent__3t6wLWK9TMLzNjXyP_JK-5 passingPercent__V7y51TiNcHvsG2ovpH-Jj">${RIGHT * 100 / (WRONG + RIGHT)}%</h2>
                            <p class="message__3zkQwRWZ127FnZrcmaishc">
                            	<c:if test="${RIGHT * 100 / (WRONG + RIGHT) < 50}">
                            		Thử lại nhé?
                            	</c:if>
                            	<c:if test="${RIGHT * 100 / (WRONG + RIGHT) >= 50 && RIGHT * 100 / (WRONG + RIGHT) < 66}">
                            		Cố gắng hơn nữa nhé!
                            	</c:if>
                            	<c:if test="${RIGHT * 100 / (WRONG + RIGHT) >= 66 && RIGHT * 100 / (WRONG + RIGHT) < 80}">
                            		Không tồi đâu!
                            	</c:if>
                            	<c:if test="${RIGHT * 100 / (WRONG + RIGHT) >= 80 && RIGHT * 100 / (WRONG + RIGHT) < 90}">
                            		👏 Bạn làm rất tốt!
                            	</c:if>
                            	<c:if test="${RIGHT * 100 / (WRONG + RIGHT) >= 90}">
                            		👏 Xuất sắc!
                            	</c:if>
                            </p>
                        </div>
                        <div class="totalsContainer__3dHgxs3regZxH1YlsP8kah">
                            <div class="total__1D8sWRquvzpoR4JFVsBYPu">
                                <svg color="#fd4d3f" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                                    <g fill-rule="nonzero">
                                        <path d="M19.778 18.364l-1.414 1.414L4.222 5.636l1.414-1.414z"></path>
                                        <path d="M5.636 19.778l-1.414-1.414L18.364 4.222l1.414 1.414z"></path>
                                    </g>
                                </svg>${WRONG}</div>
                            <div class="total__1D8sWRquvzpoR4JFVsBYPu">
                                <svg color="#4fe0b0" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                                    <title>Checkmark Icon</title>
                                    <path d="m18 2-12 12-5.5-5.5 1.41-1.41 4.09 4.08 10.59-10.58z" transform="translate(3 5)"></path>
                                </svg>${RIGHT}</div>
                        </div>
                    </div>
                    <a href="<c:url value="/learn/${SELECTED_COURSE.nameAscii}/${NEXT_LESSION.nameAscii}"/>" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-brand-purple__1JTaE-cUSI6K55KDmewKoI block__3MKGyKYuSM5G_QH33nSE7J primaryButton__29LGbAZXqDFidsDic8nnfW">Bài tiếp theo</a>
                    <a href="<c:url value="/learn/resetlession/${SELECTED_LESSION.id}"/>" data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-white__1e0kCCItRnEi-EDNpmLuX1 block__3MKGyKYuSM5G_QH33nSE7J outline__1jukYfNsJOsNuah6o7d8HZ">Làm lại</a>
                </div>
            </div>
        </div>
        <div class="leTrialBanner__3VOkodnhfWeF-L5t7tA6KV">
            <div class="leTrialBannerRelative__3mIq5_XeADd_mE-8hSnMet"></div>
        </div>
    </section>
</div>