<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PRODUCT REVIEW ADD</title>
	<c:import url="../../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
	
	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="display-1 text-white font-weight-bold font-primary">Product</h1>
				</div>
			</div>
		</div>
	</section>
</head>
<body>
	<c:import url="../../template/newheader.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<% request.setCharacterEncoding("UTF-8");
	    String productNum = request.getParameter("productNum");
	    %>
		<form action="./add" method="post" enctype="multipart/form-data">
			<input type="hidden" name="productNum" value="<%=productNum%>">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<div class="row col-8 mx-auto my-5">
				<div class="col-12">
					<label for="productReviewTitle" class="form-label fw-bold fs-5">제목</label>
					<input type="text" name="productReviewTitle" class="form-control" id="productReviewTitle"><br>
				</div>	
				<div class="col-12">
					<label for="productReviewContents" class="form-label fw-bold fs-5">내용</label>
					<textarea name="productReviewContents" class="form-control" id="productReviewContents" rows="3"></textarea><br>
				</div>
				<div id="imgList">
					<h5><b>사진</b></h5>
					<h6>최대 5장까지 등록 가능합니다.</h6>
					<div class="fw-bold fs-5 col-12 mt-3 input-group">
						<input type="file" class="form-control" name="imgs" id="imgs">
						<button type="button" class="btn btn-outline-primary btn-image" id="imgAdd">+</button>
					</div>	
				</div>
				<div class="col-12 my-4 select">
					<h5 class="fw-bold fs-5"><b>별점</b></h5>
					<div class="form-check-block select">
							<input id="oneStar" type="radio" name="productRating" value="1" class="form-check-input">
							<label for="oneStar" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★</label>
							<input id="twoStars" type="radio" name="productRating" value="2" class="form-check-input">
							<label for="twoStars" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★★</label>
							<input id="threeStars" type="radio" name="productRating" value="3" class="form-check-input">
							<label for="threeStars" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★★★</label>
							<input id="fourStars" type="radio" name="productRating" value="4" class="form-check-input">
							<label for="fourStars" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★★★★</label>
							<input id="fiveStars" type="radio" name="productRating" value="5" class="form-check-input">
							<label for="fiveStars" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">★★★★★</label>
					</div>
				</div>
				<div class="row justify-content-center my-5">
					<button type="submit" class="btn btn-primary btn-sm btn-default">등록</button>
				</div>
			</div>
	   </form>
	</div>
	<script>
		setMax(4);
	</script>
	<script src="/resources/js/common/fileManager.js"></script>
	<c:import url="../../template/common_js.jsp"></c:import>
	<c:import url="../../template/footer.jsp"></c:import>
</body>
</html>