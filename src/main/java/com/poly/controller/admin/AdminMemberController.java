package com.poly.controller.admin;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.poly.bean.Alert;
import com.poly.dao.AdminDAO;
import com.poly.dao.AdminModuleDAO;
import com.poly.dao.CourseDAO;
import com.poly.dao.MemberDAO;
import com.poly.entity.AdminModule;
import com.poly.entity.Course;
import com.poly.entity.Member;
import com.poly.utils.LogUtils;

import javafx.util.Pair;

@Controller
@RequestMapping("/Admin/Member")
public class AdminMemberController {

	@RequestMapping(value = "/ListMember", method = RequestMethod.GET)
	public String ListMember(ModelMap mm) {
		List<Member> result = new MemberDAO().fillAll();
		mm.put("ITEMS_LIST", result);
		return "AdminListMember";
	}

	@RequestMapping(value = "/ListMember/Ajax", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListMemberAjax(ModelMap mm) {
		List<Member> result = new MemberDAO().fillAll();
		mm.put("ITEMS_LIST", result);
		return new ModelAndView("Ajax.AdminListMember");
	}

	@RequestMapping(value = "/ListMember/ViewEdit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getListMemberEditView(@PathVariable(value = "id") Integer id, ModelMap mm,
			HttpSession session) {
		Member module = (Member) new MemberDAO().findEager(id);
		mm.put("MODULE_EDIT", module);
		return new ModelAndView("Ajax.AdminListMemberEditModal");
	}

	@RequestMapping(value = "/ListMember/Edit", method = RequestMethod.POST)
	@ResponseBody
	public Pair editModule(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			new MemberDAO().edit(module);
			LogUtils.logs(admId, "Cập nhật học viên " + module.get("name").toString() + " thành công");
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Cập nhật học viên thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Cập nhật học viên không thành công");
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListMember/Delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair delete(@PathVariable Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		if (Objects.equals(myId, id)) {
			LogUtils.logs(myId, "Xóa học viên không thành công: " + id);
			return new Pair(0,
					Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Không thể xóa tài khoản của chính mình!"));
		}
		try {

			new MemberDAO().deleteMember(id);
			LogUtils.logs(myId, "Xóa học viên thành công: " + id);
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công", "Xóa học viên thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Xóa học viên không thành công: " + id);
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListMember/Block/{id}/{status}", method = RequestMethod.GET)
	@ResponseBody
	public Pair block(@PathVariable Integer id, @PathVariable Boolean status, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		if (Objects.equals(myId, id)) {
			LogUtils.logs(myId, (status ? "Mở khóa" : "Khóa") + " tài khoản học viên không thành công: " + id);
			return new Pair(0,
					Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Không thể khóa tài khoản của chính mình!"));
		}
		try {
			new MemberDAO().block(id, status);
			LogUtils.logs(myId, (status ? "Mở khóa" : "Khóa") + " học viên thành công: " + id);
			return new Pair(1, Alert.createAlert(Alert.TYPE_SUCCESS, "Thành công",
					(status ? "Mở khóa" : "Khóa") + " học viên thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, (status ? "Mở khóa" : "Khóa") + " học viên không thành công: " + id);
			return new Pair(0, Alert.createAlert(Alert.TYPE_ERROR, "Đã xảy ra lỗi", "Vui lòng thử lại sau!"));
		}
	}

}
