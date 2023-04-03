package com.team.cwl.order;

import java.util.List;

import com.team.cwl.product.ProductImgDTO;

public class OrderPageItemDTO {
	
	// 뷰로부터 전달받을 값
	private Long productNum;
	
	private Long productStock;
	
	// DB로부터 꺼내올 값
	private String productName;
	
	private Long productPrice;
	
	// 만들어 낼 값
	private Long totalPrice;
	
	private List<ProductImgDTO> imageList;

	
	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}

	public Long getProductStock() {
		return productStock;
	}

	public void setProductStock(Long productStock) {
		this.productStock = productStock;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Long getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Long productPrice) {
		this.productPrice = productPrice;
	}

	public Long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public List<ProductImgDTO> getImageList() {
		return imageList;
	}

	public void setImageList(List<ProductImgDTO> imageList) {
		this.imageList = imageList;
	}

	public void initTotal() {
		this.totalPrice = this.productPrice*this.productStock;
	}
	
	@Override
	public String toString() {
		return "OrderPageItemDTO [productNum=" + productNum + ", productStock=" + productStock + ", productName="
				+ productName + ", productPrice=" + productPrice + ", totalPrice=" + totalPrice + ", imageList="
				+ imageList + "]";
	}
	
	
	
	
	
	
	
}
