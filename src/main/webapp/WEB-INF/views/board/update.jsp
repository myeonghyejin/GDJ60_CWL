<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BOARD UPDATE</title>
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
					<h1 class="display-1 text-white font-weight-bold font-primary">Board</h1>
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
			<p class="fs-2" style="font-family: 'Impact'">FREE BOARD</p>
		</div> -->
		
		<!-- Contents -->
		<form action="./update" method="post" id="frm">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="boardNum" value="${DTO.boardNum}">
			<div class="row col-8 mx-auto my-5">
				<div class="col-12">
					<label for="boardTitle" class="form-label fw-bold fs-5">제목</label>
					<input type="text" name="boardTitle" class="form-control" id="boardTitle" value="${DTO.boardTitle}"><br>
				</div>			
				<div class="col-12">
					<label for="boardContents" class="form-label fw-bold fs-5">내용</label>
					<textarea name="boardContents" class="form-control" id="boardContents" rows="3">${DTO.boardContents}</textarea><br>
				</div>
	
				<div class="row justify-content-center my-5">
					<button type="button" id="boardConfirm" class="btn btn-primary btn-sm btn-default">작성</button>
				</div>
			</div>
	   </form>
	</div>
	<script>
		$('#boardContents').summernote();
	</script>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/resources/js/common/confirm.js"></script>
</body>
</html>