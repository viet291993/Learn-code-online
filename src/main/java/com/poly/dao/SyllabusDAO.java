package com.poly.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Course;
import com.poly.entity.Syllabus;
import com.poly.utils.StringUtils;

public class SyllabusDAO extends AbstractDAO {

	public SyllabusDAO() {
		super(Syllabus.class);
	}

	public Integer create(Map module) throws Exception {
		Transaction trans = null;
		Session session = null;
		Integer result = null;
		try {
			Syllabus obj = new Syllabus();
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			int courseID = Integer.valueOf(module.get("course").toString());
			obj.setCourse((Course) new CourseDAO().find(courseID));
			obj.setDescription(module.get("description") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("description").toString()));
			obj.setOrderDisplay(
					module.get("orderDisplay") == null ? null : Integer.valueOf(module.get("orderDisplay").toString()));
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
			Syllabus obj = (Syllabus) find(Integer.valueOf(module.get("id").toString()));
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			int courseID = Integer.valueOf(module.get("course").toString());
			obj.setCourse((Course) new CourseDAO().find(courseID));
			obj.setDescription(module.get("description") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("description").toString()));
			obj.setOrderDisplay(
					module.get("orderDisplay") == null ? null : Integer.valueOf(module.get("orderDisplay").toString()));
			session.update(obj);
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public int deleteSyllabus(int Id) throws Exception {
		Transaction trans = null;
		Session session = null;
		int result = 0;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			result = session.createSQLQuery("update Syllabus set isDeleted=1 where id=:id").setParameter("id", Id)
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
