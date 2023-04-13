<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DETAIL</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
	<link rel="stylesheet" href="/resources/css/product/detail.css">
	
	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="display-1 text-white font-weight-bold font-primary">Product</h1>
				</div>
			</div>
		</div>
	</section>
</head>
<body>
	<c:import url="../template/newheader.jsp"></c:import>

	<div class="container-fluid my-5">
		<!-- Title -->
		<!-- <div class="row mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">PRODUCT</p>
		</div> -->
		
		<!-- Start Item Details -->
		<section class="item-details">
			<div class="container my-5">
				<div class="top-area">
					<div class="row align-items-center">
						<div class="col-lg-6 col-md-12 col-12">
							<div class="product-images">
								<main id="gallery">
									<div class="main-img">
										<c:set var="loop_flag" value="false"/>
											<c:forEach items="${DTO.productImgDTOs}" var="imgDTO" varStatus="index">
												<c:if test="${index.first}">
													<img src="/resources/upload/product/${imgDTO.imgName}" id="current" alt="product-image" class="img">
												<c:set var="loop_flag" value="true"/>
											</c:if>
										</c:forEach>
									</div>
									<div class="images">
										<c:forEach items="${DTO.productImgDTOs}" var="imgDTO">
											<img src="/resources/upload/product/${imgDTO.imgName}" alt="product-image" class="img">
										</c:forEach>
									</div>
								</main>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-12">
							<div class="product-info">
								<h2 class="title">${DTO.productName}</h2>
								<h3 class="price"><fmt:formatNumber value="${DTO.productPrice}" pattern="￦###,###,###,###"/></h3>
								<p class="info-text">${DTO.productDetail}</p>
								<div class="row">											
									<div class="button_quantity my-3" align="right">
										Quantity 
										<span>
											<button class="plus_btn">+</button>
										</span>
										<input type="text" class="quantity_input" value="1">
										<span>
											<button class="minus_btn">-</button>
										</span>
									</div>
									<div class="row align-items-end">
										<div class="col-lg-6 col-md-4 col-12">
											<div class="wish-button">
												<a class="btn btn_cart">Add to Cart</a>
											</div>
										</div>
										<div class="col-lg-6 col-md-4 col-12">
											<div class="wish-button">
												<a class="btn btn_buy">Buy Now</a>
											</div>
										</div>										
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="product-details-info">
					<div class="single-block">
						<div class="row">
							<div class="col-lg-6 col-12">
								<div class="info-body custom-responsive-margin">
									<h4>Details</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
										irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat.</p>
									<h4>Features</h4>
									<ul class="features">
										<li>Capture 4K30 Video and 12MP Photos</li>
										<li>Game-Style Controller with Touchscreen</li>
										<li>View Live Camera Feed</li>
										<li>Full Control of HERO6 Black</li>
										<li>Use App for Dedicated Camera Operation</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>Specifications</h4>
									<ul class="normal-list">
										<li><span>Weight:</span> 35.5oz (1006g)</li>
										<li><span>Maximum Speed:</span> 35 mph (15 m/s)</li>
										<li><span>Maximum Distance:</span> Up to 9,840ft (3,000m)</li>
										<li><span>Operating Frequency:</span> 2.4GHz</li>
										<li><span>Manufacturer:</span> GoPro, USA</li>
									</ul>
									<h4>Shipping Options:</h4>
									<ul class="normal-list">
										<li><span>Courier:</span> 2 - 4 days, $22.50</li>
										<li><span>Local Shipping:</span> up to one week, $10.00</li>
										<li><span>UPS Ground Shipping:</span> 4 - 6 days, $18.00</li>
										<li><span>Unishop Global Export:</span> 3 - 4 days, $25.00</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div> -->
			</div>
		</section>
		<!-- End Item Details -->
		
		<!-- 주문 form -->
		<form action="/order/${member.memberId}" method="get" class="order_form" id="">
			<input type="hidden" name="orders[0].productNum" value="${DTO.productNum}">
			<input type="hidden" name="orders[0].orderStock" value="">
		</form>

		<!-- Buttons -->
		<form action="./update" id="frm">
			<div class="row col-md-4 justify-content-center mx-auto">
				<input type="hidden" name="productNum" value="${DTO.productNum}">
				<c:if test="${member.memberId eq DTO.memberId}">
					<button id="update" type="submit" class="btn btn-outline-primary btn-sm btn-default mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary btn-sm btn-default mx-1">삭제</button>
				</c:if>
				<a href="./list" class="btn btn-primary btn-sm btn-default mx-1">목록</a>
			</div>
		</form>
		
		<!-- Review -->
		<div class="row col-8 justify-content-center mx-auto mt-5">
			<p class="fs-2" style="font-family: 'Impact'">REVIEW</p>
		</div>
		
		<div class="row col-8 justify-content-center mx-auto" id="productReviewListResult" data-product-num-review="${DTO.productNum}">
		</div>
	
		<c:if test="${not empty member}">
			<div class="row justify-content-center mx-auto my-3">
				<a href="./review/add?productNum=${DTO.productNum}" class="btn btn-primary btn-sm btn-default mx-1" id="productReviewAdd" data-product-num-review="${DTO.productNum}">작성</a>
			</div>
		</c:if>
		
 		<!-- QnA -->
 		<div class="row col-8 justify-content-center mx-auto mt-5">
			<p class="fs-2" style="font-family: 'Impact'">QNA</p>
		</div>
 		
		<div class="row col-8 justify-content-center mx-auto" id="productQnAListResult" data-product-num-qna="${DTO.productNum}">
		</div>
	
		<c:if test="${not empty member}">
			<div class="row justify-content-center mx-auto my-3">
				<a href="./qna/add?productNum=${DTO.productNum}" class="btn btn-primary btn-sm btn-default mx-1" id="productQnAAdd">작성</a>
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
	
	const current = document.getElementById("current");
    const opacity = 0.6;
    const imgs = document.querySelectorAll(".img");
    imgs.forEach(img => {
    	img.addEventListener("click", (e) => {
    		//reset opacity
    		imgs.forEach(img => {
    			img.style.opacity = 1;
    		});
			current.src = e.target.src;
			//adding class 
			//current.classList.add("fade-in");
			//opacity
			e.target.style.opacity = opacity;
    	}); 
    });
    
    /* 삭제 버튼 */
    const d = document.getElementById("delete");

	d.addEventListener("click", function(){
		let check = window.confirm("삭제하시겠습니까?");
		if(check) {
			frm.setAttribute("action", "./delete");
			frm.setAttribute("method", "post");
			frm.submit();
		}
	})
</script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/resources/js/product/qna.js"></script>
	<script src="/resources/js/product/review.js"></script>
</body>
</html>