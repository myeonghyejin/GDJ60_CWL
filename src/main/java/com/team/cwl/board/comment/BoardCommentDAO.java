package com.team.cwl.board.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.board.BoardDTO;
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
	
	public BoardCommentDTO getBoardCommentDetail(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getBoardCommentDetail", boardCommentDTO);
	}
	
	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}
	
	/** INSERT **/
	public int setBoardCommentAdd(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setBoardCommentAdd", boardCommentDTO);
	}
	
	public int setBoardCommentReplyAdd(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setBoardCommentReplyAdd", boardCommentDTO);
	}
	
	/** UPDATE **/
	public int setBoardCommentUpdate(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setBoardCommentUpdate", boardCommentDTO);
	}
	
	public int setStepUpdate(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setStepUpdate", boardCommentDTO);
	}
	
	public int setBoardCommentCountUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setBoardCommentCountUpdate", boardDTO);
	}
	
	/** DELETE **/
	public int setBoardCommentDelete(BoardCommentDTO boardCommentDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setBoardCommentDelete", boardCommentDTO);
	}

}
