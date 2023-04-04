package cart;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.cwl.cart.CartDTO;
import com.team.cwl.cart.CartMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/database-context.xml")
public class CartMapperTests {
	
	@Autowired
	private CartMapper mapper;
	
	@Test
	public void cartAdd() throws Exception {
		String memberId = "jjj";
		Long productNum = 50L;
		Long count = 2L;
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(memberId);
		cart.setProductNum(productNum);
		cart.setProductStock(count);
		
		int result = 0;
		result = mapper.cartAdd(cart);
		
		System.out.println("결과 : " + result);
		
	}

	
	/* 카트 삭제 */

	@Test
	public void cartDeleteTest() {
		Long cartNum = 15L;
		
		mapper.cartDelete(cartNum);

	}	
	/* 카트 수량 수정 */

	@Test
	public void modifyCartTest() {
		Long cartNum = 10L;
		Long count = 5L;
		
		CartDTO cart = new CartDTO();
		cart.setCartNum(cartNum);
		cart.setProductStock(count);
		
		mapper.modifyCount(cart);
		
	}

	
	/* 카트 목록 */ 

	@Test
	public void cartListTest() {
		String memberId = "jjj";
		
		
		List<CartDTO> list = mapper.cartList(memberId);
		for(CartDTO cart : list) {
			System.out.println(cart);
			cart.initTotal();
			System.out.println("init cart : " + cart);
		}
		
		
	
	}	
	/* 카트 확인 */

	@Test
	public void checkCartTest() {
		
		String memberId = "jjj";
		Long productNum = 50L;
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(memberId);
		cart.setProductNum(productNum);
		
		CartDTO resutlCart = mapper.checkCart(cart);
		System.out.println("결과 : " + resutlCart);
		
	}
	
	/* 장바구니 제거(주문 처리) */
	@Test
	public void deleteOrderCart() {
		String memberId = "user";
		Long productNum = 1L;
		
		CartDTO dto = new CartDTO();
		dto.setMemberId(memberId);
		dto.setProductNum(productNum);
		
		mapper.deleteOrderCart(dto);
		
	}

}
