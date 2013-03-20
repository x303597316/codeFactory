package com.jeecms.cms.entity.main.base;

import java.io.Serializable;

public abstract class BaseCmsAppInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	public static String REF = "CmsAppInfo";
	public static String PROP_CHANNELID = "channelId";
	public static String PROP_TOPICNAME = "topicName";
	public static String PROP_SHORTNAME = "shortName";
	public static String PROP_KEYWORDS = "keywords";
	public static String PROP_DESCRIPTION = "description";
	public static String PROP_TITLEIMG = "titleImg";
	public static String PROP_CONTENTIMG = "contentImg";
	public static String PROP_TPLCONTENT = "tplContent";
	public static String PROP_PRIORITY = "priority"; 
	public static String PROP_HREF = "href";
	public static String PROP_ISRECOMMEND = "isRecommend";
	public static String PROP_ID = "id";

	public BaseCmsAppInfo() {
		initialize();
	}

	public BaseCmsAppInfo(java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	public BaseCmsAppInfo(Integer channelId, String topicName, String shortName,
			String keywords, String description, String titleImg,
			String contentImg, String tplContent,String href, Integer priority,
			Integer isRecommend, int hashCode, Integer id) {
		super();
		this.setChannelId(channelId);
		this.setTopicName(topicName);
		this.setShortName(shortName);
		this.setKeywords(keywords);
		this.setDescription(description);
		this.setTitleImg(titleImg);
		this.setContentImg(contentImg);
		this.setTplContent(tplContent);
		this.setHref(href);
		this.setPriority(priority);
		this.setIsRecommend(isRecommend);

		this.id = id;

	}

	protected void initialize() {
	}

	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	private java.lang.Integer channelId;
	private java.lang.String topicName;
	private java.lang.String shortName;
	private java.lang.String keywords;
	private java.lang.String description;
	private java.lang.String titleImg;
	private java.lang.String contentImg;
	private java.lang.String tplContent;
	private java.lang.String href;
	public java.lang.String getHref() {
		return href;
	}

	public void setHref(java.lang.String href) {
		this.href = href;
	}

	private java.lang.Integer priority;
	private java.lang.Integer isRecommend;

	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}

	public java.lang.Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(java.lang.Integer channelId) {
		this.channelId = channelId;
	}

	public java.lang.String getTopicName() {
		return topicName;
	}

	public void setTopicName(java.lang.String topicName) {
		this.topicName = topicName;
	}

	public java.lang.String getShortName() {
		return shortName;
	}

	public void setShortName(java.lang.String shortName) {
		this.shortName = shortName;
	}

	public java.lang.String getKeywords() {
		return keywords;
	}

	public void setKeywords(java.lang.String keywords) {
		this.keywords = keywords;
	}

	public java.lang.String getDescription() {
		return description;
	}

	public void setDescription(java.lang.String description) {
		this.description = description;
	}

	public java.lang.String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(java.lang.String titleImg) {
		this.titleImg = titleImg;
	}

	public java.lang.String getContentImg() {
		return contentImg;
	}

	public void setContentImg(java.lang.String contentImg) {
		this.contentImg = contentImg;
	}

	public java.lang.String getTplContent() {
		return tplContent;
	}

	public void setTplContent(java.lang.String tplContent) {
		this.tplContent = tplContent;
	}

	public java.lang.Integer getPriority() {
		return priority;
	}

	public void setPriority(java.lang.Integer priority) {
		this.priority = priority;
	}

	public java.lang.Integer getIsRecommend() {
		return isRecommend;
	}

	public void setIsRecommend(java.lang.Integer isRecommend) {
		this.isRecommend = isRecommend;
	}

	public boolean equals(Object obj) {
		if (null == obj)
			return false;
		if (!(obj instanceof com.jeecms.cms.entity.main.CmsAppInfo))
			return false;
		else {
			com.jeecms.cms.entity.main.CmsAppInfo cmsAppInfo = (com.jeecms.cms.entity.main.CmsAppInfo) obj;
			if (null == this.getId() || null == cmsAppInfo.getId())
				return false;
			else
				return (this.getId().equals(cmsAppInfo.getId()));
		}
	}

	public int hashCode() {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId())
				return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":"
						+ this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}

	public String toString() {
		return super.toString();
	}

}
