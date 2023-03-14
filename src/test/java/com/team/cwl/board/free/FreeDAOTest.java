package com.team.cwl.board.free;

import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cwl.MyTestCase;
import com.team.cwl.board.BoardDTO;
import com.team.cwl.board.BoardDAO;
import com.team.cwl.util.Pagination;

public class FreeDAOTest extends MyTestCase {
	
	@Autowired
	private BoardDAO freeDAO;
	
	@Test
	public void getBoardList(Pagination pagination) throws Exception {
		List<BoardDTO> ar = freeDAO.getBoardList(pagination);
		
		assertNotEquals(0, ar.size());
	}

}
