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
		<form action="./add" method="post" enctype="multipart/form-data">
			<input type="hidden" name="productNum" value="${productNum}">
			<div class="row col-md-4 mx-auto my-5">
				<div class="fw-bold fs-5 col-12">
					<label for="memberId" class="form-label">작성자</label>
					<input type="text" name="memberId" class="form-control" id="memberId" value="${member.memberId}" readonly><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="productReviewTitle" class="form-label">제목</label>
					<input type="text" name="productReviewTitle" class="form-control" id="productReviewTitle"><br>
				</div>	
				<div class="fw-bold fs-5 col-12">
					<label for="productReviewContents" class="form-label">내용</label>
					<textarea name="productReviewContents" class="form-control" id="productReviewContents" rows="3"></textarea><br>
				</div>
				<div id="imgList">
					<div class="fw-bold fs-5 col-12 input-group">
						<input type="file" class="form-control" name="imgs">
						<button type="button" class="btn btn-outline-primary" id="imgAdd">ADD</button>
					</div>	
				</div>
				<div class="fw-bold fs-5 col-12 mu-4">
					<div class="form-check form-check-inline">
						<label for="bs1" class="form-check-label" id="inlineRadio1">★</label>
						<input id="bs1" type="radio" name="productRating" value="1" checked class="form-check-input" for="inlineRadio1">
					</div>
					<div class="form-check form-check-inline">
						<label for="bs2" class="form-check-label" id="inlineRadio2">★★</label>
						<input id="bs2" type="radio" name="productRating" value="2" class="form-check-input" for="inlineRadio2">
					</div>
					<div class="form-check form-check-inline">
						<label for="bs2" class="form-check-label" id="inlineRadio3">★★★</label>
						<input id="bs2" type="radio" name="productRating" value="3" class="form-check-input" for="inlineRadio3">
					</div>
					<div class="form-check form-check-inline">
						<label for="bs2" class="form-check-label" id="inlineRadio4">★★★★</label>
						<input id="bs2" type="radio" name="productRating" value="4" class="form-check-input" for="inlineRadio4">
					</div>
					<div class="form-check form-check-inline">
						<label for="bs2" class="form-check-label" id="inlineRadio5">★★★★★</label>
						<input id="bs2" type="radio" name="productRating" value="5" class="form-check-input" for="inlineRadio5">
					</div>
				</div>
				<div class="row justify-content-center my-5">
					<button type="submit" class="btn btn-primary col-2">글쓰기</button>
				</div>
			</div>
	   </form>
	</div>
	<script src="../resources/js/fileManager.js"></script>
	<script>
		setMax(4);
	</script>
	<c:import url="../../template/common_js.jsp"></c:import>
</body>
</html>