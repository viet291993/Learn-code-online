package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.AdminLogs;

public class AdminLogsDAO extends AbstractDAO {

	public AdminLogsDAO() {
		super(AdminLogs.class);
	}

	public List<AdminLogs> fillAllEager() {
		Session session = null;
		List<AdminLogs> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(AdminLogs.class);
				cr.createAlias("admin", "admin", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("admin", FetchMode.JOIN);
				list = cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}
}
