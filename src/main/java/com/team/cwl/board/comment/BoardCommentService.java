package com.team.cwl.board.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.board.BoardDTO;
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
		
		if(boardCommentDAO.getTotalCount(pagination) == 0) {
			pagination.setLastNum(1L);
		}
		
		return boardCommentDAO.getBoardCommentList(pagination);
	}
	
	/** INSERT **/
	public int setBoardCommentAdd(BoardCommentDTO boardCommentDTO, HttpSession session) throws Exception {
		return boardCommentDAO.setBoardCommentAdd(boardCommentDTO);
	}
	
	public int setBoardCommentReplyAdd(BoardCommentDTO boardCommentDTO, HttpSession session) throws Exception {
		BoardCommentDTO parent = boardCommentDAO.getBoardCommentDetail(boardCommentDTO);
		
		boardCommentDTO.setBoardCommentRef(parent.getBoardCommentRef());
		boardCommentDTO.setBoardCommentStep(parent.getBoardCommentStep()+1);
		boardCommentDTO.setBoardCommentDepth(parent.getBoardCommentDepth()+1);
		
		int result = boardCommentDAO.setStepUpdate(parent);
		
		result = boardCommentDAO.setBoardCommentReplyAdd(boardCommentDTO);
		
		return result;
	}
	
	/** UPDATE **/
	public int setBoardCommentUpdate(BoardCommentDTO boardCommentDTO) throws Exception {
		return boardCommentDAO.setBoardCommentUpdate(boardCommentDTO);
	}
	
	public int setBoardCommentCountAdd(BoardDTO boardDTO) throws Exception {
		return boardCommentDAO.setBoardCommentCountAdd(boardDTO);
	}
	
	public int setBoardCommentCountDelete(BoardDTO boardDTO) throws Exception {
		return boardCommentDAO.setBoardCommentCountDelete(boardDTO);
	}
	
	/** DELETE **/
	public int setBoardCommentDelete(BoardCommentDTO boardCommentDTO, HttpSession session) throws Exception {
		return boardCommentDAO.setBoardCommentDelete(boardCommentDTO);
	}

}
