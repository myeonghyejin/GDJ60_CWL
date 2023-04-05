<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DETAIL</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<div class="row mx-auto my-5">
			<c:choose>
				<c:when test="${not empty DTO.boardNum}">
					<div class="row">
						<p class="fs-4 fw-bold text-center border-bottom border-dark pb-4">${DTO.boardTitle}</p>
					</div>
					<div class="row my-4 mx-auto text-center">
						<p class="fs-6"><b>글 번호</b>&ensp;${DTO.boardNum}&emsp;<b>작성자</b>&ensp;${DTO.memberId}&emsp;<b>날짜</b>&ensp;${DTO.boardDate}&emsp;<b>조회수</b>&ensp;${DTO.boardHit+1}</p>
					</div>
					<div class="row col-6 my-4 justify-content-center mx-auto">
						<p class="fs-4">${DTO.boardContents}</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row mx-auto text-center">
						<p class="fs-2">존재하지 않는 페이지입니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- Buttons -->
		<c:if test="${member.memberId eq DTO.memberId}">
			<form action="./update" id="frm">
				<div class="row col-6 justify-content-center mx-auto">
					<input type="hidden" name="boardNum" value="${DTO.boardNum}">
					<button id="update" type="submit" class="btn btn-outline-primary col-1 mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary col-1 mx-1">삭제</button>
				</div>
			</form>
		</c:if>
		<div class="row col-6 my-2 justify-content-center mx-auto">
			<a href="./list" class="btn btn-primary col-1 mx-1">목록</a>
		</div>
		
		<!-- Comment -->
		<div class="row col-8 justify-content-center mx-auto mt-5">
			<div class="row">
				<p class="fs-2" style="font-family: 'Impact'">COMMENT</p>
			</div>
			
			<div class="row" id="boardCommentListResult" data-board-num="${DTO.boardNum}">
			</div>
			
			<c:if test="${not empty member}">
				<div class="row my-5">
					<div class="row mb-3">
						<textarea class="form-control" rows="3" id="boardCommentContents"></textarea>
					</div>
					<div class="row mb-3 justify-content-end">
						<button type="button" class="btn btn-primary col-1 mx-1" id="boardCommentAdd" data-board-num="${DTO.boardNum}">작성</button>
					</div>
				</div>
			</c:if>
		</div>
	
		<!--  Update Form Modal -->
		<!-- Modal -->
		<div class="modal fade" id="contentsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">댓글 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-floating">
						<textarea class="form-control" id="boardCommentEdit"></textarea>
						<label for="boardCommentEdit">Comments</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeModal">취소</button>
					<button type="button" class="btn btn-primary" data-boardcomment-num="" id="contentsConfirm">확인</button>
				</div>
			</div>
			</div>
		</div>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/board/comment.js"></script>
</body>
</html>