package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Language;
import com.poly.entity.Question;

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
