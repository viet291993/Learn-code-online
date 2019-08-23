<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<link href="<c:url value="/Resources/Home/shared/css/core-a0ae320c346b4b71eebba66a736b17d8.css"/>" media="screen" rel="stylesheet" type="text/css">
    <link href="<c:url value="/Resources/Home/shared/css/edit-a54436e01a4643db9542ed6288cd02d7.css"/>" media="screen" rel="stylesheet" type="text/css">
<main class="users edit ">

        <article class="fit-fixed account">
            <h1 class="sr-only">My Account</h1>

            <div class="account-menu-wrapper">
                <div data-react-class="AccountMenu">
                    <ul class="sideMenu__2XB-RBSOkiFwekO6niB_50">
                        <li class="menuItem__2tlg4ig2w6y73URUkj48qW "><a href="<c:url value='/account'/>" class="link__2PGERDP0j7TlDKbOsj9Jmt">Thông tin cá nhân</a></li>
                        <li class="menuItem__2tlg4ig2w6y73URUkj48qW selected__2vruzvLRLNvTc7SPEAhE4Y"><a href="<c:url value='/password'/>" class="link__2PGERDP0j7TlDKbOsj9Jmt">Thay đổi mật khẩu</a></li>
                    </ul>
                </div>

            </div>

            <div class="account-container">

                <div id="basic_info" class="color-scheme--white grid-col-12 account-page">

                    <div class="grid-col-6 grid-col--no-spacing">
                        <form accept-charset="UTF-8" action="<c:url value='/password'/>" class="formPassword"  id="formPassword" method="post">
                            <div style="margin:0;padding:0;display:inline">
                                <input name="userId" id="userId" type="hidden" value="${MEMBER.user.id}">
                            </div>
                            <c:if test="${f:checkPasswordNull(MEMBER.user.id)}">
	                            <div class="margin-bottom--1">
	                                <label for="passwordOld">
	                                    Mật khẩu cũ
	                                </label>
	                                <input id="passwordOld" name="passwordOld" placeholder="Mật khẩu cũ" size="30" type="password" class="Input__B0I6a45-Vc4Eo8Lqz3nSE"  style="border-color: rgba(62,62,64,0.5);">
	                            </div>
                            </c:if>
                            <div class="margin-bottom--1">
                                <label for="passwordNew">
                                    Mật khẩu mới
                                </label>
                                <input id="passwordNew" name="passwordNew" placeholder="Mật khẩu mới" size="30" type="password" class="Input__B0I6a45-Vc4Eo8Lqz3nSE"  style="border-color: rgba(62,62,64,0.5);">
                            </div>
                            
                            <div class="margin-bottom--1">
                                <label for="confirm_password">
                                    Nhập lại mật khẩu
                                </label>
                                 <input id="confirm_password" name="confirm_password" placeholder="Xác nhận mật khẩu" size="30" type="password" class="Input__B0I6a45-Vc4Eo8Lqz3nSE"  style="border-color: rgba(62,62,64,0.5);">
                            </div>
                            <input class="button" name="commit" type="submit" value="Thay đổi mật khẩu">
                        </form>
                    </div>
                </div>

            </div>
        </article>
    </main>
${Alert}
<% request.getSession().removeAttribute("Alert"); %> 
<script>
$(document).ready(function() {
	$("#formPassword").validate({
				rules: {
					passwordOld: {
						required: true,
						minlength: 6,
					},
					passwordNew: {
						required: true,
						minlength: 6,
						notEqualTo :"#passwordOld"
					},
					confirm_password: {
						required: true,
						minlength: 6,
						equalTo: "#passwordNew"
					},
				},
				messages: {
					passwordOld: {
						required: 'Vui lòng nhập mật khẩu cũ',
						minlength: 'Vui lòng nhập ít nhất 6 kí tự',
					},
					passwordNew: {
						required: 'Vui lòng nhập mật khẩu mới',
						minlength: 'Vui lòng nhập ít nhất 6 kí tự',
						notEqualTo: 'Mật khẩu mới phải khác mật khẩu cũ',
					},
					confirm_password: {
						required: 'Vui lòng nhập mật khẩu',
						minlength: 'Vui lòng nhập ít nhất 6 kí tự',
						equalTo: 'Mật khẩu không trùng',
					},
					
				}
			});
	});

</script>    