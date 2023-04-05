<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-striped">
	<c:forEach items="${list}" var="DTO">
		<tr>
			<td id="boardCommentContents${DTO.boardCommentNum}" width="100%" colspan="3">
				${DTO.boardCommentContents}
			</td>
		</tr>
		<tr>
			<td align="center" width="50%" style="vertical-align: middle;"><b>${DTO.memberId}</b></td>
			<td align="right" style="vertical-align: middle;">${DTO.boardCommentDate}</td>
			<td align="right" style="vertical-align: middle;">
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-info update" data-boardcomment-num="${DTO.boardCommentNum}" data-bs-toggle="modal" data-bs-target="#contentsModal">수정</button>
				</c:if>
				<c:if test="${member.memberId eq DTO.memberId}">
					<button class="btn btn-danger delete" id="del" data-boardcomment-num="${DTO.boardCommentNum}">삭제</button>
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