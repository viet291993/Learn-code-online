package com.poly.dao;

import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.bean.Pager;
import com.poly.config.HibernateConfiguration;
import com.poly.entity.Admin;
import com.poly.entity.AdminModuleInRole;
import com.poly.entity.Member;
import com.poly.entity.User;
import com.poly.utils.CustomFunction;

public class MemberDAO extends AbstractDAO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 918676907775092869L;

	public MemberDAO() {
		super(Member.class);
	}

	public Member checkLogin(String username, String password) throws Exception {
		Session session = null;
		Member result = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			User usr = null;
			if (session != null) {
				usr = new UserDAO().getUserLogin(username, password);
				Criteria cr = session.createCriteria(Member.class);
				cr.add(Restrictions.eq("user", usr));
				cr.add(Restrictions.eq("isDeleted", false));
				result = (Member) cr.uniqueResult();
			}
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return result;
	}
}
