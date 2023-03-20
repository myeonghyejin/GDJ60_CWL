package com.team.cwl.board;

import static org.junit.Assert.assertNotEquals;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cwl.MyTestCase;
import com.team.cwl.board.BoardDTO;
import com.team.cwl.board.BoardDAO;
import com.team.cwl.util.Pagination;

public class BoardDAOTest extends MyTestCase {
	
	@Autowired
	private BoardDAO boardDAO;
	
//	@Test
//	public void getBoardList(Pagination pagination) throws Exception {
//		List<BoardDTO> ar = boardDAO.getBoardList(pagination);
//		
//		assertNotEquals(0, ar.size());
//	}
	
	@Test
	public void setBoardAddTest() throws Exception {
		
		for (int i=0; i<30; i++) {
			Random r = new Random();
			double d = r.nextDouble();
			int num = (int)(d * 1000);
			d = num / 100.0;
		
			Calendar calendar = new GregorianCalendar();
			calendar.set(Calendar.YEAR, 2023);
			calendar.set(Calendar.MONTH, 02); // 11 = december
			calendar.set(Calendar.DAY_OF_MONTH, 15); 
			
			Date date = new Date(calendar.getTimeInMillis());	
		
			BoardDTO boardDTO = new BoardDTO();
			
			boardDTO.setMemberId("mhj");
			boardDTO.setBoardTitle("말랑복숭아"+i);
			boardDTO.setBoardContents("딱딱복숭아");
			boardDTO.setBoardDate(date);
			boardDTO.setBoardHit(0L);
		
			int result = boardDAO.setBoardAdd(boardDTO);
		}
		
	}

}
