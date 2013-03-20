package com.common.base;

import java.util.ArrayList;
import java.util.List;

public class BaseDaoMyIbaImp<T> extends BaseMyIbaConf {
	private String namespace;
	private Class  entityClass;
	
	public Class  getEntityClass() {
		return entityClass;
	}

	public void setEntityClass(Class  entityClass) {
		this.entityClass = entityClass;
	}

	public BaseDaoMyIbaImp()
	{
		session.getMapper(entityClass);
	}
	
	public int deleteByAnd(String and) {
		int cnt = 0;
		try {
			cnt = session.delete(namespace + ".delete", and);
			System.out.println(namespace + "delete(" + and + ")"
					 );
		} catch (Exception e) {
			System.out.println(namespace + "delete(" + and + ")"
					+ e.getMessage());
		}
		return cnt;
	}
	
	 
	public int getCount(String and) {
		int count = 0;
		try {
			Object obj = session.selectList(namespace + ".countAll", and);
			if (obj != null)
				count = Integer.parseInt(obj + "");
		} catch (Exception e) {
			System.out.println(namespace + ".getcount(" + and + ")"
					+ e.getMessage());
		}
		return count;
	}

	public List<T> getList(String and) {
		List<T> list = new ArrayList<T>();
		try {

			list = session.selectList(namespace + ".getList", and);
		} catch (Exception e) {
			System.out.println(namespace + ".getList(" + and + ")"
					+ e.getMessage());
		}
		return list;
	}

	 
	public String getNamespace() {
		return namespace;
	}

	 
 

	public String insert(T bean) {
		try {
			session.insert(namespace + ".insert", bean);
			return "1";
		} catch (Exception e) {
			System.out.println(namespace + ".insert(" + bean + ")"
					+ e.getMessage());
			return "0";
		}
	}

	public void setNamespace(String namespace) {
		this.namespace = namespace;
	}

	public boolean updateById(T bean) {
		boolean flag = false;
		try {
			flag = session.update(namespace + ".updateById", bean) > 0;
		} catch (Exception e) {
			System.out.println(namespace + ".updateById(" + bean + ")"
					+ e.getMessage());
		}
		return flag;
	}

}
