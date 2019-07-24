package com.poly.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.WebsiteConfig;

public class WebsiteConfigDAO extends AbstractDAO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6707316813962607622L;

	public WebsiteConfigDAO() {
		super(WebsiteConfig.class);
	}

	public HashMap<String, WebsiteConfig> findAllConfigs() {
		HashMap<String, WebsiteConfig> result = new HashMap<>();
		Session session = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			Criteria cr = session.createCriteria(WebsiteConfig.class);
			cr.add(Restrictions.eq("isDeleted", false));
			List<WebsiteConfig> list = cr.list();
			list.stream().forEach(config -> {
				result.put(config.getLang(), config);
			});
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return result;
	}

	public WebsiteConfig find(String lang) {
		Session session = null;
		WebsiteConfig obj = null;
		try {
			session = HibernateConfiguration.getInstance().openSession();
			obj = (WebsiteConfig) session.get(WebsiteConfig.class, lang);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateConfiguration.getInstance().closeSession(session);
		}
		return obj;
	}
}
