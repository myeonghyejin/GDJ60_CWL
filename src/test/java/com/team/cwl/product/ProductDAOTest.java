package com.team.cwl.product;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.cwl.MyTestCase;

public class ProductDAOTest extends MyTestCase {
	
	@Autowired
	private ProductDAO productDAO;
	
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
		
			ProductDTO productDTO = new ProductDTO();
			
			productDTO.setMemberId("mhj");
			productDTO.setProductName("말랑복숭아"+i);
			productDTO.setProductDetail("딱딱복숭아");
			productDTO.setProductStock(320);
			productDTO.setProductPrice(32000);
			productDTO.setProductDate(date);
			productDTO.setProductState(1);
		
			int result = productDAO.setProductAdd(productDTO);
		}
		
	}

}
