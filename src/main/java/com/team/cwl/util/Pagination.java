package com.team.cwl.util;

public class Pagination {
	
	//Client가 보고 싶은 페이지 번호 (Parameter)
	private Long page;
	
	public Long getPage() {
		if(this.page == null || this.page < 1) {
			this.page = 1L;
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	
	//한 페이지에 출력될 Row의 개수
	private Long perPage;
	
	public Long getPerPage() {
		if(this.perPage == null || this.perPage == 0) {
			this.perPage = 10L;
		}
		return perPage;
	}
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
	//전체 페이지 개수
	//Setter 필요 X
	private Long totalPage;
	
	public Long getTotalPage() {
		return totalPage;
	}
	
	//한 페이지에 출력될 Row의 개수
	//DB에서 받아 오는 번호
	private Long startRow;
	private Long lastRow;
	
	public Long getStartRow() {
		return startRow;
	}
	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	public Long getLastRow() {
		return lastRow;
	}
	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}
	
	//JSP에서 출력할 번호
	private Long startNum;
	private Long lastNum;
	
	public Long getStartNum() {
		return startNum;
	}
	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}
	public Long getLastNum() {
		return lastNum;
	}
	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}
	
	//한 블럭당 출력할 번호의 개수
	private Long perBlock;
	
	public Long getPerBlock() {
		if(this.perBlock == null || this.perBlock < 1) {
			this.perBlock = 5L;
		}
		return perBlock;
	}
	public void setPerBlock(Long perBlock) {
		this.perBlock = perBlock;
	}

	//이전, 다음
	private boolean prev;
	private boolean next;

	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	//검색 종류 (사용할 COLUMN명)
	private String condition;
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}

	//검색어
	private String search;
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
//-----------------------------------------------
	
	public void makeRow() {
		this.startRow = (this.getPage() - 1) * this.getPerPage() + 1;
		this.lastRow = this.getPage() * this.getPerPage();
	}

	public void makeNum(Long totalCount) {
		//총 페이지
		this.totalPage = totalCount / this.getPerBlock();
		if(totalCount % this.getPerBlock() != 0) {
			totalPage++;
		}
		
		//총 블럭
		Long totalBlock = totalPage / this.getPerBlock();
		if(totalPage % this.getPerBlock() != 0) {
			totalBlock++;
		}
		
		//마지막 페이지 초기화
		if(this.getPage() > totalPage) {
			this.setPage(totalPage);
		}
		
		//현재 블럭 번호
		Long curBlock = this.getPage() / this.getPerBlock();
		if(this.getPage() % this.getPerBlock() != 0) {
			curBlock++;
		}
		
		//현재 블럭의 시작 번호와 끝 번호
		this.startNum = (curBlock - 1) * this.getPerBlock() + 1;
		this.lastNum = curBlock * this.getPerBlock();
		
		//이전 블록, 다음 블록 유무
		if(curBlock == 1) {
			this.prev = true;
		}
		
		this.next = true;
		if(curBlock == totalBlock) {
			this.lastNum = totalPage;
			this.next = false;
		}
	}
	
}
