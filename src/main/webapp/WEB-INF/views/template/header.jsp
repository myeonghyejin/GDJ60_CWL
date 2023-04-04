<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Main Stylesheet -->
<link rel="stylesheet" href="/resources/css/style.css">

<header class="navigation fixed-top">
	<nav class="navbar navbar-expand-lg navbar-dark active">
		<div class="container-fluid">
			<div class="row justify-content-start m-4">
				<div class="col">
					<a class="navbar-brand" id="title" href="/">
						COOL<br>
						WITH<br>
						LAB
					</a>
				</div>
			</div>
			
			<div class="row justify-content-end me-4">
				<div class="col" id="menu-box">
					<div class="row">
						<ul class="navbar-nav ml-auto grid gap-0 column-gap-2">
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
					</div>
					<div class="row" id="sub">
						<ul class="navbar-nav">
							<c:if test="${empty member}">
								<li class="nav-item">
									<a class="nav-link menu sub-menu" style="font-size: 11px" href="/member/memberLogin">LOGIN</a>
								</li>
								<li class="nav-item">
									<a class="nav-link menu sub-menu" style="font-size: 11px" href="/member/memberAgree">JOIN</a>
								</li>
							</c:if>
								<li class="nav-item">
									<a class="nav-link menu sub-menu" style="font-size: 11px" href="/cart/cart?id=${member.memberId}">CART</a>
								</li>
							<c:if test="${not empty member}">	     	        		
								<li class="nav-item">
									<a class="nav-link menu sub-menu" style="font-size: 11px" href="/member/memberPage">MYPAGE</a>
								</li>
								<li class="nav-item">
									<a class="nav-link menu sub-menu" style="font-size: 11px" href="/member/memberLogout">LOGOUT</a>
								</li>		            
							</c:if>
							<c:if test="${member.adminCheck == 1}">
								<li class="nav-item">
									<a class="nav-link menu sub-menu" style="font-size: 11px" href="/admin/main">AdminPage</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</header>