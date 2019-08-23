package com.poly.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.poly.dao.CourseDAO;

@Controller
@RequestMapping("")
public class ContentController {

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView register(@RequestParam(value = "keyword", defaultValue = "") String keyword, ModelMap mm,
			HttpServletRequest request) {
		mm.put("LIST_RESULTS", new CourseDAO().findCourseByKeyWord(keyword));
		return new ModelAndView("HomeSearch");
	}

	@RequestMapping(value = "/promembership", method = RequestMethod.GET)
	public ModelAndView proMemberShip(ModelMap mm, HttpServletRequest request) {
		return new ModelAndView("HomeProMembership");
	}

}
