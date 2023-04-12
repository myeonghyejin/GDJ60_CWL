package com.team.cwl.recipe;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.cwl.util.FileManager;
import com.team.cwl.util.Pagination;

@Service
public class RecipeService {

	@Autowired
	private RecipeDAO recipeDAO;
	
	@Autowired
	private FileManager fileManager;
	
//----------------------------------------------
	
	/** SELECT **/
	public List<RecipeDTO> getRecipeList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(recipeDAO.getTotalCount(pagination));
		
		List<RecipeDTO> ar = recipeDAO.getRecipeList(pagination);
		ArrayList<RecipeDTO> ar2 = new ArrayList<RecipeDTO>();
		
		for(RecipeDTO recipeDTO: ar) {
			recipeDTO = recipeDAO.getRecipeDetail(recipeDTO);
			ar2.add(recipeDTO);
		}
		
		if(recipeDAO.getTotalCount(pagination) == 0) {
			pagination.setLastNum(1L);
		}
		
		return ar2;
	}

	public RecipeDTO getRecipeDetail(RecipeDTO recipeDTO) throws Exception {
		return recipeDAO.getRecipeDetail(recipeDTO);
	}

	/** INSERT **/
	public int setRecipeAdd(RecipeDTO recipeDTO, MultipartFile multipartFile, HttpSession session) throws Exception {
		int result = recipeDAO.setRecipeAdd(recipeDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/recipe/");

		System.out.println(realPath);
		
		if(!multipartFile.isEmpty()) {
			
			String imgName = fileManager.fileSave(multipartFile, realPath);

			RecipeImgDTO recipeImgDTO = new RecipeImgDTO();
			recipeImgDTO.setRecipeNum(recipeDTO.getRecipeNum());
			recipeImgDTO.setImgName(imgName);
			recipeImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = recipeDAO.setRecipeImgAdd(recipeImgDTO);	
		}
		return result;
	}

	/** UPDATE **/
	public int setRecipeUpdate(RecipeDTO recipeDTO, MultipartFile multipartFile, HttpSession session, Long imgNum) throws Exception {
		int result = recipeDAO.setRecipeUpdate(recipeDTO);
		
		if(imgNum != null) {
			recipeDAO.setRecipeImgDelete(imgNum);
		}
		
		String realPath = session.getServletContext().getRealPath("resources/upload/recipe/");
		
		if(!multipartFile.isEmpty()) {
			
			String imgName = fileManager.fileSave(multipartFile, realPath);

			RecipeImgDTO recipeImgDTO = new RecipeImgDTO();
			recipeImgDTO.setRecipeNum(recipeDTO.getRecipeNum());
			recipeImgDTO.setImgName(imgName);
			recipeImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = recipeDAO.setRecipeImgAdd(recipeImgDTO);	
		}
		
		return result;
	}

	/** DELETE **/
	public int setRecipeDelete(RecipeDTO recipeDTO, HttpSession session) throws Exception {
		return recipeDAO.setRecipeDelete(recipeDTO);
	}
	
}