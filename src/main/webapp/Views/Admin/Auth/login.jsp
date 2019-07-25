<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/functions.tld" %>
<c:set var="ADMIN_ID" value="${sessionScope['ADMIN']}"/>
<c:if test="${ADMIN_ID!=null}">
    <c:redirect url="/Admin" />
</c:if>
<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-weight: 300;
}
body {
    font-family: 'Poppins', sans-serif;
    color: white;
    font-weight: 300;
}
body ::-webkit-input-placeholder {
    /* WebKit browsers */
    font-family: 'Poppins', sans-serif;
    color: white;
    font-weight: 300;
}
body :-moz-placeholder {
    /* Mozilla Firefox 4 to 18 */
    font-family: 'Poppins', sans-serif;
    color: white;
    opacity: 1;
    font-weight: 300;
}
body ::-moz-placeholder {
    /* Mozilla Firefox 19+ */
    font-family: 'Poppins', sans-serif;
    color: white;
    opacity: 1;
    font-weight: 300;
}
body :-ms-input-placeholder {
    /* Internet Explorer 10+ */
    font-family: 'Poppins', sans-serif;
    color: white;
    font-weight: 300;
}
.wrapper {
    background: #50a3a2;
    background: linear-gradient(top left, #486B8A 0%, #53e3a6 100%);
    background: linear-gradient(to bottom right, #486B8A 0%, #53e3a6 100%);
    position: absolute;
    top: 0%;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
}
.wrapper.form-success .container h1 {
    transform: translateY(85px);
}
.container {
    max-width: 600px;
    margin: 0 auto;
    padding: 150px 0;
    height: 400px;
    text-align: center;
}
.container h1 {
    font-size: 40px;
    transition-duration: 1s;
    transition-timing-function: ease-in-     put;
    font-weight: 200;
}
form {
    padding: 20px 0;
    position: relative;
    z-index: 2;
}
.g-recaptcha{
 	appearance: none;
    outline: 0;
    width: 250px;
    margin: 0 auto 10px auto;
    display: block;
    text-align: center;
    font-size: 18px;
    color: white;
    -webkit-transition-duration: 0.25s;
    transition-duration: 0.25s;
    font-weight: 300;
}
form input {
    appearance: none;
    outline: 0;
    border: 1px solid rgba(255, 255, 255, 0.4);
    background-color: rgba(255, 255, 255, 0.2);
    width: 250px;
    border-radius: 3px;
    padding: 10px 15px;
    margin: 0 auto 10px auto;
    display: block;
    text-align: center;
    font-size: 18px;
    color: white;
    -webkit-transition-duration: 0.25s;
    transition-duration: 0.25s;
    font-weight: 300;
}
form input:hover {
    background-color: rgba(255, 255, 255, 0.4);
}
form input:focus {
    background-color: white;
    width: 300px;
    color: #486B8A;
}
form button {
    appearance: none;
    outline: 0;
    background-color: white;
    border: 0;
    padding: 10px 15px;
    color: #53e3a6;
    border-radius: 3px;
    width: 250px;
    cursor: pointer;
    font-size: 18px;
    transition-duration: 0.25s;
}
form button:hover {
    background-color: #486B8A;
    color:#fff;
}
.bg-bubbles {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
}
.bg-bubbles li {
    position: absolute;
    list-style: none;
    display: block;
    width: 40px;
    height: 40px;
    background-color: rgba(255, 255, 255, 0.15);
    bottom: -160px;
    animation: square 25s infinite; 
    transition-timing-function: linear;
    border-radius: 50%;
}
.bg-bubbles li:nth-child(1) {
    left: 10%;
}
.bg-bubbles li:nth-child(2) {
    left: 20%;
    width: 80px;
    height: 80px;
    animation-delay: 2s;
    animation-duration: 17s;
}
.bg-bubbles li:nth-child(3) {
    left: 25%;
    animation-delay: 4s;

}
.bg-bubbles li:nth-child(4) {
    left: 40%;
    width: 60px;
    height: 60px;
    animation-duration: 22s;
    background-color: rgba(255, 255, 255, 0.25);
}
.bg-bubbles li:nth-child(5) {
    left: 70%;
}
.bg-bubbles li:nth-child(6) {
    left: 80%;
    width: 120px;
    height: 120px;
    animation-delay: 3s;
    background-color: rgba(255, 255, 255, 0.2);
}
.bg-bubbles li:nth-child(7) {
    left: 32%;
    width: 160px;
    height: 160px;
    animation-delay: 7s;
}
.bg-bubbles li:nth-child(8) {
    left: 55%;
    width: 20px;
    height: 20px;
    animation-delay: 15s;
    animation-duration: 40s;
}
.bg-bubbles li:nth-child(9) {
    left: 25%;
    width: 10px;
    height: 10px;
    animation-delay: 2s;
    animation-duration: 40s;
    background-color: rgba(255, 255, 255, 0.3);
}
.bg-bubbles li:nth-child(10) {
    left: 90%;
    width: 160px;
    height: 160px;
    animation-delay: 11s;        
}
@keyframes square {
    0% {
        transform: translateY(0);
    }
    100% {
        transform: translateY(-700px) rotate(600deg);
    }
}
@keyframes square {
    0% {
        transform: translateY(0);
    }
    100% {
        transform: translateY(-700px) rotate(600deg);
    }
}
.copyright {
    font-size: 15px;
    position: relative;
    z-index: 1;
}
.copyright a{
    color: #fff;
    text-decoration: none;
}
.copyright a:hover{
    color: #000;
}
@media (max-width: 767px){
    .container {
        padding: 50px 0;
    }
}
@media (max-width: 400px){
    .container {
        padding: 80px 0;
    }
    .copyright {
       margin-top: -80px;
    }
}
</style>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Learn Code | Quản trị hệ thống</title>
        <link rel="icon" href="images/favicon.png"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> 
        <!-- Custom styles for this template -->
    </head>
    <body>
        <div class="wrapper">
            <div class="container">
                <h1>LEARN CODE ADMIN</h1>
                <form id="login-form" class="form" novalidate action="<c:url value="/Admin/Login"/>" method="post">
                    <input name="username" type="text" placeholder="Tên đăng nhập">
                    <input name="password" type="password" placeholder="Mật khẩu">
                    <div class="g-recaptcha" data-callback="recaptchaCallback" data-sitekey="6LdYzKUUAAAAAJss2Dvme3pPwEhwNpgwPW3cHI35"></div>
                    <button type="submit" id="login-button">Đăng nhập</button>
                </form>
            </div>

            <ul class="bg-bubbles">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>

            <div class="copyright">
                <div class="container">
                    <!--Do not remove Backlink from footer of the template. To remove it you can purchase the Backlink !-->
                  &copy; Learn code | 2019 All right reserved
                </div>
            </div>
        </div>
       
		<script src="https://www.google.com/recaptcha/api.js"></script>
		 <script src="../Resources/shared/js/jquery-2.2.4.min.js" type="text/javascript"></script>
        <script src="../Resources/shared/js/jquery.validate.js" type="text/javascript"></script>
        <script src="../Resources/shared/js/jquery.validate.additional-methods.min.js" type="text/javascript"></script>
        <script src="../Resources/shared/js/jquery.validate.messages_vi.js" type="text/javascript"></script>
         <script type="text/javascript" src="../Resources/shared/js/noty.min.js"></script>
        <script src="../Resources/shared/js/serialize.js" type="text/javascript"></script>
          <script>
            function recaptchaCallback() {
                $('#login-form .btn-primary').removeAttr('disabled');
            }
        </script>
        <script>
            var validate = $("#login-form").validate({
                rules: {
                    username: {
                        required: true
                    },
                    password: {
                        required: true
                    }
                },
                messages: {
                    username: {
                        required: 'Tài khoảng không được trống'
                    },
                    password: {
                        required: 'Mật khẩu không được trống'
                    }
                },
                submitHandler: function () {
                    var url = $('#login-form').attr('action');
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: $('#login-form').serializeObject(),
                        success: function (data) {

                            openAlert(data.value);
                            if (!data.key) {
                                grecaptcha.reset();
                            }
                        },
                        error: function () {
                            $('#myModal').modal('hide');
                            openAlert(null, function () {
                                new Noty({theme: 'nest',text: 'Have error. Try again later!', layout: 'topCenter', type: 'error'});
                                grecaptcha.reset();
                            });
                        }
                    });
                }
            });
        </script>
    </body>
</html>