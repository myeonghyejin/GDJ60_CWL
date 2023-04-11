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
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<div class="row mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">RECIPE</p>
		</div>
		
		<!-- 검색창 -->
		<div class="col-11 mx-auto">
			<form action="./list" method="get" class="row mx-5 my-5 justify-content-center">
				<input type="hidden" name="page" value="1" id="page">
				<div>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="tequila">데킬라 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="rum">럼 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="brandy">브랜디 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="vodka">보드카 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="gin">진 베이스</button>
				</div>
				<div>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="whisky">위스키 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="beer">맥주 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="wine">포도주 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="liqueur">리큐르 베이스</button>
					<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="non-alcoholic">논 알콜 칵테일</button>
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
						<div class="row my-1" align="center">
							<p><b>${DTO.recipeTitle}</b></p>
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
						<a href="./list?page=${pagination.startNum}&condition=${pagination.condition}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum}">
							<span aria-hidden="true">&lsaquo;</span>
						</a>
					</li>				
					<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="page">
						<li class="list-inline-item"><a href="./list?page=${page}&condition=${pagination.condition}&search=${pagination.search}" data-board-page="${page}">${page}</a></li>
					</c:forEach>
					<li class="list-inline-item ${pagination.next eq false ? 'disabled' : ''}">
						<a href="./list?page=${pagination.lastNum}&condition=${pagination.condition}&search=${pagination.search}"  aria-label="Next" data-board-page="${pagination.lastNum}">
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
		
		<!-- 강의 등록 버튼 -->
	 	<c:if test="${not empty member}">
			<div class="row justify-content-center mx-auto">
				<a href=./add class="btn btn-primary btn-sm btn-default">등록</a>
			</div>
	 	</c:if>
	</div>
</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/common/paging.js"></script>
</body>
</html>