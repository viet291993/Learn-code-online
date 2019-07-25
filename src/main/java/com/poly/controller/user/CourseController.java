package com.poly.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.poly.dao.CourseDAO;

@Controller
@RequestMapping("/course")
public class CourseController {
	
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView syllabus(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) {
		mm.put("LIST_COURSE", new CourseDAO().findAllCourse());
		return new ModelAndView("HomeCourse");
	}
}
