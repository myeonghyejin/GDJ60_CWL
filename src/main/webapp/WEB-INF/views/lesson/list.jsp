<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LESSON</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<div class="row mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">LESSON</p>
		</div>
		
		<!-- 검색창 -->
		<div class="col-11">
			<form action="./list" method="get" class="row mx-5 my-5 justify-content-center">
				<input type="hidden" name="page" value="1" id="page">
				<button class="btn btn-primary btn-sm btn-category mx-1">별점순</button>
				<button class="btn btn-primary btn-sm btn-category mx-1">후기 많은순</button>
				<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="">높은 가격순</button>
				<button type="submit" class="btn btn-primary btn-sm btn-category mx-1" name="condition" id="condition" value="">낮은 가격순</button>
			</form>
		</div>
		<div class="col-11">
			<form action="./list" method="get" class="row justify-content-end mx-auto g-3" id="searchForm">
				<input type="hidden" name="page" value="1" id="page">
				<div class="col-auto">
					<input type="hidden" name="condition" id="condition" value="lessonTitle">
					<label for="search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" value="${pagination.search}" name="search" id="search" placeholder="">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-outline-primary btn-sm btn-default mb-3">검색</button>
				</div>
			</form>
		</div>

		<div class="row col-8 mx-auto my-5">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>NUM</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>DATE</th>
						<th>HIT</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="DTO">
						<tr>
							<td>${DTO.lessonNum}</td>
							<td>
								<a href="./detail?lessonNum=${DTO.lessonNum}">${DTO.lessonTitle}</a>
							</td>
							<td>${DTO.memberId}</td>
							<td>${DTO.lessonDate}</td>
							<td>${DTO.lessonHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
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
		
		<!-- 상품 등록 버튼 -->
	 	<c:if test="${not empty member}">
			<div class="row justify-content-center mx-auto">
				<a href=./add class="btn btn-primary col-3">등록</a>
			</div>
	 	</c:if>
	</div>
</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/common/paging.js"></script>
</body>
</html>