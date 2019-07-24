package com.poly.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AdminAuthenticationInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Map adminSession = (Map) request.getSession().getAttribute("ADMIN");
		String uri = request.getRequestURI();
		if (adminSession == null) {
			if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				response.getWriter().println("<script>window.location.href='"+request.getContextPath()+"/Admin/Login'</script>");
			} else {
				response.sendRedirect(request.getContextPath()+"/Admin/Login");
			}
			return false;
		} else if (uri.endsWith("/Admin") || uri.endsWith("/admin")) {
			return true;
		} else {
			String[] strs = uri.split("/");
			String includeUri = "";
			String includeUri1;
			if (strs.length >= 2) {
				includeUri = "/" + strs[2];
			}
			/*
			 * Admin aID = new AdminFacade().findAdminById((Integer)
			 * adminSession.get("ADMIN_ID")); AdminRole role = aID.getAdminRoleId();
			 * List<AdminModuleInRole> moduleInRoles = role.getAdminModuleInRoles();
			 */
			/*
			 * for (AdminModuleInRole mIR : moduleInRoles) { if
			 * (includeUri.equalsIgnoreCase(mIR.getAdminModuleId().getController())) { if
			 * (strs.length >= 3) { includeUri1 = "/" + strs[3]; for (AdminModule module :
			 * mIR.getAdminModuleId().getChildrenModules()) { if
			 * (includeUri1.equalsIgnoreCase(module.getController())) {
			 * adminSession.put("MODULE_ACTIVE_PARENT",
			 * String.valueOf(mIR.getAdminModuleId().getId()));
			 * adminSession.put("MODULE_ACTIVE", String.valueOf(module.getId()));
			 * request.getSession().setAttribute("ADMIN", adminSession); return true; } }
			 * return false; } return true; } }
			 */
			return false;
		}
	}
}
