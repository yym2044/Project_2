package com.yym.infra.modules.product;

import java.util.Date;

public class Product {

	//상품
	private String trpdSeq;
	private String trpdPid;
	private String trpdName;
	private Integer trpdCategoryCd1;
	private Integer trpdCategoryCd2;
	private Integer trpdCategoryCd3;
	private Integer trpdPrice;
	private Double trpdDiscountPercent = 0.0;
	private Integer trpdDeliveryFee;
	private Double trpdStarRating;
	
	private String trpdTag;
	private String trpdDesc;
	private Integer trpdDelNy;
	private Integer trpdOptionParentCd1;
	private String trpdOptionParentName1;
	private Integer trpdOptionParentCd2;
	private String trpdOptionParentName2;
	private Integer trpdOptionParentCd3;
	private String trpdOptionParentName3;
	
	//옵션
	private String tropSeq;
	private String tropName;
	private String trocSeq;
	private String trocName;
	private Integer trocAdditionalPrice;
	
	private String[] tropNameArray;
	
	//RegMod
	private String regIp;
	private String regSeq;
	private String regDeviceCd;
	private Date regDateTime;
	private Date regDateTimeSvr;
	private String modIp;
	private String modSeq;
	private String modDeviceCd;
	private Date modDateTime;
	private Date modDateTimeSvr;
	
	
//	//for cache
//	public static List<Product> cachedOptionParentArrayList = new ArrayList<Product>();
//	public static List<Product> cachedOptionChildArrayList = new ArrayList<Product>();
	
	
	public String getTrpdSeq() {
		return trpdSeq;
	}
	public void setTrpdSeq(String trpdSeq) {
		this.trpdSeq = trpdSeq;
	}
	public String getTrpdPid() {
		return trpdPid;
	}
	public void setTrpdPid(String trpdPid) {
		this.trpdPid = trpdPid;
	}
	public String getTrpdName() {
		return trpdName;
	}
	public void setTrpdName(String trpdName) {
		this.trpdName = trpdName;
	}
	public Integer getTrpdCategoryCd1() {
		return trpdCategoryCd1;
	}
	public void setTrpdCategoryCd1(Integer trpdCategoryCd1) {
		this.trpdCategoryCd1 = trpdCategoryCd1;
	}
	public Integer getTrpdCategoryCd2() {
		return trpdCategoryCd2;
	}
	public void setTrpdCategoryCd2(Integer trpdCategoryCd2) {
		this.trpdCategoryCd2 = trpdCategoryCd2;
	}
	public Integer getTrpdCategoryCd3() {
		return trpdCategoryCd3;
	}
	public void setTrpdCategoryCd3(Integer trpdCategoryCd3) {
		this.trpdCategoryCd3 = trpdCategoryCd3;
	}
	public Integer getTrpdPrice() {
		return trpdPrice;
	}
	public void setTrpdPrice(Integer trpdPrice) {
		this.trpdPrice = trpdPrice;
	}
	public Integer getTrpdOptionParentCd1() {
		return trpdOptionParentCd1;
	}
	public void setTrpdOptionParentCd1(Integer trpdOptionParentCd1) {
		this.trpdOptionParentCd1 = trpdOptionParentCd1;
	}
	public Integer getTrpdOptionParentCd2() {
		return trpdOptionParentCd2;
	}
	public void setTrpdOptionParentCd2(Integer trpdOptionParentCd2) {
		this.trpdOptionParentCd2 = trpdOptionParentCd2;
	}
	public Integer getTrpdOptionParentCd3() {
		return trpdOptionParentCd3;
	}
	public void setTrpdOptionParentCd3(Integer trpdOptionParentCd3) {
		this.trpdOptionParentCd3 = trpdOptionParentCd3;
	}
	public String getTrpdDesc() {
		return trpdDesc;
	}
	public void setTrpdDesc(String trpdDesc) {
		this.trpdDesc = trpdDesc;
	}
	public Integer getTrpdDelNy() {
		return trpdDelNy;
	}
	public void setTrpdDelNy(Integer trpdDelNy) {
		this.trpdDelNy = trpdDelNy;
	}
	public String getRegIp() {
		return regIp;
	}
	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}
	public String getRegSeq() {
		return regSeq;
	}
	public void setRegSeq(String regSeq) {
		this.regSeq = regSeq;
	}
	public String getRegDeviceCd() {
		return regDeviceCd;
	}
	public void setRegDeviceCd(String regDeviceCd) {
		this.regDeviceCd = regDeviceCd;
	}
	public Date getRegDateTime() {
		return regDateTime;
	}
	public void setRegDateTime(Date regDateTime) {
		this.regDateTime = regDateTime;
	}
	public Date getRegDateTimeSvr() {
		return regDateTimeSvr;
	}
	public void setRegDateTimeSvr(Date regDateTimeSvr) {
		this.regDateTimeSvr = regDateTimeSvr;
	}
	public String getModIp() {
		return modIp;
	}
	public void setModIp(String modIp) {
		this.modIp = modIp;
	}
	public String getModSeq() {
		return modSeq;
	}
	public void setModSeq(String modSeq) {
		this.modSeq = modSeq;
	}
	public String getModDeviceCd() {
		return modDeviceCd;
	}
	public void setModDeviceCd(String modDeviceCd) {
		this.modDeviceCd = modDeviceCd;
	}
	public Date getModDateTime() {
		return modDateTime;
	}
	public void setModDateTime(Date modDateTime) {
		this.modDateTime = modDateTime;
	}
	public Date getModDateTimeSvr() {
		return modDateTimeSvr;
	}
	public void setModDateTimeSvr(Date modDateTimeSvr) {
		this.modDateTimeSvr = modDateTimeSvr;
	}
	public Integer getTrpdDeliveryFee() {
		return trpdDeliveryFee;
	}
	public void setTrpdDeliveryFee(Integer trpdDeliveryFee) {
		this.trpdDeliveryFee = trpdDeliveryFee;
	}
	public Double getTrpdDiscountPercent() {
		return trpdDiscountPercent;
	}
	public void setTrpdDiscountPercent(Double trpdDiscountPercent) {
		this.trpdDiscountPercent = trpdDiscountPercent;
	}
	public Double getTrpdStarRating() {
		return trpdStarRating;
	}
	public void setTrpdStarRating(Double trpdStarRating) {
		this.trpdStarRating = trpdStarRating;
	}
	public String getTrpdTag() {
		return trpdTag;
	}
	public void setTrpdTag(String trpdTag) {
		this.trpdTag = trpdTag;
	}
	public String getTrpdOptionParentName1() {
		return trpdOptionParentName1;
	}
	public void setTrpdOptionParentName1(String trpdOptionParentName1) {
		this.trpdOptionParentName1 = trpdOptionParentName1;
	}
	public String getTrpdOptionParentName2() {
		return trpdOptionParentName2;
	}
	public void setTrpdOptionParentName2(String trpdOptionParentName2) {
		this.trpdOptionParentName2 = trpdOptionParentName2;
	}
	public String getTrpdOptionParentName3() {
		return trpdOptionParentName3;
	}
	public void setTrpdOptionParentName3(String trpdOptionParentName3) {
		this.trpdOptionParentName3 = trpdOptionParentName3;
	}
	public String getTropSeq() {
		return tropSeq;
	}
	public void setTropSeq(String tropSeq) {
		this.tropSeq = tropSeq;
	}
	public String getTropName() {
		return tropName;
	}
	public void setTropName(String tropName) {
		this.tropName = tropName;
	}
	public String getTrocName() {
		return trocName;
	}
	public void setTrocName(String trocName) {
		this.trocName = trocName;
	}
	public Integer getTrocAdditionalPrice() {
		return trocAdditionalPrice;
	}
	public void setTrocAdditionalPrice(Integer trocAdditionalPrice) {
		this.trocAdditionalPrice = trocAdditionalPrice;
	}
	public String getTrocSeq() {
		return trocSeq;
	}
	public void setTrocSeq(String trocSeq) {
		this.trocSeq = trocSeq;
	}
	public String[] getTropNameArray() {
		return tropNameArray;
	}
	public void setTropNameArray(String[] tropNameArray) {
		this.tropNameArray = tropNameArray;
	}
	
}
