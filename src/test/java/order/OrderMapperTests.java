package order;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.cwl.member.MemberDTO;
import com.team.cwl.order.OrderDTO;
import com.team.cwl.order.OrderItemDTO;
import com.team.cwl.order.OrderMapper;
import com.team.cwl.product.ProductDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/database-context.xml")
public class OrderMapperTests {
	@Autowired
	private OrderMapper mapper;
	
	/* 상품 정보(주문 처리) */
	@Test
	public void getProductDetailTest() {
		
		 OrderItemDTO orderInfo = mapper.getOrderInfo(5L);
		 
		 System.out.println("result : " + orderInfo);
	}
	
	/* order 테이블 등록 */
	@Test
	public void enrollOrderTest() {
		
		OrderDTO ord = new OrderDTO();
		List<OrderItemDTO> orders = new ArrayList<OrderItemDTO>();
		
		OrderItemDTO order1 = new OrderItemDTO();
		
		order1.setProductNum(1L);
		order1.setProductStock(1L);
		order1.setProductPrice(39000L);
		order1.initTotal();
		
		
		
		ord.setOrders(orders);
		
		ord.setOrderNum("2");
		ord.setAddressee("유저");
		ord.setMemberId("user");
		ord.setMemberAddress1("44704");
		ord.setMemberAddress2("울산 남구 돋질로 262 (달동, 삼산선경아파트)");
		ord.setMemberAddress3("2601호");
		ord.setOrderState("배송중비");
		ord.getOrderPriceInfo();		
		
		mapper.enrollOrder(ord);		
		
	}
	
	/* itemorder 테이블 등록 */
	@Test
	public void enrollOrderItemTest() {
		
		OrderItemDTO oid = new OrderItemDTO();
		
		oid.setOrderNum("1");
		oid.setProductNum(1L);
		oid.setProductStock(1L);
		oid.setProductPrice(70000L);
				
		oid.initTotal();
		
		mapper.enrollOrderItem(oid);
		
	}	
	
	/* 회원 돈, 포인트 정보 변경 */
	@Test
	public void deductMoneyTest() {
		
		MemberDTO member = new MemberDTO();
		
		member.setMemberId("user");
		member.setMoney(500000L);
		
		mapper.deductMoney(member);
	}
	
	/* 상품 재고 변경 */
	@Test
	public void deductStockTest() {
		ProductDTO productDTO = new ProductDTO();
		
		productDTO.setProductNum(1L);
		productDTO.setProductStock(8L);
		
		mapper.deductStock(productDTO);
	}

}
