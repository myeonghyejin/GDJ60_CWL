<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	            <li class="nav-item"><a class="nav-link" style="font-family: 'Impact'" href="/board/list">BOARD</a></li>
	            <li class="nav-item"><a class="nav-link" style="font-family: 'Impact'" href="/lesson/list">LESSON</a></li>
	            <li class="nav-item"><a class="nav-link" style="font-family: 'Impact'" href="/product/list">PRODUCT</a></li>
	        	<li class="nav-item"><a class="nav-link" style="font-family: 'Impact'" href="/chat/chatList">Chat</a></li>
	        
	        </ul>
		    <ul class="navbar-nav">
	        	<c:if test="${empty member}">
		        	<li class="nav-item"><a class="nav-link" style="font-size: 11px" href="/member/memberLogin">LOGIN</a></li>
		            <li class="nav-item"><a class="nav-link" style="font-size: 11px" href="/member/memberAgree">JOIN</a></li>
	        	</c:if>
	        	<c:if test="${not empty member}">
		        	<li class="nav-item"><a class="nav-link" style="font-size: 11px" href="/member/memberPage">MYPAGE</a></li>
		            <li class="nav-item"><a class="nav-link" style="font-size: 11px" href="/member/memberLogout">LOGOUT</a></li>
				</c:if>
		    </ul>
		</div>
	</div>
</nav>