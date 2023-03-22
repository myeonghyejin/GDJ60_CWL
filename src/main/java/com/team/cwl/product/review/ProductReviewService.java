package com.team.cwl.product.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.util.Pagination;

@Service
public class ProductReviewService {
	
	@Autowired
	private ProductReviewDAO productReviewDAO;
	
//--------------------------------------------
	
	/** SELECT **/
	public List<ProductReviewDTO> getProductReviewList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(productReviewDAO.getTotalCount(pagination));
		return productReviewDAO.getProductReviewList(pagination);
	}

	/** INSERT **/
	public int setProductReviewAdd(ProductReviewDTO productReviewDTO, HttpSession session) throws Exception {
		return productReviewDAO.setProductReviewAdd(productReviewDTO);
	}
	
	/** UPDATE **/
	public int setProductReviewUpdate(ProductReviewDTO productReviewDTO) throws Exception {
		return productReviewDAO.setProductReviewUpdate(productReviewDTO);
	}
	
	/** DELETE **/
	public int setProductReviewDelete(ProductReviewDTO productReviewDTO) throws Exception {
		return productReviewDAO.setProductReviewDelete(productReviewDTO);
	}

}
