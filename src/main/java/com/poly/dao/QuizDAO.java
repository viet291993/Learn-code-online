package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Lession;
import com.poly.entity.Question;
import com.poly.entity.Quiz;

public class QuizDAO extends AbstractDAO{

	public QuizDAO() {
		super(Lession.class);
	}
	
	public List<Quiz> getAllQuizByQuestion(Question question) {
		Session session = null;
		List<Quiz> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Quiz.class);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("isActive", true));
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
	
}