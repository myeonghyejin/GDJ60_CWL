package com.team.cwl.board.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.util.Pagination;

@Service
public class BoardCommentService {
	
	@Autowired
	private BoardCommentDAO boardCommentDAO;
	
//--------------------------------------------
	
	/** SELECT **/
	public List<BoardCommentDTO> getBoardCommentList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(boardCommentDAO.getTotalCount(pagination));
		return boardCommentDAO.getBoardCommentList(pagination);
	}
	
	/** INSERT **/
	public int setBoardCommentAdd(BoardCommentDTO boardCommentDTO) throws Exception {
		return boardCommentDAO.setBoardCommentAdd(boardCommentDTO);
	}
	
	/** UPDATE **/
	public int setBoardCommentUpdate(BoardCommentDTO boardCommentDTO) throws Exception {
		return boardCommentDAO.setBoardCommentUpdate(boardCommentDTO);
	}
	
	/** DELETE **/
	public int setBoardCommentDelete(BoardCommentDTO boardCommentDTO) throws Exception {
		return boardCommentDAO.setBoardCommentDelete(boardCommentDTO);
	}

}
