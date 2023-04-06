<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Contents -->
<table class="table table-striped">
	<c:forEach items="${list}" var="DTO">
		<tr>
			<td id="productQnATitle${DTO.productQnANum}" data-productqna-num="${DTO.productQnANum}">
				<c:forEach begin="1" end="${DTO.productQnADepth}">[re]</c:forEach>
				<a class="detail" data-productqna-num="${DTO.productQnANum}">${DTO.productQnATitle}</a>
			</td>
			<td>${DTO.memberId}</td>
			<td>${DTO.productQnADate}</td>
			<td>
				<c:if test="${member.adminCheck eq 1}">
					<a href="./qna/reply?productQnANum=${DTO.productQnANum}&productNum=${DTO.productNum}" class="btn btn-primary" data-product-num-qna="${DTO.productNum}">답글</a>
				</c:if>
			</td>
			<td>
				<c:if test="${member.memberId eq DTO.memberId}">
					<a href="./qna/update?productQnANum=${DTO.productQnANum}&productNum=${DTO.productNum}" class="btn btn-info" data-productqna-num="${DTO.productQnANum}">수정</a>
				</c:if>
			</td>
			<td>
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-danger delete" data-productqna-num="${DTO.productQnANum}">삭제</button>
				</c:if>
			</td>
		</tr>
		<tr>
			<td id="productQnAContents${DTO.productQnANum}" style="display:none;">
				<c:choose>
					<c:when test="${DTO.productQnASecret eq 1}">
						<c:if test="${member.memberId eq DTO.memberId}">
							${DTO.productQnAContents}
						</c:if>
						<c:if test="${member.adminCheck eq 1}">
							${DTO.productQnAContents}
						</c:if>
							비밀글입니다.
					</c:when>
					<c:otherwise>
						${DTO.productQnAContents}
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>

<!-- Paging -->
<div class="m-auto">
	<div class="pagination justify-content-center mt-5 pt-4">
		<ul class="list-inline">
			<li class="list-inline-item ${pagination.page eq 1?'disabled':''}">
				<a href="#" class="page-button-qna" aria-label="Previous" data-board-page="1">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li class="list-inline-item ${pagination.prev?'disabled':''}">
				<a href="#" class="page-button-qna" aria-label="Previous" data-board-page="${pagination.startNum}">
					<span aria-hidden="true">&lsaquo;</span>
				</a>
			</li>				
			<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="page">
				<li class="list-inline-item"><a href="#" class="page-button-qna" data-board-page="${page}">${page}</a></li>
			</c:forEach>
			<li class="list-inline-item ${pagination.next eq false ? 'disabled' : ''}">
				<a href="#" class="page-button-qna" aria-label="Next" data-board-page="${pagination.lastNum}">
					<span aria-hidden="true">&rsaquo;</span>
				</a>
			 </li>
			 <li class="list-inline-item ${pagination.page eq pagination.totalPage?'disabled' : ''}">
				<a href="#" class="page-button-qna" aria-label="Next" data-board-page="${pagination.totalPage}">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</ul>	
	</div>
</div>