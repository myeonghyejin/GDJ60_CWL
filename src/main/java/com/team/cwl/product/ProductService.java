package com.team.cwl.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.cwl.util.FileManager;
import com.team.cwl.util.Pagination;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileManager fileManager;
	
//----------------------------------------------
	
	/** SELECT **/
	public List<ProductDTO> getProductList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(productDAO.getTotalCount(pagination));
		
		return productDAO.getProductList(pagination);
	}

	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception {
		return productDAO.getProductDetail(productDTO);
	}

	/** INSERT **/
	public int setProductAdd(ProductDTO productDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception {
		int result = productDAO.setProductAdd(productDTO);
		
		String realPath = session.getServletContext().getRealPath("resources/upload/product/");

		System.out.println(realPath);
		
		for(MultipartFile multipartFile : multipartFiles) {
			String imgName = fileManager.fileSave(multipartFile, realPath);

			ProductImgDTO productImgDTO = new ProductImgDTO();
			productImgDTO.setProductNum(productDTO.getProductNum());
			productImgDTO.setImgName(imgName);
			productImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = productDAO.setProductImgAdd(productImgDTO);	
		}
		return result;
	}

	/** UPDATE **/
	public int setProductUpdate(ProductDTO productDTO, MultipartFile [] multipartFiles, HttpSession session, Long [] imgNums) throws Exception {
		int result = productDAO.setProductAdd(productDTO);
		
		if(imgNums != null) {
			for(Long imgNum : imgNums) {
				productDAO.setProductImgDelete(imgNum);
			}
		}
		
		String realPath = session.getServletContext().getRealPath("resources/upload/product/");

		for(MultipartFile multipartFile : multipartFiles) {
			String imgName = fileManager.fileSave(multipartFile, realPath);

			ProductImgDTO productImgDTO = new ProductImgDTO();
			productImgDTO.setProductNum(productDTO.getProductNum());
			productImgDTO.setImgName(imgName);
			productImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = productDAO.setProductImgAdd(productImgDTO);	
		}
		return result;
	}

	/** DELETE **/
	public int setProductDelete(ProductDTO productDTO, HttpSession session) throws Exception {
		List<ProductImgDTO> ar = productDAO.getProductImgList(productDTO);
		
		int result = productDAO.setProductDelete(productDTO);
		
		if(result > 0) {			
			String realPath = session.getServletContext().getRealPath("resources/upload/lesson/");
			
			for(ProductImgDTO productImgDTO : ar) {
				boolean check = fileManager.fileDelete(realPath, productImgDTO.getImgName());
			}
			
		}
		return productDAO.setProductDelete(productDTO);
	}
	
	public int setProductImgDelete(Long imgNum) throws Exception {
		return productDAO.setProductImgDelete(imgNum);
	}
}
