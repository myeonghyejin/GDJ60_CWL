<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PRODUCT</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
	<link rel="stylesheet" href="/resources/css/product/list.css">
  
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
		</div>
		 -->
		<!-- 검색창 -->
		<div class="col-11 mx-auto">
			<form action="./list" method="get" class="row mx-5 my-5 justify-content-center">
				<input type="hidden" name="page" value="1" id="page">
				<!-- <button class="btn btn-primary btn-sm btn-category mx-1">별점순</button>
				<button class="btn btn-primary btn-sm btn-category mx-1">후기 많은순</button> -->
				<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" value="nameOrder">이름순</button>
				<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" value="highPriceOrder">높은 가격순</button>
				<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" value="lowPriceOrder">낮은 가격순</button>
				<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" value="stock">판매 중</button>
			</form>
		</div>




		<div class="col-11">
			<form action="./list" method="get" class="row justify-content-end mx-auto g-3" id="searchForm">
				<input type="hidden" name="page" value="1" id="page">
				<div class="col-auto">
					<input type="hidden" name="condition" id="condition" value="productName">
					<label for="search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" value="${pagination.search}" name="search" id="search" placeholder="">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-outline-primary btn-sm btn-default mb-3">검색</button>
				</div>
			</form>
		</div>

		<div class="container my-5">
			<div class="row shuffle-wrapper portfolio-gallery">
				<c:forEach items="${list}" var="DTO">
					<div class="col-lg-4 col-6 mb-4 shuffle-item">
						<div class="position-relative inner-box">
							<div class="image position-relative">
								<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
									<div class="carousel-inner">
										<c:set var="loop_flag" value="false"/>
										<c:forEach items="${DTO.productImgDTOs}" var="imgDTO" varStatus="index">
											<c:if test="${index.end eq 0}">
												<div class="carousel-item">
													<img src="/resources/upload/product/${imgDTO.imgName}" alt="product-image" class="img-fluid w-100 d-block">
												</div>
												<c:set var="loop_flag" value="true"/>
											</c:if>
											
											<c:choose>
												<c:when test="${index.index eq 0}">
													<div class="carousel-item active">
														<img src="/resources/upload/product/${imgDTO.imgName}" alt="product-image" class="img-fluid w-100 d-block">
													</div>
												</c:when>
												<c:otherwise>
													<div class="carousel-item">
														<img src="/resources/upload/product/${imgDTO.imgName}" alt="product-image" class="img-fluid w-100 d-block">
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
								<a href="./detail?productNum=${DTO.productNum}">
									<div class="overlay-box">
										<div class="overlay-inner">
											<div class="overlay-content">
												<h5 class="mb-0"><b>${DTO.productName}</b></h5>
												<p>${DTO.productPrice}원</p>
											</div>
										</div>
									</div>
								</a>
							</div> 
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
			
		<!-- Pagination -->
		<div class="m-auto">
			<div class="pagination justify-content-center my-3">
				<ul class="list-inline">
					<c:if test="${pagination.prev}">
						<li class="list-inline-item">
							<a href="./list?page=${pagination.startNum-1}&condition=${pagination.condition}&search=${pagination.search}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>			
					<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="page">
						<li class="list-inline-item"><a href="./list?page=${page}&condition=${pagination.condition}&search=${pagination.search}">${page}</a></li>
					</c:forEach>
					<c:if test="${pagination.next}">
						<li class="list-inline-item">
							<a href="./list?page=${pagination.lastNum+1}&condition=${pagination.condition}&search=${pagination.search}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						 </li>
					 </c:if>
				</ul>	
			</div>
		</div>
		
		<!-- 상품 등록 버튼 -->
	 	<c:if test="${not empty member}">
			<c:if test="${member.adminCheck eq 1}">
				<div class="row justify-content-center mx-auto my-3">
					<a href=./add class="btn btn-primary btn-sm btn-default">등록</a>
				</div>
			</c:if>
	 	</c:if>

</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/common/pagination.js"></script>
</body>
</html>