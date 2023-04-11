<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LESSON UPDATE</title>
	<%@ include file="../common/sessionCheck.jsp" %>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Title -->
		<div class="row mx-auto text-center border-bottom border-dark pb-2">
			<p class="fs-2" style="font-family: 'Impact'">LESSON</p>
		</div>
		<!-- Contents -->
		<form action="./update" method="post" enctype="multipart/form-data" id="frm">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="lessonNum" value="${DTO.lessonNum}">
			<input type="hidden" name="lessonImgDTOs" value="${DTO.lessonImgDTOs}">
			<div class="row col-8 mx-auto my-5">
				<div class="col-12">
					<label for="lessonTitle" class="form-label fw-bold fs-5">제목</label>
					<input type="text" name="lessonTitle" class="form-control" id="lessonTitle" value="${DTO.lessonTitle}"><br>
				</div>
				<div class="col-12">
					<label for="lessonTeacher" class="form-label fw-bold fs-5">크리에이터</label>
					<input type="text" name="lessonTeacher" class="form-control" id="lessonTeacher" value="${DTO.lessonTeacher}"><br>
				</div>
				<div class="col-12 mx-auto">
					<label for="lessonUrl" class="form-label fw-bold fs-5">URL</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon3">https://youtu.be/</span>
						<input type="text" class="form-control" name="lessonUrl" id="lessonUrl" value="${DTO.lessonUrl}">
					</div>
					<div class="form-text" id="basic-addon4">ID를 정확히 입력해야 플레이어 및 썸네일 이미지가 정상적으로 출력됩니다.</div>
				</div>
				<div class="col-12 mx-auto mt-4">
					<label for="lessonContents" class="form-label fw-bold fs-5">내용</label>
					<textarea name="lessonContents" class="form-control" id="lessonContents" rows="3">${DTO.lessonContents}</textarea><br>
				</div>
				<div id="imgList">
					<h5><b>썸네일</b></h5>
					<div class="fw-bold fs-5 col-12 mt-3 input-group">
						<input type="file" class="form-control" name="img" id="img" value="img">
					</div>
					<div class="form-text" id="basic-addon4">미등록 시 유튜브 썸네일 이미지가 출력됩니다.</div>
				</div>
				<div class="row justify-content-center my-5">
					<button type="button" id="lessonConfirm" class="btn btn-primary btn-sm btn-default">등록</button>
				</div>
			</div>
	   </form>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="/resources/js/common/confirm.js"></script>
</body>
</html>