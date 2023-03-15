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
	<div class="row justify-content-center">
		<h1 class="col-md-7 my-5">Member Login</h1>
	</div>
	<div class="row justify-content-center my-5">
		<form class="col-md-7" action="memberLogin" method="post">
			<div class="mb-3">
	    		<label for="memberId" class="form-label">ID</label>
	    		<input type="text" class="form-control" id="memberId" name="memberId" value="${cookie.rememberId.value}">
		  	</div>
		  	<div class="mb-3">
				<label for="memberPw" class="form-label">Password</label>
			  	<input type="password" class="form-control" id="memberPw" name="memberPw">
			</div>
			<div class="mb-3 form-check">
			  	<input type="checkbox" name="remember" value="remember" class="form-check-input" id="remember">
			  	<label class="form-check-label" for="remember">ID 기억하기</label>
			</div>
	  		<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div>


</body>
</html>