package com.poly.listener;

import java.util.HashMap;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.HibernateException;

import com.poly.config.HibernateConfiguration;
import com.poly.dao.WebsiteConfigDAO;
import com.poly.entity.WebsiteConfig;
import com.poly.utils.ConfigUtils;

public class GeneralContextListener implements ServletContextListener {

	@Override 
	public void contextInitialized(ServletContextEvent sce) {
		String configPath = sce.getServletContext().getRealPath("/WEB-INF/config.system.properties");
		String configPathERP = sce.getServletContext().getRealPath("/WEB-INF/config.erp.mapping.properties");
		String nameServer = new ConfigUtils().getProperties(configPathERP).getProperty(("config.mapping"));
		Properties props = new ConfigUtils().getProperties(configPath);
		Boolean on = Boolean.valueOf(props.getProperty("support.enable"));
		if (!on) {
			try {
				HibernateConfiguration.getInstance().shutdown();
			} catch (Exception e) {
			}
		} else {
			try {
				HashMap<String, WebsiteConfig> websiteConfigs = new WebsiteConfigDAO().findAllConfigs();
				sce.getServletContext().setAttribute("WEBSITE_CONFIGS", websiteConfigs);
				sce.getServletContext().setAttribute("WEBSERVICE_NAMESERVER", nameServer);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			HibernateConfiguration.getInstance().openSession().flush();
		} catch (HibernateException e) {
		}
		try {
			HibernateConfiguration.getInstance().openSession().close();
		} catch (HibernateException e) {
		}
		try {
			HibernateConfiguration.getInstance().shutdown();
		} catch (Exception e) {
		}
	}
}
