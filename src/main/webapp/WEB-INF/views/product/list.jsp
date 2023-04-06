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

</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<div class="row mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">PRODUCT</p>
		</div>
		
		<!-- 검색창 -->
		<div class="row">
			<form action="./list" method="get" class="row justify-content-end mx-auto g-3" id="searchForm">
			<input type="hidden" name="page" value="1" id="page">
				<div class="col-auto">
					<label for="search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" value="${pagination.search}" name="search" id="search" placeholder="">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-outline-primary mb-3">검색</button>
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
								<div class="overlay-box">
									<div class="overlay-inner">
										<a class="overlay-content" href="./detail?productNum=${DTO.productNum}"">
											<h5 class="mb-0">${DTO.productName}</h5>
											<p>${DTO.productPrice}</p>
										</a>
									</div>
								</div>
							</div> 
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
			
		<!-- Paging -->
		<div class="m-auto">
			<div class="pagination justify-content-center mt-5 pt-4">
				<ul class="list-inline">
					<li class="list-inline-item ${pagination.page eq 1?'disabled':''}">
						<a href="./list?page=1&condition=${pagination.condition}&search=${pagination.search}" aria-label="Previous" data-board-page="1">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li class="list-inline-item ${pagination.prev?'disabled':''}">
						<a href="./list?page=${pagination.startNum-1}&condition=${pagination.condition}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}">
							<span aria-hidden="true">&lsaquo;</span>
						</a>
					</li>				
					<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
						<li class="list-inline-item"><a href="./list?page=${i}&condition=${pagination.condition}&search=${pagination.search}" data-board-page="${i}">${i}</a></li>
					</c:forEach>
					<li class="list-inline-item ${pagination.next eq false ? 'disabled' : ''}">
						<a href="./list?page=${pagination.lastNum+1}&condition=${pagination.condition}&search=${pagination.search}"  aria-label="Next" data-board-page="${pagination.lastNum+1}">
							<span aria-hidden="true">&rsaquo;</span>
						</a>
					 </li>
					 <li class="list-inline-item ${pagination.page eq pagination.totalPage?'disabled' : ''}">
						<a href="./list?page=${pagination.totalPage}&condition=${pagination.condition}&search=${pagination.search}"  aria-label="Next" data-board-page="${pagination.totalPage}">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>	
			</div>
		</div>
		
		<!-- 상품 등록 버튼 -->
	 	<c:if test="${not empty member}">
			<div class="row justify-content-center mx-auto">
				<a href=./add class="btn btn-primary col-3">게시글 등록</a>
			</div>
	 	</c:if>

</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="../resources/js/common/paging.js"></script>
</body>
</html>