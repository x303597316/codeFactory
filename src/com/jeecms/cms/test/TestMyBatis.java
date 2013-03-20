package com.jeecms.cms.test;

import java.util.List;

import org.junit.Test;

import com.common.base.BaseMyIbaConf;
import com.jeecms.cms.dao.main.UserDao;
import com.jeecms.cms.entity.main.User;

public class TestMyBatis extends BaseMyIbaConf {
	 
	//INSERT INTO USER_INFO VALUES(1,'admin','123','1986-11-24',1,20);
	//INSERT INTO USER_INFO VALUES(2,'zhang lin','123','1986-11-24',1,20);
	@Test
	public void userDao() throws Exception {
		System.out.println("需要配置到xml中去，在命名空间里面调用"+UserDao.class);
		UserDao userDao = session.getMapper(UserDao.class);	 
		List<User> list = userDao.getList("");
		int listSize = list.size();
		for (int i = 0; i < listSize; i++)
			System.out.println(" 第 " + (i + 1) + "条记录:" + "用户ID："
					+ list.get(i).getUser_id() + " 用户名："
					+ list.get(i).getUserName());
		/*
		BaseDaoMyIbaImp<User> aa=new BaseDaoMyIbaImp<User>();
		aa.setNamespace(UserDao.class.toString());
		System.out.println(aa.getList("").size()+"----------");*/
	}
	
}
