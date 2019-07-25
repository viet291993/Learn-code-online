package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Course;

public class CourseDAO extends AbstractDAO {

	public CourseDAO() {
		super(Course.class);
	}

	public List<Course> findAllCourse() {
		Session session = null;
		List<Course> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Course.class);
				cr.createAlias("syllabuses", "syllabuses", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabuses", FetchMode.JOIN);
				list = (List<Course>) cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}
}
