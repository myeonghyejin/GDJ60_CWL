package com.team.cwl.product.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.util.Pagination;

@Service
public class ProductQnAService {
	
	@Autowired
	private ProductQnADAO productQnADAO;
	
//--------------------------------------------
	
	/** SELECT **/
	public List<ProductQnADTO> getProductQnAList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(productQnADAO.getTotalCount(pagination));
		return productQnADAO.getProductQnAList(pagination);
	}

	/** INSERT **/
	public int setProductQnAAdd(ProductQnADTO productQnADTO) throws Exception {
		return productQnADAO.setProductQnAAdd(productQnADTO);
	}
	
	/** UPDATE **/
	public int setProductQnAUpdate(ProductQnADTO productQnADTO) throws Exception {
		return productQnADAO.setProductQnAUpdate(productQnADTO);
	}
	
	/** DELETE **/
	public int setProductQnADelete(ProductQnADTO productQnADTO) throws Exception {
		return productQnADAO.setProductQnADelete(productQnADTO);
	}

}
