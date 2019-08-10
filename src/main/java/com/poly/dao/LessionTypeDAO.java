package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.LessionType;

public class LessionTypeDAO extends AbstractDAO {

	public LessionTypeDAO() {
		super(LessionType.class);
	}

	public List<LessionType> fillAll() {
		Session session = null;
		List<LessionType> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(LessionType.class);
				cr.add(Restrictions.eq("isDeleted", false));
				list = (List<LessionType>) cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}
}
