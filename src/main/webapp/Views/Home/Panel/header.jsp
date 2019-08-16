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
	                                <div><a id="catalog" href="#/catalog/subject/all" data-testid="header-catalog" class="tab__1Vw1A1yuPy-TnRg11IKht navLink__1vFiVOfSXmydFMhnUFq3wn">Danh mục</a></div>
	                                <div><a href="#/pro/membership" data-testid="header-pricing" id="pricing" class="tab__1Vw1A1yuPy-TnRg11IKht navLink__1vFiVOfSXmydFMhnUFq3wn">Diễn đàn</a></div>
	                            </div>
	                        </div>
	                        <div class="section__3D8Pj6VoF7z2B78gHIMkm6 sectionRight__2x_UrYa_JCgcfdfLU2FgeF">
	                            <div class="headerList__2cFXAvupVnCAG6idZMcZeQ showOnDesktop__x7795RqOCp8DJ5csmbNfA">
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
	                                <form class="search__1g5v3pS8JlxNKblyJTjXlN" id="search-form" action="file:///C:/search">
	                                    <input name="query" type="search" id="header-search-bar" placeholder="e.g. Python, Data Science, JavaScript" class="input__ELDaJDCKd6A2DOpNV6mXM" value="">
	                                </form>
	                            </div>
	                        </div>
	                        <div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4 suggestionContainer__3mXYg3ZgQo0ZQC9YNUDUnk">
	                            <h5>Popular Searches</h5>
	                            <div class="displayHorizontal__56YzIjP3xMbhwvlrNyW1Z suggestionList__1zEpAuJU_ZN5M_qDRqFj28">
	                                <button data-btn="true" class="basicBtn btn btn-blue__34yXHhvi2t651Fi7QF1Zjx flat__Gbu0EzdU2yQr9B87Peh09">Data Science</button>
	                                <button data-btn="true" class="basicBtn btn btn-blue__34yXHhvi2t651Fi7QF1Zjx flat__Gbu0EzdU2yQr9B87Peh09">Python</button>
	                                <button data-btn="true" class="basicBtn btn btn-blue__34yXHhvi2t651Fi7QF1Zjx flat__Gbu0EzdU2yQr9B87Peh09">Web Development</button>
	                                <button data-btn="true" class="basicBtn btn btn-blue__34yXHhvi2t651Fi7QF1Zjx flat__Gbu0EzdU2yQr9B87Peh09">HTML</button>
	                                <button data-btn="true" class="basicBtn btn btn-blue__34yXHhvi2t651Fi7QF1Zjx flat__Gbu0EzdU2yQr9B87Peh09">Java</button>
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
	                                <div><a id="catalog" href="/catalog/subject/all" data-testid="header-catalog" class="tab__1Vw1A1yuPy-TnRg11IKht navLink__1vFiVOfSXmydFMhnUFq3wn">Danh mục</a></div>
	                                <div><a href="/pro/membership" data-testid="header-pricing" id="pricing" class="tab__1Vw1A1yuPy-TnRg11IKht navLink__1vFiVOfSXmydFMhnUFq3wn">Giá cả</a></div>
	                                <div>
	                                    <button data-btn="true" class="basicBtn dropDown__2-ccs0vt2m_kB3Lma6LG25 navLink__3gwBQdmDpuPvlVr4s7Z4cN" data-testid="userdropdown-button"><c:if test="${MEMBER.name != null }">${MEMBER.name }</c:if><c:if test="${MEMBER.name == null }">Cài đặt cá nhân</c:if>
	                                    </button>
	                                    <div class="userOptionsContainer__30GA4HQNF4iP0uVJ8EuE80" data-testid="user-options-container">
										    <div class="userOptionsLink__324nKW_gSCbjnKsLQusE6v"><a href="/profiles/me">Hồ sơ của bạn</a></div>
										    <div class="userOptionsLink__324nKW_gSCbjnKsLQusE6v"><a data-testid="edit-account-link" href="/account">Cài đặt tài khoản</a></div>
										    <div class="userOptionsLink__324nKW_gSCbjnKsLQusE6v"><a data-testid="help-link" href="/help">Help</a></div>
										    <div class="userOptionsLink__324nKW_gSCbjnKsLQusE6v"><a data-testid="sign-out-link" href="<c:url value="/logout" />">Đăng xuất</a></div>
										</div>
	                                </div>
	                                <div class="navButtonContainer__1WVLA7lgxd4hQgcu55Ef5e">
	                                    <div>
	                                        <div id="mobile-pro-button" class="tab__1Vw1A1yuPy-TnRg11IKht"><a data-btn="true" data-testid="upgrade-link" data-cxlid="upgrade-link" target="_self" rel="noopener noreferrer" class="basicBtn btn btn-brand-purple__1JTaE-cUSI6K55KDmewKoI block__3MKGyKYuSM5G_QH33nSE7J outline__1jukYfNsJOsNuah6o7d8HZ" href="/pro/membership">Upgrade to Pro</a></div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </header>