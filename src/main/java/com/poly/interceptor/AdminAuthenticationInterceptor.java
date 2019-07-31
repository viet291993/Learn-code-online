package com.poly.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.poly.dao.AdminDAO;
import com.poly.entity.Admin;
import com.poly.entity.AdminModule;
import com.poly.entity.AdminModuleInRole;
import com.poly.entity.AdminRole;

@Component
public class AdminAuthenticationInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Map adminSession = (Map) request.getSession().getAttribute("ADMIN");
		String uri = request.getRequestURI();
		if (adminSession == null) {
			if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				response.getWriter().println(
						"<script>window.location.href='" + request.getContextPath() + "/Admin/Login'</script>");
			} else {
				response.sendRedirect(request.getContextPath() + "/Admin/Login");
			}
			return false;
		} else if (uri.endsWith("/Admin") || uri.endsWith("/admin")) {
			return true;
		} else {

			String[] strsContexPart = request.getContextPath().split("/");
			int number = strsContexPart.length + 1;
			String[] strs = uri.split("/");
			String includeUri = "";
			String includeUri1;
			if (strs.length >= number) {
				includeUri = "/" + strs[number];
			}

			Admin aID = new AdminDAO().findAdminById((Integer) adminSession.get("ADMIN_ID"));
			AdminRole role = aID.getAdminRole();
			List<AdminModuleInRole> moduleInRoles = role.getAdminModuleInRoles();

			for (AdminModuleInRole mIR : moduleInRoles) {
				if (includeUri.equalsIgnoreCase(mIR.getAdminModule().getController())) {
					if (strs.length >= number + 1) {
						includeUri1 = "/" + strs[number + 1];
						for (AdminModule module : mIR.getAdminModule().getAdminModules()) {
							if (includeUri1.equalsIgnoreCase(module.getController())) {
								adminSession.put("MODULE_ACTIVE_PARENT", String.valueOf(mIR.getAdminModule().getId()));
								adminSession.put("MODULE_ACTIVE", String.valueOf(module.getId()));
								request.getSession().setAttribute("ADMIN", adminSession);
								return true;
							}
						}
						return false;
					}
					return true;
				}
			}

			return false;
		}
	}
}
