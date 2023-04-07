<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DETAIL</title>
	<link rel="stylesheet" href="/resources/css/detail.css">
	<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<div class="row col-md-4 mx-auto my-5">
			<c:choose>
				<c:when test="${not empty DTO.productNum}">
					<div class="row mx-auto text-center border-bottom border-dark pb-4">
						<p class="fs-4 fw-bold text-center">${DTO.productName}</p>
						<p class="fs-6">번호 ${DTO.productNum} | 작성자 ${DTO.memberId} | 날짜 ${DTO.productDate}</p>
					</div>
					<div class="row my-4">
						<p class="fs-5">${DTO.productDetail}</p>
					</div>	
<!-------------------------------------- 우희가 한거 --------------------------------->
					<div class="wrapper">
						<div class="wrap">						
							<div class="content_area">		
								<div class="content_top">
									<div class="price">
									<div class="product_price">정가 : <fmt:formatNumber value="${DTO.productPrice}" pattern="#,### 원" /></div>													
								</div>													
									<div class="line">
								</div>	
								<div class="button">						
									<div class="button_quantity">
										주문수량
										<input type="text" class="quantity_input" value="1">
										<span>
											<button class="plus_btn">+</button>
											<button class="minus_btn">-</button>
										</span>
									</div>
									<div class="button_set">
										<a class="btn_cart">장바구니 담기</a>
										<a class="btn_buy">바로구매</a>
									</div>
									</div>
								</div>
							</div>
						</div>
								<!-- 주문 form -->
						<form action="/order/${member.memberId}" method="get" class="order_form" id="">
							<input type="hidden" name="orders[0].productNum" value="${DTO.productNum}">
							<input type="hidden" name="orders[0].orderStock" value="">
						</form>
					</div>
					
<!----------------------------------------------------------------------->	
				</c:when>
				<c:otherwise>
					<div class="row col-md-4 mx-auto text-center">
						<p class="fs-2">존재하지 않는 페이지입니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- Buttons -->
	  	<c:if test="${member.memberId eq DTO.memberId}">
			<form action="./update" id="frm">
				<div class="row col-md-4 justify-content-center mx-auto">
					<input type="hidden" name="productNum" value="${DTO.productNum}">
					<button id="update" type="submit" class="btn btn-outline-primary col-2 mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary col-2 mx-1">삭제</button>
				</div>
			</form>
	  	</c:if>
		<div class="row col-md-4 justify-content-center mx-auto my-2">
			<a href="./list" class="btn btn-primary col-2 mx-1">목록</a>
		</div>
		
		<!-- Review -->
		<div class="row mt-5">
			<p class="fs-2" style="font-family: 'Impact'">REVIEW</p>
		</div>
		
		<div class="row" id="productReviewListResult" data-product-num-review="${DTO.productNum}">
		</div>
	
		<c:if test="${not empty member}">
			<div class="row col-md-4 justify-content-center mx-auto">
				<a href="./review/add?productNum=${DTO.productNum}" class="btn btn-primary col-2 mx-1" id="productReviewAdd" data-product-num-review="${DTO.productNum}">작성</a>
			</div>
		</c:if>
		
 		<!-- QnA -->
 		<div class="row mt-5">
			<p class="fs-2" style="font-family: 'Impact'">QNA</p>
		</div>
 		
		<div class="row" id="productQnAListResult" data-product-num-qna="${DTO.productNum}">
		</div>
	
		<c:if test="${not empty member}">
			<div class="row col-md-4 justify-content-center mx-auto">
				<a href="./qna/add?productNum=${DTO.productNum}" class="btn btn-primary col-2 mx-1" id="productQnAAdd">작성</a>
			</div>
		</c:if>	
	</div>

<script>
	// 수량 버튼 조작
	let quantity = $(".quantity_input").val();
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
			$(".quantity_input").val(--quantity);	
		}
	});	
	// 서버로 전송할 데이터
	const form = {
			memberId : '${member.memberId}',
			productNum : '${DTO.productNum}',
			orderStock : ''
	}
	// 장바구니 추가 버튼
		$(".btn_cart").on("click", function(e){
			form.orderStock = $(".quantity_input").val();
			$.ajax({
				url: '/cart/cartAdd',
				type: 'POST',
				data: form,
				success: function(result){
					cartAlert(result);
				}
			})
		});
		
		function cartAlert(result){
			if(result == '0'){
				alert("장바구니에 추가를 하지 못하였습니다.");
			} else if(result == '1'){
				alert("장바구니에 추가되었습니다.");
			} else if(result == '2'){
				alert("장바구니에 이미 추가되어져 있습니다.");
			} else if(result == '5'){
				alert("로그인이 필요합니다.");	
			}
		}
		/* 바로구매 버튼 */
		$(".btn_buy").on("click", function(){
			let orderStock = $(".quantity_input").val();
			$(".order_form").find("input[name='orders[0].orderStock']").val(orderStock);
			$(".order_form").submit();
		});
</script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/product/qna.js"></script>
	<script src="/resources/js/product/review.js"></script>
</body>
</html>