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
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<div class="row mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">PRODUCT</p>
		</div>
		
		<!-- Contents -->
		<div class="row mx-auto my-5">
			<c:choose>
				<c:when test="${not empty DTO.productNum}">	
					<div class="wrapper row col-6 my-4 justify-content-center mx-auto">
						<p class="fs-4 fw-bold">${DTO.productName}</p>
						<p class="fs-5">${DTO.productDetail}</p>
						<div class="wrap">						
							<div class="content_area">		
								<div class="content_top">
									<div class="price">
									<div class="product_price"><fmt:formatNumber value="${DTO.productPrice}" pattern="￦###,###,###,###" /></div>													
								</div>													
									<div class="line">
								</div>	
								<div class="button">						
									<div class="button_quantity">
										주문 수량
										<input type="text" class="quantity_input" value="1">
										<span>
											<button class="plus_btn">+</button>
											<button class="minus_btn">-</button>
										</span>
									</div>
									<div class="button_set">
										<a class="btn_cart">ADD TO CART</a>
										<a class="btn_buy">BUY NOW</a>
									</div>
									</div>
								</div>
							</div>
						</div>
								<!-- 주문 form -->
						<form action="/order/${member.memberId}" method="get" class="order_form" id="">
							<input type="hidden" name="orders[0].productNum" value="${DTO.productNum}">
							<input type="hidden" name="orders[0].productStock" value="">
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row mx-auto text-center">
						<p class="fs-2">존재하지 않는 페이지입니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- Start Item Details -->
		<section class="item-details section">
			<div class="container">
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
									<div class="col-lg-4 col-md-4 col-12">
										<div class="form-group color-option">
											<label class="title-label" for="size">Choose color</label>
											<div class="single-checkbox checkbox-style-1">
												<input type="checkbox" id="checkbox-1" checked>
												<label for="checkbox-1"><span></span></label>
											</div>
											<div class="single-checkbox checkbox-style-2">
												<input type="checkbox" id="checkbox-2">
												<label for="checkbox-2"><span></span></label>
											</div>
											<div class="single-checkbox checkbox-style-3">
												<input type="checkbox" id="checkbox-3">
												<label for="checkbox-3"><span></span></label>
											</div>
											<div class="single-checkbox checkbox-style-4">
												<input type="checkbox" id="checkbox-4">
												<label for="checkbox-4"><span></span></label>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-12">
										<div class="form-group">
											<label for="color">Battery capacity</label>
											<select class="form-control" id="color">
												<option>5100 mAh</option>
												<option>6200 mAh</option>
												<option>8000 mAh</option>
											</select>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-12">
										<div class="form-group quantity">
											<label for="color">Quantity</label>
											<select class="form-control">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
											</select>
										</div>
									</div>
								</div>
								<div class="bottom-content">
									<div class="row align-items-end">
										<div class="col-lg-4 col-md-4 col-12">
											<div class="button cart-button">
												<button class="btn" style="width: 100%;">Add to Cart</button>
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-12">
											<div class="wish-button">
												<button class="btn"><i class="lni lni-reload"></i> Compare</button>
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-12">
											<div class="wish-button">
												<button class="btn"><i class="lni lni-heart"></i> To Wishlist</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="product-details-info">
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
				</div>
			</div>
		</section>
		<!-- End Item Details -->
		
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
			productStock : ''
	}
	// 장바구니 추가 버튼
		$(".btn_cart").on("click", function(e){
			form.productStock = $(".quantity_input").val();
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
		let productStock = $(".quantity_input").val();
		$(".order_form").find("input[name='orders[0].productStock']").val(productStock);
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
</script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/product/qna.js"></script>
	<script src="/resources/js/product/review.js"></script>
</body>
</html>