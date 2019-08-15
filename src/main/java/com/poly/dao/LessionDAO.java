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
import com.poly.entity.Lession;
import com.poly.entity.LessionType;
import com.poly.entity.Syllabus;
import com.poly.utils.StringUtils;

public class LessionDAO extends AbstractDAO {

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

	public Lession findEager(Integer id) {
		Session session = null;
		Lession syllabus = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Lession.class);
				cr.createAlias("syllabus", "syllabus", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabus", FetchMode.JOIN);
				cr.createAlias("syllabus.course", "syllabus.course", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("syllabus.course", FetchMode.JOIN);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("id", id));
				syllabus = (Lession) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return syllabus;
	}
	
	public Lession findLessionType(Integer id) {
		Session session = null;
		Lession syllabus = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Lession.class);
				cr.createAlias("lessionType", "lessionType", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("lessionType", FetchMode.JOIN);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("id", id));
				syllabus = (Lession) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return syllabus;
	}

	public Integer create(Map module) throws Exception {
		Transaction trans = null;
		Session session = null;
		Integer result = null;
		try {
			Lession obj = new Lession();
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			int SyllabusID = Integer.valueOf(module.get("syllabus").toString());
			obj.setSyllabus((Syllabus) new SyllabusDAO().find(SyllabusID));
			int LessionTypeID = Integer.valueOf(module.get("lessionType").toString());
			obj.setLessionType((LessionType) new LessionTypeDAO().find(LessionTypeID));
			obj.setDescription(module.get("description") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("description").toString()));
			obj.setNameAscii(module.get("nameAscii") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("nameAscii").toString()));
			obj.setOrderDisplay(
					module.get("orderDisplay") == null ? null : Integer.valueOf(module.get("orderDisplay").toString()));
			obj.setIsActive(Boolean.valueOf(module.get("isActive").toString()));
			obj.setIsPro(Boolean.valueOf(module.get("isPro").toString()));
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
			Lession obj = (Lession) find(Integer.valueOf(module.get("id").toString()));
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			obj.setName(
					module.get("name") == null ? null : StringUtils.escapeHtmlEntity(module.get("name").toString()));
			int SyllabusID = Integer.valueOf(module.get("syllabus").toString());
			obj.setSyllabus((Syllabus) new SyllabusDAO().find(SyllabusID));
			int LessionTypeID = Integer.valueOf(module.get("lessionType").toString());
			obj.setLessionType((LessionType) new LessionTypeDAO().find(LessionTypeID));
			obj.setDescription(module.get("description") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("description").toString()));
			obj.setNameAscii(module.get("nameAscii") == null ? null
					: StringUtils.escapeHtmlEntity(module.get("nameAscii").toString()));
			obj.setOrderDisplay(
					module.get("orderDisplay") == null ? null : Integer.valueOf(module.get("orderDisplay").toString()));
			obj.setIsActive(Boolean.valueOf(module.get("isActive").toString()));
			obj.setIsPro(Boolean.valueOf(module.get("isPro").toString()));
			session.update(obj);
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public int deleteLession(int Id) throws Exception {
		Transaction trans = null;
		Session session = null;
		int result = 0;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			result = session.createSQLQuery("update Lession set isDeleted=1 where id=:id").setParameter("id", Id)
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
