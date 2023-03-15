package com.team.cwl.board.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.util.Pagination;

@Repository
public class BoardCommentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.team.cwl.board.comment.BoardCommentDAO.";
	
//--------------------------------------------
	
	/** SELECT **/
	public List<BoardCommentDTO> getBoardCommentList(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getBoardCommentList", pagination);
	}
	
	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}
	
	/** INSERT **/
	public int setBoardCommentAdd(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"getBoardCommentAdd", boardCommentDTO);
	}
	
	/** UPDATE **/
	public int setBoardCommentUpdate(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"getBoardCommentUpdate", boardCommentDTO);
	}
	
	/** DELETE **/
	public int setBoardCommentDelete(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"getBoardCommentDelete", boardCommentDTO);
	}

}
