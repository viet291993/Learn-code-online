<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main class="container__t9cGpmzkTfzuZwSMDtCbX main__1DMoBwZbxA88IbaOPHt5Kt">
    <div class="spacer__3lbNVH1ntz2_5fW__RluYl">
        <h1 class="pageHeading__1aq3EfrTRp4zrnnSfHS3Ha">Đăng ký</h1>
        <div class="formContainer__3T4BH0jFLpXLvUq8rS6dF2">
            <div class="container__2si8atrp7hFFC6f1RpWOV0">
                <div class="flex__1yBdRTf7dKVh6F1j8s6UAN col__DIiQrF0Z1S7t-hWOmyXlD loginForm__1K1cNujviqnhXD9q0KnQjN">
                    <form id="formRegister" action="<c:url value="/register" />" autocomplete="on" method="POST" class="Form__2gFgmT5F5DNzwRqsquqz2j">
                        <div class="formGroups__2LQTSt-JbfaioCwGDyDBOX">
                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__29BXXbmwYSKxj7NCqvlRuU">
                                <label for="username" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Tên tài khoản</label>
                                <input type="text" required name="username" id="username" class="Input__B0I6a45-Vc4Eo8Lqz3nSE">
                            </div>
                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__29BXXbmwYSKxj7NCqvlRuU">
                                <label for="password" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Mật khẩu</label>
                                <input type="password" required name="password" id="password" class="Input__B0I6a45-Vc4Eo8Lqz3nSE">
                            </div>
                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__29BXXbmwYSKxj7NCqvlRuU">
                                <label for="repassword" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Nhập lại mật khẩu</label>
                                <input type="password" required name="confirm_password" id="confirm_password" class="Input__B0I6a45-Vc4Eo8Lqz3nSE">
                            </div>
                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__29BXXbmwYSKxj7NCqvlRuU">
                                <label for="name" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Họ và tên</label>
                                <input type="text" required name="name" id="name" class="Input__B0I6a45-Vc4Eo8Lqz3nSE">
                            </div>
                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__29BXXbmwYSKxj7NCqvlRuU">
                                <label for="email" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Email</label>
                                <input type="text" required name="email" id="email" class="Input__B0I6a45-Vc4Eo8Lqz3nSE">
                            </div>
                            <div class="FormGroup__39QatB_F57UEfXnAOZGyOu formGroup__29BXXbmwYSKxj7NCqvlRuU">
                                <label for="address" class="FormGroupLabel__34U-iOLGgVsuayOOXmOr_X">Địa chỉ</label>
                                <input type="text" required name="address" id="address" class="Input__B0I6a45-Vc4Eo8Lqz3nSE">
                            </div>
                        </div>
                        <div class="padBottomIfNotEmpty__1RQgubdoyzRrSZhCsyi2Z5"></div>
                        <button style="cursor: pointer;" data-btn="true" class="basicBtn__1-6tM96NkcUhBOEjk8SDoR btn__1_GoaHrKjPXkaQLmvN_yom btn-brand-purple__1JTaE-cUSI6K55KDmewKoI large__3uWKqXQr23vJ_9n9mwRvVa submitButton__1P6AGQnxESatgLx9uK646H" id="user_submit" type="submit">Đăng ký</button>
                    </form>
                </div>
            </div>
        </div><a href="<c:url value="/login"/>"class="outLink__1CAKaBwcDc48Oex0b-CAlj">Bạn đã là thành viên <b>Đăng nhập</b></a></div>
</main>
${Alert}
<% request.getSession().removeAttribute("Alert"); %>   
<script>
$(document).ready(function() {
	$("#formRegister").validate({
				rules: {
					username: {
						required: true,
						minlength: 6,
						 remote: {
			                    url: "${CONTEXTPATH}/checkUsername",
			                    type: "POST",
			                    data: {
			                        username: function () {
			                            return $("#username").val();
			                        }
			                    }
			                }
					},
					password: {
						required: true,
						minlength: 6
					},
					confirm_password: {
						required: true,
						minlength: 6,
						equalTo: "#password"
					},
					name: {
						required: true,
						minlength: 2
					},
					email: {
						required: true,
						email: true,
						remote: {
		                    url: "${CONTEXTPATH}/checkEmail",
		                    type: "POST",
		                    data: {
		                    	email: function () {
		                            return $("#email").val();
		                        }
		                    }
		                }
					},
					address: {
						required: true,
						minlength: 2
					},
				},
				messages: {
					username: {
						required:"Vui lòng nhập tên tài khoản",
						minlength: "Tên tài khoản phải từ 6 ký tự trở lên",
						remote:"Tên tài khoản đã được sử dụng",
					},
					password: {
						required: 'Vui lòng nhập mật khẩu',
						minlength: 'Vui lòng nhập ít nhất 6 kí tự'
					},
					confirm_password: {
						required: 'Vui lòng nhập mật khẩu',
						minlength: 'Vui lòng nhập ít nhất 6 kí tự',
						equalTo: 'Mật khẩu không trùng'
					},
					name: {
						required: "Vui lòng nhập họ và tên",
						minlength: "Họ tên ngắn vậy, chém gió ah?"
					},
					email: {
						required:"Vui lòng nhập email",
						minlength: "Sai định dạng email",
						remote:"Email đã được sử dụng",
					},
					address: {
						required: "Vui lòng nhập địa chỉ",
						minlength: "Địa chỉ ngắn vậy, chém gió ah?"
					},
				}
			});
});

</script>