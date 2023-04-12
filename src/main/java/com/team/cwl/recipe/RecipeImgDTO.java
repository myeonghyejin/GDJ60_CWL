package com.team.cwl.recipe;

public class RecipeImgDTO {
	
	private Long recipeImgNum;
	private Long recipeNum;
	private String imgName;
	private String originalName;
	
	public Long getRecipeImgNum() {
		return recipeImgNum;
	}
	public void setRecipeImgNum(Long recipeImgNum) {
		this.recipeImgNum = recipeImgNum;
	}
	public Long getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(Long recipeNum) {
		this.recipeNum = recipeNum;
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
