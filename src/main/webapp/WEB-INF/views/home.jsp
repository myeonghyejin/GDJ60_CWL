<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>홈</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<c:import url="./template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
		 <!-- page-title -->
		 <section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
			<div class="container">
			  <div class="row">
				<div class="col-12 text-center">
				  <h1 class="display-1 text-white font-weight-bold font-primary">Cool With LAB</h1>
				</div>
			  </div>
			</div>
			</section>
			<!-- /page-title -->	
</head>
<body>
	<!-- 서버 내부 주소, 상대경로 -->
	<c:import url="./template/newheader.jsp"></c:import>
	
	
	<c:import url="./template/common_js.jsp"></c:import>
</body>
<c:import url="./template/footer.jsp"></c:import>
</html>