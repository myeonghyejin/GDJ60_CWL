<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-hover">
	<c:forEach items="${list}" var="DTO">
		<tr class="tr-height">
			<td align="center" style="vertical-align: middle;" width="50%">
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
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-danger btn-sm delete" id="del" data-boardcomment-num="${DTO.boardCommentNum}">삭제</button>
				</c:if>
			</td>
		</tr>
		<tr>
			<td id="boardCommentContents${DTO.boardCommentNum}" class="tr-height" width="100%" style="vertical-align: middle;" colspan="3">
				<c:forEach begin="1" end="${DTO.boardCommentDepth}">
					<p id="re2" height="100%" align="center" style="vertical-align: middle;">⤷</p>
				</c:forEach>
				${DTO.boardCommentContents}
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