<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ADD</title>
	
	<c:import url="../../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<% request.setCharacterEncoding("UTF-8");
	    String productNum = request.getParameter("productNum");
	    String productReviewNum = request.getParameter("productReviewNum");
	    %>
		<form action="./update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="productNum" value="<%=productNum%>">
			<input type="hidden" name="productReviewNum" value="<%=productReviewNum%>">
			<div class="row col-md-4 mx-auto my-5">
				<div class="col-12">
					<label for="memberId" class="form-label fw-bold fs-5">작성자</label>
					<input type="text" name="memberId" class="form-control" id="memberId" value="${member.memberId}" readonly><br>
				</div>
				<div class="col-12">
					<label for="productReviewTitle" class="form-label fw-bold fs-5">제목</label>
					<input type="text" name="productReviewTitle" class="form-control" id="productReviewTitle" value="${DTO.productReviewTitle}"><br>
				</div>	
				<div class="col-12">
					<label for="productReviewContents" class="form-label fw-bold fs-5">내용</label>
					<textarea name="productReviewContents" class="form-control" id="productReviewContents" rows="3">${DTO.productReviewContents}</textarea><br>
				</div>
				<div class="fw-bold fs-5 col-12 input-group">
					<input type="file" class="form-control" id="productReviewImg" aria-describedby="productReviewImg" name="multipartfile" aria-label="Upload">
  					<button class="btn btn-outline-secondary" type="button" id="productReviewImg" name="multipartfile">X</button>
				</div>	
				<div class="col-12 my-5">
					<h5 class="fw-bold fs-5"><b>별점</b></h5>
					<div class="form-check form-check-block">
						<label for="oneStar" class="form-check-label">★</label>
						<input id="oneStar" type="radio" name="productRating" value="1" checked class="form-check-input" ${DTO.productRating eq 1 ? 'checked' :''} readonly>
					</div>
					<div class="form-check form-check-block">
						<label for="twoStars" class="form-check-label">★★</label>
						<input id="twoStars" type="radio" name="productRating" value="2" class="form-check-input" ${DTO.productRating eq 2 ? 'checked' :''} readonly>
					</div>
					<div class="form-check form-check-block">
						<label for="threeStars" class="form-check-label">★★★</label>
						<input id=""threeStars"" type="radio" name="productRating" value="3" class="form-check-input" ${DTO.productRating eq 3 ? 'checked' :''} readonly>
					</div>
					<div class="form-check form-check-block">
						<label for="fourStars" class="form-check-label">★★★★</label>
						<input id=""fourStars"" type="radio" name="productRating" value="4" class="form-check-input" ${DTO.productRating eq 4 ? 'checked' :''} readonly>
					</div>
					<div class="form-check form-check-block">
						<label for="fiveStars" class="form-check-label">★★★★★</label>
						<input id="fiveStars" type="radio" name="productRating" value="5" class="form-check-input" ${DTO.productRating eq 5 ? 'checked' :''} readonly>
					</div>
				</div>
				<div class="row justify-content-center my-2">
					<button type="submit" class="btn btn-primary col-2">글쓰기</button>
				</div>
			</div>
	   </form>
	</div>
	<c:import url="../../template/common_js.jsp"></c:import>
	<c:import url="../../template/footer.jsp"></c:import>
</body>
</html>