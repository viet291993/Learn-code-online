package com.poly.controller.user;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.poly.dao.CourseDAO;
import com.poly.dao.MemberDAO;
import com.poly.entity.Member;

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

	@RequestMapping(value = "/promembership", method = RequestMethod.POST)
	public ModelAndView proMemberUpdate(@RequestParam(value = "idMember") Integer idMember, ModelMap mm,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			Member member = (Member) new MemberDAO().find(idMember);
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DAY_OF_MONTH, 7);
			Timestamp date = new Timestamp(cal.getTimeInMillis());
			member.setTrailExpiredDate(date);
			new MemberDAO().edit(member);
			session.setAttribute("Alert", "<script>swal('Thành công', 'Đăng ký dùng thử PRO thành công!', 'success')</script>");
		} catch (Exception e) {
			session.setAttribute("Alert", "<script>swal('Lỗi', 'Đăng ký dùng thử PRO thất bại!', 'error')</script>");
		}
		return new ModelAndView("redirect:/promembership");
	}

	@RequestMapping(value = "/forums", method = RequestMethod.GET)
	public ModelAndView forums(ModelMap mm, HttpServletRequest request) {
		return new ModelAndView("HomeForums");
	}
}
