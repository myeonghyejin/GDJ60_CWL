<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<h1>My Page</h1>
		</div>
		
		<div class="row">
			<h3>아이디 : ${member.memberId}</h3>
			<h3>닉네임 : ${member.memberNickName}</h3>
			<h3>이름 : ${member.memberName}</h3>
			<h3>휴대폰 : ${member.memberPhone}</h3>
			<h3>주소 : ${member.memberAddress1}<br>${dto.memberAddress2}<br>${dto.memberAddress3}</h3>
			<h3>이메일 : ${member.memberEmail}</h3>
			<h3>성별 : ${member.memberGender}</h3>
			<h3>자기소개 : ${member.memberSI}</h3>
			<h3>나이 : ${member.memberAge}</h3>
			<a href="./memberUpdate" class="btn btn-info">회원수정</a>
		</div>
	</div>
	

</body>
</html>