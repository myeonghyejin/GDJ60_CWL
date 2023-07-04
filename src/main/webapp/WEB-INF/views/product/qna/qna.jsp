<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Contents -->
<table class="table table-hover">
	<c:forEach items="${list}" var="DTO">
		<tr class="tr-height" style="vertical-align: middle;">
			<td width="29px">
				<c:forEach begin="1" end="${DTO.productQnADepth}">
					<p id="re" height="100%" align="center">re</p>
				</c:forEach>
			</td>
			<td class="detail" id="productQnATitle${DTO.productQnANum}" data-productqna-num="${DTO.productQnANum}" width="50%" style="vertical-align: middle;">
				<a data-productqna-num="${DTO.productQnANum}"><b>${DTO.productQnATitle}</b></a>
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
			<td align="right">${DTO.productQnADate}</td>
			<td align="right">
				<c:if test="${member.adminCheck eq 1}">
					<a href="./qna/reply?productQnANum=${DTO.productQnANum}&productNum=${DTO.productNum}&productQnASecret=${DTO.productQnASecret}" class="btn btn-primary btn-sm" data-product-num-qna="${DTO.productNum}">답글</a>
				</c:if>
				<c:if test="${member.memberId eq DTO.memberId}">
					<a href="./qna/update?productQnANum=${DTO.productQnANum}&productNum=${DTO.productNum}" class="btn btn-info btn-sm" data-productqna-num="${DTO.productQnANum}">수정</a>
				</c:if>
				<c:if test="${member.memberId eq DTO.memberId || member.adminCheck eq 1}">
					<button class="btn btn-danger btn-sm delete" data-productqna-num="${DTO.productQnANum}">삭제</button>
				</c:if>
			</td>
		</tr>
		<tr class="tr-height" id="productQnAContents${DTO.productQnANum}" style="vertical-align: middle; display:none;">
			<td>
				<c:forEach begin="1" end="${DTO.productQnADepth}">
					<p id="re2">⤷</p>
				</c:forEach>
			</td>
			<td colspan="5">
				<c:if test="${DTO.productQnASecret eq 1}">
					<c:choose>
						<c:when test="${member.memberId eq DTO.memberId}">
							${DTO.productQnAContents}
						</c:when>
						<c:when test="${member.adminCheck eq 1}">
							${DTO.productQnAContents}
						</c:when>
						<c:otherwise>
							비밀글입니다.
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${DTO.productQnASecret eq 0}">
					${DTO.productQnAContents}
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