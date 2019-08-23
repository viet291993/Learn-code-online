<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>

<div class="trial__2RBesTd3jHUCAOvgDI_n0M" role="banner">
	                <div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 container__15JcyFgxNtPEUg-viGwSY1 containerThin__3lklrutWDbul9IP7I0vy7q"><img class="backgroundImage__TBbhjtxjEmHDh8RfRPCWc" src="<c:url value="/Resources/Home/shared/css/15148e611c2a8cec71f0e9200d95affb.svg " />" alt="">
	                    <div class="leftSection__3BOSRF7synzPjaKCVnoi2l">
	                        <div class="profileContainer__35xtuel1_bG0PI9TVgAYGl">
	                            <div class="avatarContainer__1kp-4fjZlS-NX4vrB_Ydtk"><img class="avatarImage__1CPb8XZ3IHWdJ-JtT5_uqJ" src="<c:if test="${MEMBER.profileimage == null}"><c:url value="/Resources/Home/img/guest.png" /></c:if><c:if test="${MEMBER.profileimage != null}">${MEMBER.profileimage}</c:if>" alt="avatar"></div>
	                            <div class="userDetailsContainer__ZQKAngqGJvAfFiP17BVRo">
	                                <div class="usernameContainer__3v4c5LW-wE2MT8wndddkRh">
	                                    <h1 class="username__2XadxoeCL3__ps0TM7GI6k">${MEMBER.name}</h1><a data-btn="true" class="basicBtn btn btn-white__1e0kCCItRnEi-EDNpmLuX1 outline__1jukYfNsJOsNuah6o7d8HZ fit-text__1GvxCv4KPqP6bG2s0Ub63x editButton__1MFirzSrrM2a3_2XgEQHne" href="#/account">Cài đặt</a></div>
	                                <div data-testid="role-label">${f:generateHomePro(MEMBER)}</div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="rightSection__1hrOF-xcqlakKFmPB2z2rm">
	                        <div class="container__3K9CG0eN2YbNbdhc2MKYKj">
	                            <div class="count__15egunoru_dNyrewQyvICt">0</div>
	                            <div class="label__3moTm67Xk2WBdab2gHzrA5">Badges</div>
	                        </div>
	                        <div class="container__3K9CG0eN2YbNbdhc2MKYKj">
	                            <div class="count__15egunoru_dNyrewQyvICt">2</div>
	                            <div class="label__3moTm67Xk2WBdab2gHzrA5">Courses</div>
	                        </div>
	                    </div>
	                </div>
	            </div>

<div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 container__1KTCjgjEAbO9nDPibOc8E2" role="main">
<div id="07036602234789517-0-panel" aria-labelledby="07036602234789517-0" role="tabpanel" style="display:block">
	                        <div class="container__2RMTkGzEKsFyUsjdRKT2cR">
	                            <!-- trial -->
	                            <%-- <div>
	                                <a href="#/subscriptions/proAnnualV3/checkout?redirect_url=%2Flearn" data-testid="pro-trial-banner-notification" event="click" class="noUnderline__1SC6_eVwcicCvkuSVbHlDb">
	                                    <div class="shell__1vPVBkwGbqEYx_R1DkguFu hoverShadow__2P3Dk0LBqbAZba0DPjm8Xx trialBannerCardShell__1OyWEdaBCjxPzUXrzfLeRS">
	                                        <div class="standardPadding__2Qfs_mGV0Kt7Y3sHTOhHtm trialBannerContainer__1KqMO2s1Jf3CamhulVbzi-">
	                                            <div class="bannerBodyContainer__3oq8W9WXy21mNcUKWtUNUB">
	                                                <div class="bannerProContainer__1g3NOfe3bs7ZPt1wA5i-0z">
	                                                    <div class="bannerPro__3usjVgiipXw5V-SnKdhoN4"><img src="<c:url value="/Resources/Home/shared/css/1f60b39aa9413ecb85bd8ccbc8ccdef5.svg" />" class="bannerProImage__2HCRozbbFGizFzIKIw6uAV" alt="pro-logo"></div>
	                                                    <h4 class="bannerBodyTitle__27iV9gl9TaO5YjU2JVTDG1">Trial Notification</h4></div>
	                                                <div class="bannerBodySubtext__HyyLflnAFajk_h8T5MUR_">
	                                                    <p class="bannerBodyMain__3eNZq3FB3CVik4mpWEAFyw">Enjoy unlimited learning, practice materials and other premium features for 1 day.</p>
	                                                    <button data-btn="true" class="basicBtn bannerUpgradeText__3yN_F8pHqqJpe1_pZGpLLU">Upgrade To Pro</button>
	                                                </div>
	                                            </div>
	                                            <div>
	                                                <div class="daysLeftTriangle__2lU1MoKpb9wiQu_j0oXcZc"></div>
	                                                <div class="daysLeftCircle__22yPaDkv1x8QIKeidfVffv daysLeftCircleRed__3h8WTODv_IxWHUw-B0tqA-">
	                                                    <div class="daysLeftContent__2N0kjxhIsid958qPZRm4nT"><span class="daysLeftNumber__2yienwnWsnvv2Zi7MHWE3i">1</span><span class="daysLeftText__22wTE5z-i8e8_2Fkd-oH6q">day</span></div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </a>
	                            </div> --%>
	                                <div class="cardGrid__1pe2Xh2sLfIUCt_IryGkOm">
	                                    <div class="container__1LHkLcTMPAPmlQ86aliTpo">
	                                        <h2 class="label__1c-NhKMh11N-kMbi6bWMj7">Học tiếp nào</h2>
	                                        <div class="cardContainer__26G4CmQ3G7JvV7A3JdpDhW">
	                                            <div class="container__cuX97vmKHPeJOlFDN-Nj"><a class="titleAnchor__1sxr029PzvMHeg2pU4Q9ll" href="#/learn/learn-java"><h3 class="title__adLVN1BiJBwVFyBElQmGh">Lập trình Java</h3></a>
	                                                <div class="progressContainer__1DM3sxy-Sm7QOzDKiNa9pN">
	                                                    <svg viewBox="0 0 100 100" height="70" width="70" class="progress__1oXtqEwJLTsJtxSgw7SSkH">
	                                                        <circle cx="50" cy="50" r="40" stroke="currentColor" stroke-width="8" fill="none" opacity=".2"></circle>
	                                                        <circle cx="50" cy="50" r="40" stroke="currentColor" stroke-width="8" stroke-linecap="square" fill="none" opacity="1" stroke-dashoffset="130" stroke-dasharray="260" transform="rotate(-90 50 50)">
	                                                            <animate attributeType="CSS" attributeName="stroke-dashoffset" from="260" to="130" dur="1000ms" begin="0" fill="freeze"></animate>
	                                                        </circle>
	                                                    </svg>
	                                                    <div style="opacity: 1; transform: scale(1);">
	                                                        <h5 class="percent__2HwVpZXXWDIqvAjFPjSsvH">3%</h5></div>
	                                                </div>
	                                            </div>
	                                            <div class="container__3uvfzXC_bGGy2-h_LXN9kY">
	                                                <div class="subContainer__12Cpjp6sRfmWo2hxMU_C5k">
	                                                    <p class="truncateText__2fwfP8IDm0cgbiVQ6wTOQl">Bài học hiện tại <strong>Hello World</strong></p>
	                                                </div>
	                                                <div class="contentListWrapper__7snu_FXVZ7ZPkG78U0Tkw">
	                                                    <div class="contentListContainer__2-QsDDArqAhec2CUp3QOha">
	                                                        <li class="container__2QurwX46lLbI1SbXhka4QN" style="opacity: 1; transform: none;">
	                                                            <div class="iconContainer__3SvjzyfVuhdn8Mnzr9zGQ7 completedIcon__35SynwXIWZqWmlAmNggxIr">
	                                                                <svg class="" width="20" height="20" fill="currentColor" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	                                                                    <title>Checkmark Icon</title>
	                                                                    <path d="m18 2-12 12-5.5-5.5 1.41-1.41 4.09 4.08 10.59-10.58z" transform="translate(3 5)"></path>
	                                                                </svg>
	                                                            </div>
	                                                            <div class="type__2Ur2qNLTi9ODBD0inE0Gee">Câu hỏi</div>
	                                                            <div class="title__1signZCcPI-V8yQkVyXQ0U"><a href="#/courses/learn-java/quizzes/java-hello-world-quiz">Hello World</a></div>
	                                                        </li>
	                                                        <li class="container__2QurwX46lLbI1SbXhka4QN" style="opacity: 1; transform: none;">
	                                                            <div class="iconContainer__3SvjzyfVuhdn8Mnzr9zGQ7 activeIcon__3KyvCTzrYtqTGAx45hwT_J">
	                                                                <svg class="" width="20" height="20" fill="currentColor" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	                                                                    <title>Project Icon</title>
	                                                                    <path d="M18.857 11.571h-1.286V8.143c0-.952-.771-1.714-1.714-1.714H12.43V5.143a2.143 2.143 0 1 0-4.286 0v1.286H4.714C3.768 6.429 3 7.196 3 8.143V11.4h1.286A2.305 2.305 0 0 1 6.6 13.714a2.305 2.305 0 0 1-2.314 2.315H3v3.257C3 20.232 3.768 21 4.714 21h3.257v-1.286a2.305 2.305 0 0 1 2.315-2.314 2.305 2.305 0 0 1 2.314 2.314V21h3.257c.947 0 1.714-.768 1.714-1.714v-3.429h1.286a2.143 2.143 0 0 0 0-4.286z"></path>
	                                                                </svg>
	                                                            </div>
	                                                            <div class="type__2Ur2qNLTi9ODBD0inE0Gee activeText__ADKyAngSMTI8Cr7gXp0Ru">Dự án</div>
	                                                            <div class="title__1signZCcPI-V8yQkVyXQ0U activeText__ADKyAngSMTI8Cr7gXp0Ru"><a href="/hello-world">Vẽ hình</a></div>
	                                                        </li>
	                                                        <li class="container__2QurwX46lLbI1SbXhka4QN" style="opacity: 1; transform: none;">
	                                                            <div class="iconContainer__3SvjzyfVuhdn8Mnzr9zGQ7">
	                                                                <svg class="" width="20" height="20" fill="currentColor" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	                                                                    <title>Article Icon</title>
	                                                                    <path d="M19 11.111H4.778V8.444H19v2.667zm0 3.556h-6.222v-1.778H19v1.778zm0 3.555h-6.222v-1.778H19v1.778zm-8 0H4.778V12.89H11v5.333zm8.293-12.738L17.818 4l-1.485 1.484L14.85 4l-1.476 1.484L11.89 4l-1.485 1.484L8.93 4 7.444 5.484 5.96 4 4.484 5.484 3 4v14.222C3 19.204 3.796 20 4.778 20H19c.982 0 1.778-.796 1.778-1.778V4l-1.485 1.484z"></path>
	                                                                </svg>
	                                                            </div>
	                                                            <div class="type__2Ur2qNLTi9ODBD0inE0Gee">Lý thuyết</div>
	                                                            <div class="title__1signZCcPI-V8yQkVyXQ0U"><a href="#/courses/learn-java/articles/what-is-an-ide">IDE là gì?</a></div>
	                                                        </li>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="container__3bWnETqaVFvjw-gQ9IcZi3"><a data-btn="true" class="basicBtn button__1s6zPiTEPT2vvONVqVYFba basicLink__1ntEiXSqZV9fADVnrfvmjQ" data-testid="today-resume-button" href="/hello-world">Tiếp tục <svg class="icon__1H1ClqSZH9JXzbQTCxIIdj" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><title>Right Arrow Icon</title><path d="M4 10.92v2h12l-5.5 5.5 1.42 1.42 7.92-7.92L11.92 4 10.5 5.42l5.5 5.5z" fill-rule="nonzero"></path></svg></a></div>
	                                        </div>
	                                    </div>
	                                    <div class="container__20DrPJXdoseDV5hCjyPwHO" data-testid="today-practice-section">
	                                        <h2 class="label__3eDLytrC7Ylx-hcRZfTv-s">Hoạt động</h2>
	                                        <div class="cardContainer__2n67EWpTUTquTEcCxn0bUd">
	                                            <div class="loadingScreen__3yUAEe-lsM9O2c2_D1dKqM stretchToFit__Us5OiSwaGebVHetgkWzPg" style="background-color: rgb(246, 245, 250); transition: opacity 0.8s ease 0s; opacity: 0;"></div>
	                                            <div class="container__3WfaTuJpjs265I3XE5Hkx0">
	                                                <div class="iconContainer__1huLydFulnyIItZvWzNtJ"><img class="iconBorder__3gx5YL3clBB1xpQaVPlhHf" src="<c:url value="/Resources/Home/shared/css/deb9fc9722a23edaab8f0980488dc2cf.svg " />" alt=""><img class="icon__2yqIf9CbfiTGlrmlyD9Pi-" src="<c:url value="/Resources/Home/shared/css/10f07203df52e619aaa431cf052af80f.svg " />" alt=""></div>
	                                                <div class="message__3IlHtB6aEGvgkSLa4lunAI">Không có hoạt động nào!</div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div>
	                                    <div>
	                                        <h2>Khóa học liên quan</h2>
	                                        <div class="cardGrid__1pe2Xh2sLfIUCt_IryGkOm">
	                                            <c:forEach items="${LIST_COURSE}" var="course">
	                                                <div>
	                                                    <a class="noUnderline__1SC6_eVwcicCvkuSVbHlDb link__3qb000I3BZ43VIlDObrTbq" href="<c:url value="/learn/${course.nameAscii} " />" target="_self" event="click">
	                                                        <div class="shell__1vPVBkwGbqEYx_R1DkguFu hoverShadow__2P3Dk0LBqbAZba0DPjm8Xx linkCard__4venWtriq9uPfCP8cd46M">
	                                                            <div class="topBar__1BKtJvUlSBtAlIv7gZoNkL" style="background-color: rgb(44, 156, 152);"></div>
	                                                            <div class="iconContainer__UD4fUMEicO1MkvAhy0i5X" data-testid="link-card-icon" style="background-color: rgb(44, 156, 152);">
	                                                                <svg class="icon__3e3mQH0mR0MEC9yNtAc2C3" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
	                                                                    <title>Path Icon</title>
	                                                                    <g fill="none" fill-rule="evenodd">
	                                                                        <path stroke="currentColor" d="M5 21h7v-6M12 9V3h7"></path>
	                                                                        <circle stroke="currentColor" stroke-width="2" cx="12" cy="12" r="2"></circle>
	                                                                        <circle stroke="currentColor" stroke-width="2" cx="3" cy="21" r="2"></circle>
	                                                                        <circle stroke="currentColor" stroke-width="2" cx="21" cy="3" r="2"></circle>
	                                                                    </g>
	                                                                </svg>
	                                                            </div>
	                                                            <div class="standardPadding__2Qfs_mGV0Kt7Y3sHTOhHtm">
	                                                                <h3 class="title__say7kMV63S0yON588nZ-9" data-testid="link-card-title">${course.name}</h3><span class="description__1FrnasXF0xZFa1dr5w0vJ4" data-testid="link-card-description">${course.description}</span></div>
	                                                        </div>
	                                                    </a>
	                                                </div>
	                                            </c:forEach>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div>
	                                    <h2>Cộng đồng<span class="atSymbol__1ose5TrdBiDccbvuoCBCmf"></span></h2>
	                                    <div class="cardGrid__1pe2Xh2sLfIUCt_IryGkOm">
	                                        <div class="container__T7_ulay5K9GrttnMEMvUZ"><img src="<c:url value="/Resources/Home/img/youtube-icon.svg " />" class="socialMediaIcon__3bhPN6cdz-jGxs7Wftkd8W" alt="">
	                                            <div>
	                                                <div>
	                                                    <h5 class="title__ALUVeosZQKUBmbN0W5zXC">Kênh YouTube</h5>
	                                                    <p class="description__1V0R1gkmyhRS6i8PCyQ0Q">Những video sẽ giúp bạn học lập trình dễ dàng hơn</p>
	                                                </div><a class="noUnderline__1SC6_eVwcicCvkuSVbHlDb linkWrapper__1BKx4Tx8Z4YwQc8vCkwkO-" href="#/pro/community" target="_self" event="click"><span class="linkText__yYmD2aPevO6tl0RpLyK3g">Learn More</span></a></div>
	                                        </div>
	                                        <div class="container__T7_ulay5K9GrttnMEMvUZ"><img src="<c:url value="/Resources/Home/img/facebook-logo.svg " />" class="socialMediaIcon__3bhPN6cdz-jGxs7Wftkd8W" alt="">
	                                            <div>
	                                                <div>
	                                                    <h5 class="title__ALUVeosZQKUBmbN0W5zXC">Nhóm Facebook</h5>
	                                                    <p class="description__1V0R1gkmyhRS6i8PCyQ0Q">Bạn đang tìm kiếm những gì liên quan đến lập trình trên Facebook?</p>
	                                                </div><a class="noUnderline__1SC6_eVwcicCvkuSVbHlDb linkWrapper__1BKx4Tx8Z4YwQc8vCkwkO-" href="https://codecademy.com/users/redirect?redirect_url=https://www.facebook.com/groups/codecademy.community" target="_blank" event="click"><span class="linkText__yYmD2aPevO6tl0RpLyK3g">Tham gia nhóm Facebook</span><svg fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><title>NewPageIcon</title><path d="M13.778 4v1.778h3.19l-8.737 8.738 1.253 1.253 8.738-8.738v3.191H20V4h-6.222zm4.444 14.222H5.778V5.778H12V4H5.778C4.79 4 4 4.8 4 5.778v12.444C4 19.204 4.796 20 5.778 20h12.444c.982 0 1.778-.796 1.778-1.778V12h-1.778v6.222z" fill-rule="nonzero"></path></svg></a></div>
	                                        </div>
	                                        <div class="container__T7_ulay5K9GrttnMEMvUZ"><img src="<c:url value="/Resources/Home/img/forums_icon.svg " />" class="socialMediaIcon__3bhPN6cdz-jGxs7Wftkd8W" alt="">
	                                            <div>
	                                                <div>
	                                                    <h5 class="title__ALUVeosZQKUBmbN0W5zXC">Diễn đàn</h5>
	                                                    <p class="description__1V0R1gkmyhRS6i8PCyQ0Q">Bạn muốn đặt câu hỏi hoặc cần được sự giúp đỡ?</p>
	                                                </div><a class="noUnderline__1SC6_eVwcicCvkuSVbHlDb linkWrapper__1BKx4Tx8Z4YwQc8vCkwkO-" href="https://codecademy.com/users/redirect?redirect_url=https://discuss.codecademy.com/" target="_blank" event="click"><span class="linkText__yYmD2aPevO6tl0RpLyK3g">Đi tới trang diễn đàn</span><svg fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><title>NewPageIcon</title><path d="M13.778 4v1.778h3.19l-8.737 8.738 1.253 1.253 8.738-8.738v3.191H20V4h-6.222zm4.444 14.222H5.778V5.778H12V4H5.778C4.79 4 4 4.8 4 5.778v12.444C4 19.204 4.796 20 5.778 20h12.444c.982 0 1.778-.796 1.778-1.778V12h-1.778v6.222z" fill-rule="nonzero"></path></svg></a></div>
	                                        </div>
	                                    </div>
	                                    <div class="wavyCornerContainer__XpjBtNvkkVZS8kyWtf6IV"><img src="<c:url value="/Resources/Home/shared/css/90d63673b558515ce0c336a20bb7a13e.svg " />" class="wavyCorner__1P71HdtDSpVUl7X4rIWMCC" alt=""></div>
	                                    <div class="circleCornerContainer__1UIzywg1yPiDwfuIgUhFR9"><img src="<c:url value="/Resources/Home/shared/css/2fba351442482f266aa5dd2058a0ac7e.svg " />" class="circleCorner__3tQH4r0XL4V7jIkJxsfzw2" alt=""></div>
	                                </div>
	                        </div>
	                    </div>
	                </div>