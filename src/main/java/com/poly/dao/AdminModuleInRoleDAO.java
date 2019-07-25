package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.AdminModuleInRole;

public class AdminModuleInRoleDAO extends AbstractDAO {

	public AdminModuleInRoleDAO() {
		super(AdminModuleInRole.class);
	}

	public List findAllModuleIdByRoleId(int roleId) {
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			Criteria cr = session.createCriteria(AdminModuleInRole.class, "mr");
			cr.createAlias("roleId", "roleId");
			cr.add(Restrictions.eq("roleId.id", roleId));
			return cr.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public int create(int roleId, int[] ids) throws Exception {
		Transaction trans = null;
		Session session = null;
		int result = 0;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			session.createSQLQuery("delete from AdminModuleInRole where AdminRoleID=:roleId")
					.setParameter("roleId", roleId).executeUpdate();
			if (ids.length > 0) {
				StringBuilder sB = new StringBuilder();
				sB.append("insert into AdminModuleInRole(AdminRoleID,AdminModuleID) values ");
				for (Integer id : ids) {
					sB.append("(:roleId,").append(id).append("),");
				}
				session.createSQLQuery(sB.toString().substring(0, sB.toString().length() - 1))
						.setParameter("roleId", roleId).executeUpdate();
			}
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
