package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Language;

public class LanguageDAO extends AbstractDAO {

	public LanguageDAO() {
		super(Language.class);
	}

	public List<Language> fillAll( ) {
		Session session = null;
		List<Language> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Language.class);
				cr.add(Restrictions.eq("isDeleted", false));
				list = (List<Language>) cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}

}
