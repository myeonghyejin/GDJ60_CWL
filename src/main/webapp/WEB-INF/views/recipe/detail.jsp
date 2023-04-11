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
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
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
						<p class="fs-3"><b>레시피</b></p>
						<p class="fs-4">${DTO.recipeIngredients}</p>
					</div>
					<div class="row col-8 my-4 justify-content-center mx-auto">
						<p class="fs-4">${DTO.recipeContents}</p>
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
					<input type="hidden" name="recipeNum" value="${DTO.recipeNum}">
					<button id="update" type="submit" class="btn btn-outline-primary btn-sm btn-default mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary btn-sm btn-default mx-1">삭제</button>
				</div>
			</form>
		</c:if>
		<div class="row col-6 my-2 justify-content-center mx-auto">
			<a href="./list" class="btn btn-primary btn-sm btn-default mx-1">목록</a>
		</div>

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