package com.team.cwl.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.cwl.board.BoardDAO;
import com.team.cwl.util.Pagination;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.team.cwl.board.BoardDAO.";

//--------------------------------------------
	
	/** SELECT **/
	public List<BoardDTO> getBoardList(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getBoardList", pagination);
	}
	
	public List<BoardDTO> getNoticeList(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getNoticeList", boardDTO);
	}

	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getBoardDetail", boardDTO);
	}

	public Long getTotalCount(Pagination pagination) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pagination);
	}
	
	/** INSERT **/
	public int setBoardAdd(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setBoardAdd", boardDTO);
	}

	/** UPDATE **/
	public int setBoardUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setBoardUpdate", boardDTO);
	}
	
	public int setBoardHitUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setBoardHitUpdate", boardDTO);
	}

	/** DELETE **/
	public int setBoardDelete(BoardDTO boardDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setBoardDelete", boardDTO);
	}
	
}
