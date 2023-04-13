<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0048)https://colorlib.com/etc/lf/Login_v20/index.html -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="icon" type="image/png" href="https://colorlib.com/etc/lf/Login_v20/images/icons/favicon.ico">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/animsition.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/animsition.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/select2.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/daterangepicker.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/main.css">
	
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
	
	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
	  <div class="container">
		<div class="row">
		  <div class="col-12 text-center">
			<h1 class="display-1 text-white font-weight-bold font-primary">Login</h1>
		  </div>
		</div>
	  </div>
	  </section>
	  <!-- /page-title -->
	  
	
	<script
		nonce="72ebb00d-4cf5-48bf-a297-1f73e9ce5986">(function (w, d) { !function (bv, bw, bx, by) { bv[bx] = bv[bx] || {}; bv[bx].executed = []; bv.zaraz = { deferred: [], listeners: [] }; bv.zaraz.q = []; bv.zaraz._f = function (bz) { return function () { var bA = Array.prototype.slice.call(arguments); bv.zaraz.q.push({ m: bz, a: bA }) } }; for (const bB of ["track", "set", "debug"]) bv.zaraz[bB] = bv.zaraz._f(bB); bv.zaraz.init = () => { var bC = bw.getElementsByTagName(by)[0], bD = bw.createElement(by), bE = bw.getElementsByTagName("title")[0]; bE && (bv[bx].t = bw.getElementsByTagName("title")[0].text); bv[bx].x = Math.random(); bv[bx].w = bv.screen.width; bv[bx].h = bv.screen.height; bv[bx].j = bv.innerHeight; bv[bx].e = bv.innerWidth; bv[bx].l = bv.location.href; bv[bx].r = bw.referrer; bv[bx].k = bv.screen.colorDepth; bv[bx].n = bw.characterSet; bv[bx].o = (new Date).getTimezoneOffset(); if (bv.dataLayer) for (const bI of Object.entries(Object.entries(dataLayer).reduce(((bJ, bK) => ({ ...bJ[1], ...bK[1] }))))) zaraz.set(bI[0], bI[1], { scope: "page" }); bv[bx].q = []; for (; bv.zaraz.q.length;) { const bL = bv.zaraz.q.shift(); bv[bx].q.push(bL) } bD.defer = !0; for (const bM of [localStorage, sessionStorage]) Object.keys(bM || {}).filter((bO => bO.startsWith("_zaraz_"))).forEach((bN => { try { bv[bx]["z_" + bN.slice(7)] = JSON.parse(bM.getItem(bN)) } catch { bv[bx]["z_" + bN.slice(7)] = bM.getItem(bN) } })); bD.referrerPolicy = "origin"; bD.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(bv[bx]))); bC.parentNode.insertBefore(bD, bC) };["complete", "interactive"].includes(bw.readyState) ? zaraz.init() : bv.addEventListener("DOMContentLoaded", zaraz.init) }(w, d, "zarazData", "script"); })(window, document);</script>
</head>

<body>
	<c:import url="../template/newheader.jsp"></c:import>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-100 p-t-100">
				<form class="login100-form validate-form" id="login_form" method="post">
					<span class="login100-form-title p-b-43">
						Account Login
						<c:if test="${result == 0}">
							<div class="login_warn">ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>
					</span>
					<div class="wrap-input100 rs1 validate-input" data-validate="Username is required">
						<input class="input100 id_input" type="text" name="memberId">
						<span class="label-input100">Username</span>
					</div>
					<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
						<input class="input100 pw_iput" type="password" name="memberPw">
						<span class="label-input100">Password</span>
					</div>


					<div class="container-login100-form-btn">
						<button class="login100-form-btn login_button">
							Login
						</button>
					</div>
					<div class="text-center w-full p-t-23">
						<a href="./memberAgree" class="txt1">
							Join
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="/resources/js/member/animsition.min.js"></script>

	<script src="/resources/js/member/select2.min.js"></script>

	<script src="/resources/js/member/moment.js"></script>
	<script src="/resources/js/member/daterangepicker.js"></script>

	<script src="/resources/js/member/countdowntime.js"></script>

	<script src="/resources/js/member/main.js"></script>

	<script async="" src="./Login V20_files/js"></script>
	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function () {

			//alert("로그인 버튼 작동");

			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();
		});
	</script>
	<!-- <script defer="" src="./Login V20_files/v2b4487d741ca48dcbadcaf954e159fc61680799950996"
		integrity="sha512-D/jdE0CypeVxFadTejKGTzmwyV10c1pxZk/AqjJuZbaJwGMyNHY3q/mTPWqMUnFACfCTunhZUVcd4cV78dK1pQ=="
		data-cf-beacon="{&quot;rayId&quot;:&quot;7b630353d8cb8314&quot;,&quot;token&quot;:&quot;cd0b4b3a733644fc843ef0b185f98241&quot;,&quot;version&quot;:&quot;2023.3.0&quot;,&quot;si&quot;:100}"
		crossorigin="anonymous"></script> -->

	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>

</body>

</html>