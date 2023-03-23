package com.team.cwl.product;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cwl.MyTestCase;
import com.team.cwl.product.qna.ProductQnADAO;
import com.team.cwl.product.qna.ProductQnADTO;
import com.team.cwl.product.review.ProductReviewDAO;
import com.team.cwl.product.review.ProductReviewDTO;

public class ProductReivewDAOTest extends MyTestCase {
	
	@Autowired
	private ProductReviewDAO productReviewDAO;
	
	@Test
	public void setProductReviewAddTest() throws Exception {
		
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
		
			ProductReviewDTO productReviewDTO = new ProductReviewDTO();
			
			productReviewDTO.setProductNum(1L);
			productReviewDTO.setMemberId("id3");
			productReviewDTO.setProductReviewContents("딱딱복숭아");
			productReviewDTO.setProductReviewDate(date);
			productReviewDTO.setProductRating(3.8);
		
			int result = productReviewDAO.setProductReviewAdd(productReviewDTO);
		}
		
	}

}
