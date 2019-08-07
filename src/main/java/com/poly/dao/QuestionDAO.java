package com.poly.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Lession;
import com.poly.entity.Question;

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
				cr.addOrder(Order.asc("order"));
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
	
}
