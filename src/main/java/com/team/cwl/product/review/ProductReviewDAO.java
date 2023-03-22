package com.team.cwl.product.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.util.Pagination;

@Repository
public class ProductReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.team.cwl.product.review.ProductReviewDAO.";
	
//--------------------------------------------
	
	/** SELECT **/
	public List<ProductReviewDTO> getProductReviewList(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getProductReviewList", pagination);
	}
	
	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}

	/** INSERT **/
	public int setProductReviewAdd(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductReviewAdd", productReviewDTO);
	}
	
	/** UPDATE **/
	public int setProductReviewUpdate(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setProductReviewUpdate", productReviewDTO);
	}
	
	/** DELETE **/
	public int setProductReviewDelete(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setProductReviewDelete", productReviewDTO);
	}

}
