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
		<form action="./update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="lessonNum" value="${DTO.lessonNum}">
			<div class="row col-8 mx-auto my-5">
				<div class="fw-bold fs-5 col-12">
					<label for="lessonTitle" class="form-label">제목</label>
					<input type="text" name="lessonTitle" class="form-control" id="lessonTitle" value="${DTO.lessonTitle}"><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="lessonTeacher" class="form-label">크리에이터</label>
					<input type="text" name="lessonTeacher" class="form-control" id="lessonTeacher" value="${DTO.lessonTeacher}"><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="lessonUrl" class="form-label">URL</label>
					<input type="text" name="lessonUrl" class="form-control" id="lessonUrl" value="${DTO.lessonUrl}"><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="lessonContents" class="form-label">내용</label>
					<textarea name="lessonContents" class="form-control" id="lessonContents" rows="3">${DTO.lessonContents}</textarea><br>
				</div>
				<div id="imgList">
					<h5><b>썸네일</b></h5>
					<div class="fw-bold fs-5 col-12 mt-3 input-group">
						<input type="file" class="form-control" name="multipartFile" id="multipartFile">
					</div>	
				</div>
				<div class="row justify-content-center my-5">
					<button type="submit" id="submit" class="btn btn-primary btn-sm btn-default">등록</button>
				</div>
			</div>
	   </form>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>