package com.team.cwl.product.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.util.Pagination;

@Repository
public class ProductQnADAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.team.cwl.product.qna.ProductQnADAO.";
	
//--------------------------------------------
	
	/** SELECT **/
	public List<ProductQnADTO> getProductQnAList(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getProductQnAList", pagination);
	}
	
	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}

	/** INSERT **/
	public int setProductQnAAdd(ProductQnADTO productQnADTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductQnAAdd", productQnADTO);
	}
	
	/** UPDATE **/
	public int setProductQnAUpdate(ProductQnADTO productQnADTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setProductQnAUpdate", productQnADTO);
	}
	
	/** DELETE **/
	public int setProductQnADelete(ProductQnADTO productQnADTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setProductQnADelete", productQnADTO);
	}
	
}