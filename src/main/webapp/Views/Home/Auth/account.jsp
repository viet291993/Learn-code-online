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
                        <li class="menuItem__2tlg4ig2w6y73URUkj48qW selected__2vruzvLRLNvTc7SPEAhE4Y"><a href="<c:url value='/account'/>" class="link__2PGERDP0j7TlDKbOsj9Jmt">Thông tin cá nhân</a></li>
                        <li class="menuItem__2tlg4ig2w6y73URUkj48qW"><a href="<c:url value='/password'/>" class="link__2PGERDP0j7TlDKbOsj9Jmt">Thay đổi mật khẩu</a></li>
                    </ul>
                </div>

            </div>

            <div class="account-container">

                <div id="basic_info" class="color-scheme--white grid-col-12 account-page">

                    <div class="grid-col-6 grid-col--no-spacing">
                        <form accept-charset="UTF-8" action="<c:url value='/account'/>" class="edit_user" enctype="multipart/form-data" id="edit_user_5d2bdd945256dca6cf000352" method="post">
                            <div style="margin:0;padding:0;display:inline">
                                <input name="utf8" type="hidden" value="✓">
                                <input name="_method" type="hidden" value="put">
                                <input name="authenticity_token" type="hidden" value="3MOcacBxhuc9Xc+MguVytxmuK2POmsC4SiJ5+vobzCk=">
                            </div>
                            <div class="margin-bottom--1">
                                <label for="username">
                                    Tài khoản
                                </label>
                                <div class="field field--text">
                                    <input disabled="disabled" id="username" name="username" placeholder="Tài khoản" size="30" type="text" value="${f:getUserName(MEMBER.user.id)}">
                                    <div class="field__status-icon "></div>
                                </div>

                            </div>
                            <div class="margin-bottom--1">
                                <label for="name">
                                    Họ và tên
                                </label>
                                <div class="field field--text">
                                    <input id="name" name="name" placeholder="Họ và tên" size="30" type="text" value="${MEMBER.name}">
                                    <div class="field__status-icon "></div>
                                </div>
                            </div>

                            <div class="margin-bottom--1">
                                <label for="email">
                                    Email
                                </label>
                                <div class="field field--text">
                                    <input disabled="disabled" id="email" name="email" placeholder="Email" size="30" type="text" value="${MEMBER.email}">
                                    <div class="field__status-icon "></div>
                                </div>

                            </div>

                            <div class="margin-bottom--1">
                                <label for="address">
                                    Địa chỉ
                                </label>
                                <div class="field field--text">
                                    <input id="address" name="address" placeholder="Địa chỉ" size="30" type="text" value="${MEMBER.address}">
                                    <div class="field__status-icon "></div>
                                </div>

                            </div>
							<div class="margin-bottom--1">
					          <label for="image">
					            Ảnh đại diện
					          </label>
							   <div class="field field--image">
								  	<img alt="image" src="${MEMBER.profileimage}">
								    <input id="image" name="image" type="file">
								</div>
					
					        </div>

                            <input class="button" name="commit" type="submit" value="Update Profile">
                        </form>
                    </div>
                </div>

            </div>
        </article>
    </main>