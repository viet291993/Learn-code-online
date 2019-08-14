package com.poly.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.poly.bean.Alert;
import com.poly.dao.CourseDAO;
import com.poly.dao.LanguageDAO;
import com.poly.dao.LessionDAO;
import com.poly.dao.LessionTypeDAO;
import com.poly.dao.SyllabusDAO;
import com.poly.entity.Course;
import com.poly.entity.Language;
import com.poly.entity.Lession;
import com.poly.entity.LessionType;
import com.poly.entity.Syllabus;
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
	public Pair InsertCourse(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			new CourseDAO().create(module);
			LogUtils.logs(myId, "Tạo khóa học " + module.get("name") + " thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Tạo khóa học thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Tạo khóa học thất bại");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Tạo khóa học không thành công"));
		}
	}

	@RequestMapping(value = "/ListCourse/ViewEdit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getListCourseEditView(@PathVariable(value = "id") Integer id, ModelMap mm,
			HttpSession session) {
		Course module = (Course) new CourseDAO().find(id);
		mm.put("SELECTED_COURSE", module);
		return new ModelAndView("Ajax.AdminListCourseEditModal");
	}

	@RequestMapping(value = "/ListCourse/Edit", method = RequestMethod.POST)
	@ResponseBody
	public Pair editModule(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			new CourseDAO().edit(module);
			LogUtils.logs(admId, "Cập nhật khóa học " + module.get("name").toString() + " thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Cập nhật khóa học thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Cập nhật khóa học không thành công");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListCourse/Delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair deleteCourse(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			new CourseDAO().deleteCourse(id);
			LogUtils.logs(admId, "Xóa khóa học thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Xóa khóa học thành công! " + id));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Xóa khóa học không thành công");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListCourse/ChangeStatus/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair changeStatusCourse(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			Course course = (Course) new CourseDAO().find(id);
			course.setIsActive(!course.isIsActive());
			new CourseDAO().edit(course);
			LogUtils.logs(admId,
					(course.isIsActive() ? "Hiện" : "Ẩn") + " khóa học " + course.getName() + " thành công " + id);
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công",
					(course.isIsActive() ? "Hiện" : "Ẩn") + " khóa học " + course.getName() + " thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Cập nhật trạng thái khóa học không thành công");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}
	
	/* Syllabus */
	@RequestMapping(value = "/ListCourse/Syllabus/{id}", method = RequestMethod.GET)
	public String ListSyllabus(@PathVariable Integer id,
			@CookieValue(value = "lang", defaultValue = StaticEnum.LANGUAGE_DEFAULT_CODE) String lang, ModelMap mm) {
		Course course = new CourseDAO().findCourseByIDEager(id, lang);
		mm.put("COURSE", course);
		return "AdminListCourseSyllabus";
	}

	@RequestMapping(value = "/ListCourse/Syllabus/Ajax/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListSyllabusAjax(@PathVariable Integer id,
			@CookieValue(value = "lang", defaultValue = StaticEnum.LANGUAGE_DEFAULT_CODE) String lang, ModelMap mm) {
		Course course = new CourseDAO().findCourseByIDEager(id, lang);
		mm.put("COURSE", course);
		return new ModelAndView("Ajax.AdminListCourseSyllabus");
	}

	@RequestMapping(value = "/ListCourse/Syllabus/ViewInsert/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListCourseSyllabusViewInsert(@PathVariable(value = "id") Integer id, ModelMap mm,
			HttpSession session) {
		Course course = (Course) new CourseDAO().find(id);
		mm.put("SELECTED_COURSE", course);
		return new ModelAndView("Ajax.AdminListCourseSyllabusInsertModal");
	}

	@RequestMapping(value = "/ListCourse/Syllabus/Insert", method = RequestMethod.POST)
	@ResponseBody
	public Pair InsertSyllabus(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			new SyllabusDAO().create(module);
			LogUtils.logs(myId, "Tạo giáo trình " + module.get("name") + " thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Tạo giáo trình thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Tạo giáo trình thất bại");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Tạo giáo trình không thành công"));
		}
	}

	@RequestMapping(value = "/ListCourse/Syllabus/ViewEdit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListCourseSyllabusViewEdit(@PathVariable(value = "id") Integer id, ModelMap mm,
			HttpSession session) {
		Syllabus syllabus = (Syllabus) new SyllabusDAO().findEager(id);
		mm.put("SELECTED_SYLLABUS", syllabus);
		return new ModelAndView("Ajax.AdminListCourseSyllabusEditModal");
	}

	@RequestMapping(value = "/ListCourse/Syllabus/Edit", method = RequestMethod.POST)
	@ResponseBody
	public Pair EditSyllabus(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			new SyllabusDAO().edit(module);
			LogUtils.logs(myId, "Cập nhật giáo trình " + module.get("name") + " thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Cập nhật giáo trình thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Cập nhật giáo trình thất bại");
			return new Pair(0,
					Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Cập nhật giáo trình không thành công"));
		}
	}

	@RequestMapping(value = "/ListCourse/Syllabus/Delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair deleteSyllabus(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			new SyllabusDAO().deleteSyllabus(id);
			LogUtils.logs(admId, "Xóa giáo trình thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Xóa giáo trình thành công! " + id));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Xóa giáo trình không thành công");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListCourse/Syllabus/ChangeStatus/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair changeStatusSyllabus(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			Syllabus syllabus = (Syllabus) new SyllabusDAO().find(id);
			syllabus.setIsActive(!syllabus.isIsActive());
			new SyllabusDAO().edit(syllabus);
			LogUtils.logs(admId, (syllabus.isIsActive() ? "Hiện" : "Ẩn") + " giáo trình " + syllabus.getName()
					+ " thành công " + id);
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công",
					(syllabus.isIsActive() ? "Hiện" : "Ẩn") + " giáo trình " + syllabus.getName() + " thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Cập nhật trạng thái giáo trình không thành công");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}
	
	
	/* Lession */
	@RequestMapping(value = "/ListCourse/Lession/ViewInsert/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListCourseLessionViewInsert(@PathVariable(value = "id") Integer id, ModelMap mm,
			HttpSession session) {
		Lession lession  = (Lession) new LessionDAO().findEager(id);
		mm.put("SELECTED_LESSION", lession);
		return new ModelAndView("Ajax.AdminListCourseLessionInsertModal");
	}

	@RequestMapping(value = "/ListCourse/Lession/Insert", method = RequestMethod.POST)
	@ResponseBody
	public Pair InsertLession(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			new LessionDAO().create(module);
			LogUtils.logs(myId, "Tạo bài học " + module.get("name") + " thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Tạo bài học thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Tạo bài học thất bại");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Tạo bài học không thành công"));
		}
	}

	@RequestMapping(value = "/ListCourse/Lession/ViewEdit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListCourseLessionViewEdit(@PathVariable(value = "id") Integer id, ModelMap mm,
			HttpSession session) {
		Lession lession = (Lession) new LessionDAO().findEager(id);
		mm.put("SELECTED_LESSION", lession);
		return new ModelAndView("Ajax.AdminListCourseLessionEditModal");
	}

	@RequestMapping(value = "/ListCourse/Lession/Edit", method = RequestMethod.POST)
	@ResponseBody
	public Pair EditLession(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			new LessionDAO().edit(module);
			LogUtils.logs(myId, "Cập nhật bài học " + module.get("name") + " thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Cập nhật bài học thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Cập nhật bài học thất bại");
			return new Pair(0,
					Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Cập nhật bài học không thành công"));
		}
	}

	@RequestMapping(value = "/ListCourse/Lession/Delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair deleteLession(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			new LessionDAO().deleteLession(id);
			LogUtils.logs(admId, "Xóa bài học thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Xóa bài học thành công! " + id));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Xóa bài học không thành công");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListCourse/Lession/ChangeStatus/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair changeStatusLession(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			Lession lession = (Lession) new LessionDAO().find(id);
			lession.setIsActive(!lession.isIsActive());
			new SyllabusDAO().edit(lession);
			LogUtils.logs(admId, (lession.isIsActive() ? "Hiện" : "Ẩn") + " bài học " + lession.getName()
					+ " thành công " + id);
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công",
					(lession.isIsActive() ? "Hiện" : "Ẩn") + " bài học " + lession.getName() + " thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Cập nhật trạng thái bài học không thành công");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}
	
	
	/* Setting */
	@RequestMapping(value = "/Setting", method = RequestMethod.GET)
	public String SettingCourse(ModelMap mm) {
		List<Language> list_language = new LanguageDAO().findAll();
		List<LessionType> list_lessionType = new LessionTypeDAO().fillAll();
		mm.put("LIST_LANGUAGE", list_language);
		mm.put("LIST_LESSIONTYPE", list_lessionType);
		return "AdminSettingCourse";
	}

	@RequestMapping(value = "/Setting/Ajax", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView SettingCourseAjax(ModelMap mm) {
		List<Language> list_language = new LanguageDAO().findAll();
		List<LessionType> list_lessionType = new LessionTypeDAO().fillAll();
		mm.put("LIST_LANGUAGE", list_language);
		mm.put("LIST_LESSIONTYPE", list_lessionType);
		return new ModelAndView("Ajax.AdminSettingCourse");
	}

}
