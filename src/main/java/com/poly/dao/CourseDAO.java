package com.poly.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.AdminModule;
import com.poly.entity.AdminModuleInRole;
import com.poly.entity.AdminRole;
import com.poly.entity.Course;
import com.poly.entity.Language;
import com.poly.utils.StringUtils;

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
				cr.createAlias("syllabuses", "sys", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("sys", FetchMode.JOIN);
				cr.add(Restrictions.eq("sys.isActive", true));
				cr.add(Restrictions.eq("sys.Deleted", false));
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
	
	public Course findCoursebyNameAscii(String nameAscii, String lang) {
		Session session = null;
		Course course = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Course.class);
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

	public Course findCoursebyNameAsciiEager(String nameAscii, String lang) {
		Session session = null;
		Course course = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Course.class);
				cr.createAlias("syllabuses", "syllabus", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabus", FetchMode.JOIN);
				cr.createAlias("syllabuses.lessions", "lession", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("lession", FetchMode.JOIN);
				cr.add(Restrictions.eq("syllabus.isActive", true));
				cr.add(Restrictions.eq("syllabus.isDeleted", false));
				cr.add(Restrictions.eq("lession.isActive", true));
				cr.add(Restrictions.eq("lession.isDeleted", false));
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
				cr.createAlias("language", "language", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("language", FetchMode.JOIN);
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
				cr.createAlias("syllabuses.lessions.questions", "syllabuses.lessions.questions",
						JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabuses.lessions.questions", FetchMode.JOIN);
				cr.createAlias("syllabuses.lessions.lessionType", "syllabuses.lessions.lessionType",
						JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabuses.lessions.lessionType", FetchMode.JOIN);
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

	public Integer create(Map module) throws Exception {
		Transaction trans = null;
		Session session = null;
		Integer result = null;
		try {
			Course obj = new Course();
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			int languageID = Integer.valueOf(module.get("languageID").toString());
			obj.setLanguage(new LanguageDAO().find(languageID));
			obj.setDescription(module.get("description") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("description").toString()));
			obj.setContent(module.get("content") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("content").toString()));
			obj.setTimeToComplete(module.get("timeToComplete") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("timeToComplete").toString()));
			obj.setPrerequisite(module.get("prerequisite") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("prerequisite").toString()));
			obj.setNameAscii(module.get("nameAscii") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("nameAscii").toString()));
			obj.setIsActive(true);
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
			Course obj = (Course) find(Integer.valueOf(module.get("id").toString()));
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			int languageID = Integer.valueOf(module.get("languageID").toString());
			obj.setLanguage(new LanguageDAO().find(languageID));
			obj.setDescription(module.get("description") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("description").toString()));
			obj.setContent(module.get("content") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("content").toString()));
			obj.setTimeToComplete(module.get("timeToComplete") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("timeToComplete").toString()));
			obj.setPrerequisite(module.get("prerequisite") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("prerequisite").toString()));
			obj.setNameAscii(module.get("nameAscii") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("nameAscii").toString()));
			session.update(obj);
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public int deleteCourse(int Id) throws Exception {
		Transaction trans = null;
		Session session = null;
		int result = 0;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			result = session.createSQLQuery("update Course set isDeleted=1 where id=:id").setParameter("id", Id)
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