package com.jeecms.cms.test;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.jeecms.cms.dao.main.CmsGroupDao;
import com.jeecms.cms.dao.main.CmsLogDao;
import com.jeecms.cms.entity.main.CmsAppInfo;
import com.jeecms.cms.entity.main.CmsLog;
import com.jeecms.cms.manager.main.CmsGroupMng;

@ContextConfiguration(locations = { "classpath:config/applicationContext.xml",
		"classpath:config/cache-context.xml",
		"classpath:config/captcha-context.xml",
		"classpath:config/jeecms-context.xml",
		"classpath:config/jeecms-servlet-admin-action.xml",
		"classpath:/config/jeecms-servlet-admin.xml",
		"classpath:/config/jeecms-servlet-front-action.xml",
		"classpath:config/jeecms-servlet-front.xml",
		"classpath:/config/jeecore-context.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class test {
	@Autowired
	CmsGroupDao cmsGroupDao;
	@Autowired
	CmsLogDao cmsLogDao;
	@Autowired
	CmsGroupMng cmsGroupMng;

	@Test
	public void testGetGroupData() {
		System.out.println("开始读取数据。。。。。。");
		System.out.println("用DAO读取数据读出数：" + cmsGroupDao.getList().size());
		System.out.println("用service读取数据读出数："
				+ cmsGroupMng.getList().size());
		System.out.println("结束读取数据");

	}

	@Test
	public void testFromBeanGetData() {

		SessionFactory sessionFactory = SpringUtils.readXmlWebRootForContext();
		Session session = sessionFactory.openSession();
		CmsLog cmslog = new CmsLog();
		cmslog.setCategory(10);
		cmslog.setIp("192.167.1");
		Date d = new Date();
		cmslog.setTime(d);
		Transaction tx = session.beginTransaction();
		session.save(cmslog);
		session.flush();// 清空缓存后customer对象处于游离状态
		tx.commit();

		System.out.println("Save Data success!");
		int recordCount = session.createQuery(
				"from  com.jeecms.cms.entity.main.CmsLog ").list().size();

		System.out.println("查询到数据jc_log表数据：" + recordCount + "条");
		session.close();

	}

	@Test
	public void testFromSqlGetData() {

		SessionFactory sessionFactory = SpringUtils.readXmlWebRootForContext();
		Session session = sessionFactory.openSession();
		System.out.println("读取自己的appInfo表数据");
		CmsAppInfo cmslog = new CmsAppInfo();

		int recordCount = session.createSQLQuery("select * from jc_app_info ")
				.list().size();

		System.out.println("查询到数据jc_app_info表数据：" + recordCount + "条");
		session.close();

	}

	// insert into jc_app_info
	// values(1,1,'topic_home','short_home','keywords','descrip','title_ime','content','tpl',10,1);

}
