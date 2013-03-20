package com.jeecms.cms.entity.main;

import java.util.Set;

import com.jeecms.cms.entity.main.base.BaseCmsAppInfo;

public class CmsAppInfo extends BaseCmsAppInfo {
	private static final long serialVersionUID = 1L;
 
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAILURE = 2;
	public static final int OPERATING = 3;

	/* [CONSTRUCTOR MARKER BEGIN] */
	public CmsAppInfo() {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public CmsAppInfo(java.lang.Integer id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */

	public CmsAppInfo(Integer channelId, String topicName, String shortName,
			String keywords, String description, String titleImg,
			String contentImg, String tplContent,String href, Integer priority,
			Integer isRecommend, int hashCode, Integer id) {
		super(channelId, topicName, shortName, keywords, description, titleImg,
				contentImg, tplContent,href, priority, isRecommend, hashCode, id);

	}
	/* [CONSTRUCTOR MARKER END] */
}
