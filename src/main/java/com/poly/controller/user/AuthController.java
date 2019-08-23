package com.poly.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.apis.FacebookApi;
import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.Gson;
import com.poly.bean.Alert;
import com.poly.dao.MemberDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.FacebookUserInfo;
import com.poly.entity.GoogleUserInfo;
import com.poly.entity.Member;
import com.poly.entity.User;
import com.poly.utils.ConfigUtils;
import com.poly.utils.CustomFunction;

import javafx.util.Pair;

@Controller
@RequestMapping("")
public class AuthController {

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
		System.out.println(password + username);
		try {
			Member member = new MemberDAO().checkLogin(username, password);
			if (member == null) {
				System.out.println("wrong member!");
				session.setAttribute("Alert",
						"<script>swal('Lỗi đăng nhâp!', 'Tài khoản hoặc mặc khẩu không đúng!', 'error')</script>");
				return new ModelAndView("redirect:/login");
			}
			if (!member.isIsActive()) {
				System.out.println("blocked!");
				session.setAttribute("Alert",
						"<script>swal('Lỗi đăng nhập', 'Tài khoản đã bị khóa!', 'error')</script>");
				return new ModelAndView("redirect:/login");
			}

			session.setAttribute("MEMBER", member);
			return new ModelAndView("redirect:/learn");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/login");
	}

	@RequestMapping(value = { "/Oauth2Callback/{social}" }, method = RequestMethod.GET)
	public void Oauth2Callback(HttpServletRequest request, HttpServletResponse response,
			@PathVariable(value = "social") String social, @RequestParam(value = "code") String code, ModelMap mm) {
		Pair<Integer, String> rs = new Pair(0, Alert.createScript("window.opener.location.reload();window.close();"));
		try {
			String configPath = request.getServletContext().getRealPath("/WEB-INF/config.oauth.properties");
			Properties props = new ConfigUtils().getProperties(configPath);
			final String googleClientId = props.getProperty("google.client.id");
			final String googleClientSecret = props.getProperty("google.client.secret");
			final String facebookClientId = props.getProperty("facebook.client.id");
			final String facebookClientSecret = props.getProperty("facebook.client.secret");
			final String msClientId = props.getProperty("ms.client.id");
			final String msClientSecret = props.getProperty("ms.client.secret");
			String host = request.getServerName();
			int port = request.getServerPort();
			String contextPath = request.getContextPath();
			String callbackURL = "http://" + host + ((port == 80 || port == 443) ? "" : ":" + port) + contextPath
					+ "/Oauth2Callback";

			if ("google".equalsIgnoreCase(social)) {
				OAuth20Service googleService = new ServiceBuilder(googleClientId).apiSecret(googleClientSecret)
						.defaultScope("email profile").callback(callbackURL + "/google").build(GoogleApi20.instance());
				final OAuth2AccessToken accessToken = googleService.getAccessToken(code);
				final String PROTECTED_RESOURCE_GOOGLE = "https://www.googleapis.com/oauth2/v3/userinfo";
				OAuthRequest requestOauth = new OAuthRequest(Verb.GET, PROTECTED_RESOURCE_GOOGLE);
				googleService.signRequest(accessToken, requestOauth);
				Response responseOauth = googleService.execute(requestOauth);
				if (responseOauth.getCode() == 200) {
					GoogleUserInfo info = new Gson().fromJson(responseOauth.getBody(), GoogleUserInfo.class);
					User result = new UserDAO().getUser(info.getEmail());
					Member member = new Member();
					if (result == null) {
						User usr = new User();
						usr.setUsername(info.getEmail());
						usr.setPassword(null);
						usr.setSalt(null);
						usr.setIsActive(true);
						usr.setIsDeleted(false);
						if (new UserDAO().create(usr) != null) {
							member.setUser(usr);
							member.setEmail(info.getEmail());
							member.setName(info.getName());
							member.setAddress(info.getLocale());
							member.setProfileimage(info.getPicture());
							member.setIsActive(true);
							member.setIsDeleted(false);
							Member result2 = (Member) new MemberDAO().create(member);
							if (result2 != null) {
								request.getSession().setAttribute("MEMBER", result2);
								rs = new Pair<>(1, Alert
										.createScript("window.location.href='" + request.getContextPath() + "/';"));
							} else {
								new UserDAO().deleteUserWhenRegError(usr.getId());
								rs = new Pair<>(1, Alert.createScript(
										"window.location.href='" + request.getContextPath() + "/login';"));
							}
						} else {
							rs = new Pair<>(1, Alert
									.createScript("window.location.href='" + request.getContextPath() + "/login';"));
						}
					} else {
						member = new MemberDAO().findByUsername(info.getEmail());
						if (member == null) {
							member = new Member();
							member.setUser(result);
							member.setEmail(info.getEmail());
							member.setName(info.getName());
							member.setAddress(info.getLocale());
							member.setProfileimage(info.getPicture());
							member.setIsActive(true);
							member.setIsDeleted(false);
							Member member2 = (Member) new MemberDAO().create(member);
							if (member2 != null) {
								request.getSession().setAttribute("MEMBER", member2);
								rs = new Pair<>(1, Alert.createScript(
										"window.location.href='" + request.getContextPath() + "/learn';"));
							} else {
								rs = new Pair<>(1, Alert.createScript(
										"window.location.href='" + request.getContextPath() + "/login';"));
							}
						} else {
							request.getSession().setAttribute("MEMBER", member);
							rs = new Pair<>(1, Alert
									.createScript("window.location.href='" + request.getContextPath() + "/learn';"));
						}
					}
				} else {
					throw new Exception();
				}
			} else if ("facebook".equalsIgnoreCase(social)) {
				OAuth20Service facebookService = new ServiceBuilder(facebookClientId).apiSecret(facebookClientSecret)
						.defaultScope("email").callback(callbackURL + "/facebook").build(FacebookApi.instance());
				final OAuth2AccessToken accessToken = facebookService.getAccessToken(code);
				final String PROTECTED_RESOURCE_FACEBOOK = "https://graph.facebook.com/v3.2/me?fields=id,name,email";
				final OAuthRequest requestOauth = new OAuthRequest(Verb.GET, PROTECTED_RESOURCE_FACEBOOK);
				facebookService.signRequest(accessToken, requestOauth);
				final Response responseOauth = facebookService.execute(requestOauth);
				if (responseOauth.getCode() == 200) {
					System.out.println(responseOauth.getBody());
					FacebookUserInfo info = new Gson().fromJson(responseOauth.getBody(), FacebookUserInfo.class);
					User result = new UserDAO().getUser(info.getEmail());
					Member member = new Member();
					if (result == null) {
						User usr = new User();
						usr.setUsername(info.getEmail());
						usr.setPassword(null);
						usr.setSalt(null);
						usr.setIsActive(true);
						usr.setIsDeleted(false);
						Member member2 = (Member) new MemberDAO().create(member);
						if (member2 != null) {
							member.setUser(usr);
							member.setEmail(info.getEmail());
							member.setName(info.getName());
							member.setProfileimage("http://graph.facebook.com/" + info.getId() + "/picture?type=large");
							member.setIsActive(true);
							member.setIsDeleted(false);
							Member result2 = (Member) new MemberDAO().create(member);
							if (result2 != null) {
								request.getSession().setAttribute("MEMBER", result2);
								rs = new Pair<>(1,
										Alert.createScript("window.location.href='" + request.getContextPath() + "';"));
							} else {
								new UserDAO().deleteUserWhenRegError(usr.getId());
								rs = new Pair<>(1, Alert.createScript(
										"window.location.href='" + request.getContextPath() + "/login';"));
							}
						} else {
							rs = new Pair<>(1, Alert
									.createScript("window.location.href='" + request.getContextPath() + "/login';"));
						}
					} else {
						member = new MemberDAO().findByUsername(info.getEmail());
						if (member == null) {
							member = new Member();
							member.setUser(result);
							member.setEmail(info.getEmail());
							member.setName(info.getName());
							member.setProfileimage(
									"http://graph.facebook.com/" + info.getId() + "/picture?type=square");
							member.setIsActive(true);
							member.setIsDeleted(false);
							Member member2 = (Member) new MemberDAO().create(member);
							if (member2 != null) {
								request.getSession().setAttribute("MEMBER", member2);
								rs = new Pair<>(1, Alert.createScript(
										"window.location.href='" + request.getContextPath() + "/learn';"));
							} else {
								rs = new Pair<>(1, Alert.createScript(
										"window.location.href='" + request.getContextPath() + "/login';"));
							}
						} else {
							request.getSession().setAttribute("MEMBER", member);
							rs = new Pair<>(1, Alert
									.createScript("window.location.href='" + request.getContextPath() + "/learn';"));
						}
					}
				} else {
					throw new Exception();
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		try {
			response.getWriter().write(rs.getValue());
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register(ModelMap mm, HttpServletRequest request) {
		return new ModelAndView("HomeRegister");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView register(@RequestParam(value = "username") String username,
			@RequestParam(value = "name") String name, @RequestParam(value = "email") String email,
			@RequestParam(value = "address") String address, @RequestParam(value = "password") String password,
			ModelMap mm, HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			User temp = new User();
			String salt = CustomFunction.randomKey();
			temp.setUsername(username);
			temp.setPassword(CustomFunction.passwordEncryption(password, salt));
			temp.setSalt(salt);
			temp.setIsActive(true);
			User usr = (User) new UserDAO().create(temp);
			if (usr != null) {
				Member member = new Member();
				member.setName(name);
				member.setUser(usr);
				member.setEmail(email);
				member.setAddress(address);
				member.setIsActive(true);
				member.setIsDeleted(false);
				if (new MemberDAO().create(member) != null) {
					System.out.println("Đăng ký thành công!");
					session.setAttribute("Alert",
							"<script>swal('Thành công', 'Tạo tài khoản thành công!', 'success')</script>");
					return new ModelAndView("redirect:/register");
				} else {
					new UserDAO().deleteUserWhenRegError(usr.getId());
					session.setAttribute("Alert", "<script>swal('Lỗi', 'Tạo tài khoản thất bại!', 'error')</script>");
					return new ModelAndView("redirect:/register");
				}
			} else {
				session.setAttribute("Alert", "<script>swal('Lỗi', 'Tạo tài khoản thất bại!', 'error')</script>");
				return new ModelAndView("redirect:/register");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/register");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView logout(ModelMap mm, HttpServletRequest request) {
		request.getSession().removeAttribute("MEMBER");
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/checkUsername", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkUsername(@RequestParam(value = "username", required = false) String username, ModelMap mm) {
		return !new UserDAO().checkUsernameExist(username);
	}


	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public ModelAndView account(ModelMap mm, HttpServletRequest request) {
		return new ModelAndView("HomeAccount");
	}

	@RequestMapping(value = "/account", method = RequestMethod.POST)
	public ModelAndView accountUpdate(@RequestParam(value = "memberId", required = true) Integer memberId,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "address", required = true) String address, ModelMap mm, HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			Member member = (Member) new MemberDAO().find(memberId);
			member.setName(name);
			member.setAddress(address);
			new MemberDAO().edit(member);
			session.setAttribute("MEMBER", member);
			session.setAttribute("Alert",
					"<script>swal('Thành công', 'Thay đổi thông tin thành công!', 'success')</script>");
		} catch (Exception e) {
			session.setAttribute("Alert", "<script>swal('Lỗi', 'Thay đổi thông tin thất bại!', 'error')</script>");
		}
		return new ModelAndView("redirect:/account");
	}

	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public ModelAndView password(ModelMap mm, HttpServletRequest request) {
		return new ModelAndView("HomePassword");
	}

	@RequestMapping(value = "/password", method = RequestMethod.POST)
	public ModelAndView passwordUpdate(@RequestParam(value = "userId", required = true) Integer userId,
			@RequestParam(value = "passwordOld", required = false) String passwordold,
			@RequestParam(value = "passwordNew", required = true) String passwordNew, ModelMap mm,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			if (new UserDAO().checkPasswordOld(userId, passwordold)) {
				User user = (User) new UserDAO().find(userId);
				if (user.getSalt() == null) {
					String salt = CustomFunction.randomKey();
					user.setPassword(CustomFunction.passwordEncryption(passwordNew, salt));
					user.setSalt(salt);
				} else {
					user.setPassword(CustomFunction.passwordEncryption(passwordNew, user.getSalt()));
				}
				new UserDAO().edit(user);
				session.setAttribute("Alert",
						"<script>swal('Thành công', 'Thay đổi mật khẩu thành công!', 'success')</script>");
			}else {
				session.setAttribute("Alert", "<script>swal('Thất bại', 'Mật khẩu cũ không đúng!', 'error')</script>");
			}
		} catch (Exception e) {
			session.setAttribute("Alert", "<script>swal('Đã có lỗi xảy ra', 'Thay đổi mật khẩu thất bại!', 'error')</script>");
		}
		return new ModelAndView("redirect:/password");
	}
}
