package com.jeecms.cms.action.admin.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeecms.cms.entity.main.CmsAppInfo;
import com.jeecms.cms.entity.main.CmsModel;
import com.jeecms.cms.manager.main.CmsAppInfoMng;
import com.jeecms.cms.manager.main.CmsLogMng;
import com.jeecms.cms.web.WebErrors;
@Controller
public class CmsAppInfoAct {
	private static final Logger log = LoggerFactory
	.getLogger(CmsModelAct.class);
	@RequestMapping("/appinfo/v_list.do")
	public String list(HttpServletRequest request, ModelMap model) {
		List<CmsAppInfo> list = manager.getList(true);
		model.addAttribute("list", list);
		return "appinfo/list";
	}

	@RequestMapping("/appinfo/v_add.do")
	public String add(ModelMap appInfo) {
		return "appinfo/add";
	}

	@RequestMapping("/appinfo/v_edit.do")
	public String edit(Integer id, HttpServletRequest request, ModelMap appInfo) {
		WebErrors errors = validateEdit(id, request);
		if (errors.hasErrors()) {
			return errors.showErrorPage(appInfo);
		}
		appInfo.addAttribute("cmsAppInfo", manager.findById(id));
		return "appinfo/edit";
	}

	@RequestMapping("/appinfo/o_save.do")
	public String save(CmsAppInfo bean, HttpServletRequest request, ModelMap model) {
		WebErrors errors = validateSave(bean, request);
		if (errors.hasErrors()) {
			return errors.showErrorPage(model);
		}
		bean.setIsRecommend(1);
		bean = manager.save(bean);
		log.info("save CmsAppInfo id={}", bean.getId());
		cmsLogMng.operating(request, "cmsAppInfo.log.save", "id=" + bean.getId()
				+ ";name=" + bean.getTopicName());
		return "redirect:v_list.do";
	}

	@RequestMapping("/appinfo/o_delete.do")
	public String delete(Integer[] ids, HttpServletRequest request,
			ModelMap model) {
		WebErrors errors = validateDelete(ids, request);
		if (errors.hasErrors()) {
			return errors.showErrorPage(model);
		}
		CmsAppInfo[] beans = manager.deleteByIds(ids);
		for (CmsAppInfo bean : beans) {
			log.info("delete CmsAppInfo id={}", bean.getId());
			cmsLogMng.operating(request, "cmsAppInfo.log.delete", "id="
					+ bean.getId() + ";name=" + bean.getTopicName());
		}
		return list(request, model);
	}
	

	@RequestMapping("/appinfo/o_update.do")
	public String update(CmsAppInfo bean, HttpServletRequest request,
			ModelMap appInfo) {
		WebErrors errors = validateUpdate(bean.getId(), request);
		if (errors.hasErrors()) {
			return errors.showErrorPage(appInfo);
		}
		bean = manager.update(bean);
		 
		return list(request, appInfo);
	}

	 

	private WebErrors validateEdit(Integer id, HttpServletRequest request) {
		WebErrors errors = WebErrors.create(request);
		if (vldExist(id, errors)) {
			return errors;
		}
		return errors;
	}

	private WebErrors validateUpdate(Integer id, HttpServletRequest request) {
		WebErrors errors = WebErrors.create(request);
		if (vldExist(id, errors)) {
			return errors;
		}
		return errors;
	}

	private WebErrors validateDelete(Integer[] ids, HttpServletRequest request) {
		WebErrors errors = WebErrors.create(request);
		errors.ifEmpty(ids, "ids");
		for (Integer id : ids) {
			vldExist(id, errors);
		}
		return errors;
	}

	private WebErrors validatePriority(Integer[] wids, Integer[] priority,
			Boolean[] disabled, Integer defId, HttpServletRequest request) {
		WebErrors errors = WebErrors.create(request);
		if (errors.ifEmpty(wids, "wids")) {
			return errors;
		}
		if (errors.ifEmpty(priority, "priority")) {
			return errors;
		}
		if (wids.length != priority.length || wids.length != disabled.length) {
			String s = "wids length not equals priority length or disabled length";
			errors.addErrorString(s);
			return errors;
		}
		for (int i = 0, len = wids.length; i < len; i++) {
			if (vldExist(wids[i], errors)) {
				return errors;
			}
			if (priority[i] == null) {
				priority[i] = 0;
			}
			if (disabled[i] == null) {
				disabled[i] = false;
			}
		}
		if (vldExist(defId, errors)) {
			return errors;
		}
		return errors;
	}

	private WebErrors validateSave(CmsAppInfo bean, HttpServletRequest request) {
		WebErrors errors = WebErrors.create(request);
		return errors;
	}
	
	private boolean vldExist(Integer id, WebErrors errors) {
		if (errors.ifNull(id, "id")) {
			return true;
		}
		CmsAppInfo entity = manager.findById(id);
		if (errors.ifNotExist(entity, CmsAppInfo.class, id)) {
			return true;
		}
		return false;
	}

	@Autowired
	private CmsLogMng cmsLogMng;
	@Autowired
	private CmsAppInfoMng manager;
}