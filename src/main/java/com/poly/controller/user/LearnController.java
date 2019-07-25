package com.poly.controller.user;

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
import com.poly.dao.LessionDAO;
import com.poly.entity.Course;
import com.poly.entity.Lession;

@Controller
@RequestMapping(value = { "/learn", "/hoc" })
public class LearnController {

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView learn(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) throws Exception {
		mm.put("LIST_COURSE", new CourseDAO().findAllCourse());
		return new ModelAndView("HomeLearn");
	}

	@RequestMapping(value = "/{nameAscii:^[a-zA-Z0-9-]+}", method = RequestMethod.GET)
	public ModelAndView byNameAscii(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			@PathVariable(value = "nameAscii") String nameAscii, HttpServletRequest request,
			HttpServletResponse response, ModelMap mm, HttpSession session) {
		System.out.println("NameAscii: " + nameAscii);
		Course course = new CourseDAO().findCoursebyNameAsciiEager(nameAscii, lang);
		if (course != null) {
			mm.put("SELECTED_COURSE", course);
			return new ModelAndView("HomeCourseDetail");
		}
		return new ModelAndView("redirect:/learn");
	}

	@RequestMapping(value = "/{nameAscii:^[a-zA-Z0-9-]+}/{nameAscii2:^[a-zA-Z0-9-]+}", method = RequestMethod.GET)
	public ModelAndView byNameAscii2(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			@PathVariable(value = "nameAscii") String nameAscii, @PathVariable(value = "nameAscii2") String nameAscii2,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		Lession lession = new LessionDAO().findLessionByNameAscii2(nameAscii, nameAscii2, lang);
		if (lession != null) {
			mm.put("SELECTED_LESSION", lession);
			return new ModelAndView("HomeLessionDetail");
		}
		return new ModelAndView("redirect:/learn");
	}
}
