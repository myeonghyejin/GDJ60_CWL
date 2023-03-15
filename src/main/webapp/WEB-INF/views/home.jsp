<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>홈</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<c:import url="./template/common_css.jsp"></c:import>
</head>
<body>
	<!-- 서버 내부 주소, 상대경로 -->
	<c:import url="./template/header.jsp"></c:import>
	
<div class="container-fluid my-5">
	<div class="row col-md-6 offset-md-3">
		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
	  	<div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="/resources/images/son.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="/resources/images/cha.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      <img src="/resources/images/park.jpg" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	</div>
</div>
<div class="container-fluid my-5" id="noticeList">
	
</div>	
	
	<c:import url="./template/common_js.jsp"></c:import>
	
</body>
</html>