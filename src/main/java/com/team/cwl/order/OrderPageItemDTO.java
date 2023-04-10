package com.team.cwl.order;

import java.util.List;

import com.team.cwl.product.ProductImgDTO;

public class OrderPageItemDTO {
	
	// 뷰로부터 전달받을 값
	private Long productNum;
	
	private int orderStock;
	
	// DB로부터 꺼내올 값
	private String productName;
	
	private int productPrice;
	
	// 만들어 낼 값
	private int totalPrice;
	
	private List<ProductImgDTO> imageList;

	
	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}

	public int getOrderStock() {
		return orderStock;
	}

	public void setOrderStock(int orderStock) {
		this.orderStock = orderStock;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public List<ProductImgDTO> getImageList() {
		return imageList;
	}

	public void setImageList(List<ProductImgDTO> imageList) {
		this.imageList = imageList;
	}

	public void initTotal() {
		this.totalPrice = this.productPrice*this.orderStock;
	}
	
	@Override
	public String toString() {
		return "OrderPageItemDTO [productNum=" + productNum + ", orderStock=" + orderStock + ", productName="
				+ productName + ", productPrice=" + productPrice + ", totalPrice=" + totalPrice + ", imageList="
				+ imageList + "]";
	}
	
	
	
	
	
	
	
}
