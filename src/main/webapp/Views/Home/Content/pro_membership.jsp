<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
 <div class="react-root " data-react-class="PortalRouter ">
    <div class="container__1agAdRZ7zVD3XliDBHs3go " id="checkout-page " role="main ">
        <div class="sidebar__2LoNjNzV1ypLL2GBNXG3R7 ">
            <div>
                <div class="sidebar__6G5cpniHXzGZ_G2zTmW7v pro__1EyaaUx1pn2sNVJ-T1tujK " role="presentation ">
                    <a class="backButton__3BOjdvnCpd20WbftAp2odt " data-testid="back-button " href="<c:url value='/' />">
                        <svg fill="currentColor " height="24 " version="1.1 " viewBox="0 0 24 24 " width="24 " xmlns="http://www.w3.org/2000/svg ">
                            <title>Chevron Left Icon</title>
                            <path d="M9.475 12.06l7.293 7.294-1.414 1.414-8.708-8.707 8.708-8.707 1.414 1.414z "></path>
                        </svg>Quay lại</a>
                    <div class="sidebarBackground__1qQUgM0iCV5KQPTmjeMC1p " data-flip-id="background " data-flip-config="{&quot;translate&quot;:true,&quot;scale&quot;:true,&quot;opacity&quot;:true} "></div>
                    <div class="decorativeImg__3fBJR5EQwTapwhIipylpIJ " style="background-image:url(<c:url value="/Resources/Home/img/ProMemberShip.png" />)" data-flip-id="img " data-flip-config="{&quot;translate&quot;:true,&quot;scale&quot;:true,&quot;opacity&quot;:true} "></div>
                    <div class="sidebarBody__3lRxxwfU7nWWHTykOBcqa5 ">
                        <h1 class="header__3fo9X_6rg7zglV-sIq7tZp " data-flip-id="header " data-flip-config="{&quot;translate&quot;:true,&quot;scale&quot;:true,&quot;opacity&quot;:true} ">Học viên PRO</h1>
                        <div class="sidebarContent__nVWahzj_jajgo6oetwF6u ">
                            <p class="proDescription__rs5S6hzoX1h4uKzewaKmh ">Truy cập vào các câu đố, dự án độc quyền và các giáo trình học tập tùy chỉnh.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main__26HF2SfacjO-YdzQ6Co8Wy mainAfterSidebar__2JLnbTPYFjZ0TYz7TLMOj0 ">
            <div class="mainContents__47jvpWQNHET4cuQNNs-Hg ">
                <div class=" ">
                    <div class=" ">
                     <form action="<c:url value="/promembership" />"  method="POST">
                        <div class="hideProPlanCards__3e9CNd1Q3oLfQuviCQLfrr ">
                            <div class="proPlans__26xVQtGeVvaGG5gqKXFS51 " data-cxlid="pro-plan-cards " data-testid="pro-plan-cards ">
                                <div class="planCardContainer__2vmGJ10_tMDm4s6kH0d9K2 " data-testid="plan-card-container-proAnnualV3 ">
                                    <input type="hidden" name="idMember" value="${MEMBER.id}">
                                    <button ${f:generateLablePro(MEMBER)!='Đăng ký'?'disabled':''}  data-testid="plan-card-proAnnualV3 " class="container__3Kv9eq9Gzw_RFdNE-IqS4F " type="button ">
                                        <div class="shell__1vPVBkwGbqEYx_R1DkguFu hoverShadow__2P3Dk0LBqbAZba0DPjm8Xx borderedContainer__1bcYaRXYdsBqvmaDQGcw21 ">
                                            <div class="standardPadding__2Qfs_mGV0Kt7Y3sHTOhHtm planCardBody__32FtVH50OuLyZvNTbg1pAk ">
                                                <div class="popularity__H2IRL3EbQ61qjrj3-eGxb ">
                                                    <div data-testid="popular-badge " data-cxlid="popular-badge " class="popular__33tHM4AaCOPEZzy6dvZX56 "></div>
                                                </div>
                                                <p class="billedText__2Ywb8t5dLJFtyMrWZ3_1F4 " data-testid="number-of-months-12 ">Dùng thử PRO</p>
                                                <label class="monthlyPriceLabel__bJdm9eW8aZLothsLa0N62 " for="radio-Annual "><span class="monthlyPrice__HJjkIWE002cCLTrHqsTpN ">Miễn phí</span><span class="monthlyPriceMonth__1ZMKS2Exl34jTyPSjaOc_l "></span></label>
                                                <p class="planValue__2Q7_9HhOV3l7q132-TrtJs ">7 ngày</p>
                                            </div>
                                           <div class="footer__3rruRkoHu6_MZa6mWCoIH3 flex__2jEGvw8lcaMEiExXdXxqqU transparentTopBorder__wSH4-_S65KgjsRP9IZ9_c leftAlign__1-UL_RgPmyVb0vX2l_CaoE standardPadding__3MvtxRV20cSmQro_IljAVb standardHeight__1BgWkWM2PXh4enV-GhxhZz footer__1KW_XMO3rkJA0lDJS0qF8V " style="background-color: ${f:generateLablePro(MEMBER)!='Đăng ký'?'gray':'#3069f0'}; color: white; font-weight: bold;cursor: pointer;">
                                                <div >
                                                    <div>
                                                        <label style="cursor: pointer;">${f:generateLablePro(MEMBER)}</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </button></div>
                                <div class="planCardContainer__2vmGJ10_tMDm4s6kH0d9K2 " data-testid="plan-card-container-proSixMonthV1 ">
                                    <button disabled data-testid="plan-card-proSixMonthV1 " class="container__3Kv9eq9Gzw_RFdNE-IqS4F " type="button ">
                                        <div class="shell__1vPVBkwGbqEYx_R1DkguFu hoverShadow__2P3Dk0LBqbAZba0DPjm8Xx borderedContainer__1bcYaRXYdsBqvmaDQGcw21 ">
                                            <div class="standardPadding__2Qfs_mGV0Kt7Y3sHTOhHtm planCardBody__32FtVH50OuLyZvNTbg1pAk ">
                                                <div class="popularity__H2IRL3EbQ61qjrj3-eGxb "></div>
                                                <p class="billedText__2Ywb8t5dLJFtyMrWZ3_1F4 " data-testid="number-of-months-6 ">PRO 1</p>
                                                <label class="monthlyPriceLabel__bJdm9eW8aZLothsLa0N62 " for="radio-6 Months "><span class="monthlyPrice__HJjkIWE002cCLTrHqsTpN ">20.000 </span><span class="monthlyPriceMonth__1ZMKS2Exl34jTyPSjaOc_l ">vnd</span></label>
                                                <p class="planValue__2Q7_9HhOV3l7q132-TrtJs ">1 tháng</p>
                                            </div>
                                            <div class="footer__3rruRkoHu6_MZa6mWCoIH3 flex__2jEGvw8lcaMEiExXdXxqqU transparentTopBorder__wSH4-_S65KgjsRP9IZ9_c leftAlign__1-UL_RgPmyVb0vX2l_CaoE standardPadding__3MvtxRV20cSmQro_IljAVb standardHeight__1BgWkWM2PXh4enV-GhxhZz footer__1KW_XMO3rkJA0lDJS0qF8V " style="background-color: gray; color: white; font-weight: bold;cursor: pointer;">
                                                <div >
                                                    <div>
                                                        <label style="cursor: pointer;">Đăng ký</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </button><span class="planSavingsLabel__3IioEbqV7aBz1ha9-8htHr " data-testid="plan-savings-label-proSixMonthV1 ">Sắp ra mắt</span></div>
                                <div class="planCardContainer__2vmGJ10_tMDm4s6kH0d9K2 " data-testid="plan-card-container-proV2b ">
                                    <button disabled data-testid="plan-card-proV2b " class="container__3Kv9eq9Gzw_RFdNE-IqS4F containerActive__gotiL7xxQzwAhf-vLoj-0 " type="button ">
                                        <div class="shell__1vPVBkwGbqEYx_R1DkguFu hoverShadow__2P3Dk0LBqbAZba0DPjm8Xx borderedContainer__1bcYaRXYdsBqvmaDQGcw21 ">
                                            <div class="standardPadding__2Qfs_mGV0Kt7Y3sHTOhHtm planCardBody__32FtVH50OuLyZvNTbg1pAk ">
                                                <div class="popularity__H2IRL3EbQ61qjrj3-eGxb "></div>
                                                <p class="billedText__2Ywb8t5dLJFtyMrWZ3_1F4 " data-testid="number-of-months-1 ">PRO 6</p>
                                                <label class="monthlyPriceLabel__bJdm9eW8aZLothsLa0N62 " for="radio-Monthly "><span class="monthlyPrice__HJjkIWE002cCLTrHqsTpN ">100.000 </span><span class="monthlyPriceMonth__1ZMKS2Exl34jTyPSjaOc_l ">vnd</span></label>
                                                <p class="planValue__2Q7_9HhOV3l7q132-TrtJs ">6 tháng</p>
                                            </div>
                                            <div class="footer__3rruRkoHu6_MZa6mWCoIH3 flex__2jEGvw8lcaMEiExXdXxqqU transparentTopBorder__wSH4-_S65KgjsRP9IZ9_c leftAlign__1-UL_RgPmyVb0vX2l_CaoE standardPadding__3MvtxRV20cSmQro_IljAVb standardHeight__1BgWkWM2PXh4enV-GhxhZz footer__1KW_XMO3rkJA0lDJS0qF8V " style="background-color: gray; color: white; font-weight: bold;cursor: pointer;">
                                                <div >
                                                    <div>
                                                        <label style="cursor: pointer;">Đăng ký</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </button><span class="planSavingsLabel__3IioEbqV7aBz1ha9-8htHr " data-testid="plan-savings-label-proSixMonthV1 ">Sắp ra mắt</span></div>
                                </div>
                            </div></form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
${Alert}
<% request.getSession().removeAttribute("Alert"); %>