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

	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="display-1 text-white font-weight-bold font-primary">Lesson</h1>
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
				<c:when test="${not empty DTO.lessonNum}">
					<div class="row col-8 my-4 justify-content-center mx-auto" id="frame">
						<iframe width="800" height="420" src="https://www.youtube.com/embed/${DTO.lessonUrl}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					</div>
					<div class="row mx-auto">
						<p class="fs-4 fw-bold text-center">${DTO.lessonTitle}</p>
						<p class="fs-6 text-center border-bottom border-dark pb-4"><b>크리에이터</b>&ensp;${DTO.lessonTeacher}&emsp;<b>날짜</b>&ensp;${DTO.lessonDate}&emsp;<b>조회 수</b>&ensp;${DTO.lessonHit+1}</p>
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
		<form action="./update" id="frm">
			<div class="row col-md-4 justify-content-center mx-auto">
				<input type="hidden" name="lessonNum" value="${DTO.lessonNum}">
				<c:if test="${member.memberId eq DTO.memberId}">
					<button id="update" type="submit" class="btn btn-outline-primary btn-sm btn-default mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary btn-sm btn-default mx-1">삭제</button>
				</c:if>
				<a href="./list" class="btn btn-primary btn-sm btn-default mx-1">목록</a>
			</div>
		</form>
		
 		<!-- Review -->
		<div class="row col-8 justify-content-center mx-auto mt-5">
			<div class="row">
			   <p class="fs-2" style="font-family: 'Impact'">REVIEW</p>
		   </div>
			
		   <div class="row" id="lessonReviewListResult" data-lesson-review="${DTO.lessonNum}">
		   </div>
		   
		   <c:if test="${not empty member}">
			   <div class="row my-5">
				   <div class="form-check-block select col-12 justify-content-center mx-auto mb-3" align="center">
							<input id="oneStar" type="radio" name="lessonRating" value="1" class="form-check-input lessonRating">
							<label for="oneStar" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★</label>
							<input id="twoStars" type="radio" name="lessonRating" value="2" class="form-check-input lessonRating">
							<label for="twoStars" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★★</label>
							<input id="threeStars" type="radio" name="lessonRating" value="3" class="form-check-input lessonRating">
							<label for="threeStars" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★★★</label>
							<input id="fourStars" type="radio" name="lessonRating" value="4" class="form-check-input lessonRating">
							<label for="fourStars" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★★★★</label>
							<input id="fiveStars" type="radio" name="lessonRating" value="5" class="form-check-input lessonRating">
							<label for="fiveStars" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★★★★★</label>
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