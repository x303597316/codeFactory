package com.jeecms.cms.entity.main;

/**
 * User: Zhang lin Date: 12-1-4 下午3:12 Version: 1.0
 */

public class User {
	private Long user_id;
	private String userName;
	private String password;
	private String birth_date;

	private Integer sex;
	private Integer age;

 

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long userId) {
		user_id = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(String birthDate) {
		birth_date = birthDate;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public User() {
	}
}