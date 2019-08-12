package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Member;
import com.poly.entity.User;

public class MemberDAO extends AbstractDAO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 918676907775092869L;

	public MemberDAO() {
		super(Member.class);
	}

	public List<Member> fillAll() {
		Session session = null;
		List<Member> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Member.class);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.createAlias("user", "user", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("user", FetchMode.JOIN);
				list = cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}

	public void block(Integer id, Boolean status) throws Exception {
		Session session = null;
		Transaction trans = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				trans = session.beginTransaction();
				Query query = session.createSQLQuery("update Member set isActive=:isActive where id=:id")
						.setParameter("isActive", status).setParameter("id", id);
				query.executeUpdate();
				HibernateConfiguration.getInstance().commitTransaction(trans);
			}
		} catch (Exception e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public void deleteMember(int id) throws Exception {
		Session session = null;
		Transaction trans = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				trans = session.beginTransaction();
				Query query = session.createSQLQuery("update Member set isDeleted=1 where id=" + id);
				query.executeUpdate();
				HibernateConfiguration.getInstance().commitTransaction(trans);
			}
		} catch (Exception e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
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
