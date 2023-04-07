<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LESSON ADD</title>
	<%@ include file="../common/sessionCheck.jsp" %>
	<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<form action="./add" method="post" enctype="multipart/form-data">
			<div class="row col-md-4 mx-auto my-5">
				<div class="fw-bold fs-5 col-12">
					<label for="memberId" class="form-label">작성자</label>
					<input type="text" name="memberId" class="form-control" id="memberId" value="${member.memberId}" readonly><br>
				</div>
				<div class="fw-bold fs-5 col-12">
					<label for="lessonTitle" class="form-label">제목</label>
					<input type="text" name="lessonTitle" class="form-control" id="lessonTitle"><br>
				</div>			
				<div class="fw-bold fs-5 col-12">
					<label for="lessonContents" class="form-label">내용</label>
					<textarea name="lessonContents" class="form-control" id="lessonContents" rows="3"></textarea><br>
				</div>
				<div id="imgList">
					<div class="fw-bold fs-5 col-12 input-group">
						<input type="file" class="form-control" name="imgs">
						<button type="button" class="btn btn-outline-primary" id="imgAdd">ADD</button>
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
		setCount('${DTO.lessonImgDTOs.size()}');
		setParam("imgs")
	</script>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>