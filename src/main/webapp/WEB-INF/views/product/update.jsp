<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>UPDATE</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<div class="row col-md-4 mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">${productName} Update Page</p>
		</div>
		
		<!-- Contents -->
		<form action="./update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="productNum" value="${DTO.productNum}">
			<div class="row col-md-4 mx-auto my-5">
				<div class="fw-bold fs-5 col-12">
					<label for="memberId" class="form-label">작성자</label>
					<input type="text" name="memberId" class="form-control" id="memberId" value="${member.memberId}" readonly><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="productName" class="form-label">제목</label>
					<input type="text" name="productName" class="form-control" id="productName" value="${DTO.productName}"><br>
				</div>			
				<div class="fw-bold fs-5 col-12">
					<label for="productDetail" class="form-label">내용</label>
					<textarea name="productDetail" class="form-control" id="productDetail" rows="3">${DTO.productDetail}</textarea><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="productStock" class="form-label">재고</label>
					<input type="text" name="productStock" class="form-control" id="productStock" value="${DTO.productStock}"><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="productPrice" class="form-label">가격</label>
					<input type="text" name="productPrice" class="form-control" id="productPrice" value="${DTO.productPrice}"><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="bs1" class="form-label">판매</label>
					<input id="bs1" type="radio" ${DTO.productState eq 1 ? 'checked' :''} name="productState" value="${DTO.productState}">
					<label for="bs2" class="form-label">판매 중지</label>
					<input id="bs2" type="radio" ${DTO.productState eq 0 ? 'checked' :''} name="productState" value="${DTO.productState}">
				</div>
				<div class="row justify-content-center my-5">
					<button type="submit" class="btn btn-primary col-2">글쓰기</button>
				</div>
			</div>
	   </form>
	</div>
	<script>
		$('#productContents').summernote();
	</script>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>