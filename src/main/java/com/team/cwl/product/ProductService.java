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
	public int setProductAdd(ProductDTO productDTO, MultipartFile multipartFile, HttpSession session) throws Exception {
		int result = productDAO.setProductAdd(productDTO);
		
		//file HDD에 저장
		String realPath = session.getServletContext().getRealPath("resources/upload/product/");
		System.out.println(realPath);
					
		String imgName = fileManager.fileSave(multipartFile, realPath);
		
		//DB에 Insert
		ProductImgDTO productImgDTO = new ProductImgDTO();
		productImgDTO.setProductNum(productDTO.getProductNum());
		productImgDTO.setImgName(imgName);
		productImgDTO.setOriginalName(multipartFile.getOriginalFilename());
					
		result = productDAO.setProductImgAdd(productImgDTO);
		
		return result;
	}

	/** UPDATE **/
	public int setProductUpdate(ProductDTO productDTO) throws Exception {
		return productDAO.setProductUpdate(productDTO);
	}

	/** DELETE **/
	public int setProductDelete(ProductDTO productDTO) throws Exception {
		return productDAO.setProductDelete(productDTO);
	}

}
