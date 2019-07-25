package com.poly.controller.admin;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.poly.bean.Alert;
import com.poly.bean.Pager;
import com.poly.dao.AdminDAO;
import com.poly.dao.AdminModuleDAO;
import com.poly.dao.AdminModuleInRoleDAO;
import com.poly.dao.AdminRoleDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Admin;
import com.poly.entity.AdminModule;
import com.poly.entity.AdminModuleInRole;
import com.poly.entity.AdminRole;
import com.poly.entity.User;
import com.poly.utils.CustomFunction;
import com.poly.utils.LogUtils;
import com.poly.utils.StaticEnum;
import com.poly.utils.StringUtils;

import javafx.util.Pair;

@Controller
@RequestMapping("/Admin/Permission")
public class AdminPermissionController {

	@RequestMapping(value = "/ListRole", method = RequestMethod.GET)
	public String ListRole(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "displayPerPage", required = false, defaultValue = "10") int displayPerPage,
			@RequestParam(value = "orderColumn", required = false, defaultValue = "id") String orderColmn,
			@RequestParam(value = "asc", required = false, defaultValue = "true") boolean asc, ModelMap mm) {
		System.out.println("HELLO");
		Pager pager = new Pager();
		pager.setAsc(asc);
		pager.setCurrentPage(currentPage);
		pager.setDisplayPerPage(displayPerPage);
		pager.setOrderColumn(orderColmn);
		List result = new AdminRoleDAO().pager(pager);
		mm.put("ITEMS_LIST", result);
		mm.put("PAGER", pager);
		return "AdminListRole";
	}

	@RequestMapping(value = "/ListRole/Ajax", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListRoleAjax(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "displayPerPage", required = false, defaultValue = "10") int displayPerPage,
			@RequestParam(value = "orderColumn", required = false, defaultValue = "id") String orderColmn,
			@RequestParam(value = "asc", required = false, defaultValue = "true") boolean asc, ModelMap mm) {
		Pager pager = new Pager();
		pager.setAsc(asc);
		pager.setCurrentPage(currentPage);
		pager.setDisplayPerPage(displayPerPage);
		pager.setOrderColumn(orderColmn);
		List result = new AdminRoleDAO().pager(pager);
		mm.put("ITEMS_LIST", result);
		mm.put("PAGER", pager);
		return new ModelAndView("Ajax.AdminListRole");
	}

	@RequestMapping(value = "/ListRole/ViewChangePermission/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ChangePermission(@PathVariable Integer id, ModelMap mm, HttpSession session) {
		AdminRole roleAdmin = (AdminRole) new AdminRoleDAO().find(id);
		List<AdminModuleInRole> moduleInRoles = roleAdmin.getAdminModuleInRoles();
		mm.put("MODULE_IN_ROLES_CHECK", moduleInRoles);
		mm.put("MODULES", new AdminModuleDAO().findAllModuleByLevel(1));
		mm.put("CURRENT_ROLE", id);
		return new ModelAndView("Ajax.AdminListRoleChangePermision");
	}

	@RequestMapping(value = { "/ListRole/ChangePermission/{id}" }, method = RequestMethod.POST)
	@ResponseBody
	public Pair ChangePermission(@PathVariable(value = "id") Integer id, @RequestBody int[] ids, ModelMap mm,
			HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			new AdminModuleInRoleDAO().create(id, ids);
			LogUtils.logs(myId, "Phân quyền quản trị thành công");
			return new Pair(1, Alert.createSuccessAlert("Phân quyền quản trị thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Phân quyền quản trị không thành công");
			return new Pair(0, Alert.createErrorAlert("Phân quyền quản trị không thành công"));
		}
	}

	@RequestMapping(value = { "/ListRole/Delete/{id}" }, method = RequestMethod.GET)
	@ResponseBody
	public Pair DeleteRole(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			new AdminRoleDAO().delete(id);
			LogUtils.logs(myId, "Xóa quyền quản trị thành công");
			return new Pair(1, Alert.createSuccessAlert("Xóa quyền quản trị thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Xóa quyền quản trị không thành công");
			return new Pair(0, Alert.createErrorAlert("Xóa quyền quản trị không thành công"));
		}
	}

	@RequestMapping(value = "/ListRole/ViewInsert", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListRoleViewInsert() {
		return new ModelAndView("Ajax.AdminListRoleInsertModal");
	}

	@RequestMapping(value = "/ListRole/Insert", method = RequestMethod.POST)
	@ResponseBody
	public Pair InsertAdminRole(@RequestParam(value = "name") String name, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		try {
			AdminRole roleAdmin = new AdminRole();
			roleAdmin.setName(name);
			new AdminRoleDAO().create(roleAdmin);
			LogUtils.logs(myId, "Tạo quyền quản trị " + roleAdmin.getName() + " thành công");
			return new Pair(1, Alert.createSuccessAlert("Tạo quyền quản trị thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Tạo quyền quản trị thất bại");
			return new Pair(0, Alert.createErrorAlert("Tạo quyền quản trị không thành công"));
		}
	}

	@RequestMapping(value = "/ListAdmin", method = RequestMethod.GET)
	public String ListAdmin(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "displayPerPage", required = false, defaultValue = "10") int displayPerPage,
			@RequestParam(value = "orderColumn", required = false, defaultValue = "id") String orderColmn,
			@RequestParam(value = "asc", required = false, defaultValue = "true") boolean asc, ModelMap mm) {
		Pager pager = new Pager();
		pager.setAsc(asc);
		pager.setCurrentPage(currentPage);
		pager.setDisplayPerPage(displayPerPage);
		pager.setOrderColumn(orderColmn);
		List result = new AdminDAO().pager(pager);
		mm.put("ITEMS_LIST", result);
		mm.put("PAGER", pager);
		return "AdminListAdmin";
	}

	@RequestMapping(value = "/ListAdmin/Ajax", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListAdminAjax(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "displayPerPage", required = false, defaultValue = "10") int displayPerPage,
			@RequestParam(value = "orderColumn", required = false, defaultValue = "id") String orderColmn,
			@RequestParam(value = "asc", required = false, defaultValue = "true") boolean asc, ModelMap mm) {
		Pager pager = new Pager();
		pager.setAsc(asc);
		pager.setCurrentPage(currentPage);
		pager.setDisplayPerPage(displayPerPage);
		pager.setOrderColumn(orderColmn);
		List result = new AdminDAO().pager(pager);
		mm.put("ITEMS_LIST", result);
		mm.put("PAGER", pager);
		return new ModelAndView("Ajax.AdminListAdmin");
	}

	@RequestMapping(value = "/ListAdmin/Delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair delete(@PathVariable Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		if (Objects.equals(myId, id)) {
			LogUtils.logs(myId, "Xóa tài khoản quản trị không thành công: " + id);
			return new Pair(0, Alert.createErrorAlert("Không thể xóa tài khoản của chính mình!"));
		}
		try {

			new AdminDAO().deleteAdmin(id);
			LogUtils.logs(myId, "Xóa tài khoản quản trị thành công: " + id);
			return new Pair(1, Alert.createSuccessAlert("Xóa tài khoản quản trị thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Xóa tài khoản quản trị không thành công: " + id);
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListAdmin/Block/{id}/{status}", method = RequestMethod.GET)
	@ResponseBody
	public Pair block(@PathVariable Integer id, @PathVariable Boolean status, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		if (Objects.equals(myId, id)) {
			LogUtils.logs(myId, (status ? "Mở khóa" : "Khóa") + " tài khoản quản trị không thành công: " + id);
			return new Pair(0, Alert.createErrorAlert("Không thể khóa tài khoản của chính mình!"));
		}
		try {
			new AdminDAO().block(id, status);
			LogUtils.logs(myId, (status ? "Mở khóa" : "Khóa") + " tài khoản quản trị thành công: " + id);
			return new Pair(1,
					Alert.createSuccessAlert((status ? "Mở khóa" : "Khóa") + " tài khoản quản trị thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, (status ? "Mở khóa" : "Khóa") + " tài khoản quản trị không thành công: " + id);
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListAdmin/ViewInsert", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListAdminViewInsert(ModelMap mm) {
		return new ModelAndView("Ajax.ListAdminViewInsert");
	}

	@RequestMapping(value = "/ListAdmin/Insert", method = RequestMethod.POST)
	@ResponseBody
	public Pair register(@RequestBody Map<String, String> map, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		String username = map.get("userName");
		String password = map.get("password");
		String name = map.get("name");
		int adminRoleId = Integer.valueOf(map.get("adminRoleId"));
		int companyID = Integer.valueOf(map.get("companyID"));
		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(name) || StringUtils.isEmpty(password)) {
			LogUtils.logs(myId, "Tạo tài khoản quản trị không thành công");
			return new Pair(0, Alert.createErrorAlert("Vui lòng nhập tất cả các trường!"));
		}
		if (new UserDAO().checkUsernameExist(username)) {
			LogUtils.logs(myId, "Tạo tài khoản quản trị không thành công");
			return new Pair(0, Alert.createErrorAlert("Tên đăng nhập đã tồn tại!"));
		}
		try {
			User temp = new User();
			temp.setUsername(username);
			temp.setPassword(CustomFunction.md5(password));
			User usr = (User) new UserDAO().create(temp);
			if (usr != null) {
				Admin adm = new Admin();
				adm.setName(name);
				adm.setUser(usr);
				adm.setAdminRole(new AdminRole(adminRoleId));
				adm.setIsActive(true);
				adm.setIsDeleted(false);
				/*
				 * if (!StringUtils.isEmpty(map.get("expiredDate"))) { adm.setExpiredDate( new
				 * Timestamp(new
				 * SimpleDateFormat("dd-MM-yyyy").parse(map.get("expiredDate")).getTime())); }
				 */
				if (new AdminDAO().create(adm) != null) {
					LogUtils.logs(myId, "Tạo tài khoản quản trị " + adm.getName() + " thành công");
					return new Pair(1, Alert.createSuccessAlert("Tạo tài khoản quản trị thành công!"));
				} else {
					new UserDAO().deleteUserWhenRegError(usr.getId());
					LogUtils.logs(myId, "Tạo tài khoản quản trị không thành công");
					return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
				}
			} else {
				LogUtils.logs(myId, "Tạo tài khoản quản trị không thành công");
				return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Tạo tài khoản quản trị không thành công");
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListAdmin/ViewEdit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListAdminViewEdit(
			@CookieValue(value = "adminLang", defaultValue = StaticEnum.LANGUAGE_DEFAULT_CODE) String lang,
			@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		Integer companyIDsession = (int) adminSession.get("COMPANY_ID");
		Admin adm = new AdminDAO().findEager(id);
		mm.put("SELECTED_ADMIN", adm);
		/*
		 * if (adm.getExpiredDate() != null) { mm.put("SELECTED_ADMIN_EXPIREDDATE", new
		 * SimpleDateFormat("dd-MM-yyyy").format(adm.getExpiredDate().getTime())); }
		 * else { mm.put("SELECTED_ADMIN_EXPIREDDATE", ""); }
		 */
		return new ModelAndView("Ajax.AdminListAdminEditModal");
	}

	@RequestMapping(value = "/ListAdmin/Edit", method = RequestMethod.POST)
	@ResponseBody
	public Pair EditListAdmin(@RequestBody Map<String, String> map, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		String name = map.get("name");
		int adminRole = Integer.valueOf(map.get("adminRole"));
		if (StringUtils.isEmpty(name)) {
			LogUtils.logs(myId, "Cập nhật tài khoản quản trị " + name + " không thành công");
			return new Pair(0, Alert.createErrorAlert("Vui lòng nhập tất cả các trường!"));
		}
		try {
			User usr = new UserDAO().getUser(map.get("username"));
			Admin adm = new Admin();
			adm.setId(Integer.parseInt(map.get("id")));
			adm.setName(name);
			adm.setUser(usr);
			adm.setAdminRole(new AdminRole(adminRole));
			adm.setIsActive(true);
			adm.setIsDeleted(false);
			/*
			 * if (!StringUtils.isEmpty(map.get("expiredDate"))) { adm.setExpiredDate( new
			 * Timestamp(new
			 * SimpleDateFormat("dd-MM-yyyy").parse(map.get("expiredDate")).getTime())); }
			 */
			new AdminDAO().edit(adm);
			LogUtils.logs(myId, "Cập nhật tài khoản quản trị " + adm.getName() + " thành công");
			return new Pair(1, Alert.createSuccessAlert("Cập nhật tài khoản quản trị thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Cập nhật tài khoản quản trị không thành công");
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ChangePassword", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView ViewChangePassword(@RequestParam(value = "id", required = false) Integer id, ModelMap mm) {
		mm.put("ADMIN_EDIT", id);
		return new ModelAndView("Ajax.ChangePassword");
	}

	@RequestMapping(value = "/ChangePassword", method = RequestMethod.POST)
	@ResponseBody
	public Pair ChangePassword(@RequestParam(value = "oldPass", required = false) String oldPass,
			@RequestParam(value = "id", required = false) Integer id, @RequestParam(value = "newPass") String newPass,
			HttpSession session, ModelMap mm) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int myId = (int) adminSession.get("ADMIN_ID");
		if (!StringUtils.isEmpty(oldPass)) {
			id = myId;
		}
		try {
			int rs = new AdminDAO().changePassword(oldPass, newPass, id);
			if (rs == 1) {
				LogUtils.logs(myId, "Đổi mật khẩu thành công: " + id);
				return new Pair(1, Alert.createSuccessAlert("Đổi mật khẩu thành công!"));
			} else if (!StringUtils.isEmpty(oldPass)) {
				LogUtils.logs(myId, "Đổi mật khẩu thất bại: " + id);
				return new Pair(0, Alert.createErrorAlert("Mật khẩu cũ không chính xác!"));
			} else {
				throw new Exception();
			}
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(myId, "Đổi mật khẩu thất bại: " + id);
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}

	// ListModule
	@RequestMapping(value = "/ListModule", method = RequestMethod.GET)
	public String getDefaultListModuleView(ModelMap mm, HttpSession session) {
		mm.put("MODULES", new AdminModuleDAO().findAllModuleByLevel(1));
		return "AdminListModule";
	}

	// ListModuleAjax
	@RequestMapping(value = "/ListModule/Ajax", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getDefaultListModuleAjaxView(ModelMap mm, HttpSession session) {
		mm.put("MODULES", new AdminModuleDAO().findAllModuleByLevel(1));
		return new ModelAndView("Ajax.AdminListModule");
	}

	@RequestMapping(value = "/ListModule/ViewInsert/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getListModuleInsertView(@PathVariable(value = "id") Integer id, ModelMap mm,
			HttpSession session) {
		AdminModule module = (AdminModule) new AdminModuleDAO().find(id);
		mm.put("MODULE_PARENT", module);
		return new ModelAndView("Ajax.AdminListModuleViewInsert");
	}

	@RequestMapping(value = "/ListModule/Insert", method = RequestMethod.POST)
	@ResponseBody
	public Pair insertModule(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			AdminModule Adm = (AdminModule) module;
			new AdminModuleDAO().create(module);
			LogUtils.logs(admId, "Thêm module " + Adm.getName() + " thành công");
			return new Pair(1, Alert.createSuccessAlert("Thêm module thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Thêm module thất bại");
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListModule/ViewEdit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getListModuleEditView(@PathVariable(value = "id") Integer id, ModelMap mm,
			HttpSession session) {
		AdminModule module = (AdminModule) new AdminModuleDAO().find(id);
		mm.put("MODULE_EDIT", module);
		return new ModelAndView("Ajax.AdminListModuleViewEdit");
	}

	@RequestMapping(value = "/ListModule/Edit", method = RequestMethod.POST)
	@ResponseBody
	public Pair editModule(@RequestBody Map module, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			AdminModule Adm = (AdminModule) module;
			new AdminModuleDAO().edit(module);
			LogUtils.logs(admId, "Cập nhật module " + Adm.getName() + " thành công");
			return new Pair(1, Alert.createSuccessAlert("Cập nhật module thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Cập nhật module không thành công");
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListModule/Delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair deleteCustomer(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			new AdminModuleDAO().deleteModule(id);
			LogUtils.logs(admId, "Xóa module thành công");
			return new Pair(1, Alert.createSuccessAlert("Xóa module thành công! " + id));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Xóa module không thành công");
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}

	@RequestMapping(value = "/ListModule/ChangeStatus/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Pair changeStatusCustomer(@PathVariable(value = "id") Integer id, ModelMap mm, HttpSession session) {
		Map adminSession = (Map) session.getAttribute("ADMIN");
		int admId = (int) adminSession.get("ADMIN_ID");
		try {
			AdminModule module = (AdminModule) new AdminModuleDAO().find(id);
			module.setIsShow(!module.getIsShow());
			new AdminModuleDAO().edit(module);
			LogUtils.logs(admId, (module.getIsShow() ? "Hiện" : "Ẩn") + " module thành công " + id);
			return new Pair(1, Alert.createSuccessAlert((module.getIsShow() ? "Hiện" : "Ẩn") + " module thành công!"));
		} catch (Exception e) {
			e.printStackTrace();
			LogUtils.logs(admId, "Cập nhật trạng thái module không thành công");
			return new Pair(0, Alert.createErrorAlert("Đã xảy ra lỗi. Vui lòng thử lại sau!"));
		}
	}
}