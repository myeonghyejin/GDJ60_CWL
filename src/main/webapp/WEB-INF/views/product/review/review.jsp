<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Contents -->
<table class="table table-striped">
	<c:forEach items="${list}" var="DTO">
		<tr>
			<td id="productReviewContents${DTO.productReviewNum}">
				${DTO.productReviewContents}
			</td>
			<td>${DTO.memberId}</td>
			<td id="productRating${DTO.productReviewNum}">${DTO.productRating}</td>
			<td>${DTO.productReviewDate}</td>
			<td>
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-info update" data-productreview-num="${DTO.productReviewNum}" data-bs-toggle="modal" data-bs-target="#reviewEditModal">수정</button>
				</c:if>
			</td>
			<td>
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-danger delete" data-productreview-num="${DTO.productReviewNum}">삭제</button>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

<!-- Paging -->
<div class="rowmx-auto">
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
		
			<li class="page-item ${pagination.page eq 1?'disabled':''}">
				<a class="page-link" href="./review/list?page=1&condition=${pagination.condition}&search=${pagination.search}" aria-label="Previous" data-review-page="1">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			
			<li class="page-item ${pagination.prev?'disabled':''}">
				<a class="page-link" href="./review/list?page=${pagination.startNum-1}&condition=${pagination.condition}&search=${pagination.search}" aria-label="Previous" data-review-page="${pagination.startNum-1}">
					<span aria-hidden="true">&lsaquo;</span>
				</a>
			</li>
								
			<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
				<li class="page-item"><a class="page-link" href="./review/list?page=${i}&condition=${pagination.condition}&search=${pagination.search}" data-review-page="${i}">${i}</a></li>
			</c:forEach>
			
			<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
				<a class="page-link" href="./review/list?page=${pagination.lastNum+1}&condition=${pagination.condition}&search=${pagination.search}"  aria-label="Next" data-review-page="${pagination.lastNum+1}">
					<span aria-hidden="true">&rsaquo;</span>
				</a>
				</li>
 				
 			<li class="page-item ${pagination.page eq pagination.totalPage?'disabled' : ''}">
				<a class="page-link" href="./review/list?page=${pagination.totalPage}&condition=${pagination.condition}&search=${pagination.search}"  aria-label="Next" data-review-page="${pagination.totalPage}">
					<span aria-hidden="true">&raquo;</span>
				</a>
				</li>
				
		</ul>
	</nav>
</div>