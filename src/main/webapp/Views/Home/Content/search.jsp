<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
 <div class="react-root" data-react-class="PortalRouter">
        <div class="contentContainer__3rYV5hCbkX8Z5A1gQ1uzq4">
            <div class="container__18Lvak7TOj2ONYnVncDswZ" data-testid="header-search-dropdown">
                <svg class="searchIcon__2GdypljE5Y4og7xMIXTnC0" width="34" height="34" fill="currentColor" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <title>Search Icon</title>
                    <path d="M9.583 2a7.583 7.583 0 0 1 7.584 7.583 7.601 7.601 0 0 1-1.82 4.935l.315.315h.921l5.834 5.834-1.75 1.75-5.834-5.834v-.921l-.315-.315a7.601 7.601 0 0 1-4.935 1.82A7.583 7.583 0 0 1 9.583 2zm0 2.333a5.228 5.228 0 0 0-5.25 5.25 5.228 5.228 0 0 0 5.25 5.25 5.228 5.228 0 0 0 5.25-5.25 5.228 5.228 0 0 0-5.25-5.25z" fill-rule="nonzero"></path>
                </svg>
                <form class="search__29onWpDjq58c3aCaE2qo-p" id="search-form" action="<c:url value="/search" />">
                    <input type="search" name="keyword" placeholder="<c:forEach items='${LIST_KEYWORD}' var='KEY'>${KEY.name},</c:forEach>..." class="input__2N7BddZhWJzGy_ks5nHLzZ" value="${param.keyword==null?'':param.keyword}">
                </form>
            </div>
            <div class="">
                <div class="resultsInfo__1kdRooMNwAuwJCXclRXaPY">
                    <div>${fn:length(LIST_RESULTS)}
                        <!-- -->
                        <!-- -->kết quả
                        <!-- -->của <strong>${param.keyword==null?'':param.keyword}</strong></div>
                   <!--  <div><span class="">1 of2</span>
                        <a href="https://www.codecademy.com/search?page=2&amp;query=java">
                            <svg class="changePage__23tnTX595ITqn9V_CKad2i" aria-label="next" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                                <title>Chevron Right Icon</title>
                                <path d="M13.94 12.06L6.645 4.769l1.415-1.414 8.707 8.707-8.707 8.707-1.415-1.414z"></path>
                            </svg>
                        </a>
                    </div> -->
                </div>
                <div data-testid="search-results">
                    <ol class="resultList__32p0gnOrMo3X9fXH4NKPlX">
                    <c:forEach items="${LIST_RESULTS}" var="RESULTS">
                        <li>
                            <a href="<c:url value="/learn/${RESULTS.nameAscii}" />" class="resultLink__t5uUGIWxRGQlJeR0Uk8bG">
                                <div class="shell__1vPVBkwGbqEYx_R1DkguFu result__1H8LBMtqhGsaDZ6nXppDyY"><img class="graphic__3xXcR8iieViLb9btvy5C7T" src="<c:url value="/Resources/Home/img/imgcourse.webp" />" alt="Learn Java">
                                    <div class="standardPadding__2Qfs_mGV0Kt7Y3sHTOhHtm">
                                        <div class="type__PYBo0WrckLqfgQ-gQnd3G">Khóa học</div>
                                        <div class="title__3sKtpbrKLRKxJviSPPEYHM"><strong>${RESULTS.name}</strong></div>
                                        <div>${RESULTS.description}</div>
                                    </div>
                                </div>
                            </a>
                        </li>
					</c:forEach>                        
                    </ol>
                </div>
                <div class="resultsInfo__1kdRooMNwAuwJCXclRXaPY">
                    <div>${fn:length(LIST_RESULTS)}
                        <!-- -->
                        <!-- -->kết quả
                        <!-- -->của <strong>${param.keyword==null?'':param.keyword}</strong></div>
                   <!--  <div><span class="">1 of2</span>
                        <a href="https://www.codecademy.com/search?page=2&amp;query=java">
                            <svg class="changePage__23tnTX595ITqn9V_CKad2i" aria-label="next" fill="currentColor" height="24" version="1.1" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                                <title>Chevron Right Icon</title>
                                <path d="M13.94 12.06L6.645 4.769l1.415-1.414 8.707 8.707-8.707 8.707-1.415-1.414z"></path>
                            </svg>
                        </a>
                    </div> -->
                </div>
            </div>
        </div>
    </div>