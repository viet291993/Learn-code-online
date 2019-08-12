package com.poly.controller.user;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.apis.FacebookApi;
import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.poly.bean.Alert;
import com.poly.dao.AdminDAO;
import com.poly.dao.CourseDAO;
import com.poly.dao.MemberDAO;
import com.poly.entity.Admin;
import com.poly.entity.Member;
import com.poly.utils.CaptchaUtil;
import com.poly.utils.ConfigUtils;
import com.poly.utils.StringUtils;

import javafx.util.Pair;

@Controller
@RequestMapping("")
public class HomeController {

	@RequestMapping(value = { "/", "/trang-chu", "/home" }, method = RequestMethod.GET)
	public ModelAndView Index(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) throws Exception {
		String configPath = request.getServletContext().getRealPath("/WEB-INF/config.oauth.properties");
		java.util.Properties props = new ConfigUtils().getProperties(configPath);
		final String googleClientId = props.getProperty("google.client.id");
		final String googleClientSecret = props.getProperty("google.client.secret");
		final String facebookClientId = props.getProperty("facebook.client.id");
		final String facebookClientSecret = props.getProperty("facebook.client.secret");
		String host = request.getServerName();
		int port = request.getServerPort();
		String contextPath = request.getContextPath();
		String callbackURL = "http://" + host + ((port == 80 || port == 443) ? "" : ":" + port) + contextPath
				+ "/Oauth2Callback";

		OAuth20Service googleService = new ServiceBuilder(googleClientId).apiSecret(googleClientSecret)
				.defaultScope("email profile").callback(callbackURL + "/google").build(GoogleApi20.instance());
		OAuth20Service facebookService = new ServiceBuilder(facebookClientId).apiSecret(facebookClientSecret)
				.defaultScope("email").callback(callbackURL + "/facebook").build(FacebookApi.instance());
		final Map<String, String> additionalParams = new HashMap<>();
		additionalParams.put("access_type", "offline");
		// force to reget refresh token (if user are asked not the first time)
		additionalParams.put("prompt", "consent");
		final String authorizationUrl = googleService.createAuthorizationUrlBuilder().additionalParams(additionalParams)
				.build();
		mm.put("GOOGLE_OAUTH_LINK", authorizationUrl);
		mm.put("FACEBOOK_OAUTH_LINK", facebookService.getAuthorizationUrl());
		return new ModelAndView("HomeIndex");
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) throws Exception {
		String configPath = request.getServletContext().getRealPath("/WEB-INF/config.oauth.properties");
		java.util.Properties props = new ConfigUtils().getProperties(configPath);
		final String googleClientId = props.getProperty("google.client.id");
		final String googleClientSecret = props.getProperty("google.client.secret");
		final String facebookClientId = props.getProperty("facebook.client.id");
		final String facebookClientSecret = props.getProperty("facebook.client.secret");
		String host = request.getServerName();
		int port = request.getServerPort();
		String contextPath = request.getContextPath();
		String callbackURL = "http://" + host + ((port == 80 || port == 443) ? "" : ":" + port) + contextPath
				+ "/Oauth2Callback";

		OAuth20Service googleService = new ServiceBuilder(googleClientId).apiSecret(googleClientSecret)
				.defaultScope("email profile").callback(callbackURL + "/google").build(GoogleApi20.instance());
		OAuth20Service facebookService = new ServiceBuilder(facebookClientId).apiSecret(facebookClientSecret)
				.defaultScope("email").callback(callbackURL + "/facebook").build(FacebookApi.instance());
		final Map<String, String> additionalParams = new HashMap<>();
		additionalParams.put("access_type", "offline");
		// force to reget refresh token (if user are asked not the first time)
		additionalParams.put("prompt", "consent");
		final String authorizationUrl = googleService.createAuthorizationUrlBuilder().additionalParams(additionalParams)
				.build();
		mm.put("GOOGLE_OAUTH_LINK", authorizationUrl);
		mm.put("FACEBOOK_OAUTH_LINK", facebookService.getAuthorizationUrl());
		return new ModelAndView("HomeLogin");
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView login(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password, ModelMap mm, HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			Member member = new MemberDAO().checkLogin(username, password);
			if (member == null) {
				System.out.println("Invalid member!");
			}
			if (!member.isIsActive()) {

			}

			Map memberSession = new HashMap();
			session.setAttribute("MEMBER", memberSession);
			return new ModelAndView("redirect:/learn");
		} catch (Exception e) {
			
		}
		return new ModelAndView("redirect:/learn");
	}

	@RequestMapping(value = { "/learn", "/hoc" }, method = RequestMethod.GET)
	public ModelAndView syllabus(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) {
		mm.put("LIST_COURSE", new CourseDAO().findAllCourse());
		return new ModelAndView("HomeLearn");
	}
}
