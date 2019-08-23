<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
				<header class="container__1mcnsTuVKPm9oryFJotFgJ" data-testid="AppHeader">
	                <nav class="wrapper___FtNJJFPKOjBRYeSq7eqS appBar__129_mhJfJMvqCAAnzWUiOg">
	                    <div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 contentWrapper__2MvNFVWRnpySbai8R2WkFr">
	                        <div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionLeft__1ZxE4qxswlSZVqzj66Yx4I">
	                            <div class="headerList__2cFXAvupVnCAG6idZMcZeQ">
	                                <div>
	                                    <a id="logo" href="<c:url value="/" />" data-testid="header-logo" class="tab__1Vw1A1yuPy-TnRg11IKht logo__1W8ukLXybN8rEWBCNwhgft"><img alt="Codecademy logo" class="image__2CSw5dhd1g0C30kO8pF64Z" src="<c:url value="/Resources/Home/img/logo.png" />"></a>
	                                </div>
	                            </div>
	                            <div class="headerList__2cFXAvupVnCAG6idZMcZeQ showOnDesktop__x7795RqOCp8DJ5csmbNfA">
	                                <div><a id="catalog" href="#" data-testid="header-catalog" class="tab__1Vw1A1yuPy-TnRg11IKht navLink__1vFiVOfSXmydFMhnUFq3wn">Danh mục</a></div>
	                                <div><a href="#" data-testid="header-pricing" id="pricing" class="tab__1Vw1A1yuPy-TnRg11IKht navLink__1vFiVOfSXmydFMhnUFq3wn">Diễn đàn</a></div>
	                            </div>
	                        </div>
	                        <div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionRight__2x_UrYa_JCgcfdfLU2FgeF">
	                            <c:if test="${MEMBER == null }">
	                            	<div class="headerList__2cFXAvupVnCAG6idZMcZeQ showOnDesktop__x7795RqOCp8DJ5csmbNfA">
									    <div>
									        <div id="header-search" class="tab__1Vw1A1yuPy-TnRg11IKht">
									            <button data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-red__QyPlW8b4Oy99ink1-on-u searchButton__2KTNKvMt9TPJiavoQUJujx navIcon__1afXwT9LAGTVR9mbgskuX6" data-testid="header-search">
									                <svg fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
									                    <title>Search Icon</title>
									                    <path d="M9.583 2a7.583 7.583 0 0 1 7.584 7.583 7.601 7.601 0 0 1-1.82 4.935l.315.315h.921l5.834 5.834-1.75 1.75-5.834-5.834v-.921l-.315-.315a7.601 7.601 0 0 1-4.935 1.82A7.583 7.583 0 0 1 9.583 2zm0 2.333a5.228 5.228 0 0 0-5.25 5.25 5.228 5.228 0 0 0 5.25 5.25 5.228 5.228 0 0 0 5.25-5.25 5.228 5.228 0 0 0-5.25-5.25z" fill-rule="nonzero"></path>
									                </svg>
									            </button>
									        </div>
									    </div>
									    <div>
									        <div data-testid="header-avatar" id="header-avatar" class="tab__1Vw1A1yuPy-TnRg11IKht"><a data-btn="true" data-testid="header-sign-up" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-brand-purple__1JTaE-cUSI6K55KDmewKoI" href="<c:url value="/register" />">Đăng ký</a></div>
									    </div>
									</div>
	                            </c:if>
	                            <c:if test="${MEMBER != null }">
	                            	<div class="headerList__2cFXAvupVnCAG6idZMcZeQ showOnDesktop__x7795RqOCp8DJ5csmbNfA">
	                                <div>
									    <div id="pro-button" class="tab__1Vw1A1yuPy-TnRg11IKht">${f:generateHomeHeaderPro(MEMBER,CONTEXTPATH)}</div>
									</div>
	                                <div>
	                                    <div id="header-search" class="tab__1Vw1A1yuPy-TnRg11IKht">
	                                        <button data-btn="true" class="basicBtn btn btn-red searchButton__2KTNKvMt9TPJiavoQUJujx navIcon__1afXwT9LAGTVR9mbgskuX6" data-testid="header-search">
	                                            <svg fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
	                                                <title>Search Icon</title>
	                                                <path d="M9.583 2a7.583 7.583 0 0 1 7.584 7.583 7.601 7.601 0 0 1-1.82 4.935l.315.315h.921l5.834 5.834-1.75 1.75-5.834-5.834v-.921l-.315-.315a7.601 7.601 0 0 1-4.935 1.82A7.583 7.583 0 0 1 9.583 2zm0 2.333a5.228 5.228 0 0 0-5.25 5.25 5.228 5.228 0 0 0 5.25 5.25 5.228 5.228 0 0 0 5.25-5.25 5.228 5.228 0 0 0-5.25-5.25z" fill-rule="nonzero"></path>
	                                            </svg>
	                                        </button>
	                                    </div>
	                                </div>
                                    <div data-testid="header-avatar" id="header-avatar" class="tab__1Vw1A1yuPy-TnRg11IKht">
                                        <div class="wrapper__6QRVYmjk_3YS02hd62vt_">
                                            <button aria-label="my account dropdown toggle" class="toggle__304aSMDrfBOZgFLaPhzXIa" id="dropdown-toggle" type="button">
                                                <div id="button-avatar" class="avatar__Cb1WP643p3tcQpIWLY9R8 round__3de1LBOIa74IvzHDeRG3lQ small__3duTmSpEyR9eEpaRITuulp"><img alt="Avatar" aria-label="my account dropdown toggle" class="image__1Q4r5fS8Aj_N6s2tLcrFks" src="<c:if test="${MEMBER.profileimage == null}"><c:url value="/Resources/Home/img/guest.png" /></c:if><c:if test="${MEMBER.profileimage != null}">${MEMBER.profileimage}</c:if>"></div>
                                            </button>
                                        </div>
                                    </div>
	                            </div>
	                            </c:if>
	                            <div class="headerList__2cFXAvupVnCAG6idZMcZeQ showOnMobile__1OZznV0-PypUlpSlqeVOCi">
	                                <div id="open-menu-mobile">
	                                    <div id="menu" class="tab__1Vw1A1yuPy-TnRg11IKht">
	                                        <button data-btn="true" aria-label="Open settings menu" class="basicBtn btn btn-brand-dark-blue__h_687J3IEb4D21JPTffU8 navIcon__1afXwT9LAGTVR9mbgskuX6 mobileMenuIcon__2iU10MZCuDwrFoyvSKibBV" data-testid="header-mobile-menu">
	                                            <svg fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
	                                                <g fill-rule="nonzero">
	                                                    <path d="M20 11v2H4v-2zM20 17v2H4v-2zM20 5v2H4V5z"></path>
	                                                </g>
	                                            </svg>
	                                        </button>
	                                    </div>
	                                </div>
	                                <!-- Open menu mobile -->
	                                <div id="close-menu-mobile" style="display: none;">
	                                    <div id="menu" class="tab__1Vw1A1yuPy-TnRg11IKht">
	                                        <button data-btn="true" aria-label="Close settings menu" class="basicBtn btn btn-brand-dark-blue__h_687J3IEb4D21JPTffU8 navIcon__1afXwT9LAGTVR9mbgskuX6 mobileMenuIcon__2iU10MZCuDwrFoyvSKibBV" data-testid="header-mobile-menu">
	                                            <svg fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
	                                                <g fill-rule="nonzero">
	                                                    <path d="M19.778 18.364l-1.414 1.414L4.222 5.636l1.414-1.414z"></path>
	                                                    <path d="M5.636 19.778l-1.414-1.414L18.364 4.222l1.414 1.414z"></path>
	                                                </g>
	                                            </svg>
	                                        </button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </nav>
	                <!-- search bar -->
	                <div id="nav-search" style="display: none;">
	                    <div class="overlay__1Wk02wgKl7SENAt371z0FX"></div>
	                    <div class="container__38BpIAxFZ3rVoKFb_13KUV" id="header-search-dropdown">
	                        <div class="queryContainer__2lPrjDQUYqIgZnC7PaKvPL">
	                            <div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 displayHorizontal__56YzIjP3xMbhwvlrNyW1Z">
	                                <svg class="searchIcon__1FtnD6BvZJ56M-J25cGt2" height="48" width="48" fill="currentColor" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	                                    <title>Search Icon</title>
	                                    <path d="M9.583 2a7.583 7.583 0 0 1 7.584 7.583 7.601 7.601 0 0 1-1.82 4.935l.315.315h.921l5.834 5.834-1.75 1.75-5.834-5.834v-.921l-.315-.315a7.601 7.601 0 0 1-4.935 1.82A7.583 7.583 0 0 1 9.583 2zm0 2.333a5.228 5.228 0 0 0-5.25 5.25 5.228 5.228 0 0 0 5.25 5.25 5.228 5.228 0 0 0 5.25-5.25 5.228 5.228 0 0 0-5.25-5.25z" fill-rule="nonzero"></path>
	                                </svg>
	                                <form class="search__1g5v3pS8JlxNKblyJTjXlN" id="search-form" action="<c:url value="/search" />">
	                                    <input name="keyword" type="search" id="header-search-bar" placeholder="<c:forEach items='${LIST_KEYWORD}' var='KEY'>${KEY.name},</c:forEach>..." class="input__ELDaJDCKd6A2DOpNV6mXM" value="${param.keyword==null?'':param.keyword}">
	                                </form>
	                            </div>
	                        </div>
	                        <div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 suggestionContainer__3mXYg3ZgQo0ZQC9YNUDUnk">
	                            <h5>Phổ biến</h5>
	                            <div class="displayHorizontal__56YzIjP3xMbhwvlrNyW1Z suggestionList__1zEpAuJU_ZN5M_qDRqFj28">
	                            	<c:forEach items='${LIST_KEYWORD}' var='KEY'>
	                                	<button data-btn="true" class="basicBtn btn btn-blue__34yXHhvi2t651Fi7QF1Zjx flat__Gbu0EzdU2yQr9B87Peh09">${KEY.name}</button>
	                                </c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <!-- nav bar mobile -->
	                <div id="nav-mobile" style="display: none;">
	                    <div class="container__2YnVg5mpmDXWM_E3-WEgYe" data-testid="header-mobile-menu-dropdown">
	                        <div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4">
	                            <form class="search__1WlJdD2sw-W7HprzUcWCgr" id="search-form" action="/search">
	                                <input name="query" type="search" placeholder="e.g. Python, Data Science, Javascript" aria-label="search" class="input__1fjGoWDWXp5xvsIzFrRso8" value="">
	                                <button data-btn="true" class="basicBtn searchIcon__30b9MtXj09nYMcY7HxyN8j">
	                                    <svg fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
	                                        <title>Search Icon</title>
	                                        <path d="M9.583 2a7.583 7.583 0 0 1 7.584 7.583 7.601 7.601 0 0 1-1.82 4.935l.315.315h.921l5.834 5.834-1.75 1.75-5.834-5.834v-.921l-.315-.315a7.601 7.601 0 0 1-4.935 1.82A7.583 7.583 0 0 1 9.583 2zm0 2.333a5.228 5.228 0 0 0-5.25 5.25 5.228 5.228 0 0 0 5.25 5.25 5.228 5.228 0 0 0 5.25-5.25 5.228 5.228 0 0 0-5.25-5.25z" fill-rule="nonzero"></path>
	                                    </svg>
	                                </button>
	                            </form>
	                            <div class="headerList__10S3eaI5d9_EMEWGPR9cIo">
	                                <div><a id="catalog" href="# data-testid="header-catalog" class="tab__1Vw1A1yuPy-TnRg11IKht navLink__1vFiVOfSXmydFMhnUFq3wn">Danh mục</a></div>
	                                <div><a href="#" data-testid="header-pricing" id="pricing" class="tab__1Vw1A1yuPy-TnRg11IKht navLink__1vFiVOfSXmydFMhnUFq3wn">Giá cả</a></div>
	                                <div>
	                                    <button data-btn="true" class="basicBtn dropDown__2-ccs0vt2m_kB3Lma6LG25 navLink__3gwBQdmDpuPvlVr4s7Z4cN" data-testid="userdropdown-button"><c:if test="${MEMBER.name != null }">${MEMBER.name }</c:if><c:if test="${MEMBER.name == null }">Cài đặt cá nhân</c:if>
	                                    </button>
	                                    <div class="userOptionsContainer__30GA4HQNF4iP0uVJ8EuE80" data-testid="user-options-container">
										    <div class="userOptionsLink__324nKW_gSCbjnKsLQusE6v"><a href="#">Hồ sơ của bạn</a></div>
										    <div class="userOptionsLink__324nKW_gSCbjnKsLQusE6v"><a data-testid="edit-account-link" href="<c:url value='/account'/>">Cài đặt tài khoản</a></div>
										    <div class="userOptionsLink__324nKW_gSCbjnKsLQusE6v"><a data-testid="help-link" href="#">Help</a></div>
										    <div class="userOptionsLink__324nKW_gSCbjnKsLQusE6v"><a data-testid="sign-out-link" href="<c:url value="/logout" />">Đăng xuất</a></div>
										</div>
	                                </div>
	                                <div class="navButtonContainer__1WVLA7lgxd4hQgcu55Ef5e">
	                                    <div>
	                                        <div id="mobile-pro-button" class="tab__1Vw1A1yuPy-TnRg11IKht"><a data-btn="true" data-testid="upgrade-link" data-cxlid="upgrade-link" target="_self" rel="noopener noreferrer" class="basicBtn btn btn-brand-purple__1JTaE-cUSI6K55KDmewKoI block__3MKGyKYuSM5G_QH33nSE7J outline__1jukYfNsJOsNuah6o7d8HZ" href="">Upgrade to Pro</a></div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </header>
	            <div id="menu-profile" style="display: none;" class="overlay__3LeDG7tuQrrJdjPm8agkmx fixed__1dVANA0vWS60mCGpsRBU8T type-transparent__19iohvkXZv5eOsVMRAvvLQ">
				    <div id="profile-position" align="right" offset="20" class="content__fQv0JV6LGGkYLrzWHtg7t popover__2vSb5RYj187vezgJCHUZI1 below-right__XT76WV7zCz6PFSFnddn2A" style="top: 74px; z-index: 50;;">
				        <div>
				            <div class="" style="opacity: 1;">
				                <div class="shadow__3DzEF2DlOL8n2FXGHNWRBW">
				                    <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD menu__e94OfrzcqoePgW_YvhDCp">
				                        <nav>
				                            <div><a class="menuItem__1XAsFXFqLByEK4sD6lx3za no-underline" href="/profiles/me">Hồ sơ của tôi</a><a data-testid="edit-account-link" class="menuItem__1XAsFXFqLByEK4sD6lx3za no-underline" href="<c:url value='/account'/>" id="edit-account-link">Cài đặt tài khoản</a><a data-testid="help-link" class="menuItem__1XAsFXFqLByEK4sD6lx3za no-underline" href="/help" id="help-link">Help</a><a data-testid="sign-out-link" class="menuItem__1XAsFXFqLByEK4sD6lx3za no-underline" href="<c:url value="/logout" />" id="sign-out-link">Đăng xuất</a></div>
				                        </nav>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>