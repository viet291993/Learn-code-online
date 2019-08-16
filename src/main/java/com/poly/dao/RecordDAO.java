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

public class RecordDAO extends AbstractDAO {

	public RecordDAO() {
		super(Record.class);
	}
	
	public Record findRecord(Course course, Member member) {
		Session session = null;
		Record record = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Record.class);
				cr.add(Restrictions.eq("course", course));
				cr.add(Restrictions.eq("member", member));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("isDeleted", false));
				record =(Record) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return record;
	}
	
	public Record findRecord(Integer courseId, Member member) {
		Session session = null;
		Record record = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			if (session != null) {
				Criteria cr = session.createCriteria(Record.class);
				cr.add(Restrictions.eq("course", (Course) new CourseDAO().find(courseId)));
				cr.add(Restrictions.eq("member", member));
				cr.add(Restrictions.eq("isActive", true));
				cr.add(Restrictions.eq("isDeleted", false));
				record = (Record) cr.uniqueResult();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return record;
	}
}