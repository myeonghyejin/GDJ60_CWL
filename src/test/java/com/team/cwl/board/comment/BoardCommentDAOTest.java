package com.team.cwl.board.comment;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cwl.MyTestCase;

public class BoardCommentDAOTest extends MyTestCase {
	
	@Autowired
	private BoardCommentDAO boardCommentDAO;
	
	@Test
	public void setBoardCommentAddTest() throws Exception {
		
		for (int i=0; i<30; i++) {
			Random r = new Random();
			double d = r.nextDouble();
			int num = (int)(d * 1000);
			d = num / 100.0;
		
			Calendar calendar = new GregorianCalendar();
			calendar.set(Calendar.YEAR, 2023);
			calendar.set(Calendar.MONTH, 02); // 11 = december
			calendar.set(Calendar.DAY_OF_MONTH, 20); 
			
			Date date = new Date(calendar.getTimeInMillis());	
		
			BoardCommentDTO boardCommentDTO = new BoardCommentDTO();
			
			boardCommentDTO.setBoardNum(45L);
			boardCommentDTO.setMemberId("mhj");
			boardCommentDTO.setBoardCommentContents("말랑복숭아"+i);
			boardCommentDTO.setBoardCommentDate(date);
		
			int result = boardCommentDAO.setBoardCommentAdd(boardCommentDTO);
		}
		
	}

}
