package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
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
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("isDeleted", false));
				list = (List<Course>) cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}

	public List<Course> findAllCourseEager() {
		Session session = null;
		List<Course> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Course.class);
				cr.createAlias("syllabuses", "syllabuses", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabuses", FetchMode.JOIN);
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("isDeleted", false));
				list = (List<Course>) cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}

	public Course findCoursebyNameAsciiEager(String nameAscii, String lang) {
		Session session = null;
		Course course = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Course.class);
				cr.createAlias("syllabuses", "syllabuses", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabuses", FetchMode.JOIN);
				cr.createAlias("syllabuses.lessions", "syllabuses.lessions", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabuses.lessions", FetchMode.JOIN);
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("nameAscii", nameAscii));
				course = (Course) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return course;
	}

	public int findIdByNameAscii(String urlNameAscii, String lang) {
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				return (int) session.createSQLQuery("select id from Course where nameAscii = '" + urlNameAscii + "'")
						.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return -1;
	}
	
	public List<Course> fillAll(Boolean isDelete) {
		Session session = null;
		List<Course> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Course.class);
				cr.add(Restrictions.eq("isDeleted", isDelete));
				list = (List<Course>) cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}
	
	public Course findCourseByIDEager(int id, String lang) {
		Session session = null;
		Course course = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Course.class);
				cr.createAlias("syllabuses", "syllabuses", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabuses", FetchMode.JOIN);
				cr.createAlias("syllabuses.lessions", "syllabuses.lessions", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabuses.lessions", FetchMode.JOIN);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("id", id));
				course = (Course) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return course;
	}
}
