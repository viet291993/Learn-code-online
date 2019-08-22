package com.poly.controller.user;

import java.util.Date;

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
import com.poly.dao.RecordDAO;
import com.poly.dao.RecordQuestionDAO;
import com.poly.dao.SyllabusDAO;
import com.poly.entity.Course;
import com.poly.entity.Jdoodle;
import com.poly.entity.Lession;
import com.poly.entity.Member;
import com.poly.entity.Question;
import com.poly.entity.QuestionInstruction;
import com.poly.entity.Record;
import com.poly.entity.RecordQuestion;
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
		Course course = new CourseDAO().findCoursebyNameAscii(nameAscii, lang);
		mm.put("SELECTED_COURSE", course);
		Record record = new Record();
		record = new RecordDAO().findRecord(course, (Member) session.getAttribute("MEMBER"));
		if (record == null) {
			record = new Record();
			record.setCorrect(false);
			record.setCourse(course);
			record.setMember((Member) session.getAttribute("MEMBER"));
			record.setIsActive(true);
			record.setIsDeleted(false);
			try {
				record = (Record) new RecordDAO().create(record);
			} catch (Exception e) {
				System.out.println("[ERROR] CREATE RECORD");
				record = null;
			}
		}
		if (record != null) {
			Lession lession = new LessionDAO().findLessionByNameAsciiEager2(nameAscii, nameAscii2, lang);
			RecordQuestion recordQuestion = new RecordQuestionDAO().findLastPassQuestion(record);
			Integer questionCount = new QuestionDAO().getCountQuestion(lession);
			mm.put("QUESTION_COUNT", questionCount);
			Integer order = null;
			if (recordQuestion != null && recordQuestion.isIsPass()) {
				if (recordQuestion.getQuestion().getOrderDisplay() == questionCount) {
					order = questionCount;
					mm.put("IS_DONE", true);
					mm.put("TEMP_CODE", recordQuestion.getTempCode());
					Lession nextLession = new LessionDAO().getLession(lession.getSyllabus(), lession.getOrderDisplay() + 1);
					mm.put("NEXT_LESSION", nextLession);
				} else {
					order = recordQuestion.getQuestion().getOrderDisplay() + 1;
				}
			} else if (recordQuestion != null && !recordQuestion.isIsPass()) {
				order = recordQuestion.getQuestion().getOrderDisplay();
				mm.put("TEMP_CODE", recordQuestion.getTempCode());
			} else {
				order = 1;
			}
			if (lession != null) {
				mm.put("SELECTED_LESSION", lession);
				if (lession.getLessionType().getCode() != null) {
					Question question = new Question();
					if (lession.getLessionType().getCode().equals("L") || lession.getLessionType().getCode().equals("P")) {
						question = new QuestionDAO().findQuestionEager(lession, order);
						mm.put("SELECTED_QUESTION", question);
						return new ModelAndView("HomeLessionProject");
					} else if (lession.getLessionType().getCode().equals("Q")){
						question = new QuestionDAO().findFirstQuestionByLession(lession);
						mm.put("COUNT_QUESTION", new QuestionDAO().getCountQuestion(lession));
						mm.put("SELECTED_QUESTION", question);
						mm.put("LIST_QUIZ", new QuizDAO().getAllQuizByQuestion(question));
						return new ModelAndView("HomeLessionQuiz");
					} else if (lession.getLessionType().getCode().equals("A")){
						question = new QuestionDAO().findFirstQuestionByLession(lession);
						mm.put("SELECTED_QUESTION", question);
						Lession nextLession = new LessionDAO().getLession(lession.getSyllabus(), lession.getOrderDisplay() + 1);
						mm.put("NEXT_LESSION", nextLession);
						return new ModelAndView("HomeLessionArticle");
					}
				}
			}
		}
		return new ModelAndView("redirect:/learn");
	}
	
	@RequestMapping(value = "/execute", method = RequestMethod.POST)
	public void execute(@CookieValue(value = "lang", defaultValue = "vi") String lang, @RequestParam("code") String code, @RequestParam("questionId") Integer questionId,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		Question question = new QuestionDAO().findQuestion(questionId);
		Integer questionCount = new QuestionDAO().getCountQuestion(question.getLession());
		session.setAttribute("SESSION_QUESTION_COUNT", questionCount);
		Record record = new RecordDAO().findRecord(question.getLession().getSyllabus().getCourse().getId(), (Member )session.getAttribute("MEMBER"));
		RecordQuestion recordQuestion = new RecordQuestionDAO().findRecordQuestion(record, question);
		Jdoodle jdoodle = Execute.execute(code, question.getLession().getSyllabus().getCourse().getLanguage().getCodeJdoodle());
		session.setAttribute("JDOODLE", jdoodle);
		session.setAttribute("SESSION_QUESTION", question);
		boolean isExactly = true;
		Integer outputType = null;
		if (recordQuestion != null && recordQuestion.isIsPass()) {
			if (recordQuestion.getQuestion().getOrderDisplay() == questionCount) {
				session.setAttribute("SESSION_IS_DONE", isExactly);
				Lession nextLession = new LessionDAO().getLession(question.getLession().getSyllabus(), question.getLession().getOrderDisplay() + 1);
				session.setAttribute("SESSION_NEXT_LESSION", nextLession);
			}
			else
				session.setAttribute("SESSION_IS_TRUE", isExactly);
			outputType = 1;
			if (jdoodle.getCpuTime() != null && jdoodle.getStatusCode().equals("200")) {
				for (QuestionInstruction questionInstruction : question.getInstructions()) {
					if (!StringUtils.equalsCode(jdoodle.getOutput(), questionInstruction.getResult())) {
						outputType = 2;
					}
				}
			} else {
				outputType = 3;
			}
		} else if (jdoodle.getCpuTime() != null && jdoodle.getStatusCode().equals("200")) {
			for (QuestionInstruction questionInstruction : question.getInstructions()) {
				if (!StringUtils.equalsCode(jdoodle.getOutput(), questionInstruction.getResult())) {
					isExactly = false;
					outputType = 2;
				}
			}
			if (isExactly) {
				outputType = 1;
				
				if (recordQuestion != null) {
					recordQuestion.setTempCode(code);
					recordQuestion.setIsPass(true);
					recordQuestion.setLastUpdate(new Date());
					try {
						new RecordQuestionDAO().edit(recordQuestion);
						recordQuestion = new RecordQuestionDAO().findRecordQuestion(record, question);
						if (recordQuestion.getQuestion().getOrderDisplay() == questionCount) {
							session.setAttribute("SESSION_IS_DONE", isExactly);
							Lession nextLession = new LessionDAO().getLession(question.getLession().getSyllabus(), question.getLession().getOrderDisplay() + 1);
							session.setAttribute("SESSION_NEXT_LESSION", nextLession);
						}
						else
							session.setAttribute("SESSION_IS_TRUE", isExactly);
					} catch (Exception e) {
						System.out.println("[ERROR] EDIT RECORD_QUESTION WHERE IS_PASS = 1");
					}
				}
			}
		} else {
			session.setAttribute("SESSION_IS_TRUE", false);
			outputType = 3;
		}
		session.setAttribute("OUTPUT_TYPE", outputType);
		if (recordQuestion == null) {
			recordQuestion = new RecordQuestion();
			recordQuestion.setQuestion(question);
			recordQuestion.setRecord(record);
			recordQuestion.setTempCode(code);
			recordQuestion.setIsActive(true);
			recordQuestion.setIsDeleted(false);
			recordQuestion.setIsPass(isExactly);
			recordQuestion.setLastUpdate(new Date());
			try {
				new RecordQuestionDAO().create(recordQuestion);
				recordQuestion = new RecordQuestionDAO().findRecordQuestion(record, question);
				if (recordQuestion.getQuestion().getOrderDisplay() == questionCount)
					session.setAttribute("SESSION_IS_DONE", isExactly);
				else
					session.setAttribute("SESSION_IS_TRUE", isExactly);
			} catch (Exception e) {
				System.out.println("[ERROR] CREATE RECORD_QUESTION");
			}
		}
	}
	
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public ModelAndView load_result(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		Integer outputType = (Integer) session.getAttribute("OUTPUT_TYPE");
		session.removeAttribute("OUTPUT_TYPE");
		if (session.getAttribute("JDOODLE") != null) {
			if (outputType != null) {
				if (outputType == 1)
					mm.put("RESULT", ((Jdoodle) session.getAttribute("JDOODLE")).getOutput());
				else if (outputType == 2)
					mm.put("RESULT_WRONG", ((Jdoodle) session.getAttribute("JDOODLE")).getOutput());
				else
					mm.put("RESULT_ERROR", ((Jdoodle) session.getAttribute("JDOODLE")).getOutput());
			}
		}
		session.removeAttribute("JDOODLE");
		return new ModelAndView("HomeLessionProjectAjaxResult");
	}
	
	@RequestMapping(value = "/ajax2", method = RequestMethod.GET)
	public ModelAndView load_button(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		if (session.getAttribute("SESSION_IS_TRUE") != null) {
			mm.put("ISTRUE", session.getAttribute("SESSION_IS_TRUE"));
			session.removeAttribute("SESSION_IS_TRUE");
		}
		if (session.getAttribute("SESSION_IS_DONE") != null) {
			mm.put("IS_DONE", session.getAttribute("SESSION_IS_DONE"));
			session.removeAttribute("SESSION_IS_DONE");
		}
		if (session.getAttribute("SESSION_NEXT_LESSION") != null) {
			mm.put("NEXT_LESSION", session.getAttribute("SESSION_NEXT_LESSION"));
			session.removeAttribute("SESSION_NEXT_LESSION");
		}
		mm.put("QUESTION_COUNT", session.getAttribute("SESSION_QUESTION_COUNT"));
		session.removeAttribute("SESSION_QUESTION_COUNT");
		mm.put("SELECTED_QUESTION", session.getAttribute("SESSION_QUESTION"));
		session.removeAttribute("SESSION_QUESTION");
		return new ModelAndView("HomeLessionProjectAjaxButton");
	}
	
	@RequestMapping(value = "/next", method = RequestMethod.POST)
	public void nextQuestion(@CookieValue(value = "lang", defaultValue = "vi") String lang, HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session,
			@RequestParam(value = "nameAscii") String nameAscii, @RequestParam(value = "nameAscii2") String nameAscii2, @RequestParam(value = "questionId") Integer questionId) {
		Lession lession = new LessionDAO().findLessionByNameAsciiEager2(nameAscii, nameAscii2, lang);
		session.setAttribute("SESSION_LESSION", lession);
		Question question = new QuestionDAO().findQuestionEager(lession, questionId);
		session.setAttribute("SESSION_QUESTION", question);
		Course course = new CourseDAO().findCoursebyNameAscii(nameAscii, lang);
		Record record = new Record();
		record = new RecordDAO().findRecord(course, (Member) session.getAttribute("MEMBER"));
		session.setAttribute("SESSION_RECORD_QUESTION", new RecordQuestionDAO().findRecordQuestion(record, question));
	}
	
	@RequestMapping(value = "/next/ajax", method = RequestMethod.GET)
	public ModelAndView nextQuestion_ajax(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		mm.put("SELECTED_LESSION", session.getAttribute("SESSION_LESSION"));
		session.removeAttribute("SESSION_LESSION");
		mm.put("SELECTED_QUESTION", session.getAttribute("SESSION_QUESTION"));
		session.removeAttribute("SESSION_QUESTION");
		RecordQuestion recordQuestion = (RecordQuestion) session.getAttribute("SESSION_RECORD_QUESTION");
		session.removeAttribute("SESSION_RECORD_QUESTION");
		if (recordQuestion != null) {
			mm.put("TEMP_CODE", recordQuestion.getTempCode());				
		}
		return new ModelAndView("HomeLessionProjectAjax");
	}
	
	@RequestMapping(value = "/next/ajax2", method = RequestMethod.POST)
	public void nextQuestion2(@CookieValue(value = "lang", defaultValue = "vi") String lang, HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session,
			@RequestParam(value = "nameAscii") String nameAscii, @RequestParam(value = "nameAscii2") String nameAscii2, @RequestParam(value = "questionId") Integer questionId) {
		Lession lession = new LessionDAO().findLessionByNameAsciiEager2(nameAscii, nameAscii2, lang);
		session.setAttribute("SESSION_LESSION", lession);
		Question question = new QuestionDAO().findQuestionEager(lession, questionId);
		session.setAttribute("SESSION_QUESTION", question);
		Course course = new CourseDAO().findCoursebyNameAscii(nameAscii, lang);
		Record record = new Record();
		record = new RecordDAO().findRecord(course, (Member) session.getAttribute("MEMBER"));
		session.setAttribute("SESSION_RECORD_QUESTION", new RecordQuestionDAO().findRecordQuestion(record, question));
		Lession nextLession = new LessionDAO().getLession(question.getLession().getSyllabus(), question.getLession().getOrderDisplay() + 1);
		session.setAttribute("SESSION_NEXT_LESSION", nextLession);
	}
	
	@RequestMapping(value = "/next/ajax2", method = RequestMethod.GET)
	public ModelAndView nextQuestion2_ajax2(@CookieValue(value = "lang", defaultValue = "vi") String lang,
			HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session) {
		mm.put("SELECTED_LESSION", session.getAttribute("SESSION_LESSION"));
		session.removeAttribute("SESSION_LESSION");
		mm.put("SELECTED_QUESTION", session.getAttribute("SESSION_QUESTION"));
		session.removeAttribute("SESSION_QUESTION");
		Integer questionCount = new QuestionDAO().getCountQuestion((Lession) mm.get("SELECTED_LESSION"));
		mm.put("QUESTION_COUNT", questionCount);
		RecordQuestion recordQuestion = (RecordQuestion) session.getAttribute("SESSION_RECORD_QUESTION");
		session.removeAttribute("SESSION_RECORD_QUESTION");
		if (recordQuestion != null) {
			if (recordQuestion.isIsPass() && recordQuestion.getQuestion().getOrderDisplay() != questionCount)
				mm.put("ISTRUE", true);
			else if (recordQuestion.isIsPass() && recordQuestion.getQuestion().getOrderDisplay() == questionCount) {
				mm.put("NEXT_LESSION", session.getAttribute("SESSION_NEXT_LESSION"));
				mm.put("IS_DONE", true);
			}
		}
		session.removeAttribute("SESSION_NEXT_LESSION");
		return new ModelAndView("HomeLessionProjectAjaxNav");
	}
}
