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
	
	public ProductReviewDTO getProductReviewDetail(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getProductReviewDetail", productReviewDTO);
	}
	
	public List<ProductReviewImgDTO> getProductReviewImgList(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getProductReviewImgList", productReviewDTO);
	}
	
	public ProductReviewImgDTO getProductReviewImgDetail(ProductReviewImgDTO productReviewImgDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getProductReviewImgDetail", productReviewImgDTO);
	}
	
	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}

	/** INSERT **/
	public int setProductReviewAdd(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductReviewAdd", productReviewDTO);
	}
	
	public int setProductReviewImgAdd(ProductReviewImgDTO productReviewImgDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductReviewImgAdd", productReviewImgDTO);
	}
	
	/** UPDATE **/
	public int setProductReviewUpdate(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setProductReviewUpdate", productReviewDTO);
	}
	
	/** DELETE **/
	public int setProductReviewDelete(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setProductReviewDelete", productReviewDTO);
	}
	
	public int setProductReviewImgDelete(Long imgNum) throws Exception {
		return sqlSession.delete(NAMESPACE+"setProductReviewImgDelete", imgNum);
	}

}
