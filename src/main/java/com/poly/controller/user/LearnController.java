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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.poly.dao.CourseDAO;
import com.poly.dao.LessionDAO;
import com.poly.dao.QuestionDAO;
import com.poly.dao.QuizDAO;
import com.poly.dao.SyllabusDAO;
import com.poly.entity.Course;
import com.poly.entity.Jdoodle;
import com.poly.entity.Lession;
import com.poly.entity.Question;
import com.poly.entity.QuestionInstruction;
import com.poly.utils.Execute;
import com.poly.utils.StringUtils;

@Controller
@RequestMapping(value = { "/learn", "/hoc" })
public class LearnController {

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView learn(@CookieValue(value = "lang", defaultValue = "vi") String lang, ModelMap mm,
			HttpServletRequest request) throws Exception {
		mm.put("LIST_COURSE", new CourseDAO().findAllCourseEager());
		return new ModelAndView("HomeLearn");
	}

	@RequestMapping(value = "/{nameAscii:^[a-zA-Z0-9-]+}", method = RequestMethod.GET)
	public ModelAndView byNameAscii(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			@PathVariable(value = "nameAscii") String nameAscii, HttpServletRequest request,
			HttpServletResponse response, ModelMap mm, HttpSession session) {
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
			if (lession.getLessionType().getCode() != null) {
				if (lession.getLessionType().getCode().equals("L") || lession.getLessionType().getCode().equals("P")) {
					mm.put("SELECTED_QUESTION", new QuestionDAO().findQuestionEager(lession, 1));
					mm.put("QUESTION_COUNT", new QuestionDAO().getCountQuestion(lession));
					return new ModelAndView("HomeLessionProject");
				} else if (lession.getLessionType().getCode().equals("Q")){
					Question question = new QuestionDAO().findFirstQuestionByLession(lession);
					mm.put("SELECTED_QUESTION", question);
					mm.put("LIST_QUIZ", new QuizDAO().getAllQuizByQuestion(question));
					return new ModelAndView("HomeLessionQuiz");
				}
			}
		}
		return new ModelAndView("redirect:/learn");
	}
	
	@RequestMapping(value = "/execute", method = RequestMethod.POST)
	public void execute(@CookieValue(value = "lang", defaultValue = "vi") String lang, @RequestParam("code") String code, @RequestParam("questionId") Integer questionId,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		Question question = new QuestionDAO().findQuestion(questionId);
		session.setAttribute("SESSION_QUESTION_COUNT", new QuestionDAO().getCountQuestion(question.getLession()));
		Jdoodle jdoodle = Execute.execute(code, question.getLession().getSyllabus().getCourse().getLanguage().getCodeJdoodle());
		session.setAttribute("JDOODLE", jdoodle);
		if (jdoodle.getCpuTime() != null && jdoodle.getStatusCode().equals("200")) {
			boolean rs = true;
			for (QuestionInstruction questionInstruction : question.getInstructions()) {
				if (!StringUtils.equalsCode(jdoodle.getOutput(), questionInstruction.getResult())) {
					rs = false;
				}
			}
			if (rs)
				session.setAttribute("SESSION_QUESTION", question);
			session.setAttribute("SESSION_IS_TRUE", rs); 
		} else {
			session.setAttribute("SESSION_IS_TRUE", false);
		}
	}
	
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public ModelAndView load_result(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		if (session.getAttribute("JDOODLE") != null) {
			mm.put("RESULT", ((Jdoodle) session.getAttribute("JDOODLE")).getOutput());
			session.removeAttribute("SESSION_RESULT");
		}
		return new ModelAndView("HomeLessionProjectAjaxResult");
	}
	
	@RequestMapping(value = "/ajax2", method = RequestMethod.GET)
	public ModelAndView load_button(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		if (session.getAttribute("SESSION_IS_TRUE") != null) {
			mm.put("ISTRUE", session.getAttribute("SESSION_IS_TRUE"));
			session.removeAttribute("SESSION_IS_TRUE");
			mm.put("QUESTION_COUNT", session.getAttribute("SESSION_QUESTION_COUNT"));
			session.removeAttribute("SESSION_QUESTION_COUNT");
			mm.put("SELECTED_QUESTION", session.getAttribute("SESSION_QUESTION"));
			session.removeAttribute("SESSION_QUESTION");
			mm.put("QUESTION_COUNT", new QuestionDAO().getCountQuestion(((Question) mm.get("SELECTED_QUESTION")).getLession()));
		}
		return new ModelAndView("HomeLessionProjectAjaxButton");
	}
	
	@RequestMapping(value = "/next", method = RequestMethod.POST)
	public void nextQuestion(@CookieValue(value = "lang", defaultValue = "vi") String lang, HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session,
			@RequestParam(value = "nameAscii") String nameAscii, @RequestParam(value = "nameAscii2") String nameAscii2, @RequestParam(value = "questionId") Integer questionId) {
		Lession lession = new LessionDAO().findLessionByNameAscii2(nameAscii, nameAscii2, lang);
		session.setAttribute("SESSION_LESSION", lession);
		session.setAttribute("SESSION_QUESTION", new QuestionDAO().findQuestionEager(lession, questionId));
	}
	
	@RequestMapping(value = "/next/ajax", method = RequestMethod.GET)
	public ModelAndView nextQuestion_ajax(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		mm.put("SELECTED_LESSION", session.getAttribute("SESSION_LESSION"));
		session.removeAttribute("SESSION_LESSION");
		mm.put("SELECTED_QUESTION", session.getAttribute("SESSION_QUESTION"));
		session.removeAttribute("SESSION_QUESTION");
		return new ModelAndView("HomeLessionProjectAjax");
	}
	
	@RequestMapping(value = "/next/ajax2", method = RequestMethod.POST)
	public ModelAndView nextQuestion2_ajax(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session,
			@RequestParam(value = "nameAscii") String nameAscii, @RequestParam(value = "nameAscii2") String nameAscii2, @RequestParam(value = "questionId") Integer questionId) {
		System.out.println(nameAscii + " " + nameAscii2 + " " + questionId);
		Lession lession = new LessionDAO().findLessionByNameAscii2(nameAscii, nameAscii2, lang);
		session.setAttribute("SESSION_LESSION", lession);
		session.setAttribute("SESSION_QUESTION", new QuestionDAO().findQuestionEager(lession, questionId));
		return new ModelAndView("HomeLessionProjectAjaxNav");
	}
	
	@RequestMapping(value = "/next/ajax2", method = RequestMethod.GET)
	public ModelAndView nextQuestion2_ajax2(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		mm.put("SELECTED_LESSION", session.getAttribute("SESSION_LESSION"));
		session.removeAttribute("SESSION_LESSION");
		mm.put("SELECTED_QUESTION", session.getAttribute("SESSION_QUESTION"));
		session.removeAttribute("SESSION_QUESTION");
		mm.put("QUESTION_COUNT", new QuestionDAO().getCountQuestion((Lession) mm.get("SELECTED_LESSION")));
		return new ModelAndView("HomeLessionProjectAjaxNav");
	}
}
