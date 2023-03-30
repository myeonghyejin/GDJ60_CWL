<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BOARD</title>
	<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<div class="row col-md-4 mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">FREE BOARD</p>
		</div>
	
		<div class="row col-md-4 mx-auto my-5">
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
							<td>${DTO.boardNum}</td>
							<td>
								<a href="./detail?boardNum=${DTO.boardNum}">${DTO.boardTitle}</a>
							</td>
							<td>${DTO.memberId}</td>
							<td>${DTO.boardDate}</td>
							<td>${DTO.boardHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		<!-- Paging -->
		<div class="rowmx-auto">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
				
					<li class="page-item ${pagination.page eq 1?'disabled':''}">
						<a class="page-link" href="./list?page=1&condition=${pagination.condition}&search=${pagination.search}" aria-label="Previous" data-board-page="1">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					
					<li class="page-item ${pagination.prev?'disabled':''}">
						<a class="page-link" href="./list?page=${pagination.startNum-1}&condition=${pagination.condition}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}">
							<span aria-hidden="true">&lsaquo;</span>
						</a>
					</li>
										
					<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
						<li class="page-item"><a class="page-link" href="./list?page=${i}&condition=${pagination.condition}&search=${pagination.search}" data-board-page="${i}">${i}</a></li>
					</c:forEach>
					
					<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
						<a class="page-link" href="./list?page=${pagination.lastNum+1}&condition=${pagination.condition}&search=${pagination.search}"  aria-label="Next" data-board-page="${pagination.lastNum+1}">
							<span aria-hidden="true">&rsaquo;</span>
						</a>
	 				</li>
		 				
		 			<li class="page-item ${pagination.page eq pagination.totalPage?'disabled' : ''}">
						<a class="page-link" href="./list?page=${pagination.totalPage}&condition=${pagination.condition}&search=${pagination.search}"  aria-label="Next" data-board-page="${pagination.totalPage}">
							<span aria-hidden="true">&raquo;</span>
						</a>
						</li>
						
				</ul>
			</nav>
		</div>
		
		<!-- 검색창 -->
		<form action="./list" method="get" class="row g-3" id="searchForm">
			<input type="hidden" name="page" value="1" id="page">
			<div class="row justify-content-center mx-auto">
				<div class="col-auto">
					<label for="condition" class="visually-hidden">Email</label>
					<select class="form-select" name="condition" id="condition" aria-label="Default select example">
						<option value="title" ${pagination.condition eq 'title' ? 'selected' : ''}>제목</option>
						<option value="contents" ${pagination.condition eq 'contents' ? 'selected' : ''}>내용</option>
						<option value="writer" ${pagination.condition eq 'writer' ? 'selected' : ''}>작성자</option>
					</select>
				</div>
				<div class="col-auto">
					<label for="search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" value="${pagination.search}" name="search" id="search" placeholder="검색어를 입력하세요.">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-outline-primary mb-3">검색</button>
				</div>
			</div>
		</form>
		
		<!-- 상품 등록 버튼 -->
	 	<c:if test="${not empty member}">
			<div class="row justify-content-center mx-auto">
				<a href=./add class="btn btn-primary col-3">게시글 등록</a>
			</div>
	 	</c:if>
		</div>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="../resources/js/paging.js"></script>
</body>
</html>