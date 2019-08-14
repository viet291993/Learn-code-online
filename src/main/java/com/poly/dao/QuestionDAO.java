package com.poly.dao;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Lession;
import com.poly.entity.Question;
import com.poly.entity.Syllabus;

public class QuestionDAO extends AbstractDAO{

	public QuestionDAO() {
		super(Lession.class);
	}
	
	public Question findFirstQuestionByLession(Lession lessionId) {
		Session session = null;
		Question question = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Question.class);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("lession", lessionId));
				cr.addOrder(Order.asc("orderDisplay"));
				cr.setMaxResults(1); 
				question = (Question) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return question;
	}
	
	public Question findQuestion(Lession lessionId, Integer order) {
		Session session = null;
		Question question = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Question.class);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("lession", lessionId));
				cr.add(Restrictions.eq("orderDisplay", order));
				question = (Question) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return question;
	}
	
	public Question findQuestionEager(Lession lessionId, Integer order) {
		Session session = null;
		Question question = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Question.class);
				cr.createAlias("lession", "les", JoinType.INNER_JOIN);
				cr.createAlias("les.syllabus", "syl", JoinType.INNER_JOIN);
				cr.createAlias("syl.course", "cou", JoinType.INNER_JOIN);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("lession", lessionId));
				cr.add(Restrictions.eq("orderDisplay", order));
				question = (Question) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return question;
	}
	
	public Integer getCountQuestion(Lession lessionId) {
		Session session = null;
		Integer count = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Question.class);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("lession", lessionId));
				cr.setProjection(Projections.rowCount());
				count = ((Long) cr.uniqueResult()).intValue();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return count;
	}
	
	public Question findQuestion(Integer questionId) {
		Session session = null;
		Question question = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Question.class);
				cr.createAlias("lession", "les", JoinType.INNER_JOIN);
				cr.setFetchMode("les", FetchMode.SELECT);
				cr.createAlias("les.syllabus", "syl", JoinType.INNER_JOIN);
				cr.setFetchMode("syl", FetchMode.SELECT);
				cr.createAlias("syl.course", "cou", JoinType.INNER_JOIN);
				cr.setFetchMode("cou", FetchMode.SELECT);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("id", questionId));
				question = (Question) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return question;
	}
	
	public Question findEager(Integer id) {
		Session session = null;
		Question question = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Question.class);
				cr.createAlias("course", "course", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("course", FetchMode.JOIN);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("id", id));
				question =(Question) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return question;
	}
	
	public int deleteQuestion(int Id) throws Exception {
		Transaction trans = null;
		Session session = null;
		int result = 0;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			result = session.createSQLQuery("update Question set isDeleted=1 where id=:id").setParameter("id", Id)
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