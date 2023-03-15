<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BOARD</title>
	<c:import url="../template/commonCss.jsp"></c:import>
</head>
<body>

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
					<a class="page-link" href="#" aria-label="Previous" data-board-page="1">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				
				<li class="page-item ${pagination.prev?'disabled':''}">
					<a class="page-link" href="#" aria-label="Previous" data-board-page="${pagination.startNum-1}">
						<span aria-hidden="true">&lsaquo;</span>
					</a>
				</li>
									
				<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
					<li class="page-item"><a class="page-link" href="#" data-board-page="${i}">${i}</a></li>
				</c:forEach>
				
				<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
					<a class="page-link" href="#"  aria-label="Next" data-board-page="${pagination.lastNum+1}">
						<span aria-hidden="true">&rsaquo;</span>
					</a>
 				</li>
	 				
	 			<li class="page-item ${pagination.page eq pagination.totalPage?'disabled' : ''}">
					<a class="page-link" href="#"  aria-label="Next" data-board-page="${pagination.totalPage}">
						<span aria-hidden="true">&raquo;</span>
					</a>
					</li>
					
			</ul>
		</nav>
	</div>
	
</div>

</body>
</html>