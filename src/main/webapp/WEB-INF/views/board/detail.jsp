<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DETAIL</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">

	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="display-1 text-white font-weight-bold font-primary">Board</h1>
				</div>
			</div>
		</div>
	</section>
</head>
<body>
	<c:import url="../template/newheader.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<div class="row mx-auto my-5">
			<c:choose>
				<c:when test="${not empty DTO.boardNum}">
					<div class="row">
						<p class="fs-4 fw-bold text-center border-bottom border-dark pb-4">${DTO.boardTitle}</p>
					</div>
					<div class="row my-4 mx-auto text-center">
						<p class="fs-6">
							<b>글 번호</b>&ensp;${DTO.boardNum}&emsp;
							<b>작성자</b>&ensp;
								<c:if test="${member.adminCheck eq 0}">
									${DTO.memberId}
								</c:if>
								<c:if test="${member.adminCheck eq 1}">
									관리자
								</c:if>&emsp;
							<b>날짜</b>&ensp;${DTO.boardDate}&emsp;
							<b>조회수</b>&ensp;${DTO.boardHit+1}
						</p>
					</div>
					<div class="row col-8 my-4 justify-content-center mx-auto">
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
		<form action="./update" id="frm">
			<div class="row col-md-4 justify-content-center mx-auto">
				<input type="hidden" name="boardNum" value="${DTO.boardNum}">
				<c:if test="${member.memberId eq DTO.memberId || member.adminCheck eq 1}">
					<button id="update" type="submit" class="btn btn-outline-primary btn-sm btn-default mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary btn-sm btn-default mx-1">삭제</button>
				</c:if>
				<a href="./list" class="btn btn-primary btn-sm btn-default mx-1">목록</a>
			</div>
		</form>
		
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
						<button type="button" class="btn btn-primary btn-sm btn-default mx-1" id="boardCommentAdd" data-board-num="${DTO.boardNum}">작성</button>
					</div>
				</div>
			</c:if>
		</div>
	
		<!-- Update -->
		<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<button type="button" class="btn btn-secondary btn-sm btn-default" data-bs-dismiss="modal" id="closeUpdateModal">취소</button>
					<button type="button" class="btn btn-primary btn-sm btn-default" data-boardcomment-num="" id="updateConfirm">확인</button>
				</div>
			</div>
			</div>
		</div>

		<!-- Reply -->
		<div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">답글</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-floating">
						<textarea class="form-control" id="boardCommentReply"></textarea>
						<label for="boardCommentReply">Comments</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-sm btn-default" data-bs-dismiss="modal" id="closeReplyModal">취소</button>
					<button type="button" class="btn btn-primary btn-sm btn-default" data-boardcomment-num="" id="replyConfirm">확인</button>
				</div>
			</div>
			</div>
		</div>

	</div>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
<script src="/resources/js/board/comment.js"></script>
<script>
	/* 삭제 버튼 */
	const d = document.getElementById("delete");

	d.addEventListener("click", function(){
		let check = window.confirm("삭제하시겠습니까?");
		if(check) {
			frm.setAttribute("action", "./delete");
			frm.setAttribute("method", "post");
			frm.submit();
		}
	})
</script>
</body>
</html>