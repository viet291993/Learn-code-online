package com.poly.dao;

import java.util.List;
import java.util.Map;

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
import com.poly.entity.Course;
import com.poly.entity.Lession;
import com.poly.entity.Member;
import com.poly.entity.Question;
import com.poly.entity.QuestionInstruction;
import com.poly.entity.Quiz;
import com.poly.entity.Record;
import com.poly.entity.RecordQuestion;
import com.poly.entity.Syllabus;
import com.poly.utils.StringUtils;

public class RecordQuestionDAO extends AbstractDAO {

	public RecordQuestionDAO() {
		super(RecordQuestion.class);
	}

	public RecordQuestion findRecordQuestion(Record record, Question question) {
		Session session = null;
		RecordQuestion recordQuestion = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(RecordQuestion.class);
				cr.createAlias("question", "ques", JoinType.INNER_JOIN);
				cr.setFetchMode("ques", FetchMode.JOIN);
				cr.add(Restrictions.eq("record", record));
				cr.add(Restrictions.eq("question", question));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("isDeleted", false));
				recordQuestion = (RecordQuestion) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return recordQuestion;
	}
	
	public RecordQuestion findLastPassQuestion(Record record) {
		Session session = null;
		RecordQuestion recordQuestion = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(RecordQuestion.class);
				cr.createAlias("question", "ques", JoinType.INNER_JOIN);
				cr.setFetchMode("ques", FetchMode.JOIN);
				cr.add(Restrictions.eq("record", record));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("isDeleted", false));
				cr.addOrder(Order.desc("lastUpdate"));
				cr.setMaxResults(1);
				recordQuestion = (RecordQuestion) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return recordQuestion;
	}
}