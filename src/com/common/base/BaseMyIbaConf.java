package com.common.base;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BaseMyIbaConf {
	protected static String resource = "com/common/resource/mybatis/myBatis-Configuration.cfg.xml";
	protected static SqlSession session = null;

	static {
		try {
			if (session == null) {
				Reader reader = Resources.getResourceAsReader(resource);
				SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
				SqlSessionFactory factory = builder.build(reader);

				session = factory.openSession();

				reader.close();
				reader = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
