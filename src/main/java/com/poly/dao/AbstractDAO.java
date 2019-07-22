package com.poly.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.poly.config.HibernateConfiguration;

public abstract class AbstractDAO<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public final Class<T> entityClass;

	public AbstractDAO(Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	public T create(T entity) throws Exception {
		Transaction tran = null;
		Session session = null;
		T result = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			tran = session.beginTransaction();
			if (entity == null) {
				throw new NullPointerException();
			}
			Serializable id = session.save(entity);
			session.flush();
			result = (T) session.get(entityClass, id);
			HibernateConfiguration.getInstance().commitTransaction(tran);
		} catch (Exception e) {
			HibernateConfiguration.getInstance().rollbackTransaction(tran);
			e.printStackTrace();
		} finally {
			if (session.isOpen()) {
				HibernateConfiguration.getInstance().closeSession(session);
			}
			if (session.isOpen()) {
				HibernateConfiguration.getInstance().closeSession(session);
			}
		}
		return result;
	}
//
//    public void delete(T entity) throws Exception {
//        Transaction tran = null;
//        Session session = null;
//        try {
//            session = HibernateConfiguration.getInstance().openSession();
//            tran = session.beginTransaction();
//            session.delete(entity);
//            HibernateConfiguration.getInstance().commitTransaction(tran);
//        } catch (Exception e) {
//            HibernateConfiguration.getInstance().rollbackTransaction(tran);
//            e.printStackTrace();
//            throw e;
//        } finally {
//            if (session.isOpen()) {
//                HibernateConfiguration.getInstance().closeSession(session);
//            }
//        }
//    }

	public void edit(T entity) throws Exception {
		Transaction tran = null;
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			tran = session.beginTransaction();
			session.update(entity);
			HibernateConfiguration.getInstance().commitTransaction(tran);
		} catch (Exception e) {
			HibernateConfiguration.getInstance().rollbackTransaction(tran);
			e.printStackTrace();
			throw e;
		} finally {
			if (session.isOpen()) {
				HibernateConfiguration.getInstance().closeSession(session);
			}
		}
	}

	public T find(Integer id) {
		Session session = null;
		T obj = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			obj = (T) session.get(entityClass, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session.isOpen()) {
				HibernateConfiguration.getInstance().closeSession(session);
			}
		}
		return obj;
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		Session session = null;
		List<T> list = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			list = session.createCriteria(entityClass).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session.isOpen()) {
				HibernateConfiguration.getInstance().closeSession(session);
			}
		}
		return list;
	}

	protected int count(boolean hasIsDelete) {
		Session session = null;
		int cnt = 0;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			Criteria cr = session.createCriteria(entityClass);
			cr.setProjection(Projections.rowCount());
			if (hasIsDelete) {
				cr.add(Restrictions.eq("isDelete", false));
			}
			cnt = ((Long) cr.uniqueResult()).intValue();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session.isOpen()) {
				HibernateConfiguration.getInstance().closeSession(session);
			}
		}
		return cnt;
	}
}
