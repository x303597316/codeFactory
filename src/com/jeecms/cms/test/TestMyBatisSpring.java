package com.jeecms.cms.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jeecms.cms.dao.main.UserDao;
import com.jeecms.cms.entity.main.User;


 

public class TestMyBatisSpring {
	private ClassPathXmlApplicationContext context;
	private UserDao userDao;
	
	 @Before
	public void init(){
		context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
		userDao = (UserDao)context.getBean("userDao");
	}
	  
	//INSERT INTO USER_INFO VALUES(1,'admin','123','1986-11-24',1,20);
	@Test
	public void testGetOneUser(){		 		 
		List<User> list = userDao.getList("");
		int listSize = list.size();
		for (int i = 0; i < listSize; i++)
			System.out.println(" 第 " + (i + 1) + "条记录:" + "用户ID："
					+ list.get(i).getUser_id() + " 用户名："
					+ list.get(i).getUserName());
	}
	 
}
