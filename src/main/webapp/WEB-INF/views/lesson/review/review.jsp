<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Contents -->
<table class="table table-striped">
	<c:forEach items="${list}" var="DTO">
		<tr>
			<td id="lessonReviewContents${DTO.lessonReviewNum}">
				${DTO.lessonReviewContents}
			</td>
			<td>${DTO.memberId}</td>
			<td id="lessonRating${DTO.lessonReviewNum}">
				<c:if test="${DTO.lessonRating eq 1}">
					★
				</c:if>
				<c:if test="${DTO.lessonRating eq 2}">
					★★
				</c:if>
				<c:if test="${DTO.lessonRating eq 3}">
					★★★
				</c:if>
				<c:if test="${DTO.lessonRating eq 4}">
					★★★★
				</c:if>
				<c:if test="${DTO.lessonRating eq 5}">
					★★★★★
				</c:if>
			</td>
			<td>${DTO.lessonReviewDate}</td>
			<td>
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-info update" data-lessonReview-num="${DTO.lessonReviewNum}" data-bs-toggle="modal" data-bs-target="#contentsModal">수정</button>
				</c:if>
			</td>
			<td>
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-danger delete" data-lessonReview-num="${DTO.lessonReviewNum}">삭제</button>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

<!-- Paging -->
<div class="m-auto">
	<div class="pagination justify-content-center mt-5 pt-4">
		<ul class="list-inline">
			<li class="list-inline-item ${pagination.page eq 1?'disabled':''}">
				<a href="#" class="page-button" aria-label="Previous" data-board-page="1">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li class="list-inline-item ${pagination.prev?'disabled':''}">
				<a href="#" class="page-button" aria-label="Previous" data-board-page="${pagination.startNum}">
					<span aria-hidden="true">&lsaquo;</span>
				</a>
			</li>				
			<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="page">
				<li class="list-inline-item"><a href="#" class="page-button" data-board-page="${page}">${page}</a></li>
			</c:forEach>
			<li class="list-inline-item ${pagination.next eq false ? 'disabled' : ''}">
				<a href="#" class="page-button" aria-label="Next" data-board-page="${pagination.lastNum}">
					<span aria-hidden="true">&rsaquo;</span>
				</a>
			 </li>
			 <li class="list-inline-item ${pagination.page eq pagination.totalPage?'disabled' : ''}">
				<a href="#" class="page-button" aria-label="Next" data-board-page="${pagination.totalPage}">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>	
	</div>
</div>