<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BOARD</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">

	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="display-1 text-white font-weight-bold font-primary">Board</h1>
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
			<p class="fs-2" style="font-family: 'Impact'">FREE BOARD</p>
		</div> -->
		
		<!-- Contents -->
		<div class="row col-8 justify-content-center mx-auto my-5">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>NO.</th>
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
								<a href="./detail?boardNum=${DTO.boardNum}">${DTO.boardTitle} <b>[${DTO.boardCommentCount}]</b></a>
							</td>
							<td>
								<c:if test="${member.adminCheck eq 0}">
									${DTO.memberId}
								</c:if>
								<c:if test="${member.adminCheck eq 1}">
									관리자
								</c:if>
							</td>
							<td>${DTO.boardDate}</td>
							<td>${DTO.boardHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
		
		<!-- 검색창 -->
		<form action="./list" method="get" class="row g-3" id="searchForm">
			<input type="hidden" name="page" value="1" id="page">
			<div class="row justify-content-center mx-auto mt-5">
				<div class="col-auto">
					<label for="condition" class="visually-hidden">Email</label>
					<select class="form-select" name="condition" id="condition" aria-label="Default select example">
						<option value="boardTitle" ${pagination.condition eq 'boardTitle' ? 'selected' : ''}>제목</option>
						<option value="boardContents" ${pagination.condition eq 'boardContents' ? 'selected' : ''}>내용</option>
						<option value="memberId" ${pagination.condition eq 'memberId' ? 'selected' : ''}>작성자</option>
					</select>
				</div>
				<div class="col-auto">
					<label for="search" class="visually-hidden">Search</label>
					<input type="text" class="form-control" value="${pagination.search}" name="search" id="search">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-outline-primary btn-sm btn-default mb-3">검색</button>
				</div>
			</div>
		</form>
		
		<!-- 상품 등록 버튼 -->
	 	<c:if test="${not empty member}">
			<div class="row justify-content-center mx-auto my-3">
				<a href=./add class="btn btn-primary btn-sm btn-default">등록</a>
			</div>
	 	</c:if>
	 	
</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/common/pagination.js"></script>
</body>
</html>