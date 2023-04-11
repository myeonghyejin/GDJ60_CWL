package com.team.cwl.recipe;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.util.Pagination;

@Repository
public class RecipeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.team.cwl.recipe.RecipeDAO.";

//--------------------------------------------
	
	/** SELECT **/
	public List<RecipeDTO> getRecipeList(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getRecipeList", pagination);
	}

	public RecipeDTO getRecipeDetail(RecipeDTO recipeDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getRecipeDetail", recipeDTO);
	}

	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}
	
	/** INSERT **/
	public int setRecipeAdd(RecipeDTO recipeDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setRecipeAdd", recipeDTO);
	}
	
	public int setRecipeImgAdd(RecipeImgDTO recipeImgDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setRecipeImgAdd", recipeImgDTO);
	}

	/** UPDATE **/
	public int setRecipeUpdate(RecipeDTO recipeDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setRecipeUpdate", recipeDTO);
	}

	/** DELETE **/
	public int setRecipeDelete(RecipeDTO recipeDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setRecipeDelete", recipeDTO);
	}
	
	public int setRecipeImgDelete(Long imgNum) throws Exception {
		return sqlSession.delete(NAMESPACE+"setRecipeImgDelete", imgNum);
	}

}
