package com.team.cwl.lesson;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cwl.MyTestCase;

public class LessonDAOTest extends MyTestCase {
	
	@Autowired
	private LessonDAO lessonDAO;
	
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
			calendar.set(Calendar.DAY_OF_MONTH, 20); 
			
			Date date = new Date(calendar.getTimeInMillis());	
		
			LessonDTO lessonDTO = new LessonDTO();
			
			lessonDTO.setMemberId("mhj");
			lessonDTO.setLessonTitle("딱복");
			lessonDTO.setLessonContents("물복");
			lessonDTO.setLessonDate(date);
		
			int result = lessonDAO.setLessonAdd(lessonDTO);
		}
		
	}

}
