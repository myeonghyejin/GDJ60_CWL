<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Contents -->
<table class="table table-hover">
	<c:forEach items="${list}" var="DTO">
		<tr class="tr-height" style="vertical-align: middle;">
			<td width="29px"></td>
			<td class="detail" id="productReviewTitle${DTO.productReviewNum}" data-productreview-num="${DTO.productReviewNum}" width="40%" style="vertical-align: middle;">
				<a data-productreview-num="${DTO.productReviewNum}"><b>${DTO.productReviewTitle}</b></a>
			</td>
			<td align="center">
				<b>
					<c:if test="${DTO.memberId ne 'admin'}">
						${DTO.memberId}
					</c:if>
					<c:if test="${DTO.memberId eq 'admin'}">
						관리자
					</c:if>
				</b>
			</td>
			<td id="productRating${DTO.productReviewNum}" align="right" style="text-align: center;">
				<c:if test="${DTO.productRating eq 1}">
					★
				</c:if>
				<c:if test="${DTO.productRating eq 2}">
					★★
				</c:if>
				<c:if test="${DTO.productRating eq 3}">
					★★★
				</c:if>
				<c:if test="${DTO.productRating eq 4}">
					★★★★
				</c:if>
				<c:if test="${DTO.productRating eq 5}">
					★★★★★
				</c:if>
			</td>
			<td align="right">${DTO.productReviewDate}</td>
			<td align="right">
				<c:if test="${member.memberId eq DTO.memberId}">
					<a href="./review/update?productReviewNum=${DTO.productReviewNum}&productNum=${DTO.productNum}" class="btn btn-info btn-sm" data-productreview-num="${DTO.productReviewNum}">수정</a>
				</c:if>
				<c:if test="${member.memberId eq DTO.memberId || member.adminCheck eq 1}">
					<button class="btn btn-danger btn-sm delete" data-productreview-num="${DTO.productReviewNum}">삭제</button>
				</c:if>
			</td>
		</tr>
		<tr class="tr-height" id="productReviewContents${DTO.productReviewNum}" style="vertical-align: middle; display:none;">
			<td>⤷</td>
			<td colspan="6">
				<div class="row">
					<c:if test="${not empty DTO.productReviewImgDTOs}">
						<c:forEach items="${DTO.productReviewImgDTOs}" var="imgDTO">
							<img src="/resources/upload/product/review/${imgDTO.imgName}" alt="product_review_image">
						</c:forEach>
					</c:if>
				</div>
				${DTO.productReviewContents}
			</td>
		</tr>
	</c:forEach>
</table>

<!-- Paging -->
<div class="m-auto">
	<div class="pagination justify-content-center mt-5 pt-4">
		<ul class="list-inline">
			<li class="list-inline-item ${pagination.page eq 1?'disabled':''}">
				<a href="#" class="page-button-review" aria-label="Previous" data-board-page="1">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li class="list-inline-item ${pagination.prev?'disabled':''}">
				<a href="#" class="page-button-review" aria-label="Previous" data-board-page="${pagination.startNum}">
					<span aria-hidden="true">&lsaquo;</span>
				</a>
			</li>				
			<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="page">
				<li class="list-inline-item"><a href="#" class="page-button-review" data-board-page="${page}">${page}</a></li>
			</c:forEach>
			<li class="list-inline-item ${pagination.next eq false ? 'disabled' : ''}">
				<a href="#" class="page-button-review" aria-label="Next" data-board-page="${pagination.lastNum}">
					<span aria-hidden="true">&rsaquo;</span>
				</a>
			 </li>
			 <li class="list-inline-item ${pagination.page eq pagination.totalPage?'disabled' : ''}">
				<a href="#" class="page-button-review" aria-label="Next" data-board-page="${pagination.totalPage}">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>	
	</div>
</div>