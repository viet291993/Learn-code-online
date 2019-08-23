<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<link href="<c:url value="/Resources/Home/shared/css/desktop_theme_11_2b0389cca106efdfc0f82343dc5ed295c821d4e2.css"/>" media="all" rel="stylesheet" data-target="desktop_theme" data-theme-id="11">
<link href="<c:url value="/Resources/Home/shared/css/desktop_4_72d0912f566baffe6567ade10cd411d7e18f6e06.css"/>" media="all" rel="stylesheet" data-target="desktop" data-theme-id="11">
<section id="main" class="ember-application">
    <div class="ember-view" id="ember4">
        <div id="" class="wrap" style="">
            <div class="container">
                <div id="ember9" class="ember-view">
                    <div id="banner" style="">
                        <div id="circle-img-welcome" style=""></div>
                        <div id="welcome-message" style="">
                            <h2>LearnCode Forums</h2>
                            <p>Chào mừng bạn đến với Diễn đàn LearnCode! Diễn đàn này là một nơi thân thiện cho mọi người học viết mã.</p>
                            <p>Trợ giúp các thành viên để trở thành một thành viên cộng đồng hữu ích.</p>
                        </div>
                    </div>
                </div>
                <div id="ember10" class="controls ember-view">
                    <!---->
                </div>
                <div id="ember11" class="ember-view"></div>
                <div id="ember12" class="hidden create-topics-notice ember-view">
                    <!---->
                </div>
                <span id="ember13" class="ember-view"><!----></span>
            </div>
            <div class="container">
                <div id="ember1777" class="ember-view">
                    <!---->
                </div>
            </div>

            <div class="list-controls">
                <div class="container">
                    <section id="ember1781" class="navigation-container ember-view">
                        <ol id="ember1783" class="category-breadcrumb ember-view">
                            <li id="ember1784" class="select-kit single-select combobox combo-box category-drop has-reached-minimum bullet ember-view">
                                <div title="all categories" aria-haspopup="true" aria-label="all categories" tabindex="0" id="ember1785" class="select-kit-header combo-box-header category-drop-header is-none ember-view" style="undefined"><span class="selected-name">
  <span class="category-name">all categories</span>
                                    </span>

                                    <svg class="fa d-icon d-icon-caret-right svg-icon caret-icon svg-string" xmlns="http://www.w3.org/2000/svg" style="undefined">
                                        <use xlink:href="#caret-right"></use>
                                    </svg>
                                </div>

                                <div class="select-kit-body">
                                    <div id="ember1786" class="select-kit-filter ember-view">
                                        <input autocapitalize="off" autocorrect="off" autocomplete="off" tabindex="-1" spellcheck="false" placeholder="Search..." id="ember1787" class="filter-input ember-text-field ember-view" type="text">

                                        <svg class="fa d-icon d-icon-search svg-icon filter-icon svg-string" xmlns="http://www.w3.org/2000/svg">
                                            <use xlink:href="#search"></use>
                                        </svg>
                                    </div>

                                    <!---->
                                </div>

                                <div class="select-kit-wrapper"></div>
                            </li>

                            <!---->
                            <li id="ember1788" class="select-kit single-select combobox combo-box tag-drop has-reached-minimum bullet tag_all ember-view">
                                <div title="all tags" aria-haspopup="true" aria-label="all tags" tabindex="0" id="ember1789" class="select-kit-header combo-box-header tag-drop-header is-none ember-view"><span class="selected-name">
    all tags
</span>

                                    <svg class="fa d-icon d-icon-caret-right svg-icon caret-icon svg-string" xmlns="http://www.w3.org/2000/svg">
                                        <use xlink:href="#caret-right"></use>
                                    </svg>
                                </div>

                                <div class="select-kit-body">
                                    <div id="ember1790" class="select-kit-filter ember-view">
                                        <input autocapitalize="off" autocorrect="off" autocomplete="off" tabindex="-1" spellcheck="false" placeholder="Search..." id="ember1791" class="filter-input ember-text-field ember-view" type="text">

                                        <svg class="fa d-icon d-icon-search svg-icon filter-icon svg-string" xmlns="http://www.w3.org/2000/svg">
                                            <use xlink:href="#search"></use>
                                        </svg>
                                    </div>

                                    <!---->
                                </div>

                                <div class="select-kit-wrapper"></div>
                            </li>

                            <!---->
                        </ol>

                        <!---->
                        <ul id="navigation-bar" class="nav nav-pills ember-view">
                            <li title="all topics grouped by category" id="ember1794" class="ember-view"><a href="https://discuss.codecademy.com/categories">Categories</a></li>
                            <li title="topics with recent posts" id="ember1796" class="active ember-view"><a href="https://discuss.codecademy.com/latest" class="active">Latest</a></li>
                            <li title="topics you have bookmarked" id="ember1798" class="ember-view"><a href="https://discuss.codecademy.com/bookmarks">Bookmarks</a></li>
                            <li title="topics created in the last few days" id="ember1800" class="ember-view"><a href="https://discuss.codecademy.com/new">New</a></li>
                            <li title="topics you are currently watching or tracking with unread posts" id="ember1802" class="has-icon ember-view"><a href="https://discuss.codecademy.com/unread"><span class="unread"></span>Unread</a></li>
                            <li title="the most active topics in the last year, month, week or day" id="ember1804" class="ember-view"><a href="https://discuss.codecademy.com/top">Active</a></li>
                            <li id="ember1805" class="ember-view"></li>
                            <!---->
                        </ul>

                        <!---->
                        <button aria-label="New Topic" id="create-topic" class="btn btn-default btn btn-icon-text ember-view">
                            <svg class="fa d-icon d-icon-plus svg-icon svg-string" xmlns="http://www.w3.org/2000/svg">
                                <use xlink:href="#plus"></use>
                            </svg>

                            <span class="d-button-label">Tạo chủ đề<!----></span>

                        </button>

                        <!---->
                    </section>
                </div>
            </div>

            <div id="ember1778" class="loading-container ember-view">
            </div>

            <div class="container list-container ">
               <div class="row">
    <div class="full-width">
        <div id="list-area">
            <div id="ember829" class="contents ember-view">
                <div id="ember830" class="bulk-select-container ember-view">
                    <!---->
                </div>

                <table id="ember831" class="topic-list ember-view">
                    <thead>
                        <tr>
                            <th data-sort-order="default" class="default">Chủ đề</th>

                            <th data-sort-order="posters" class="posters"></th>

                            <th data-sort-order="posts" class="posts sortable num">Trả lời</th>

                            <th data-sort-order="views" class="views sortable num">Lượt xem</th>

                            <th data-sort-order="activity" class="activity sortable num">Ngày tạo</th>

                        </tr>
                    </thead>

                    <!---->

                    <tbody>
                        <tr data-topic-id="426901" id="ember834" class="topic-list-item category-general tag-python ember-view">
                            <td class="main-link clearfix" colspan="1">
                                <span class="link-top-line"><a href="/t/numpy-binomial-distribution-interpretation/426901" class="title raw-link raw-topic-link" data-topic-id="426901">NumPy Binomial Distribution Interpretation</a><span class="topic-post-badges"></span>
                                </span>
                                <div class="link-bottom-line">
                                    <a class="badge-wrapper bullet" href="/c/general"><span class="badge-category-bg" style="background-color: #008080;"></span><span data-drop-close="true" class="badge-category clear-badge" title="Welcome to your learning community! Learn how the Forums work, chat with other learners, and find opportunities to practice your skills."><span class="category-name">General</span></span></a>
                                    <div class="discourse-tags"><a href="/tags/python" data-tag-name="python" class="discourse-tag simple">python</a> </div>

                                </div>
                            </td>

                            <td class="posters">
                                <a href="/u/patrickd314" data-user-card="patrickd314" class="latest single"><img alt="" width="25" height="25" src="https://sjc5.discourse-cdn.com/codecademy/user_avatar/discuss.codecademy.com/patrickd314/25/7512586_2.png" class="avatar latest single" title="Patrick M. Dennis, MD - Original Poster, Most Recent Poster"></a>
                            </td>

                            <td class="num posts-map posts heatmap-" title="This topic has 0 replies">
                                <a href="" class="posts-map badge-posts heatmap-">

                                    <span class="number">0</span>
                                </a>
                            </td>

                            <td class="num views "><span class="number" title="this topic has been viewed 42 times">42</span></td>

                            <td class="num age activity" title="First post: Jul 17, 2019 12:48 am
Posted: Jul 17, 2019 12:48 am">
                                <a class="post-activity" href="/t/numpy-binomial-distribution-interpretation/426901/1"><span class="relative-date" data-time="1563299306386" data-format="tiny">Jul 17</span></a>
                            </td>
                       	 </tr>
						</tbody>
					</table>
					</div>
				<div id="ember893" class="loading-container ember-view">
				</div>
				</div>
				</div>
				</div>
            </div>
        </div>
    </div>
</section>