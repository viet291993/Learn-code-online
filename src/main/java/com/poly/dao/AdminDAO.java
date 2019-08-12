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
import com.poly.entity.User;
import com.poly.utils.CustomFunction;

public class AdminDAO extends AbstractDAO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 918676907775092869L;

	public AdminDAO() {
		super(Admin.class);
	}

	public List<Admin> fillAll( ) {
		Session session = null;
		List<Admin> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Admin.class);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.createAlias("adminRole", "adminRole", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("adminRole", FetchMode.JOIN);
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

	public Admin checkLogin(String username, String password) throws Exception {
		Session session = null;
		Admin result = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			User usr = null;
			if (session != null) {
				usr = new UserDAO().getUserLogin(username, password);
				Criteria cr = session.createCriteria(Admin.class);
				cr.add(Restrictions.eq("user", usr));
				cr.add(Restrictions.eq("isDeleted", false));
				result = (Admin) cr.uniqueResult();
			}
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return result;
	}

	public void block(Integer id, Boolean status) throws Exception {
		Session session = null;
		Transaction trans = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				trans = session.beginTransaction();
				Query query = session.createSQLQuery("update admin set isActive=:isActive where id=:id")
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

	public Admin findAdminByUsername(String userName) throws Exception {
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			User usr = null;
			usr = new UserDAO().getUser(userName);
			if (session != null && usr != null) {
				Criteria cr = session.createCriteria(Admin.class);
				cr.add(Restrictions.eq("userID", usr));
				cr.add(Restrictions.eq("isDeleted", false));
				return (Admin) cr.uniqueResult();
			}
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return null;
	}

	public Integer getAdminRoleByAdminId(int admId) {
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Admin.class);
				cr.add(Restrictions.eq("id", admId));
				cr.setProjection(Projections.projectionList().add(Projections.property("adminRoleId.id")));
				return (Integer) cr.uniqueResult();
			}
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public Admin findAdminById(Integer id) {
		Session session = null;
		Admin admin = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Admin.class);
				cr.createAlias("adminRole", "adminRole", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("adminRole", FetchMode.JOIN);
				cr.createAlias("adminRole.adminModuleInRoles", "adminModuleInRoles", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("adminModuleInRoles", FetchMode.JOIN);
				cr.add(Restrictions.eq("id", id));
				cr.add(Restrictions.eq("isDeleted", false));
				admin = (Admin) cr.uniqueResult();
				if (admin != null) {
					for (AdminModuleInRole mr : (admin.getAdminRole().getAdminModuleInRoles())) {
						Hibernate.initialize(mr.getAdminModule().getAdminModules());
					}
					admin.getAdminRole().setAdminModuleInRoles(
							admin.getAdminRole().getAdminModuleInRoles().stream().sorted((module1, module2) -> {
								int orderNumber1 = module1.getAdminModule().getOrderNumber() == null ? 0
										: module1.getAdminModule().getOrderNumber();
								int orderNumber2 = module2.getAdminModule().getOrderNumber() == null ? 0
										: module2.getAdminModule().getOrderNumber();
								return Integer.compare(orderNumber2, orderNumber1);
							}).collect(Collectors.toList()));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session.isOpen()) {
				HibernateConfiguration.getInstance().closeSession(session);
			}
		}
		return admin;
	}

	public void deleteAdmin(int id) throws Exception {
		Session session = null;
		Transaction trans = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				trans = session.beginTransaction();
				Query query = session.createSQLQuery("update admin set isDeleted=1 where id=" + id);
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

	/*
	 * public int create(Map admin) throws Exception { Session session = null;
	 * Transaction trans = null; try { session =
	 * HibernateConfiguration.getInstance().openSession(); trans =
	 * session.beginTransaction(); if (admin == null) { return 1; } if
	 * (StringUtils.isEmpty(admin.get("userName").toString()) ||
	 * StringUtils.isEmpty(admin.get("name").toString()) ||
	 * StringUtils.isEmpty(admin.get("password").toString())) { return 2; } Admin a
	 * = new Admin(); a.setName(admin.get("name").toString());
	 * a.setPassword(CustomFunction.md5(admin.get("password").toString()));
	 * a.setUsername(admin.get("userName").toString()); a.setAdminRoleId(new
	 * AdminRole(Integer.parseInt(admin.get("adminRoleId").toString())));
	 * 
	 * a.setIsActive(true); if (findAdminByUsername(a.getUsername()) != null) {
	 * return 3; } session.save(a);
	 * HibernateConfiguration.getInstance().commitTransaction(trans); return 4; }
	 * catch (Exception e) {
	 * HibernateConfiguration.getInstance().rollbackTransaction(trans); throw e; }
	 * finally { HibernateConfiguration.getInstance().closeSession(session); } }
	 */

	public int changePassword(String oldpass, String newpass, int myId) throws Exception {
		Session session = null;
		Transaction trans = null;
		int rs = 0;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			Query q;
			if (oldpass == null) {
				q = session.createSQLQuery(
						"update [User] set password=:newpass where id = (select UserID from Admin where id=:id)");
				q.setParameter("newpass", CustomFunction.md5(newpass)).setParameter("id", myId);
			} else {
				q = session.createSQLQuery(
						"update [User] set password=:newpass where password=:oldpass id = (select UserID from Admin where id=:id)");
				q.setParameter("newpass", CustomFunction.md5(newpass))
						.setParameter("oldpass", CustomFunction.md5(oldpass)).setParameter("id", myId);
			}
			rs = q.executeUpdate();
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (Exception e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return rs;
	}

	public Admin findEager(Integer adminID) {
		Session session = null;
		Admin obj = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Admin.class);
				cr.createAlias("adminRole", "adminRole", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("adminRole", FetchMode.JOIN);
				cr.createAlias("user", "user", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("user", FetchMode.JOIN);
				cr.add(Restrictions.eq("id", adminID));
				obj = (Admin) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return obj;
	}

}
