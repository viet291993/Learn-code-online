package com.poly.dao;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Lession;

public class LessionDAO extends AbstractDAO{

	public LessionDAO() {
		super(Lession.class);
	}
	
	public Lession findLessionByNameAscii2(String nameAscii, String nameAscii2, String lang) {
		Session session = null;
		Lession lession = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Lession.class);
				cr.createAlias("syllabus", "syllabus", JoinType.INNER_JOIN);
				cr.createAlias("syllabus.course", "syllabus.course", JoinType.INNER_JOIN);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("syllabus.course.id", new CourseDAO().findIdByNameAscii(nameAscii, lang)));
				cr.add(Restrictions.eq("nameAscii", nameAscii2));
				lession = (Lession) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return lession;
	}
	
}
