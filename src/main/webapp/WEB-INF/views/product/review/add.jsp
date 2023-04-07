<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ADD</title>
	<c:import url="../../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
</head>
<body>
	<c:import url="../../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<% request.setCharacterEncoding("UTF-8");
	    String productNum = request.getParameter("productNum");
	    %>
		<form action="./add" method="post" enctype="multipart/form-data">
			<input type="hidden" name="productNum" value="<%=productNum%>">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<div class="row col-8 mx-auto my-5">
				<div class="fw-bold fs-5 col-12">
					<label for="productReviewTitle" class="form-label">제목</label>
					<input type="text" name="productReviewTitle" class="form-control" id="productReviewTitle"><br>
				</div>	
				<div class="fw-bold fs-5 col-12">
					<label for="productReviewContents" class="form-label">내용</label>
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
				<div class="fw-bold fs-5 col-12 my-4">
					<h5><b>별점</b></h5>
					<div class="form-check form-check-block">
						<label for="bs1" class="form-check-label" id="oneStar">★</label>
						<input id="bs1" type="radio" name="productRating" value="1" checked class="form-check-input" for="oneStar">
					</div>
					<div class="form-check form-check-block">
						<label for="bs2" class="form-check-label" id="twoStars">★★</label>
						<input id="bs2" type="radio" name="productRating" value="2" class="form-check-input" for="twoStars">
					</div>
					<div class="form-check form-check-block">
						<label for="bs3" class="form-check-label" id="threeStars">★★★</label>
						<input id="bs3" type="radio" name="productRating" value="3" class="form-check-input" for="threeStars">
					</div>
					<div class="form-check form-check-block">
						<label for="bs4" class="form-check-label" id="fourStars">★★★★</label>
						<input id="bs4" type="radio" name="productRating" value="4" class="form-check-input" for="fourStars">
					</div>
					<div class="form-check form-check-block">
						<label for="bs5" class="form-check-label" id="fiveStars">★★★★★</label>
						<input id="bs5" type="radio" name="productRating" value="5" class="form-check-input" for="fiveStars">
					</div>
				</div>
				<div class="row justify-content-center my-5">
					<button type="submit" class="btn btn-primary btn-sm btn-default">등록</button>
				</div>
			</div>
	   </form>
	</div>
	<script src="/resources/js/common/fileManager.js"></script>
	<script>
		setMax(4);
	</script>
	<c:import url="../../template/common_js.jsp"></c:import>
	<c:import url="../../template/footer.jsp"></c:import>
</body>
</html>