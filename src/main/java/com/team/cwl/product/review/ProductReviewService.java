package com.team.cwl.product.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.cwl.product.ProductImgDTO;
import com.team.cwl.util.FileManager;
import com.team.cwl.util.Pagination;

@Service
public class ProductReviewService {
	
	@Autowired
	private ProductReviewDAO productReviewDAO;
	
	@Autowired
	private FileManager fileManager;
	
//--------------------------------------------
	
	/** SELECT **/
	public List<ProductReviewDTO> getProductReviewList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(productReviewDAO.getTotalCount(pagination));
		return productReviewDAO.getProductReviewList(pagination);
	}
	
	public ProductReviewDTO getProductReviewDetail(ProductReviewDTO productReviewDTO) throws Exception {
		return productReviewDAO.getProductReviewDetail(productReviewDTO);
	}

	/** INSERT **/
	public int setProductReviewAdd(ProductReviewDTO productReviewDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception {
		int result = productReviewDAO.setProductReviewAdd(productReviewDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/product/review");

		System.out.println(realPath);
		
		for(MultipartFile multipartFile : multipartFiles) {
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			String imgName = fileManager.fileSave(multipartFile, realPath);

			ProductReviewImgDTO productReviewImgDTO = new ProductReviewImgDTO();
			productReviewImgDTO.setProductReviewNum(productReviewDTO.getProductReviewNum());
			productReviewImgDTO.setImgName(imgName);
			productReviewImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = productReviewDAO.setProductReviewImgAdd(productReviewImgDTO);	
		}
		return result;
	}
	
	/** UPDATE **/
	public int setProductReviewUpdate(ProductReviewDTO productReviewDTO, MultipartFile [] multipartFiles, HttpSession session, Long [] imgNums) throws Exception {
		int result = productReviewDAO.setProductReviewUpdate(productReviewDTO);
		
		if(imgNums != null) {
			for(Long imgNum : imgNums) {
				productReviewDAO.setProductReviewImgDelete(imgNum);
			}
		}
		
		String realPath = session.getServletContext().getRealPath("resources/upload/product/review");

		System.out.println(realPath);
		
		for(MultipartFile multipartFile : multipartFiles) {
			String imgName = fileManager.fileSave(multipartFile, realPath);

			ProductReviewImgDTO productReviewImgDTO = new ProductReviewImgDTO();
			productReviewImgDTO.setProductReviewNum(productReviewDTO.getProductReviewNum());
			productReviewImgDTO.setImgName(imgName);
			productReviewImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = productReviewDAO.setProductReviewImgAdd(productReviewImgDTO);	
		}
		return result;
	}
	
	/** DELETE **/
	public int setProductReviewDelete(ProductReviewDTO productReviewDTO, HttpSession session) throws Exception {
		List<ProductReviewImgDTO> ar = productReviewDAO.getProductReviewImgList(productReviewDTO);
		
		int result = productReviewDAO.setProductReviewDelete(productReviewDTO);
		
		if(result > 0) {			
			String realPath = session.getServletContext().getRealPath("resources/upload/product/review");
			
			for(ProductReviewImgDTO productReviewImgDTO : ar) {
				boolean check = fileManager.fileDelete(realPath, productReviewImgDTO.getImgName());
			}
			
		}
		return productReviewDAO.setProductReviewDelete(productReviewDTO);
	}
	
	public int setProductReviewImgDelete(Long imgNum) throws Exception {
		return productReviewDAO.setProductReviewImgDelete(imgNum);
	}

}
