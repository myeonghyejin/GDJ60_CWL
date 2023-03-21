package com.team.cwl.lesson;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cwl.MyTestCase;
import com.team.cwl.lesson.review.LessonReviewDAO;
import com.team.cwl.lesson.review.LessonReviewDTO;

public class LessonReviewDAOTest extends MyTestCase {
	
	@Autowired
	private LessonReviewDAO lessonReviewDAO;
	
	@Test
	public void setProductAddTest() throws Exception {
		
		for (int i=0; i<30; i++) {
			Random r = new Random();
			double d = r.nextDouble();
			int num = (int)(d * 1000);
			d = num / 100.0;
		
			Calendar calendar = new GregorianCalendar();
			calendar.set(Calendar.YEAR, 2023);
			calendar.set(Calendar.MONTH, 02); // 11 = december
			calendar.set(Calendar.DAY_OF_MONTH, 21); 
			
			Date date = new Date(calendar.getTimeInMillis());	
		
			LessonReviewDTO lessonReviewDTO = new LessonReviewDTO();
			
			lessonReviewDTO.setLessonNum(31L);
			lessonReviewDTO.setMemberId("id3");
			lessonReviewDTO.setLessonReviewContents("물복");
			lessonReviewDTO.setLessonReviewDate(date);
			lessonReviewDTO.setLessonRating(4.1);
		
			int result = lessonReviewDAO.setLessonReviewAdd(lessonReviewDTO);
		}
		
	}

}
