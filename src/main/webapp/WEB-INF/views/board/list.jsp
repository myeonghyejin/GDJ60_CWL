<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
<c:import url="../template/commonCss.jsp"></c:import>
</head>
<body>

<div class="container-fluid my-5">
	
	<!-- Title -->
	<div class="row col-md-4 mx-auto text-center border-bottom border-dark pb-2">
		<p class="fs-2" style="font-family: 'Impact'">FREE BOARD</p>
	</div>

	<div class="row col-md-4 mx-auto my-5">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>NUM</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="DTO">
					<tr>
						<td>${DTO.boardNum}</td>
						<td>
							<a href="./detail?boardNum=${DTO.boardNum}">${DTO.boardTitle}</a>
						</td>
						<td>${DTO.memberId}</td>
						<td>${DTO.boardDate}</td>
						<td>${DTO.boardHit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
</div>

</body>
</html>