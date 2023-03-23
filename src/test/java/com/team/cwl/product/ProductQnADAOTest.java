package com.team.cwl.product;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cwl.MyTestCase;
import com.team.cwl.board.BoardDTO;
import com.team.cwl.product.qna.ProductQnADAO;
import com.team.cwl.product.qna.ProductQnADTO;

public class ProductQnADAOTest extends MyTestCase {
	
	@Autowired
	private ProductQnADAO productQnADAO;
	
	@Test
	public void setProductQnAAddTest() throws Exception {
		
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
		
			ProductQnADTO productQnADTO = new ProductQnADTO();
			
			productQnADTO.setProductNum(1L);
			productQnADTO.setMemberId("id3");
			productQnADTO.setProductQnAContents("딱딱복숭아");
			productQnADTO.setProductQnADate(date);
		
			int result = productQnADAO.setProductQnAAdd(productQnADTO);
		}
		
	}

}
