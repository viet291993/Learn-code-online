package com.poly.utils;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Admin;
import com.poly.entity.AdminLogs;

public class LogUtils {

	public static void logs(int adminID, String content) {
		Transaction trans = null;
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			AdminLogs log = new AdminLogs();
			log.setAdmin((Admin) session.get(Admin.class, adminID));
			log.setLogContent(content);
			session.save(log);
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (Exception e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			e.printStackTrace();
		}
	}

}
