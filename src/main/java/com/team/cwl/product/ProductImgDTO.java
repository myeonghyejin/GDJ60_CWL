package com.team.cwl.product;

public class ProductImgDTO {
	
	private Long productImgNum;
	private Long productNum;
	private String imgName;
	private String originalName;
	
	public Long getProductImgNum() {
		return productImgNum;
	}
	public void setProductImgNum(Long productImgNum) {
		this.productImgNum = productImgNum;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

}
