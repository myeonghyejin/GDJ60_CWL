package com.team.cwl.recipe;

public class RecipeDTO {
	
	private Long recipeNum;
	private String memberId;
	private String recipeTitle;
	private String recipeContents;
	private String recipeIngredients;
	private String recipeBase;
	
	private RecipeImgDTO recipeImgDTOs;
	
	public Long getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(Long recipeNum) {
		this.recipeNum = recipeNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getRecipeContents() {
		return recipeContents;
	}
	public void setRecipeContents(String recipeContents) {
		this.recipeContents = recipeContents;
	}
	public String getRecipeIngredients() {
		return recipeIngredients;
	}
	public void setRecipeIngredients(String recipeIngredients) {
		this.recipeIngredients = recipeIngredients;
	}
	public String getRecipeBase() {
		return recipeBase;
	}
	public void setRecipeBase(String recipeBase) {
		this.recipeBase = recipeBase;
	}
	
	public RecipeImgDTO getRecipeImgDTOs() {
		return recipeImgDTOs;
	}
	public void setRecipeImgDTOs(RecipeImgDTO recipeImgDTOs) {
		this.recipeImgDTOs = recipeImgDTOs;
	}

}
