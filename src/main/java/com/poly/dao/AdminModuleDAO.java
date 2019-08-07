package com.poly.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.AdminModule;
import com.poly.utils.StringUtils;

public class AdminModuleDAO extends AbstractDAO {

	public AdminModuleDAO() {

		super(AdminModule.class);
	}

	public List<AdminModule> findAllModuleByLevel(int parentId) {
		Session session = null;
		List<AdminModule> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(AdminModule.class, "m");
				cr.createAlias("adminModules", "adminModules", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("adminModules", FetchMode.JOIN);
				cr.add(Restrictions.eq("m.adminModule.id", parentId));
				cr.add(Restrictions.eq("isDeleted", false));
				cr.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
				cr.addOrder(Order.desc("m.orderNumber"));
				list = cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}

	public Integer create(Map module) throws Exception {
		Transaction trans = null;
		Session session = null;
		Integer result = null;
		try {
			AdminModule obj = new AdminModule();
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			obj.setController(module.get("controller") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("controller").toString()));
			obj.setAdminModule(session.get(AdminModule.class, (Integer.valueOf(module.get("module").toString()))));
			obj.setIcon(
					module.get("icon") == null ? null : StringUtils.escapeHtmlEntity(module.get("icon").toString()));
			obj.setIsShow(Boolean.valueOf(module.get("isShow").toString()));
			obj.setOrderNumber(
					module.get("orderNumber") == null ? null : Integer.valueOf(module.get("orderNumber").toString()));
			result = (Integer) session.save(obj);
			session.flush();
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return result;
	}

	public void edit(Map module) throws Exception {
		Transaction trans = null;
		Session session = null;
		try {
			AdminModule obj = (AdminModule) find(Integer.valueOf(module.get("id").toString()));
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			obj.setController(module.get("controller") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("controller").toString()));
			obj.setIcon(
					module.get("icon") == null ? null : StringUtils.escapeHtmlEntity(module.get("icon").toString()));
			obj.setOrderNumber(
					module.get("orderNumber") == null ? null : Integer.valueOf(module.get("orderNumber").toString()));
			session.update(obj);
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public int deleteModule(int Id) throws Exception {
		Transaction trans = null;
		Session session = null;
		int result = 0;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			result = session.createSQLQuery("update AdminModule set isDeleted=1 where id=:id").setParameter("id", Id)
					.executeUpdate();
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return result;
	}
	
}
