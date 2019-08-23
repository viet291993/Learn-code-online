package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Lession;
import com.poly.entity.Question;
import com.poly.entity.Quiz;

public class QuizDAO extends AbstractDAO{

	public QuizDAO() {
		super(Quiz.class);
	}
	
	public List<Quiz> getAllQuizByQuestion(Question question) {
		Session session = null;
		List<Quiz> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Quiz.class);
				cr.add(Restrictions.eq("isDeleted", false));
				//cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("question", question));
				list = (List<Quiz>) cr.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return list;
	}
	
	public Quiz findQuiz(Integer quizId) {
		Session session = null;
		Quiz quiz = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Quiz.class);
				cr.add(Restrictions.eq("isDeleted", false));
				//cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("id", quizId));
				cr.setMaxResults(1);
				quiz = (Quiz) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return quiz;
	}
	
	public Integer getCountQuiz(Question question) {
		Session session = null;
		Integer count = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Quiz.class);
				cr.add(Restrictions.eq("isDeleted", false));
				//cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("question", question));
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
}