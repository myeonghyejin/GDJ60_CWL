package com.team.cwl.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.util.Pagination;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.team.cwl.product.ProductDAO.";

//--------------------------------------------
	
	/** SELECT **/
	public List<ProductDTO> getProductList(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getProductList", pagination);
	}

	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getProductDetail", productDTO);
	}
	
	public List<ProductImgDTO> getProductImgList(ProductDTO productDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getProductImgList", productDTO);
	}

	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}
	
	/** INSERT **/
	public int setProductAdd(ProductDTO productDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductAdd", productDTO);
	}
	
	public int setProductImgAdd(ProductImgDTO productImgDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductImgAdd", productImgDTO);
	}

	/** UPDATE **/
	public int setProductUpdate(ProductDTO productDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setProductUpdate", productDTO);
	}

	/** DELETE **/
	public int setProductDelete(ProductDTO productDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setProductDelete", productDTO);
	}
	
	public int setProductImgDelete(Long imgNum) throws Exception {
		return sqlSession.delete(NAMESPACE+"setProductImgDelete", imgNum);
	}

}
