<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DETAIL</title>
	<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<div class="row col-md-4 mx-auto my-5">
			<c:choose>
				<c:when test="${not empty DTO.productNum}">
					<div class="row mx-auto text-center border-bottom border-dark pb-4">
						<p class="fs-4 fw-bold text-center">${DTO.productName}</p>
						<p class="fs-6">번호 ${DTO.productNum} | 작성자 ${DTO.memberId} | 날짜 ${DTO.productDate}</p>
					</div>
					<div class="row my-4">
						<p class="fs-5">${DTO.productDetail}</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row col-md-4 mx-auto text-center">
						<p class="fs-2">존재하지 않는 페이지입니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- Buttons -->
	  	<c:if test="${member.memberId eq DTO.memberId}">
			<form action="./update" id="frm">
				<div class="row col-md-4 justify-content-center mx-auto">
					<input type="hidden" name="productNum" value="${DTO.productNum}">
					<button id="update" type="submit" class="btn btn-outline-primary col-2 mx-1">수정</button>
					<button id="delete" type="button" class="btn btn-outline-primary col-2 mx-1">삭제</button>
				</div>
			</form>
	  	</c:if>
		<div class="row col-md-4 justify-content-center mx-auto my-2">
			<a href="./list" class="btn btn-primary col-2 mx-1">목록</a>
		</div>
		
		<!-- Review -->
		<div class="row mt-5">
			<p class="fs-2" style="font-family: 'Impact'">REVIEW</p>
		</div>
		
		<div class="row" id="productReviewListResult">
		</div>
	
		<div class="row col-md-4 justify-content-center mx-auto">
			<a href="./review/add?productNum=${DTO.productNum}" class="btn btn-primary col-2 mx-1" id="productReviewAdd" data-product-num-review="${DTO.productNum}">작성</a>
		</div>
		
 		<!-- QnA -->
 		<div class="row mt-5">
			<p class="fs-2" style="font-family: 'Impact'">QNA</p>
		</div>
 		
		<div class="row" id="productQnAListResult">
		</div>
	
		<div class="row col-md-4 justify-content-center mx-auto">
			<a href="./qna/add?productNum=${DTO.productNum}" class="btn btn-primary col-2 mx-1" id="productQnAAdd" data-product-num-qna="${DTO.productNum}">작성</a>
		</div>
		
	</div>
	
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/product/qna.js"></script>
	<script src="/resources/js/product/review.js"></script>
</body>
</html>