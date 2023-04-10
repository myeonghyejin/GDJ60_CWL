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
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<c:import url="../../template/header.jsp"></c:import>
	<div class="container-fluid my-5">
		<!-- Contents -->
		<% request.setCharacterEncoding("UTF-8");
	    String productNum = request.getParameter("productNum");
	    String productQnANum = request.getParameter("productQnANum");
		String productQnASecret = request.getParameter("productQnASecret");
	    %>
		<form action="./reply" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="productNum" value="<%=productNum%>">
			<input type="hidden" name="productQnANum" value="<%=productQnANum%>">
			<input type="hidden" name="productQnASecret" value="<%=productQnASecret%>">
			<div class="row col-8 mx-auto my-5">
				<div class="fw-bold fs-5 col-12">
					<label for="productQnATitle" class="form-label">제목</label>
					<input type="text" name="productQnATitle" class="form-control" id="productQnATitle"><br>
				</div>	
				<div class="fw-bold fs-5 col-12">
					<label for="productQnAContents" class="form-label">내용</label>
					<textarea name="productQnAContents" class="form-control" id="productQnAContents" rows="3"></textarea><br>
				</div>
				<div class="row justify-content-center my-5">
					<button type="submit" class="btn btn-primary btn-sm btn-default">작성</button>
				</div>
			</div>
	   </form>
	</div>
	<script>
		$('#productQnAContents').summernote();
	</script>
	<c:import url="../../template/common_js.jsp"></c:import>
	<c:import url="../../template/footer.jsp"></c:import>
</body>
</html>