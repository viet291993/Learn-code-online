package com.poly.controller.user;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.poly.dao.CourseDAO;
import com.poly.utils.CustomFunction;

@Controller
@RequestMapping("")
public class HomeController {

	@RequestMapping(value = { "/", "/trang-chu", "/home" }, method = RequestMethod.GET)
	public ModelAndView Index(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) throws Exception {
		return new ModelAndView("HomeIndex");
	}
	
	@RequestMapping(value = { "/learn", "/hoc" }, method = RequestMethod.GET)
	public ModelAndView syllabus(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) {
		mm.put("LIST_COURSE", new CourseDAO().findAllCourse());
		return new ModelAndView("HomeLearn");
	}
	
	@RequestMapping(value = {"/{nameAscii:^(?!CellxAdmin)[a-zA-Z0-9-]+}", "/{nameAscii:^(?!CellxAdmin)[a-zA-Z0-9-]+}/trang-{page}"}, method = RequestMethod.GET)
	public ModelAndView byNameAscii(@CookieValue(value = "lang", defaultValue = "vi") String lang, @PathVariable(value = "nameAscii") String nameAscii,
            @PathVariable Optional<Integer> page, HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		
		return new ModelAndView("HomeLearn");
	}
}
