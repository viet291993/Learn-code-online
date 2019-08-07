package com.poly.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.poly.dao.CourseDAO;
import com.poly.dao.LessionDAO;
import com.poly.dao.QuestionDAO;
import com.poly.entity.Course;
import com.poly.entity.Jdoodle;
import com.poly.entity.Lession;
import com.poly.utils.Execute;

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
			if (lession.getLessionType().getName() != null && lession.getLessionType().getName().equals("Interactive Lesson")) {
				mm.put("SELECTED_QUESTION", new QuestionDAO().findFirstQuestionByLession(lession));
			}
			return new ModelAndView("HomeLessionDetail");
		}
		return new ModelAndView("redirect:/learn");
	}
	
	@RequestMapping(value = "/execute", method = RequestMethod.POST)
	public void execute(@CookieValue(value = "lang", defaultValue = "vi") String lang, @RequestParam("code") String code,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		session.setAttribute("TEMP_RESULT", Execute.execute(code, "java"));
	}
	
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public ModelAndView load_result(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		System.out.println("temp result: " + session.getAttribute("TEMP_RESULT"));
		System.out.println("reload result");
		if (session.getAttribute("TEMP_RESULT") != null) {
			Jdoodle jd = new Gson().fromJson((String) session.getAttribute("TEMP_RESULT"), Jdoodle.class);
			mm.put("RESULT", jd.getOutput());
			session.removeAttribute("TEMP_RESULT");
		}
		return new ModelAndView("HomeLessionDetailAjax");
	}
}
