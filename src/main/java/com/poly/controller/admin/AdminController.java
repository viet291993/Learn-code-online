package com.poly.controller.admin;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.poly.bean.Alert;
import com.poly.dao.AdminDAO;
import com.poly.entity.Admin;
import com.poly.utils.CaptchaUtil;
import com.poly.utils.ConfigUtils;
import com.poly.utils.StringUtils;

import javafx.util.Pair;

@Controller
@RequestMapping(value = { "/Admin", "/admin" })
public class AdminController {

	@RequestMapping(method = RequestMethod.GET)
	public String getHomeView(@RequestParam(value = "startDate", required = false, defaultValue = "") String startDate,
			@RequestParam(value = "endDate", required = false, defaultValue = "") String endDate,
			@RequestParam(value = "search", defaultValue = "0") Integer search, HttpServletResponse response,
			ModelMap mm, HttpSession session) {
		Cookie cookie = new Cookie("MODULE_ACTIVE", "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		cookie = new Cookie("MODULE_ACTIVE_PARENT", "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "AdminInformation";
	}

	@RequestMapping(value = "/Ajax", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getHomeViewAdmin(
			@RequestParam(value = "startDate", required = false, defaultValue = "") String startDate,
			@RequestParam(value = "endDate", required = false, defaultValue = "null") String endDate, ModelMap mm,
			HttpSession session) {
		return new ModelAndView("Ajax.AdminInformation");
	}

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String getLoginView(ModelMap mm) {
		return "AdminLogin";
	}

	@PostMapping(value = "/Login")
	@ResponseBody
	public Pair<Integer, String> login(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam("g-recaptcha-response") String recaptchaResponse, ModelMap mm, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String reCaptchaPath = session.getServletContext().getRealPath("/WEB-INF/config.reCaptcha.properties");
		Properties props = ConfigUtils.getInstance().getProperties(reCaptchaPath);
		String secret = props.getProperty("secret");
		CaptchaUtil cUtil = new CaptchaUtil();
		boolean verifyCaptcha = cUtil.verifyReCaptcha(secret, recaptchaResponse);
		if (!verifyCaptcha) {
			return new Pair(0, "Invalid captcha!");
		}
		Pair<Integer, String> result;
		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			result = new Pair(0, "All fields are required!");
			return result;
		}
		try {

			Admin admin = new AdminDAO().checkLogin(username, password);
			if (admin == null) {
				result = new Pair<Integer, String>(0, Alert.createErrorAlert("Sai tên đăng nhập hoặc mật khẩu!"));
				return result;
			}
			if (!admin.isIsActive()) {
				result = new Pair<Integer, String>(0, Alert.createErrorAlert("Tài khoản của bạn đã bị khóa!"));
				return result;
			}

			Map adminSession = new HashMap();
			adminSession.put("ADMIN_ID", admin.getId());
			session.setAttribute("ADMIN", adminSession);
			/*
			 * if (session.getAttribute("CUSTOMER") == null) { Member mem = new
			 * CustomerDAO().findCustomerByUsername(admin.getUserID().getUsername()); if
			 * (mem != null) { HashMap memberSession = new HashMap();
			 * customerSession.put("MEMBER", mem);
			 * request.getSession().setAttribute("MEMBER", memberSession); } }
			 */

			result = new Pair<Integer, String>(1, Alert.createRedirectPage(request.getContextPath()+"/Admin"));
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result = new Pair<Integer, String>(0, Alert.createErrorAlert2("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
			return result;
		}
	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("ADMIN");
		Cookie cookie = new Cookie("MODULE_ACTIVE", "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		cookie = new Cookie("MODULE_ACTIVE_PARENT", "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		try {
			response.sendRedirect(request.getContextPath()+"/Admin/Login");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
