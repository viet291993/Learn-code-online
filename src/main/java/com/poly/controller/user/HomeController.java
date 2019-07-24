package com.poly.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.poly.utils.CustomFunction;

@Controller
@RequestMapping("")
public class HomeController {

	@RequestMapping(value = { "/", "/trang-chu", "/home" }, method = RequestMethod.GET)
	public ModelAndView Index(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) throws Exception {
		return new ModelAndView("HomeIndex");
	}

}
