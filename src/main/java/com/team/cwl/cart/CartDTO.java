package com.team.cwl.cart;

import java.util.List;

import com.team.cwl.product.ProductImgDTO;

public class CartDTO {
	
	private Long cartNum;
	
	private String memberId;
	
	private Long productNum;
	
	private Long productStock;
	
	// product	
	private String productName;
	
	private Long productPrice;
	
	// 추가
	private Long totalPrice;
	
	/* 상품 이미지 */
	private List<ProductImgDTO> imageList;

	public Long getCartNum() {
		return cartNum;
	}

	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

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
		return "CartDTO [cartNum=" + cartNum + ", memberId=" + memberId + ", productNum=" + productNum
				+ ", productStock=" + productStock + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", totalPrice=" + totalPrice + ", imageList=" + imageList + "]";
	}
	
	
	
	
	
}
