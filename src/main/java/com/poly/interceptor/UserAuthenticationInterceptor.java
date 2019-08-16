package com.poly.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class UserAuthenticationInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
        Object sessionObj = request.getSession().getAttribute("MEMBER");
        String uri = request.getRequestURI().toLowerCase();
        if (sessionObj == null) {
            if (uri.contains(request.getContextPath().toLowerCase() + "/learn")) {
            	response.sendRedirect(request.getContextPath() + "/login");
                return false;
            }
        } else {
        	System.out.println("url " + request.getContextPath().toLowerCase() + "/learn");
        	System.out.println("uri " + uri);
        	if (uri.contains(request.getContextPath().toLowerCase() + "/login") || uri.contains(request.getContextPath().toLowerCase() + "/register") 
        			|| uri.equals(request.getContextPath().toLowerCase() + "/") || uri.contains(request.getContextPath().toLowerCase() + "/home")) {
            	response.sendRedirect(request.getContextPath() + "/learn");
                return false;
            }
        }
        return true;
    }
}
