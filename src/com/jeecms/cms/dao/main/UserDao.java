package com.jeecms.cms.dao.main;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.Mapper;

import com.jeecms.cms.entity.main.User;

@Mapper("userDao")
public interface UserDao {

	public int insert(User user);  //这个与xml里面的 id是一致的

	public int updateById(User user);

	public int delete(String userName);

	public int countAll();

	/**
	 * 进行模糊查询
	 * 
	 * @param likeCondition
	 * @param page
	 * @return
	 */
	//public List<User> getAllUser(Map<String, Object> likeCondition);

 

	public List<User> getList(String sql);

}
