package com.poly.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.poly.bean.Alert;
import com.poly.dao.CourseDAO;
import com.poly.entity.Course;
import com.poly.utils.LogUtils;
import com.poly.utils.StaticEnum;

import javafx.util.Pair;

@Controller
@RequestMapping("/Admin/Course")
public class AdminCourseController {
	
	@RequestMapping(value = "/ListCourse", method = RequestMethod.GET)
	public String ListCourse(ModelMap mm) {
		List<Course> result = new CourseDAO().fillAll(false);
		mm.put("ITEMS_LIST", result);
		return "AdminListCourse";
	}

	@RequestMapping(value = "/ListCourse/Ajax", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListCourseAjax(ModelMap mm) {
		List<Course> result = new CourseDAO().fillAll(false);
		mm.put("ITEMS_LIST", result);

		return new ModelAndView("Ajax.AdminListCourse");
	}

	@RequestMapping(value = "/ListCourse/ViewInsert", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListCourseViewInsert() {
		return new ModelAndView("Ajax.AdminListCourseInsertModal");
	}

	@RequestMapping(value = "/ListCourse/Insert", method = RequestMethod.POST)
	@ResponseBody
	public Pair InsertCourse(@RequestParam(value = "name") String name, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			Course course = new Course();
			course.setName(name);
			new CourseDAO().create(course);
			LogUtils.logs(myId, "Tạo khóa học " + course.getName() + " thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Tạo khóa học thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Tạo khóa học thất bại");
			return new Pair(0,
					Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Tạo khóa học không thành công"));
		}
	}
	
	@RequestMapping(value = "/ListCourse/Syllabus/{id}", method = RequestMethod.GET)
	public String ListSyllabus(@PathVariable Integer id,@CookieValue(value = "lang", defaultValue = StaticEnum.LANGUAGE_DEFAULT_CODE) String lang,ModelMap mm) {
		Course course  = new CourseDAO().findCourseByIDEager(id, lang);
		mm.put("COURSE", course);
		return "AdminListCourseSyllabus";
	}

	@RequestMapping(value = "/ListCourse/Syllabus/Ajax/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListSyllabusAjax(@PathVariable Integer id,@CookieValue(value = "lang", defaultValue = StaticEnum.LANGUAGE_DEFAULT_CODE) String lang,ModelMap mm) {
		Course course  = new CourseDAO().findCourseByIDEager(id, lang);
		mm.put("COURSE", course);
		return new ModelAndView("Ajax.AdminListCourseSyllabus");
	}
}
