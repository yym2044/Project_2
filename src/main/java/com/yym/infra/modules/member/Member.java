package com.yym.infra.modules.member;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Member {

	//검색어
	private Integer ifscSeq;
	private String ifscName; 
	//멤버
	private String ifmmSeq;
	private Integer ifmmAdminNy;
	private String ifmmId;
	private String ifmmPwd;
	private String ifmmName;
	private String ifmmGenderCd;
	private String ifmmGender;
	private String ifmmDob;
	private String ifmmFavoriteColor;
	private Integer ifmmGradeCd;
	private String ifmmGrade;
	private Integer ifmmDelNy;
	private Integer ifmmStatusCd;
	private String ifmmStatus;
	private Integer ifmmEmailConsentNy;
	private String ifmmEmailConsentNyText;
	private Integer ifmmSmsConsentNy;
	private String ifmmSmsConsentNyText;
	private Integer ifmmPushConsentNy;
	private String ifmmPushConsentNyText;
	private String ifmmDesc;
	//멤버_이메일
	private String ifmeEmailFull;
	private String ifmeEmailAccount;
	private String ifmeEmailDomain;
	private String ifmeEmailDomainCd;
	//멤버_폰
//		private String ifmpTelecomCd;
//		private String ifmpTelecomName;
//		private String ifmpNumberMobile;
//		private String ifmpNumberHome;
	
//		infrMemberPhone
	private String ifmpSeq;
	private Integer ifmpDefaultNy;
	private Integer ifmpTypeCd;
	private Integer ifmpDeviceCd;
	private Integer ifmpTelecomCd;
	private String ifmpNumber;
	private Integer ifmpDelNy;
//		infrMemberPhoneArray
	private Integer[] ifmpDefaultNyArray;
	private Integer[] ifmpTypeCdArray;
	private Integer[] ifmpDeviceCdArray;
	private Integer[] ifmpTelecomCdArray;
	private String[] ifmpNumberArray;
	private Integer[] ifmpDelNyArray;
	
//		infrMemberAddressOnline
	private String ifaoSeq;
	private Integer ifaoTypeCd;
	private Integer ifaoDefaultNy;
	private Integer ifaoSnsTypeCd;
	private String ifaoTitle;
	private String ifaoUrl;
	
//		infrMemberAddressOnlineArray
	//홈페이지 & SNS
	private Integer[] ifaoTypeCdArray;
	private Integer[] ifaoDefaultNyArray;
	private Integer[] ifaoSnsTypeCdArray;
	private String[] ifaoTitleArray;
	private String[] ifaoUrlArray;
	
	//멤버_어드레스
	private String ifmaZipCode;
	private String ifmaAddress1;
	private String ifmaAddress2;
	private String ifmaAddressReferences;
	private Double ifmaLat;
	private Double ifmaLng;
	//멤버_노트
	private String ifntSeq;
	private String ifntOrder;
	private String ifntContent;
	private String ifntWriter;
	private String ifntWriterCd;
	
	//국적
	private String ifnaSeq;
	private String ifnaName;
	private String ifnaCode2Char;
	private String ifnaCode3Char;
	
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
	//--------------------------------------------------------------
	public Integer getIfscSeq() {
		return ifscSeq;
	}
	public void setIfscSeq(Integer ifscSeq) {
		this.ifscSeq = ifscSeq;
	}
	public String getIfscName() {
		return ifscName;
	}
	public void setIfscName(String ifscName) {
		this.ifscName = ifscName;
	}
	public String getIfmmSeq() {
		return ifmmSeq;
	}
	public void setIfmmSeq(String ifmmSeq) {
		this.ifmmSeq = ifmmSeq;
	}
	public String getIfmmId() {
		return ifmmId;
	}
	public void setIfmmId(String ifmmId) {
		this.ifmmId = ifmmId;
	}
	public String getIfmmPwd() {
		return ifmmPwd;
	}
	public void setIfmmPwd(String ifmmPwd) {
		this.ifmmPwd = ifmmPwd;
	}
	public String getIfmmName() {
		return ifmmName;
	}
	public void setIfmmName(String ifmmName) {
		this.ifmmName = ifmmName;
	}
	public String getIfmmGenderCd() {
		return ifmmGenderCd;
	}
	public void setIfmmGenderCd(String ifmmGenderCd) {
		this.ifmmGenderCd = ifmmGenderCd;
	}
	public String getIfmmDob() {
		return ifmmDob;
	}
	public void setIfmmDob(String ifmmDob) {
		this.ifmmDob = ifmmDob;
	}
	public String getIfmmFavoriteColor() {
		return ifmmFavoriteColor;
	}
	public void setIfmmFavoriteColor(String ifmmFavoriteColor) {
		this.ifmmFavoriteColor = ifmmFavoriteColor;
	}
	public Integer getIfmmGradeCd() {
		return ifmmGradeCd;
	}
	public void setIfmmGradeCd(Integer ifmmGradeCd) {
		this.ifmmGradeCd = ifmmGradeCd;
	}
	public String getIfmmGrade() {
		return ifmmGrade;
	}
	public void setIfmmGrade(String ifmmGrade) {
		this.ifmmGrade = ifmmGrade;
	}
	public Integer getIfmmDelNy() {
		return ifmmDelNy;
	}
	public void setIfmmDelNy(Integer ifmmDelNy) {
		this.ifmmDelNy = ifmmDelNy;
	}
	public Integer getIfmmStatusCd() {
		return ifmmStatusCd;
	}
	public void setIfmmStatusCd(Integer ifmmStatusCd) {
		this.ifmmStatusCd = ifmmStatusCd;
	}
	public String getIfmmStatus() {
		return ifmmStatus;
	}
	public void setIfmmStatus(String ifmmStatus) {
		this.ifmmStatus = ifmmStatus;
	}
	public Integer getIfmmEmailConsentNy() {
		return ifmmEmailConsentNy;
	}
	public void setIfmmEmailConsentNy(Integer ifmmEmailConsentNy) {
		this.ifmmEmailConsentNy = ifmmEmailConsentNy;
	}
	public String getIfmmEmailConsentNyText() {
		return ifmmEmailConsentNyText;
	}
	public void setIfmmEmailConsentNyText(String ifmmEmailConsentNyText) {
		this.ifmmEmailConsentNyText = ifmmEmailConsentNyText;
	}
	public Integer getIfmmSmsConsentNy() {
		return ifmmSmsConsentNy;
	}
	public void setIfmmSmsConsentNy(Integer ifmmSmsConsentNy) {
		this.ifmmSmsConsentNy = ifmmSmsConsentNy;
	}
	public String getIfmmSmsConsentNyText() {
		return ifmmSmsConsentNyText;
	}
	public void setIfmmSmsConsentNyText(String ifmmSmsConsentNyText) {
		this.ifmmSmsConsentNyText = ifmmSmsConsentNyText;
	}
	public Integer getIfmmPushConsentNy() {
		return ifmmPushConsentNy;
	}
	public void setIfmmPushConsentNy(Integer ifmmPushConsentNy) {
		this.ifmmPushConsentNy = ifmmPushConsentNy;
	}
	public String getIfmmPushConsentNyText() {
		return ifmmPushConsentNyText;
	}
	public void setIfmmPushConsentNyText(String ifmmPushConsentNyText) {
		this.ifmmPushConsentNyText = ifmmPushConsentNyText;
	}
	public String getIfmmDesc() {
		return ifmmDesc;
	}
	public void setIfmmDesc(String ifmmDesc) {
		this.ifmmDesc = ifmmDesc;
	}
	public String getIfmeEmailFull() {
		return ifmeEmailFull;
	}
	public void setIfmeEmailFull(String ifmeEmailFull) {
		this.ifmeEmailFull = ifmeEmailFull;
	}
	public String getIfmeEmailAccount() {
		return ifmeEmailAccount;
	}
	public void setIfmeEmailAccount(String ifmeEmailAccount) {
		this.ifmeEmailAccount = ifmeEmailAccount;
	}
	public String getIfmeEmailDomain() {
		return ifmeEmailDomain;
	}
	public void setIfmeEmailDomain(String ifmeEmailDomain) {
		this.ifmeEmailDomain = ifmeEmailDomain;
	}
	public String getIfmeEmailDomainCd() {
		return ifmeEmailDomainCd;
	}
	public void setIfmeEmailDomainCd(String ifmeEmailDomainCd) {
		this.ifmeEmailDomainCd = ifmeEmailDomainCd;
	}
	public String getIfmpSeq() {
		return ifmpSeq;
	}
	public void setIfmpSeq(String ifmpSeq) {
		this.ifmpSeq = ifmpSeq;
	}
	public Integer getIfmpDefaultNy() {
		return ifmpDefaultNy;
	}
	public void setIfmpDefaultNy(Integer ifmpDefaultNy) {
		this.ifmpDefaultNy = ifmpDefaultNy;
	}
	public Integer getIfmpTypeCd() {
		return ifmpTypeCd;
	}
	public void setIfmpTypeCd(Integer ifmpTypeCd) {
		this.ifmpTypeCd = ifmpTypeCd;
	}
	public Integer getIfmpDeviceCd() {
		return ifmpDeviceCd;
	}
	public void setIfmpDeviceCd(Integer ifmpDeviceCd) {
		this.ifmpDeviceCd = ifmpDeviceCd;
	}
	public Integer getIfmpTelecomCd() {
		return ifmpTelecomCd;
	}
	public void setIfmpTelecomCd(Integer ifmpTelecomCd) {
		this.ifmpTelecomCd = ifmpTelecomCd;
	}
	public String getIfmpNumber() {
		return ifmpNumber;
	}
	public void setIfmpNumber(String ifmpNumber) {
		this.ifmpNumber = ifmpNumber;
	}
	public Integer getIfmpDelNy() {
		return ifmpDelNy;
	}
	public void setIfmpDelNy(Integer ifmpDelNy) {
		this.ifmpDelNy = ifmpDelNy;
	}
	public Integer[] getIfmpDefaultNyArray() {
		return ifmpDefaultNyArray;
	}
	public void setIfmpDefaultNyArray(Integer[] ifmpDefaultNyArray) {
		this.ifmpDefaultNyArray = ifmpDefaultNyArray;
	}
	public Integer[] getIfmpTypeCdArray() {
		return ifmpTypeCdArray;
	}
	public void setIfmpTypeCdArray(Integer[] ifmpTypeCdArray) {
		this.ifmpTypeCdArray = ifmpTypeCdArray;
	}
	public Integer[] getIfmpDeviceCdArray() {
		return ifmpDeviceCdArray;
	}
	public void setIfmpDeviceCdArray(Integer[] ifmpDeviceCdArray) {
		this.ifmpDeviceCdArray = ifmpDeviceCdArray;
	}
	public Integer[] getIfmpTelecomCdArray() {
		return ifmpTelecomCdArray;
	}
	public void setIfmpTelecomCdArray(Integer[] ifmpTelecomCdArray) {
		this.ifmpTelecomCdArray = ifmpTelecomCdArray;
	}
	public String[] getIfmpNumberArray() {
		return ifmpNumberArray;
	}
	public void setIfmpNumberArray(String[] ifmpNumberArray) {
		this.ifmpNumberArray = ifmpNumberArray;
	}
	public Integer[] getIfmpDelNyArray() {
		return ifmpDelNyArray;
	}
	public void setIfmpDelNyArray(Integer[] ifmpDelNyArray) {
		this.ifmpDelNyArray = ifmpDelNyArray;
	}
	public String getIfmaZipCode() {
		return ifmaZipCode;
	}
	public void setIfmaZipCode(String ifmaZipCode) {
		this.ifmaZipCode = ifmaZipCode;
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
	public String getIfmaAddressReferences() {
		return ifmaAddressReferences;
	}
	public void setIfmaAddressReferences(String ifmaAddressReferences) {
		this.ifmaAddressReferences = ifmaAddressReferences;
	}
	public String getIfntSeq() {
		return ifntSeq;
	}
	public void setIfntSeq(String ifntSeq) {
		this.ifntSeq = ifntSeq;
	}
	public String getIfntOrder() {
		return ifntOrder;
	}
	public void setIfntOrder(String ifntOrder) {
		this.ifntOrder = ifntOrder;
	}
	public String getIfntContent() {
		return ifntContent;
	}
	public void setIfntContent(String ifntContent) {
		this.ifntContent = ifntContent;
	}
	public String getIfntWriter() {
		return ifntWriter;
	}
	public void setIfntWriter(String ifntWriter) {
		this.ifntWriter = ifntWriter;
	}
	public String getIfnaSeq() {
		return ifnaSeq;
	}
	public void setIfnaSeq(String ifnaSeq) {
		this.ifnaSeq = ifnaSeq;
	}
	public String getIfnaName() {
		return ifnaName;
	}
	public void setIfnaName(String ifnaName) {
		this.ifnaName = ifnaName;
	}
	public String getIfnaCode2Char() {
		return ifnaCode2Char;
	}
	public void setIfnaCode2Char(String ifnaCode2Char) {
		this.ifnaCode2Char = ifnaCode2Char;
	}
	public String getIfnaCode3Char() {
		return ifnaCode3Char;
	}
	public void setIfnaCode3Char(String ifnaCode3Char) {
		this.ifnaCode3Char = ifnaCode3Char;
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
	public String getIfaoSeq() {
		return ifaoSeq;
	}
	public void setIfaoSeq(String ifaoSeq) {
		this.ifaoSeq = ifaoSeq;
	}
	public Integer getIfaoTypeCd() {
		return ifaoTypeCd;
	}
	public void setIfaoTypeCd(Integer ifaoTypeCd) {
		this.ifaoTypeCd = ifaoTypeCd;
	}
	public Integer getIfaoDefaultNy() {
		return ifaoDefaultNy;
	}
	public void setIfaoDefaultNy(Integer ifaoDefaultNy) {
		this.ifaoDefaultNy = ifaoDefaultNy;
	}
	public Integer getIfaoSnsTypeCd() {
		return ifaoSnsTypeCd;
	}
	public void setIfaoSnsTypeCd(Integer ifaoSnsTypeCd) {
		this.ifaoSnsTypeCd = ifaoSnsTypeCd;
	}
	public String getIfaoTitle() {
		return ifaoTitle;
	}
	public void setIfaoTitle(String ifaoTitle) {
		this.ifaoTitle = ifaoTitle;
	}
	public String getIfaoUrl() {
		return ifaoUrl;
	}
	public void setIfaoUrl(String ifaoUrl) {
		this.ifaoUrl = ifaoUrl;
	}
	public String getIfntWriterCd() {
		return ifntWriterCd;
	}
	public void setIfntWriterCd(String ifntWriterCd) {
		this.ifntWriterCd = ifntWriterCd;
	}
	public Integer getIfmmAdminNy() {
		return ifmmAdminNy;
	}
	public void setIfmmAdminNy(Integer ifmmAdminNy) {
		this.ifmmAdminNy = ifmmAdminNy;
	}
	public Double getIfmaLat() {
		return ifmaLat;
	}
	public void setIfmaLat(Double ifmaLat) {
		this.ifmaLat = ifmaLat;
	}
	public Double getIfmaLng() {
		return ifmaLng;
	}
	public void setIfmaLng(Double ifmaLng) {
		this.ifmaLng = ifmaLng;
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
	public Integer[] getIfaoTypeCdArray() {
		return ifaoTypeCdArray;
	}
	public void setIfaoTypeCdArray(Integer[] ifaoTypeCdArray) {
		this.ifaoTypeCdArray = ifaoTypeCdArray;
	}
	public Integer[] getIfaoDefaultNyArray() {
		return ifaoDefaultNyArray;
	}
	public void setIfaoDefaultNyArray(Integer[] ifaoDefaultNyArray) {
		this.ifaoDefaultNyArray = ifaoDefaultNyArray;
	}
	public Integer[] getIfaoSnsTypeCdArray() {
		return ifaoSnsTypeCdArray;
	}
	public void setIfaoSnsTypeCdArray(Integer[] ifaoSnsTypeCdArray) {
		this.ifaoSnsTypeCdArray = ifaoSnsTypeCdArray;
	}
	public String[] getIfaoTitleArray() {
		return ifaoTitleArray;
	}
	public void setIfaoTitleArray(String[] ifaoTitleArray) {
		this.ifaoTitleArray = ifaoTitleArray;
	}
	public String[] getIfaoUrlArray() {
		return ifaoUrlArray;
	}
	public void setIfaoUrlArray(String[] ifaoUrlArray) {
		this.ifaoUrlArray = ifaoUrlArray;
	}
	public String getIfmmGender() {
		return ifmmGender;
	}
	public void setIfmmGender(String ifmmGender) {
		this.ifmmGender = ifmmGender;
	}
	
}
