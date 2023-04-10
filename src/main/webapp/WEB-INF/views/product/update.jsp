<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PRODUCT UPDATE</title>
	<%@ include file="../common/sessionCheck.jsp" %>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<div class="row mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">PRODUCT</p>
		</div>
		
		<!-- Contents -->
		<form action="./update" method="post" enctype="multipart/form-data" id="frm">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="productNum" value="${DTO.productNum}">
			<div class="row col-8 mx-auto my-5">
				<div class="fw-bold fs-5 col-12">
					<label for="productName" class="form-label">제품 이름</label>
					<input type="text" name="productName" class="form-control" id="productName" value="${DTO.productName}"><br>
				</div>	
				<div class="fw-bold fs-5 col-12">
					<label for="productPrice" class="form-label">가격</label>
					<input type="number" name="productPrice" class="form-control" id="productPrice" value="${DTO.productPrice}"><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="productDetail" class="form-label">제품 상세 내용</label>
					<textarea name="productDetail" class="form-control" id="productDetail" rows="3">${DTO.productDetail}</textarea><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="productStock" class="form-label">재고</label>
					<input type="number" name="productStock" class="form-control" id="productStock" value="${DTO.productStock}"><br>
				</div>
				<div id="imgList">
					<h5><b>제품 사진</b></h5>
					<h6>최소 1장, 최대 5장까지 등록 가능합니다.</h6>
					<div class="fw-bold fs-5 col-12 mt-3 input-group">
						<input type="file" class="form-control" name="imgs" id="imgs">
						<button type="button" class="btn btn-outline-primary btn-image" id="imgAdd">+</button>
					</div>	
				</div>
				<div class="fw-bold fs-5 col-12 my-4">
					<div class="form-check form-check-inline">
						<label for="bs1" class="form-check-label" id="inlineRadio1">판매</label>
						<input id="bs1" type="radio" name="productState" value="1" checked class="form-check-input radio-wrap" for="inlineRadio1" 
						value="${DTO.productState}" ${DTO.productState eq 1 ? 'checked' :''}>
					</div>
					<div class="form-check form-check-inline">
						<label for="bs2" class="form-check-label" id="inlineRadio2">판매 중지</label>
						<input id="bs2" type="radio" name="productState" value="0" class="form-check-input radio-wrap" for="inlineRadio2" 
						value="${DTO.productState}" ${DTO.productState eq 0 ? 'checked' :''}>
					</div>
				</div>
				<div class="row justify-content-center my-5">
					<button type="button" id="productConfirm" class="btn btn-primary btn-sm btn-default">등록</button>
				</div>
			</div>
	   </form>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/resources/js/common/fileManager.js"></script>
	<script src="/resources/js/common/confirm.js"></script>
	<script>
		setMax(4);
		setCount('${DTO.productImgDTOs.size()}');
		setParam("imgs")
	</script>
</body>
</html>