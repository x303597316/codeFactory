package com.jeecms.cms.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.common.web.support.pagination.Page;
import com.jeecms.cms.entity.main.CmsUser;
import com.jeecms.core.dao.UnifiedUserDao;
import com.opensymphony.xwork2.ActionSupport;

public class Struts2DemoAction extends ActionSupport {
	/*
	 * @Autowired CmsGroupDao cmsGroupDao;
	 * 
	 * @Autowired CmsLogDao cmsLogDao;
	 * 
	 * @Autowired CmsGroupMng cmsGroupMng;
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	 
	private UnifiedUserDao dao;

	public UnifiedUserDao getDao() {
		return dao;
	}

	@Autowired
	public void setDao(UnifiedUserDao dao) {
		this.dao = dao;
	}

	public String execute() throws Exception {

		Object obj = request.getSession().getAttribute("userName");
		if (obj == null) {
			System.out.println("没有登陆需要进入登陆界面");
			return ERROR;
		} else {
			System.out.println("身份正确，直接进入界面");
			return SUCCESS;
		}
	}

	public String login() {
		Object obj = request.getSession().getAttribute("userName");

		if (obj == null) {
			System.out.println("没有登陆需要进入登陆界面1");
			return ERROR;
		} else {
			System.out.println("身份正确，直接进入界面1");
			return SUCCESS;
		}

	}
	public String index() {
		Object obj = request.getSession().getAttribute("userName");

		if (obj == null) {
			System.out.println("没有登陆需要进入登陆界面2");
			return ERROR;
		} else {
			System.out.println("身份正确，直接进入界面2");
			return SUCCESS;
		}

	}
	public String validatorLogin() {
        System.out.println("==================");
		String username = request.getParameter("username");
		System.out.println("登陆的用户显示： " + username);

		
	//	UnifiedUser user = dao.getByUsername(username);
		System.out.println("已经验证结束");
		//if (user == null) {
		if(username==""){
			 System.out.println("用户名不存在：");
				return ERROR;
		}else {
			Page<CmsUser>  page=new Page<CmsUser>();
			//page.setItems(items);
			//page.setContext(context);
			System.out.println("身份正确，直接进入界面");
			return SUCCESS;
		}
	}

	/*
	 * public CmsGroupDao getCmsGroupDao() { return cmsGroupDao; }
	 * 
	 * // 这里通过spring注册业务对象 // @Resource(name = "cmsGroupMng") public void
	 * setCmsGroupDao(CmsGroupDao cmsGroupDao) { this.cmsGroupDao = cmsGroupDao;
	 * }
	 * 
	 * public CmsLogDao getCmsLogDao() { return cmsLogDao; }
	 * 
	 * public void setCmsLogDao(CmsLogDao cmsLogDao) { this.cmsLogDao =
	 * cmsLogDao; }
	 * 
	 * public CmsGroupMng getCmsGroupMng() { return cmsGroupMng; }
	 * 
	 * public void setCmsGroupMng(CmsGroupMng cmsGroupMng) { this.cmsGroupMng =
	 * cmsGroupMng; }
	 */

}
