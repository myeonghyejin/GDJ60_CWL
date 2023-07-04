<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-hover">
	<c:forEach items="${list}" var="DTO">
		<tr class="tr-height">
			<td width="29px"></td>
			<td align="center" style="vertical-align: middle;" width="40%">
				<b>${DTO.memberId}</b>
				<c:if test="${member.memberId eq DTO.memberId}">
					<p id="me">나</p>
				</c:if>
			</td>
			<td align="right" style="vertical-align: middle;">${DTO.boardCommentDate}</td>
			<td align="right" style="vertical-align: middle;">
				<c:if test="${not empty member}">
					<c:if test="${DTO.boardCommentDepth eq 0}">
						<button class="btn btn-info btn-sm reply" data-boardcomment-num="${DTO.boardCommentNum}" data-bs-toggle="modal" data-bs-target="#replyModal">답글</button>
					</c:if>
				</c:if>
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-info btn-sm update" data-boardcomment-num="${DTO.boardCommentNum}" data-bs-toggle="modal" data-bs-target="#updateModal">수정</button>
				</c:if>
				<c:if test="${member.memberId eq DTO.memberId || member.adminCheck eq 1}">
					<button class="btn btn-danger btn-sm delete" id="del" data-boardcomment-num="${DTO.boardCommentNum}">삭제</button>
				</c:if>
			</td>
		</tr>
		<tr class="tr-height">
			<td style="vertical-align: middle;">
				<c:forEach begin="1" end="${DTO.boardCommentDepth}">
					<p id="re2" style="vertical-align: middle;">⤷</p>
				</c:forEach>
			</td>
			<td id="boardCommentContents${DTO.boardCommentNum}" class="tr-height" style="vertical-align: middle;" colspan="3">
				${DTO.boardCommentContents}
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