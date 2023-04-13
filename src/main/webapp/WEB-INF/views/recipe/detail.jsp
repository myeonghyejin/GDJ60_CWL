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
					<h1 class="display-1 text-white font-weight-bold font-primary">Recipe</h1>
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
				<c:when test="${not empty DTO.recipeNum}">
					<div class="row">
						<p class="fs-4 fw-bold text-center border-bottom border-dark pb-4">${DTO.recipeTitle}</p>
					</div>
					<div class="row col-8 my-4 justify-content-center mx-auto">
						<img src="/resources/upload/recipe/${DTO.recipeImgDTOs.imgName}" alt="recipe-image">
					</div>
					<div class="row col-8 my-4 justify-content-center mx-auto" align="center" id="frame">
						<p class="fs-5"><b>레시피</b></p>
						<p class="fs-6">${DTO.recipeIngredients}</p>
					</div>
					<div class="row col-8 my-4 justify-content-center mx-auto">
						<p class="fs-6">${DTO.recipeContents}</p>
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
				<input type="hidden" name="recipeNum" value="${DTO.recipeNum}">
				<c:if test="${member.memberId eq DTO.memberId}">
					<button id="update" type="submit" class="btn btn-outline-primary btn-sm btn-default mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary btn-sm btn-default mx-1">삭제</button>
				</c:if>
				<a href="./list" class="btn btn-primary btn-sm btn-default mx-1">목록</a>
			</div>
		</form>

	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
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