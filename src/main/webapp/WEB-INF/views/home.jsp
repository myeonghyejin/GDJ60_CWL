<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>홈</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<c:import url="./template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
</head>
<body>
<section class="banner bg-cover position-relative d-flex justify-content-center align-items-center"
data-background="/resources/images/banner/banner2.jpg">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<h1 class="display-1 text-white font-weight-bold font-primary">Cool With LAB</h1>
			</div>
		</div>
	</div>
</section>
	<!-- 서버 내부 주소, 상대경로 -->
	<c:import url="./template/newheader.jsp"></c:import>
	<c:import url="./template/common_js.jsp"></c:import>
</body>
<c:import url="./template/footer.jsp"></c:import>
</html>