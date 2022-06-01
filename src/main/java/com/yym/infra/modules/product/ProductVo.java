package com.yym.infra.modules.product;

public class ProductVo {
	
	private String trpdSeq;
	private String[] trpdSeqArray;
	private String ifmmSeq;
	private String ifsaSeq;
	private String trctSeq;
	private String trprSeq;
	
	private Integer shCategory = 0;
	private String shBar = "";
	
	private String shSort;
	
	private Integer trprOptionChildCd1;
	private Integer trprOptionChildCd2;
	private Integer trprOptionChildCd3;
	
	
//	paging
	private int thisPage = 1;									// 현재 페이지					지금은!	// 현재 페이지
	private int rowNumToShow = 4;								// 화면에 보여줄 데이터 줄 갯수				// 한 페이지에 들어가는 물품 개수
	private int pageNumToShow = 5;								// 화면에 보여줄 페이징 번호 갯수			// 화면에 보여줄 최대 페이지 개수
	private int totalRows;										// 전체 데이터 갯수						// 전체 물품 개수
	private int totalPages;										// 전체 페이지 번호						// 전체 페이지 번호
	private int startPage;										// 시작 페이지 번호						// 시작 페이지 번호
	private int endPage;										// 마지막 페이지 번호						// 마지막 페이지 번호
	private int startRnumForMysql = 0;							// 쿼리 시작 row						// 보여주기 시작할 물건 번호
	
	//------------
	
	
		public void setParamsPaging(int totalRowsParam) {
			
			totalRows = totalRowsParam; 

			totalPages = totalRows / rowNumToShow;
			
			// 검색결과가 안나올 때 thisPage가 0이 되는데 다시 1로 바꿔줘야 오류가 발생안함
			if(thisPage == 0) {
				thisPage = 1;
				startRnumForMysql = 0;
			}

			if (totalRows % rowNumToShow > 0) {
				totalPages = totalPages+ 1;
			}

			if (totalPages < thisPage) {
				thisPage = totalPages;
			}
			
			startPage = (((thisPage - 1) / pageNumToShow) * pageNumToShow + 1);

			endPage = (startPage + pageNumToShow - 1);

			if (endPage > totalPages) {
				endPage = (totalPages);
			}
			
			if (thisPage == 1) {
				startRnumForMysql = 0;
			} else {
				startRnumForMysql = ((rowNumToShow * (thisPage-1)));
			}
			
			System.out.println("getThisPage():" + thisPage);
			System.out.println("getTotalRows():" + totalRows);
			System.out.println("getRowNumToShow():" + rowNumToShow);
			System.out.println("getTotalPages():" + totalPages);
			System.out.println("getStartPage():" + startPage);
			System.out.println("getEndPage():" + endPage);		
			System.out.println("getStartRnumForMysql(): " + startRnumForMysql);
			
		}
	//------------
		
		public String getTrpdSeq() {
			return trpdSeq;
		}

		public String getTrprSeq() {
			return trprSeq;
		}

		public void setTrprSeq(String trprSeq) {
			this.trprSeq = trprSeq;
		}

		public void setTrpdSeq(String trpdSeq) {
			this.trpdSeq = trpdSeq;
		}

		public String getIfmmSeq() {
			return ifmmSeq;
		}

		public void setIfmmSeq(String ifmmSeq) {
			this.ifmmSeq = ifmmSeq;
		}

		public String getTrctSeq() {
			return trctSeq;
		}

		public void setTrctSeq(String trctSeq) {
			this.trctSeq = trctSeq;
		}

		public Integer getShCategory() {
			return shCategory;
		}

		public void setShCategory(Integer shCategory) {
			this.shCategory = shCategory;
		}

		public String getShBar() {
			return shBar;
		}

		public void setShBar(String shBar) {
			this.shBar = shBar;
		}

		public String getShSort() {
			return shSort;
		}

		public void setShSort(String shSort) {
			this.shSort = shSort;
		}

		public Integer getTrprOptionChildCd1() {
			return trprOptionChildCd1;
		}

		public void setTrprOptionChildCd1(Integer trprOptionChildCd1) {
			this.trprOptionChildCd1 = trprOptionChildCd1;
		}

		public Integer getTrprOptionChildCd2() {
			return trprOptionChildCd2;
		}

		public void setTrprOptionChildCd2(Integer trprOptionChildCd2) {
			this.trprOptionChildCd2 = trprOptionChildCd2;
		}

		public Integer getTrprOptionChildCd3() {
			return trprOptionChildCd3;
		}

		public void setTrprOptionChildCd3(Integer trprOptionChildCd3) {
			this.trprOptionChildCd3 = trprOptionChildCd3;
		}

		public int getThisPage() {
			return thisPage;
		}

		public void setThisPage(int thisPage) {
			this.thisPage = thisPage;
		}

		public int getRowNumToShow() {
			return rowNumToShow;
		}

		public void setRowNumToShow(int rowNumToShow) {
			this.rowNumToShow = rowNumToShow;
		}

		public int getPageNumToShow() {
			return pageNumToShow;
		}

		public void setPageNumToShow(int pageNumToShow) {
			this.pageNumToShow = pageNumToShow;
		}

		public int getTotalRows() {
			return totalRows;
		}

		public void setTotalRows(int totalRows) {
			this.totalRows = totalRows;
		}

		public int getTotalPages() {
			return totalPages;
		}

		public void setTotalPages(int totalPages) {
			this.totalPages = totalPages;
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public int getStartRnumForMysql() {
			return startRnumForMysql;
		}

		public void setStartRnumForMysql(int startRnumForMysql) {
			this.startRnumForMysql = startRnumForMysql;
		}

		public String getIfsaSeq() {
			return ifsaSeq;
		}

		public void setIfsaSeq(String ifsaSeq) {
			this.ifsaSeq = ifsaSeq;
		}

		public String[] getTrpdSeqArray() {
			return trpdSeqArray;
		}

		public void setTrpdSeqArray(String[] trpdSeqArray) {
			this.trpdSeqArray = trpdSeqArray;
		}

}
