<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Main Stylesheet -->
<link rel="stylesheet" href="/resources/css/common/header.css">

<header class="navigation fixed-top">
	<nav class="navbar navbar-expand-lg navbar-dark active">
		<div class="container-fluid">
			<ul id="title">
				<a class="navbar-brand" href="/">
					COOL<br>
					WITH<br>
					LAB
				</a>
			</ul>
			
			<ul class="navbar-nav ml-auto grid gap-0 column-gap-2" id="main">
				<li class="nav-item">
					<a class="nav-link menu main-menu" href="#">Cool with Cocktail</a>
				</li>
				<li class="nav-item">
					<a class="nav-link menu main-menu" href="#">Recipe</a>
				</li>
				<li class="nav-item">
					<a class="nav-link menu main-menu" href="/lesson/list">Lesson</a>
				</li>
				<li class="nav-item">
					<a class="nav-link menu main-menu" href="/chat/chatList">with Drink</a>
				</li>
				<li class="nav-item">
					<a class="nav-link menu main-menu" href="/board/list">Board</a>
				</li>
				<li class="nav-item">
					<a class="nav-link menu main-menu" href="/product/list">Product</a>
				</li>
			</ul>			
			
			<ul class="navbar-nav" id="sub">
				<c:if test="${empty member}">
					<li class="nav-item">
						<a class="nav-link menu sub-menu" style="font-size: 11px" href="/member/memberLogin">LOGIN</a>
					</li>
					<li class="nav-item">
						<a class="nav-link menu sub-menu" style="font-size: 11px" href="/member/memberAgree">JOIN</a>
					</li>
				</c:if>
				<c:if test="${not empty member}">	     	        		
					<li class="nav-item">
						<a class="nav-link menu sub-menu" style="font-size: 11px" href="/member/memberPage">MYPAGE</a>
					</li>
					<li class="nav-item">
						<a class="nav-link menu sub-menu" style="font-size: 11px" href="/cart/cart?id=${member.memberId}">CART</a>
					</li>
					<li class="nav-item">
						<a class="nav-link menu sub-menu" style="font-size: 11px" href="/member/memberLogout">LOGOUT</a>
					</li>		            
				</c:if>
				<c:if test="${member.adminCheck == 1}">
					<li class="nav-item">
						<a class="nav-link menu sub-menu" style="font-size: 11px" href="/admin/main">ADMIN</a>
					</li>
				</c:if>
			</ul>

		</div>
	</nav>
</header>
<body id="body"></body>