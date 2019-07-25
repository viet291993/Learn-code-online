package com.poly.bean;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate4.Hibernate4Module;

public class HibernateAwareObjectMapper extends ObjectMapper {

	private static final long serialVersionUID = 1L;

	public HibernateAwareObjectMapper() {
		Hibernate4Module hibernate4Module = new Hibernate4Module();
		hibernate4Module.disable(Hibernate4Module.Feature.USE_TRANSIENT_ANNOTATION);
		registerModule(hibernate4Module);
	}
}
