package com.team.cwl.order;

public class OrderCancelDTO {
	
	private String memberId;
	
	private Long orderNum;
	
	private String keyword;
	
	private Long amount;
	
	private Long pageNum;

	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Long getOrderNum() {
		return orderNum;
	}
	
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public Long getPageNum() {
		return pageNum;
	}

	public void setPageNum(Long pageNum) {
		this.pageNum = pageNum;
	}

	@Override
	public String toString() {
		return "OrderCancelDTO [memberId=" + memberId + ", orderNum=" + orderNum + ", keyword=" + keyword + ", amount="
				+ amount + ", pageNum=" + pageNum + "]";
	}
}
