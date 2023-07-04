package com.team.cwl.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cwl.board.BoardService;
import com.team.cwl.util.Pagination;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
//----------------------------------------------
	
	/** SELECT **/
	public List<BoardDTO> getBoardList(Pagination pagination) throws Exception {
		pagination.makeRow();
		pagination.makeNum(boardDAO.getTotalCount(pagination));
		
		if(boardDAO.getTotalCount(pagination) == 0) {
			pagination.setLastNum(1L);
		}
		
		return boardDAO.getBoardList(pagination);
	}
	
	public List<BoardDTO> getNoticeList(BoardDTO boardDTO) throws Exception {
		return boardDAO.getNoticeList(boardDTO);
	}

	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception {
		return boardDAO.getBoardDetail(boardDTO);
	}

	/** INSERT **/
	public int setBoardAdd(BoardDTO boardDTO) throws Exception {
		return boardDAO.setBoardAdd(boardDTO);
	}

	/** UPDATE **/
	public int setBoardUpdate(BoardDTO boardDTO) throws Exception {
		return boardDAO.setBoardUpdate(boardDTO);
	}
	
	public int setBoardHitUpdate(BoardDTO boardDTO) throws Exception {
		return boardDAO.setBoardHitUpdate(boardDTO);
	}

	/** DELETE **/
	public int setBoardDelete(BoardDTO boardDTO) throws Exception {
		return boardDAO.setBoardDelete(boardDTO);
	}

}