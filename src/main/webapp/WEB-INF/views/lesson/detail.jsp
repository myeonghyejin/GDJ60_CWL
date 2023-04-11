<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LESSON</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<div class="row mx-auto my-5">
			<c:choose>
				<c:when test="${not empty DTO.lessonNum}">
					<div class="row col-8 my-4 justify-content-center mx-auto" id="youtube">
						<iframe width="800" height="420" src="https://www.youtube.com/embed/${DTO.lessonUrl}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					</div>
					<div class="row mx-auto">
						<p class="fs-4 fw-bold text-center">${DTO.lessonTitle}</p>
						<p class="fs-6 text-center border-bottom border-dark pb-4">${DTO.lessonTeacher}</p>
					</div>
					<div class="row col-8 my-4 mx-auto" align="center">
						<p class="fs-4">${DTO.lessonContents}</p>
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
				<div class="row justify-content-center mx-auto">
					<input type="hidden" name="lessonNum" value="${DTO.lessonNum}">
					<button id="update" type="submit" class="btn btn-outline-primary btn-sm btn-default mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary btn-sm btn-default mx-1">삭제</button>
				</div>
			</form>
	  	</c:if>
		<div class="row justify-content-center mx-auto my-2">
			<a href="./list" class="btn btn-primary btn-sm btn-default mx-1">목록</a>
		</div>
		
 		<!-- Review -->
		<div class="row col-8 justify-content-center mx-auto mt-5">
			<div class="row">
			   <p class="fs-2" style="font-family: 'Impact'">REVIEW</p>
		   </div>
			
		   <div class="row" id="lessonReviewListResult" data-lesson-review="${DTO.lessonNum}">
		   </div>
		   
		   <c:if test="${not empty member}">
			   <div class="row my-5">
				   <div class="fw-bold fs-5 col-12 mb-3">
						   <div class="form-check form-check-inline">
							   <label for="bs1" class="form-check-label" id="oneStar">★</label>
							   <input id="bs1" type="radio" id="oneStar" name="lessonRating" value="1" checked class="form-check-input lessonRating" for="oneStar">
						   </div>
						   <div class="form-check form-check-inline">
							   <label for="bs2" class="form-check-label" id="twoStars">★★</label>
							   <input id="bs2" type="radio" id="twoStars" name="lessonRating" value="2" class="form-check-input lessonRating" for="twoStars">
						   </div>
						   <div class="form-check form-check-inline">
							   <label for="bs3" class="form-check-label" id="threeStars">★★★</label>
							   <input id="bs3" type="radio" id="threeStars" name="lessonRating" value="3" class="form-check-input lessonRating" for="threeStars">
						   </div>
						   <div class="form-check form-check-inline">
							   <label for="bs4" class="form-check-label" id="fourStars">★★★★</label>
							   <input id="bs4" type="radio" id="fourStars" name="lessonRating" value="4" class="form-check-input lessonRating" for="fourStars">
						   </div>
						   <div class="form-check form-check-inline">
							   <label for="bs5" class="form-check-label" id="fiveStars">★★★★★</label>
							   <input id="bs5" type="radio" id="fiveStars" name="lessonRating" value="5" class="form-check-input lessonRating" for="fiveStars">
						   </div>
					   </div>
				   <div class="row mb-3">
					   <textarea class="form-control" rows="3" id="lessonReviewContents"></textarea>
				   </div>
				   <div class="row mb-3 justify-content-end">
					   <button type="button" class="btn btn-primary btn-sm btn-default mx-1" id="lessonReviewAdd" data-lesson-review="${DTO.lessonNum}">작성</button>
				   </div>
			   </div>
		   </c:if>
		</div>
		
		<!-- Update Modal -->
		<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-floating">
						<textarea class="form-control" id="lessonReviewEdit"></textarea>
						<label for="lessonReviewEdit">Comments</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeUpdateModal">취소</button>
					<button type="button" class="btn btn-primary" data-lessonReview-num="" id="updateConfirm">확인</button>
				</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/resources/js/lesson/review.js"></script>
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