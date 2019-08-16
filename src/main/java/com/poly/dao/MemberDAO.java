package com.poly.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

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
import com.poly.utils.StringUtils;

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

	public Member findEager(Integer memberID) {
		Session session = null;
		Member obj = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Member.class);
				cr.createAlias("user", "user", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("user", FetchMode.JOIN);
				cr.add(Restrictions.eq("id", memberID));
				obj = (Member) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return obj;
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

	public void edit(Map module) throws Exception {
		Transaction trans = null;
		Session session = null;
		try {
			Member obj = (Member) find(Integer.valueOf(module.get("id").toString()));
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			User user = new UserDAO().getUser(module.get("username").toString());
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			obj.setUser(user);
			obj.setEmail(
					module.get("email") == null ? null : StringUtils.escapeHtmlEntity(module.get("email").toString()));
			obj.setAddress(module.get("address") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("address").toString()));
			if (!StringUtils.isEmpty(module.get("trailExpiredDate"))) {
				obj.setTrailExpiredDate((new Timestamp(new SimpleDateFormat("dd-MM-yyyy")
						.parse(module.get("trailExpiredDate").toString()).getTime())));
			}
			if (!StringUtils.isEmpty(module.get("proExpiredDate"))) {
				obj.setProExpiredDate((new Timestamp(
						new SimpleDateFormat("dd-MM-yyyy").parse(module.get("proExpiredDate").toString()).getTime())));
			}

			session.update(obj);
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public Member checkLogin(String username, String password) {
		Session session = null;
		Member result = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			User usr = null;
			if (session != null) {
				usr = new UserDAO().getUserLogin(username, password);
				if (usr != null) {
					Criteria cr = session.createCriteria(Member.class);
					cr.add(Restrictions.eq("user", usr));
					cr.add(Restrictions.eq("isDeleted", false));
					result = (Member) cr.uniqueResult();
				}
			}
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return result;
	}
}
