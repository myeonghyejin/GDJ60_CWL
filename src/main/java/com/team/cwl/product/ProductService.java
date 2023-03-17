package com.team.cwl.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.util.Pagination;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
//----------------------------------------------
	
	/** SELECT **/
	public List<ProductDTO> getProductList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(productDAO.getTotalCount(pagination));
		
		return productDAO.getProductList(pagination);
	}

	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception {
		productDAO.setProductHitUpdate(productDTO);
		return productDAO.getProductDetail(productDTO);
	}

	/** INSERT **/
	public int setProductAdd(ProductDTO productDTO) throws Exception {
		return productDAO.setProductAdd(productDTO);
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
