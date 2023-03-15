<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="../template/commonCss.jsp"></c:import>
</head>
<body>

<div class="container-fluid my-5">
	<!-- Contents -->
	<div class="row col-md-4 mx-auto my-5">
		<c:choose>
			<c:when test="${not empty DTO.boardNum}">
				<div class="row mx-auto text-center border-bottom border-dark pb-4">
					<p class="fs-6">번호 ${DTO.boardNum} | 작성자 ${DTO.memberId} | 날짜 ${DTO.boardDate} | 조회수 ${DTO.boardHit}</p>
				</div>
				<div class="row my-4">
					<p class="fs-4 fw-bold text-center">${DTO.boardTitle}</p>
					<p class="fs-5">${DTO.boardContents}</p>
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
<%--  	<c:if test="${member.memderId eq DTO.memderId}"> --%>
		<form action="./update" id="frm">
			<div class="row col-md-4 justify-content-center mx-auto">
				<a href="./reply?boardNum=${DTO.boardNum}" class="btn btn-outline-primary col-2 mx-1">답글 달기</a>
				<input type="hidden" name="boardNum" value="${DTO.boardNum}">
				<button id="update" type="submit" class="btn btn-outline-primary col-2 mx-1">수정</button>
				<button id="delete" type="button" class="btn btn-outline-primary col-2 mx-1">삭제</button>
			</div>
		</form>
<%--  	</c:if> --%>
	<div class="row col-md-4 justify-content-center mx-auto my-2">
		<a href="./list" class="btn btn-primary col-2 mx-1">목록</a>
	</div>

</div>

</body>
</html>