<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Contents -->
<table class="table table-hover">
	<c:forEach items="${list}" var="DTO">
		<tr class="tr-height">
			<td align="center" style="vertical-align: middle;" width="50%">
				<b>${DTO.memberId}</b>
				<c:if test="${member.memberId eq DTO.memberId}">
					<p id="me">나</p>
				</c:if>
			</td>
			<td id="lessonRating${DTO.lessonReviewNum}" align="center" style="vertical-align: middle;">
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
			<td align="right" style="vertical-align: middle;">${DTO.lessonReviewDate}</td>
			<td align="right" style="vertical-align: middle;">
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-info btn-sm update my-0" data-lessonReview-num="${DTO.lessonReviewNum}" data-bs-toggle="modal" data-bs-target="#updateModal">수정</button>
				</c:if>
				<c:if test="${member.memberId eq DTO.memberId || member.adminCheck eq 1}">
					<button class="btn btn-danger btn-sm delete" id="del" data-lessonReview-num="${DTO.lessonReviewNum}">삭제</button>
				</c:if>
			</td>
		</tr>
		<tr>
			<td id="lessonReviewContents${DTO.lessonReviewNum}" class="tr-height" width="100%" style="vertical-align: middle;" colspan="4">
				${DTO.lessonReviewContents}
			</td>
		</tr>
	</c:forEach>
</table>

<!-- Pagination -->
<div class="m-auto">
	<div class="pagination justify-content-center my-3">
		<ul class="list-inline">
			<c:if test="${pagination.prev}">
				<li class="list-inline-item">
					<a href="#" aria-label="Previous" data-board-page="${pagination.startNum}">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>			
			<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="page">
				<li class="list-inline-item"><a href="#" data-board-page="${page}">${page}</a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="list-inline-item">
					<a href="#" aria-label="Next" data-board-page="${pagination.lastNum}">
						<span aria-hidden="true">&raquo;</span>
					</a>
				 </li>
			 </c:if>
		</ul>
	</div>
</div>