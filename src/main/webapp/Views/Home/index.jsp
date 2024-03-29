<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${MEMBER != null}">
    <script type="text/javascript">
	    window.location.href = "<%=request.getContextPath()%>/learn";
	</script>
</c:if>
<main class="main__jhBqo7rBIWmr8mS_EhZm">
            <div class="container__t9cGpmzkTfzuZwSMDtCbX container__3PjvxeZ6sSvE7xKd3igw-0">
                <div class="collageContainer__3KYXHdr0-SK5rejw9ST5Qq">
                    <div class="titleContainer__2kdrhe6ZWYZpBOZ88grjVL">
                        <h1>Học lập trình <br> dễ nhất trên <br> LearnCode!</h1></div><img src="<c:url value="/Resources/Home/img/banner-home.png" />" class="learner__3vTyNPqZP4vapfuoSCveyY"><img src="<c:url value="/Resources/Home/img/daecb491e565bc6b7390756d03fc1ee1.svg"/>" alt="" class="bars__Ijm1fSi8r49Z09mMysanR"><img src="./index_files/f059ec67021b3dfeea1b6cb2eb373683.svg" alt=""><img src="<c:url value="/Resources/Home/img/3ce816c669e3c8a946f0895049a01e44.svg"/>" alt="" class="triangle__2R2-HQOXNIN6Chb-e2rmPA"><img src="<c:url value="/Resources/Home/img/5c537833d79f7065497b565eaa7bca64.svg" />" alt="" class="rectangle__nu9ra5e_9o2QOhALFTPgN"></div>
                <div class="formContainer__2l_MfQ1gY1nLmc15QoiqRe">
                    <div class="formContents__11wRcREszRNutLneB6TOP3">
                        <h2 class="formHeader__ewADzegSmio5jLLTQF2Rr">Đăng nhập tài khoản</h2>
                        <h1 class="mobileTitle__28xF0P4BAQnIezH7OTNsWa">Học lập trình dễ nhất trên LearnCode!</h1>
                        <div class="formContainer__3T4BH0jFLpXLvUq8rS6dF2">
                            <div class="registrationContainer__2QEroVip0rj6VbrALiBz8V">
                                <form action="<c:url value="/login" />" method="POST">
                                    <fieldset class="fieldset__90L8T9R_uCnS1Uv2DXnSl">
                                        <div>
                                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__2f7GlHvZXKIMvaIzaJuPIp">
                                                <label for="sign_up_form_email" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Email hoặc tài khoản</label>
                                                <div class="inputWrapper__1QrvHYrz5fvfSM_ybUnPYg">
                                                    <input type="text" data-testid="email-field" name="username" required="" data-resource="user" autofocus="" id="sign_up_form_email" class="Input__B0I6a45-Vc4Eo8Lqz3nSE" value="" aria-invalid="true">
                                                </div>
                                            </div>
                                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__2f7GlHvZXKIMvaIzaJuPIp">
                                                <label for="sign_up_form_password" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Mật khẩu</label>
                                                <div class="inputWrapper__1QrvHYrz5fvfSM_ybUnPYg">
                                                    <input type="password" data-testid="password-field" name="password" required="" pattern=".{3,128}" data-resource="user" id="sign_up_form_password" class="Input__B0I6a45-Vc4Eo8Lqz3nSE" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <button data-btn="true" type="submit" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-brand-purple__1JTaE-cUSI6K55KDmewKoI large__3uWKqXQr23vJ_9n9mwRvVa submitButton__34k4InI5TII_ayjcKIwCLO" id="sign_up_form_submit">Học ngay</button>
                                        <p class="tos__2irFvmVYzLt-zbObC3_2D8"><a href="<c:url value="/register"/>">Đăng ký</a> trở thành thành viên để học học lập trình và gia nhập cộng đồng LearnCode.</p>
                                    </fieldset>
                                </form>
                                <div>
                                    <h2 class="heading__2FI6Ms_rz_pbgjzF-Rgw_e">Hoặc đăng nhập tài khoản:</h2>
                                    <div class="btnContainer__3Ldc1PXDuChiV56wYQugYC">
                                        <div class="btnContainerItem__3kFJlOyX7257vaaAwEWbPP">
                                            <a data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-red__QyPlW8b4Oy99ink1-on-u socialAuthButton__37xPl0ozPFfWqDPqxOZliK" href="${GOOGLE_OAUTH_LINK}"><img alt="Log in with Google" src="<c:url value="/Resources/Home/img/google-login.svg" />" class="icon__2vDktWxPDSLCOvKmj71yjI" /></a>
                                        </div>
                                        <div class="btnContainerItem__3kFJlOyX7257vaaAwEWbPP">
                                            <a data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-red__QyPlW8b4Oy99ink1-on-u socialAuthButton__37xPl0ozPFfWqDPqxOZliK" href="${FACEBOOK_OAUTH_LINK}"><img alt="Log in with Facebook" src="<c:url value="/Resources/Home/img/facebook-login.svg" />" class="icon__2vDktWxPDSLCOvKmj71yjI" /></a>
                                        </div>
                                        <div class="btnContainerItem__3kFJlOyX7257vaaAwEWbPP">
                                            <a data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-red__QyPlW8b4Oy99ink1-on-u socialAuthButton__37xPl0ozPFfWqDPqxOZliK" href="#/users/auth/github?scope=public_repo%2Cuser%3Aemail"><img alt="Log in with Github" src="<c:url value="/Resources/Home/img/github-login.svg" />" class="icon__2vDktWxPDSLCOvKmj71yjI" /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ctaSection__36_vX81vkCA8SpLCytuVZ3">
                <div class="container__t9cGpmzkTfzuZwSMDtCbX"><img src="<c:url value="/Resources/Home/img/ad31cc5d0e772afeb709ff2eb8533388.svg" />" alt="" class="intersectingOvalsImg__1gExzHIE5Mn2S0LJqwsUVm"><img src="<c:url value="/Resources/Home/img/22ec3e0cc58cb2335431228f470553ae.svg" />" alt="" class="pieChartImg__1uArqVg9AvfqchFXiz4AuY"><img src="<c:url value="/Resources/Home/img/75e370504e7e835443ce65fa47062325.svg" />" alt="" class="togglesImg__2t3KchlrgDHtt14jpQckcK">
                    <div class="ctaSectionContent__2ritis0K0nd-ZVgDtf4eDw">
                        <h2 class="ctaHeader__2rtm70gsy41omgpzTodBkn">LearnCode là khởi đầu  <br> tốt nhất để học lập trình</h2>
                        <p class="ctaContent__-GIe7aYRIo8D0yKMcml_d">Học lập trình là cách dễ nhất để thay đổi nghề nghiệp của bạn.</p></div>
                </div>
            </div>
        </main>