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
import com.poly.entity.Lession;
import com.poly.entity.Question;
import com.poly.entity.QuestionInstruction;
import com.poly.entity.Quiz;
import com.poly.utils.StringUtils;

public class QuestionDAO extends AbstractDAO {

	public QuestionDAO() {
		super(Question.class);
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
				cr.createAlias("instructions", "instructions", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("instructions", FetchMode.JOIN);
				cr.createAlias("lession", "lession", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("lession", FetchMode.JOIN);
				cr.createAlias("lession.lessionType", "lession.lessionType", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("lession.lessionType", FetchMode.JOIN);
				cr.createAlias("quizs", "quizs", JoinType.LEFT_OUTER_JOIN);
				cr.setFetchMode("quizs", FetchMode.JOIN);
				cr.add(Restrictions.eq("isDeleted", false));
				cr.add(Restrictions.eq("id", id));
				question = (Question) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return question;
	}

	public void edit(Map module) throws Exception {
		Transaction trans = null;
		Session session = null;
		try {
			Question question = (Question) find(Integer.valueOf(module.get("id").toString()));
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			question.setTitle((String) module.get("title"));
			int LessonID = Integer.valueOf(module.get("lession").toString());
			question.setLession((Lession) new LessionDAO().find(LessonID));
			question.setDescription((String) module.get("description"));
			question.setContent((String) module.get("content"));
			question.setFileName((String) module.get("fileName"));
			question.setDefaultCode((String) module.get("defaultCode"));
			question.setOrderDisplay(
					module.get("orderDisplay") == null ? null : Integer.valueOf(module.get("orderDisplay").toString()));
			question.setIsActive(Boolean.valueOf(module.get("isActive").toString()));
			session.update(question);
			switch (module.get("lessionType").toString()) {
			case "L":
			case "P":
				session.createSQLQuery("update Question_Instruction set isDeleted=1 where Question_id=:QuestionId")
						.setParameter("QuestionId", question.getId()).executeUpdate();
				if (module.get("listInstruction") != null) {
					List listInstruction = (List) module.get("listInstruction");
					for (Object o : listInstruction) {
						Map m = (Map) o;
						if (m.get("insID") != null && !m.get("insID").toString().equals("")) {
							Integer id = Integer.valueOf(m.get("insID").toString());
							QuestionInstruction instruction = session.get(QuestionInstruction.class, id);
							instruction.setContent((String) m.get("insContent"));
							instruction.setHint((String) m.get("insHint"));
							instruction.setRequiredCode((String) m.get("insRequiredCode"));
							instruction.setResult((String) m.get("insResult"));
							instruction.setOrderDisplay(Integer.valueOf(m.get("insOrderDisplay").toString()));
							instruction.setQuestion(question);
							instruction.setIsDeleted(false);
							session.update(instruction);
						} else {
							QuestionInstruction instruction = new QuestionInstruction();
							instruction.setContent((String) m.get("insContent"));
							instruction.setHint((String) m.get("insHint"));
							instruction.setRequiredCode((String) m.get("insRequiredCode"));
							instruction.setResult((String) m.get("insResult"));
							instruction.setOrderDisplay(Integer.valueOf(m.get("insOrderDisplay").toString()));
							instruction.setQuestion(question);
							instruction.setIsDeleted(false);
							session.save(instruction);
						}
					}
				}
				break;
			case "Q":
				session.createSQLQuery("update Quiz set isDeleted=1 where Question_id=:QuestionId")
						.setParameter("QuestionId", question.getId()).executeUpdate();
				if (module.get("listQuiz") != null) {
					List listInstruction = (List) module.get("listQuiz");
					for (Object o : listInstruction) {
						Map m = (Map) o;
						if (m.get("quizId") != null && !m.get("quizId").toString().equals("")) {
							Integer id = Integer.valueOf(m.get("quizId").toString());
							Quiz quiz = session.get(Quiz.class, id);
							quiz.setAnswer((String) m.get("answer"));
							quiz.setIsTrue(Boolean.valueOf(m.get("isTrue").toString()));
							quiz.setQuestion(question);
							quiz.setIsDeleted(false);
							session.update(quiz);
						} else {
							Quiz quiz = new Quiz();
							quiz.setAnswer((String) m.get("answer"));
							quiz.setIsTrue(Boolean.valueOf(m.get("isTrue").toString()));
							quiz.setQuestion(question);
							quiz.setIsDeleted(false);
							session.save(quiz);
						}
					}
				}
				break;
			default:
				break;
			}
			session.flush();
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
	}

	public void create(Map module) throws Exception {
		Transaction trans = null;
		Session session = null;
		try {
			Question question = new Question();
			session = HibernateConfiguration.getInstance().openSession();
			trans = session.beginTransaction();
			question.setTitle((String) module.get("title"));
			int LessonID = Integer.valueOf(module.get("lession").toString());
			question.setLession((Lession) new LessionDAO().find(LessonID));
			question.setDescription((String) module.get("description"));
			question.setContent((String) module.get("content"));
			question.setFileName((String) module.get("fileName"));
			question.setDefaultCode((String) module.get("defaultCode"));
			question.setOrderDisplay(
					module.get("orderDisplay") == null ? null : Integer.valueOf(module.get("orderDisplay").toString()));
			question.setIsActive(Boolean.valueOf(module.get("isActive").toString()));
			session.save(question);
			Integer questionID = (Integer) session.createSQLQuery("select top 1 id from Question order by id desc")
					.uniqueResult();
			question.setId(questionID);
			switch (module.get("lessionType").toString()) {
			case "L":
			case "P":
				if (module.get("listInstruction") != null) {
					List listInstruction = (List) module.get("listInstruction");
					for (Object o : listInstruction) {
						Map m = (Map) o;
						QuestionInstruction instruction = new QuestionInstruction();
						instruction.setContent((String) m.get("insContent"));
						instruction.setHint((String) m.get("insHint"));
						instruction.setRequiredCode((String) m.get("insRequiredCode"));
						instruction.setResult((String) m.get("insResult"));
						instruction.setOrderDisplay(Integer.valueOf(m.get("insOrderDisplay").toString()));
						instruction.setQuestion(question);
						session.save(instruction);
					}
				}
				break;
			case "Q":
				if (module.get("listQuiz") != null) {
					List listInstruction = (List) module.get("listQuiz");
					for (Object o : listInstruction) {
						Map m = (Map) o;
						Quiz quiz = new Quiz();
						quiz.setAnswer((String) m.get("answer"));
						quiz.setIsTrue(Boolean.valueOf(m.get("isTrue").toString()));
						quiz.setQuestion(question);
						quiz.setIsDeleted(false);
						session.save(quiz);
					}
				}
				break;
			}
			session.flush();
			HibernateConfiguration.getInstance().commitTransaction(trans);
		} catch (

		HibernateException e) {
			HibernateConfiguration.getInstance().rollbackTransaction(trans);
			throw e;
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
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