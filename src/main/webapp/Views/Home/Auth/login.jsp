<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main class="container__t9cGpmzkTfzuZwSMDtCbX main__1DMoBwZbxA88IbaOPHt5Kt">
    <div class="spacer__3lbNVH1ntz2_5fW__RluYl">
        <h1 class="pageHeading__1aq3EfrTRp4zrnnSfHS3Ha">Đăng nhập</h1>
        <div class="formContainer__3T4BH0jFLpXLvUq8rS6dF2">
            <div class="container__2si8atrp7hFFC6f1RpWOV0">
                <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD loginForm__1K1cNujviqnhXD9q0KnQjN">
                    <form action="<c:url value="/login" />" autocomplete="on" method="POST" class="Form__2gFgmT5F5DNzwRqsquqz2j">
                        <div class="formGroups__2LQTSt-JbfaioCwGDyDBOX">
                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__29BXXbmwYSKxj7NCqvlRuU">
                                <label for="user_login" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Email hoặc tên tài khoản</label>
                                <input type="text" name="username" id="username" class="Input__B0I6a45-Vc4Eo8Lqz3nSE">
                            </div>
                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__29BXXbmwYSKxj7NCqvlRuU">
                                <label for="login__user_password" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Mật khẩu</label>
                                <input type="password" name="password" id="password" class="Input__B0I6a45-Vc4Eo8Lqz3nSE">
                            </div>
                        </div>
                        <div class="padBottomIfNotEmpty__1RQgubdoyzRrSZhCsyi2Z5"></div>
                        <div class="forgotContainer__2Uly6y1Bk6XJE6oFFv2f8e"><a class="forgotPassword__3SelY78NZ1s0jGQKpjAd04" href="/secret/new">Bạn quên mật khẩu?</a></div>
                        <button style="cursor: pointer;" data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-brand-purple__1JTaE-cUSI6K55KDmewKoI large__3uWKqXQr23vJ_9n9mwRvVa submitButton__1P6AGQnxESatgLx9uK646H" id="user_submit" type="submit">Đăng nhập</button>
                    </form>
                </div>
                <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD">
                    <div>
                        <h2 class="heading__2FI6Ms_rz_pbgjzF-Rgw_e">Hoặc đăng nhập bằng</h2>
                        <div class="btnContainer__3Ldc1PXDuChiV56wYQugYC">
                            <div class="btnContainerItem__3kFJlOyX7257vaaAwEWbPP">
                                <a data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-red__QyPlW8b4Oy99ink1-on-u socialAuthButton__37xPl0ozPFfWqDPqxOZliK" href="${GOOGLE_OAUTH_LINK }"><img alt="Log in with Google" src="<c:url value="/Resources/Home/img/google-login.svg" />" class="icon__2vDktWxPDSLCOvKmj71yjI" /></a>
                            </div>
                            <div class="btnContainerItem__3kFJlOyX7257vaaAwEWbPP">
                                <a data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-red__QyPlW8b4Oy99ink1-on-u socialAuthButton__37xPl0ozPFfWqDPqxOZliK" href="${FACEBOOK_OAUTH_LINK }"><img alt="Log in with Facebook" src="<c:url value="/Resources/Home/img/facebook-login.svg" />" class="icon__2vDktWxPDSLCOvKmj71yjI" /></a>
                            </div>
                            <div class="btnContainerItem__3kFJlOyX7257vaaAwEWbPP">
                                <a data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-red__QyPlW8b4Oy99ink1-on-u socialAuthButton__37xPl0ozPFfWqDPqxOZliK" href="/users/auth/github?scope=public_repo%2Cuser%3Aemail"><img alt="Log in with Github" src="<c:url value="/Resources/Home/img/github-login.svg" />" class="icon__2vDktWxPDSLCOvKmj71yjI" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><a href="<c:url value="/register"/>" class="outLink__1CAKaBwcDc48Oex0b-CAlj">Chưa là thành viên? <b>Đăng ký</b></a></div>
</main>