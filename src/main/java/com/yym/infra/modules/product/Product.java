package com.yym.infra.modules.product;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Product {

	private String optionMethod;
	
	
	
	
	//멤버
	private String ifmmSeq;
	private String ifmmName;
	private String ifmeEmailFull;
	private String ifmpNumber;
	private String ifmaAddress1;
	private String ifmaAddress2;
	
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
	private Integer tropOrder;
	private String trocSeq;
	private String trocName;
	private Integer trocOrder;
	private Integer trocAdditionalPrice;
	
	private String[] tropNameArray;
	
	private String[] trocNameArray1;
	private Integer[] trocAdditionalPriceArray1;
	private String[] trocNameArray2;
	private Integer[] trocAdditionalPriceArray2;
	private String[] trocNameArray3;
	private Integer[] trocAdditionalPriceArray3;
	
	//tradProduct_Real
	private String trprSeq;
	
	private String trprOptionChildCd1;
	private String trprOptionChildName1;
	private String trprOptionChildCd2;
	private String trprOptionChildName2;
	private String trprOptionChildCd3;
	private String trprOptionChildName3;
	
	private Integer trprUseNy;
	private Integer trprDelNy;
	
	private Integer trprListPrice;
	private Integer trprDiscountPrice;
	private Integer trprStock;
	
	private Integer[] trprListPriceArray;
	private Integer[] trprDiscountPriceArray;
	private Integer[] trprStockArray;
	
	//tradCart
	private String trctSeq;
	private Integer trctQuantity;
	private Integer trctDelNy;
	
	private String[] checkboxTrprArray;
	private String[] trprFullNameArray;
	private Integer[] trctQuantityArray;
	
	private Integer totalProduct;
	private Integer totalDelivery;
	private Integer totalMoney;
	
	//스프링에 파일을 올리기 위해
	private MultipartFile[] file0;
	private MultipartFile[] file1;
	
	//uploaded
	private String tableName;
	
	private String seq;
	private Integer type;
	private Integer defaultNy;
	private Integer sort;
	private String originalName;
	private String uuidName;
	private String ext;
	private long size;
	private Integer delNy;
	private String pseq;
	private String path;
	
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
	public Integer getTropOrder() {
		return tropOrder;
	}
	public void setTropOrder(Integer tropOrder) {
		this.tropOrder = tropOrder;
	}
	public Integer getTrocOrder() {
		return trocOrder;
	}
	public void setTrocOrder(Integer trocOrder) {
		this.trocOrder = trocOrder;
	}
	public String[] getTrocNameArray1() {
		return trocNameArray1;
	}
	public void setTrocNameArray1(String[] trocNameArray1) {
		this.trocNameArray1 = trocNameArray1;
	}
	public Integer[] getTrocAdditionalPriceArray1() {
		return trocAdditionalPriceArray1;
	}
	public void setTrocAdditionalPriceArray1(Integer[] trocAdditionalPriceArray1) {
		this.trocAdditionalPriceArray1 = trocAdditionalPriceArray1;
	}
	public String[] getTrocNameArray2() {
		return trocNameArray2;
	}
	public void setTrocNameArray2(String[] trocNameArray2) {
		this.trocNameArray2 = trocNameArray2;
	}
	public Integer[] getTrocAdditionalPriceArray2() {
		return trocAdditionalPriceArray2;
	}
	public void setTrocAdditionalPriceArray2(Integer[] trocAdditionalPriceArray2) {
		this.trocAdditionalPriceArray2 = trocAdditionalPriceArray2;
	}
	public String[] getTrocNameArray3() {
		return trocNameArray3;
	}
	public void setTrocNameArray3(String[] trocNameArray3) {
		this.trocNameArray3 = trocNameArray3;
	}
	public Integer[] getTrocAdditionalPriceArray3() {
		return trocAdditionalPriceArray3;
	}
	public void setTrocAdditionalPriceArray3(Integer[] trocAdditionalPriceArray3) {
		this.trocAdditionalPriceArray3 = trocAdditionalPriceArray3;
	}
	public MultipartFile[] getFile0() {
		return file0;
	}
	public void setFile0(MultipartFile[] file0) {
		this.file0 = file0;
	}
	public MultipartFile[] getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile[] file1) {
		this.file1 = file1;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getDefaultNy() {
		return defaultNy;
	}
	public void setDefaultNy(Integer defaultNy) {
		this.defaultNy = defaultNy;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getUuidName() {
		return uuidName;
	}
	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public Integer getDelNy() {
		return delNy;
	}
	public void setDelNy(Integer delNy) {
		this.delNy = delNy;
	}
	public String getPseq() {
		return pseq;
	}
	public void setPseq(String pseq) {
		this.pseq = pseq;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Integer getTrprListPrice() {
		return trprListPrice;
	}
	public void setTrprListPrice(Integer trprListPrice) {
		this.trprListPrice = trprListPrice;
	}
	public Integer getTrprDiscountPrice() {
		return trprDiscountPrice;
	}
	public void setTrprDiscountPrice(Integer trprDiscountPrice) {
		this.trprDiscountPrice = trprDiscountPrice;
	}
	public Integer getTrprStock() {
		return trprStock;
	}
	public void setTrprStock(Integer trprStock) {
		this.trprStock = trprStock;
	}
	public Integer[] getTrprListPriceArray() {
		return trprListPriceArray;
	}
	public void setTrprListPriceArray(Integer[] trprListPriceArray) {
		this.trprListPriceArray = trprListPriceArray;
	}
	public Integer[] getTrprDiscountPriceArray() {
		return trprDiscountPriceArray;
	}
	public void setTrprDiscountPriceArray(Integer[] trprDiscountPriceArray) {
		this.trprDiscountPriceArray = trprDiscountPriceArray;
	}
	public Integer[] getTrprStockArray() {
		return trprStockArray;
	}
	public void setTrprStockArray(Integer[] trprStockArray) {
		this.trprStockArray = trprStockArray;
	}
	public String getTrprOptionChildCd1() {
		return trprOptionChildCd1;
	}
	public void setTrprOptionChildCd1(String trprOptionChildCd1) {
		this.trprOptionChildCd1 = trprOptionChildCd1;
	}
	public String getTrprOptionChildCd2() {
		return trprOptionChildCd2;
	}
	public void setTrprOptionChildCd2(String trprOptionChildCd2) {
		this.trprOptionChildCd2 = trprOptionChildCd2;
	}
	public String getTrprOptionChildCd3() {
		return trprOptionChildCd3;
	}
	public void setTrprOptionChildCd3(String trprOptionChildCd3) {
		this.trprOptionChildCd3 = trprOptionChildCd3;
	}
	public Integer getTrprUseNy() {
		return trprUseNy;
	}
	public void setTrprUseNy(Integer trprUseNy) {
		this.trprUseNy = trprUseNy;
	}
	public Integer getTrprDelNy() {
		return trprDelNy;
	}
	public void setTrprDelNy(Integer trprDelNy) {
		this.trprDelNy = trprDelNy;
	}
	public String getTrprSeq() {
		return trprSeq;
	}
	public void setTrprSeq(String trprSeq) {
		this.trprSeq = trprSeq;
	}
	public String getTrctSeq() {
		return trctSeq;
	}
	public void setTrctSeq(String trctSeq) {
		this.trctSeq = trctSeq;
	}
	public Integer getTrctQuantity() {
		return trctQuantity;
	}
	public void setTrctQuantity(Integer trctQuantity) {
		this.trctQuantity = trctQuantity;
	}
	public Integer getTrctDelNy() {
		return trctDelNy;
	}
	public void setTrctDelNy(Integer trctDelNy) {
		this.trctDelNy = trctDelNy;
	}
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getTrprOptionChildName1() {
		return trprOptionChildName1;
	}
	public void setTrprOptionChildName1(String trprOptionChildName1) {
		this.trprOptionChildName1 = trprOptionChildName1;
	}
	public String getTrprOptionChildName2() {
		return trprOptionChildName2;
	}
	public void setTrprOptionChildName2(String trprOptionChildName2) {
		this.trprOptionChildName2 = trprOptionChildName2;
	}
	public String getTrprOptionChildName3() {
		return trprOptionChildName3;
	}
	public void setTrprOptionChildName3(String trprOptionChildName3) {
		this.trprOptionChildName3 = trprOptionChildName3;
	}
	public String getOptionMethod() {
		return optionMethod;
	}
	public void setOptionMethod(String optionMethod) {
		this.optionMethod = optionMethod;
	}
	public String getIfmmName() {
		return ifmmName;
	}
	public void setIfmmName(String ifmmName) {
		this.ifmmName = ifmmName;
	}
	public String getIfmeEmailFull() {
		return ifmeEmailFull;
	}
	public void setIfmeEmailFull(String ifmeEmailFull) {
		this.ifmeEmailFull = ifmeEmailFull;
	}
	public String getIfmpNumber() {
		return ifmpNumber;
	}
	public void setIfmpNumber(String ifmpNumber) {
		this.ifmpNumber = ifmpNumber;
	}
	public String getIfmaAddress1() {
		return ifmaAddress1;
	}
	public void setIfmaAddress1(String ifmaAddress1) {
		this.ifmaAddress1 = ifmaAddress1;
	}
	public String getIfmaAddress2() {
		return ifmaAddress2;
	}
	public void setIfmaAddress2(String ifmaAddress2) {
		this.ifmaAddress2 = ifmaAddress2;
	}
	public String[] getCheckboxTrprArray() {
		return checkboxTrprArray;
	}
	public void setCheckboxTrprArray(String[] checkboxTrprArray) {
		this.checkboxTrprArray = checkboxTrprArray;
	}
	public Integer[] getTrctQuantityArray() {
		return trctQuantityArray;
	}
	public void setTrctQuantityArray(Integer[] trctQuantityArray) {
		this.trctQuantityArray = trctQuantityArray;
	}
	public String[] getTrprFullNameArray() {
		return trprFullNameArray;
	}
	public void setTrprFullNameArray(String[] trprFullNameArray) {
		this.trprFullNameArray = trprFullNameArray;
	}
	public Integer getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Integer totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Integer getTotalProduct() {
		return totalProduct;
	}
	public void setTotalProduct(Integer totalProduct) {
		this.totalProduct = totalProduct;
	}
	public Integer getTotalDelivery() {
		return totalDelivery;
	}
	public void setTotalDelivery(Integer totalDelivery) {
		this.totalDelivery = totalDelivery;
	}
	
}
