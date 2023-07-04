<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RECIPE</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
	<link rel="stylesheet" href="/resources/css/recipe/list.css">
	
	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="display-1 text-white font-weight-bold font-primary">Recipe</h1>
				</div>
			</div>
		</div>
	</section>
</head>
<body>
	<c:import url="../template/newheader.jsp"></c:import>
	<div class="container-fluid my-5">
		
		<!-- 검색창 -->
		<div class="col-11 mx-auto">
			<form action="./list" method="get" class="row mx-5 my-5 justify-content-center">
				<input type="hidden" name="page" value="1" id="page">
				<input type="hidden" name="condition" value="recipeBase" id="recipeBase">
				<div class="row justify-content-center mx-auto my-1">
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Tequila">데킬라 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Rum">럼 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Brandy">브랜디 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Vodka">보드카 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Gin">진 베이스</button>
				</div>
				<div class="row justify-content-center mx-auto my-1">
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Whisky">위스키 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Beer">맥주 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Wine">포도주 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Liqueur">리큐르 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="recipeBase" value="Non-Alcoholic">논 알콜 칵테일</button>
				</div>
			</form>
		</div>
		<div class="col-11">
			<form action="./list" method="get" class="row justify-content-end mx-auto g-3" id="searchForm">
				<input type="hidden" name="page" value="1" id="page">
				<div class="col-auto">
					<input type="hidden" name="condition" id="condition" value="recipeTitle">
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
							<a href="./detail?recipeNum=${DTO.recipeNum}">
								<div class="image position-relative">
									<img src="/resources/upload/recipe/${DTO.recipeImgDTOs.imgName}" alt="recipe-image" class="img-fluid w-100 d-block">
								</div>
							</a>
						</div>
						<div>

						</div>
						<div class="row justify-content-center mx-auto my-2" align="center">
							<button class="btn btn-sm btn-condition mx-1 my-1" name="recipeBase" value="${DTO.recipeBase}" disabled="disabled">${DTO.recipeBase}</button>
							<p><b>${DTO.recipeTitle}</b></p>
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
		
		<!-- 강의 등록 버튼 -->
	 	<c:if test="${not empty member}">
			<div class="row justify-content-center mx-auto mt-4">
				<a href=./add class="btn btn-primary btn-sm btn-default">등록</a>
			</div>
	 	</c:if>
</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/common/pagination.js"></script>
</body>
</html>