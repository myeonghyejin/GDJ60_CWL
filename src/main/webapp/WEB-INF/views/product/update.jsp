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
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
	<c:import url="../template/newheader.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<!-- <div class="row mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">PRODUCT</p>
		</div> -->
		
		<!-- Contents -->
		<form action="./update" method="post" enctype="multipart/form-data" id="frm">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="productNum" value="${DTO.productNum}">
			<div class="row col-8 mx-auto my-5">
				<div class="col-12 my-1">
					<label for="productName" class="form-label fw-bold fs-5">제품 이름</label>
					<input type="text" name="productName" class="form-control" id="productName" value="${DTO.productName}"><br>
				</div>	
				<div class="col-12 my-1">
					<label for="productPrice" class="form-label fw-bold fs-5">가격</label>
					<input type="number" name="productPrice" class="form-control" id="productPrice" value="${DTO.productPrice}"><br>
				</div>
				<div class="col-12 my-1">
					<label for="productDetail" class="form-label fw-bold fs-5">제품 상세 내용</label>
					<textarea name="productDetail" class="form-control" id="productDetail" rows="3">${DTO.productDetail}</textarea><br>
				</div>
				<div class="col-12 my-1">
					<label for="productStock" class="form-label fw-bold fs-5">재고</label>
					<input type="number" name="productStock" class="form-control" id="productStock" value="${DTO.productStock}"><br>
				</div>
				
				<div id="imgList" class="my-1">
					<h5 class="fw-bold fs-5"><b>제품 사진</b></h5>
					<div class="form-text" id="basic-addon4">최소 1장, 최대 5장까지 등록 가능합니다.</div>
					<div class="col-12 mt-3 input-group">
						<input type="file" class="form-control" name="imgs" id="imgs">
						<button type="button" class="btn btn-outline-primary btn-image" id="imgAdd">+</button>
					</div>
				</div>
				
				<div class="col-12 mt-4">
					<h5 class="fw-bold fs-5"><b>첨부 사진 삭제</b></h5>
					<div class="form-text" id="basic-addon4">체크 박스 클릭 시 삭제 가능합니다.</div>
					<c:forEach items="${DTO.productImgDTOs}" var="imgDTO">
						<div class="input-group mb-3 my-3">
							<div class="input-group-text">
								<input class="form-check-input deleteCheck" type="checkbox" name="productImgNum" value="${imgDTO.productImgNum}" aria-label="Checkbox for following text input">
							</div>
							<input type="text" disabled value="${imgDTO.originalName}" class="form-control" aria-label="Text input with checkbox">
						</div>
					</c:forEach>
				</div>
			</div>		
				
			<div class="col-12 select justify-content-center mx-auto" align="center">
				<div class="form-check-block select">
					<input id="onSale" type="radio" name="productState" value="1" class="form-check-input" ${DTO.productState eq '1' ? 'checked' :''}>
					<label for="onSale" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">판매</label>
					<input id="notForSale" type="radio" name="productState" value="0" class="form-check-input" ${DTO.productState eq '0' ? 'checked' :''}>					
					<label for="notForSale" class="form-check-label btn btn-outline-primary btn-sm btn-category mx-1">판매 중지</label>
				</div>
			</div>
				
			<div class="row justify-content-center my-5">
					<button type="button" id="productConfirm" class="btn btn-primary btn-sm btn-default">등록</button>
			</div>
		</form>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/resources/js/common/fileManager.js"></script>
	<script src="/resources/js/common/confirm.js"></script>
	<script>
		$('#productDetail').summernote();
		setMax(4);
		setCount('${DTO.productImgDTOs.size()}');
		setParam("imgs")
	</script>
</body>
</html>