<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MY PAGE</title>
	<%@ include file="../common/sessionCheck.jsp" %>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
	
	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="display-1 text-white font-weight-bold font-primary">My Page</h1>
				</div>
			</div>
		</div>
	</section>
</head>
<body>
	<c:import url="../template/newheader.jsp"></c:import>
	<div class="container-fluid my-5">
		<div class="row col-2 my-4 justify-content-start mx-auto">
			<img alt="profile-image" src="/resources/images/profile.png">
		</div>
		<div class="row col-6 my-4 justify-content-center mx-auto" id="frame">
			<div class="row col-md-6 mx-auto my-1">
				ID
				<h5 class="my-1">${dto.memberId}</h5>
			</div>
			<div class="row col-md-6 mx-auto my-1">
				이름
				<h5 class="my-1">${dto.memberName}</h5>
			</div>
			<div class="row col-md-6 mx-auto my-1">
				성별
				<h5 class="my-1">${dto.memberGender}</h5>
			</div>
			<div class="row col-md-6 mx-auto my-1">
				나이
				<h5 class="my-1">${dto.memberAge}</h5>
			</div>
			<div class="row col-md-12 my-1">
				연락처 
				<h5 class="my-1">${dto.memberPhone}</h5>				
			</div>
			<div class="row col-md-12 my-1">
				주소
				<h5 class="my-1">(${dto.memberAddress1})<br>${member.memberAddress2} ${member.memberAddress3}</h5>
			</div>
			
			<div class="row col-md-12 my-1">
				자기 소개
				<h5 class="my-1">${dto.memberSI}</h5>
			</div>
		</div>
		<div class="row justify-content-center mx-auto">
			<a href="./memberUpdate" class="btn btn-primary btn-sm col-1 mx-1">정보 수정</a>
		</div>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>