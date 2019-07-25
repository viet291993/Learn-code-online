package com.poly.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.poly.config.HibernateConfiguration;
import com.poly.entity.Lession;

public class LessionDAO extends AbstractDAO{

	public LessionDAO() {
		super(Lession.class);
	}
}
