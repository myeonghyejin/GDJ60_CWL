<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <meta charset="utf-8">
  <title>Agen | Bootstrap Agency Template</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <!-- ** Plugins Needed for the Project ** -->
  <!-- slick slider -->
  <link rel="stylesheet" href="/resources/js/plugins/slick/slick.css">
  <!-- themefy-icon -->
  <link rel="stylesheet" href="/resources/js/plugins/themify-icons/themify-icons.css">
  <!-- venobox css -->
  <link rel="stylesheet" href="/resources/js/plugins/venobox/venobox.css">
  <!-- card slider -->
  <link rel="stylesheet" href="/resources/js/plugins/card-slider/css/style.css">

  <!-- Main Stylesheet -->
  <link href="/resources/css/common/newstyle.css" rel="stylesheet">
  
  <!--Favicon-->
  <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
  <link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
  
  
  <header class="navigation fixed-top">
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/"><img src="/resources/images/banner/logo.png" width="150px" height="75px" alt="Egen"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
      aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navigation">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/recipe/list">Recipe</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/lesson/list">Lesson</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/chat/chatList">with Drink</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/list">Board</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/product/list">Product</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="/member/memberPage" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Pages</a>
          <div class="dropdown-menu">
            <c:if test="${empty member}">
              <a class="dropdown-item" href="/member/memberLogin">LOGIN</a>
              <a class="dropdown-item" href="/member/memberAgree">JOIN</a>
            </c:if>
            <c:if test="${not empty member}">	    
              <a class="dropdown-item" href="/member/memberPage">MYPAGE</a>
              <a class="dropdown-item" href="/cart/${member.memberId}">CART</a>
              <a class="dropdown-item" href="/member/memberLogout">LOGOUT</a>
            </c:if>
            <c:if test="${member.adminCheck == 1}">
              <a class="dropdown-item" href="/admin/main">ADMIN</a>
            </c:if>
          </div>
        </li>
       
      </ul>
    </div>
  </nav>
  </header>
  
  <!-- page-title -->
  <!-- <section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h1 class="display-1 text-white font-weight-bold font-primary">Cool With LAB</h1>
      </div>
    </div>
  </div>
  </section> -->
  <!-- /page-title -->
  
</head>

<body>




<!-- slick slider -->
<script src="/resources/js/plugins/slick/slick.min.js"></script>
<!-- venobox -->
<script src="/resources/js/plugins/venobox/venobox.min.js"></script>
<!-- shuffle -->
<script src="/resources/js/plugins/shuffle/shuffle.min.js"></script>
<!-- apear js -->
<script src="/resources/js/plugins/counto/apear.js"></script>
<!-- counter -->
<script src="/resources/js/plugins/counto/counTo.js"></script>
<!-- card slider -->
<script src="/resources/js/plugins/card-slider/js/card-slider-min.js"></script>

<!-- Main Script -->
<script src="/resources/js/common/newscript.js"></script>

<body id="body"></body>
