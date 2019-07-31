package com.poly.dao;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.User;
import com.poly.utils.CustomFunction;

public class UserDAO extends AbstractDAO {

	public UserDAO() {
		super(User.class);
	}

	public User getUserLogin(String username, String password) {
		Session session = null;
		User usr = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(User.class);
				cr.add(Restrictions.eq("username", username));
				usr = (User) cr.uniqueResult();
				if (password != null) {
					if (!CustomFunction.passwordEncryption(password, usr.getSalt()).equals(usr.getPassword())) {
						return null;
					}
				}
			}
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return usr;
	}

	public User getUser(String username) {
		Session session = null;
		User usr = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(User.class);
				cr.add(Restrictions.eq("username", username));
				cr.add(Restrictions.eq("isDeleted", false));
				usr = (User) cr.uniqueResult();
			}
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return usr;
	}

	public void deleteUserWhenRegError(int id) {
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Query q = session.createSQLQuery("delete from Users where id=:id");
				q.setInteger("id", id);
				q.executeUpdate();
			}
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public boolean checkUsernameExist(String username) {
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Query q = session.createSQLQuery("select count(*) from Users where username=:username");
				q.setString("username", username);
				return (int) q.uniqueResult() != 0;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return false;
	}

	public boolean checkUsernameAndPassword(String username, String password) {
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Query q = session
						.createSQLQuery("select count(*) from Users where username=:username and password=:password");
				q.setString("username", username);
				q.setString("password", password);
				return (int) q.uniqueResult() != 0;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return false;
	}

}
