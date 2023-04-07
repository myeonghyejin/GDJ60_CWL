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
		
		if(productQnADAO.getTotalCount(pagination) == 0) {
			pagination.setLastNum(1L);
		}
		
		return productQnADAO.getProductQnAList(pagination);
	}
	
	public ProductQnADTO getProductQnADetail(ProductQnADTO productQnADTO) throws Exception {
		return productQnADAO.getProductQnADetail(productQnADTO);
	}

	/** INSERT **/
	public int setProductQnAAdd(ProductQnADTO productQnADTO) throws Exception {
		return productQnADAO.setProductQnAAdd(productQnADTO);
	}
	
	public int setProductQnAReplyAdd(ProductQnADTO productQnADTO) throws Exception {
		ProductQnADTO parent = productQnADAO.getProductQnADetail(productQnADTO);
		
		productQnADTO.setProductQnARef(parent.getProductQnARef());
		productQnADTO.setProductQnAStep(parent.getProductQnAStep()+1);
		productQnADTO.setProductQnADepth(parent.getProductQnADepth()+1);
		
		int result = productQnADAO.setStepUpdate(parent);
	
		result = productQnADAO.setProductQnAReplyAdd(productQnADTO);
		
		return result;
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
