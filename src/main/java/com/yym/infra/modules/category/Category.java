package com.yym.infra.modules.category;

import java.util.ArrayList;
import java.util.List;

public class Category {

	private String ifctSeq;
	private String ifctName;
	private String ifctParents;
	private String ifctDepth;
	private String ifctOrder;
	private String ifctUrl;
	
	//for cache
	public static List<Category> cachedCategoryArrayList = new ArrayList<Category>();


	
	/////////////////////////////////////
	public String getIfctSeq() {
		return ifctSeq;
	}
	
	public void setIfctSeq(String ifctSeq) {
		this.ifctSeq = ifctSeq;
	}
	
	public String getIfctName() {
		return ifctName;
	}
	
	public void setIfctName(String ifctName) {
		this.ifctName = ifctName;
	}
	
	public String getIfctParents() {
		return ifctParents;
	}
	
	public void setIfctParents(String ifctParents) {
		this.ifctParents = ifctParents;
	}
	
	public String getIfctDepth() {
		return ifctDepth;
	}
	
	public void setIfctDepth(String ifctDepth) {
		this.ifctDepth = ifctDepth;
	}
	
	public String getIfctOrder() {
		return ifctOrder;
	}
	
	public void setIfctOrder(String ifctOrder) {
		this.ifctOrder = ifctOrder;
	}
	
	public String getIfctUrl() {
		return ifctUrl;
	}
	
	public void setIfctUrl(String ifctUrl) {
		this.ifctUrl = ifctUrl;
	}
	
	
	
	
}