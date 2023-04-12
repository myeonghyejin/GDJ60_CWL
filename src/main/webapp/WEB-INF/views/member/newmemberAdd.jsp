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

	<!-- <link rel="stylesheet" type="text/css" href="/resources/css/member/bootstrap.min.css"> -->

	<!-- <link rel="stylesheet" type="text/css" href="./Login V20_files/font-awesome.min.css"> -->

	<link rel="stylesheet" type="text/css" href="./Login V20_files/icon-font.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/animsition.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/hamburgers.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/animsition.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/select2.min.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/daterangepicker.css">

	<link rel="stylesheet" type="text/css" href="/resources/css/member/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/member/main.css">
	
	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
	  <div class="container">
		<div class="row">
		  <div class="col-12 text-center">
			<h1 class="display-1 text-white font-weight-bold font-primary">Join</h1>
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
			<div class="wrap-login100 p-b-160 p-t-50">
				<form class="login100-form validate-form" id="join_form" method="post">
					<span class="login100-form-title p-b-43">
						Account Join
					</span>
                    <div class="id_wrap">
					<div class="wrap-input100 rs1 validate-input id_name" data-validate="Username is required">
						<input class="input100 id_input" type="text" name="memberId">
						<span class="label-input100">Username</span>
                        <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
                        <span class="id_input_re_2">아이디가 이미 존재합니다.</span>	
                        <span class="final_id_ck">아이디를 입력해주세요.</span>			
                    </div>
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

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

	<script src="/resources/js//member/animsition.min.js"></script>

	<script src="./Login V20_files/popper.js"></script>
	<script src="/resources/js/member/bootstrap.min.js"></script>

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
    script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script>
     /* 유효성 검사 통과유무 변수 */
     var idCheck = false;			// 아이디
     var idckCheck = false;			// 아이디 중복 검사
     var nickName = false;			// 닉네임
     //var nickNameCheck = false;		// 닉네임 중복 검사
     var pwCheck = false;			// 비번
     var pwckCheck = false;			// 비번 확인
     var pwckcorCheck = false;		// 비번 확인 일치 확인
     var nameCheck = false;			// 이름
     var addressCheck = false 		// 주소
    $(document).ready(function(){
        //회원가입 버튼(회원가입 기능 작동)
        $(".join_button").click(function(){
            
            /* 입력값 변수 */
            var id = $('.id_input').val(); 				// id 입력란
            //var nickName = $('.nickName_input').val(); 	// 닉네임 입력란
            var pw = $('.pw_input').val();				// 비밀번호 입력란
            var pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란
            var name = $('.user_input').val();			// 이름 입력란
            var mail = $('.mail_input').val();			// 이메일 입력란
            var addr = $('.address_input_3').val();		// 주소 입력란
            
            /* 아이디 유효성검사 */
            if(id == ""){
                $('.final_id_ck').css('display','block');
                idCheck = false;
            }else{
                $('.final_id_ck').css('display', 'none');
                idCheck = true;
            }
            
            /* 닉네임 유효성검사 */
            if(nickName == ""){
                $('.final_nickName_ck').css('display','block');
                nickNameCheck = false;
            }else{
                $('.final_nickName_ck').css('display', 'none');
                nickNameCheck = true;
            }
            
            /* 비밀번호 유효성 검사 */
            if(pw == ""){
                $('.final_pw_ck').css('display','block');
                pwCheck = false;
            }else{
                $('.final_pw_ck').css('display', 'none');
                pwCheck = true;
            }
            
            /* 비밀번호 확인 유효성 검사 */
            if(pwck == ""){
                $('.final_pwck_ck').css('display','block');
                pwckCheck = false;
            }else{
                $('.final_pwck_ck').css('display', 'none');
                pwckCheck = true;
            }
            
            /* 이름 유효성 검사 */
            if(name == ""){
                $('.final_name_ck').css('display','block');
                nameCheck = false;
            }else{
                $('.final_name_ck').css('display', 'none');
                nameCheck = true;
            }		
            
            
            
            /* 주소 유효성 검사 */
            if(addr == ""){
                $('.final_addr_ck').css('display','block');
                addressCheck = false;
            }else{
                $('.final_addr_ck').css('display', 'none');
                addressCheck = true;
            }		
            
            /* 최종 유효성 검사 */
            if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&addressCheck ){
                $("#join_form").attr("action", "/member/memberAdd");
                $("#join_form").submit();			
                
            }		
            
            return false;
        });
    });
    //아이디 중복검사
    $('.id_input').on("propertychange change keyup paste input", function(){
        /* console.log("keyup 테스트"); */
        
        var memberId = $('.id_input').val();			// .id_input에 입력되는 값
        var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
        
        $.ajax({
            type : "post",
            url : "/member/memberIdCheck",
            data : data,
            success : function(result){
                // console.log("성공 여부" + result);
                if(result != 'fail'){
                    $('.id_input_re_1').css("display","inline-block");
                    $('.id_input_re_2').css("display", "none");	
                    idckCheck = true;
                } else {
                    $('.id_input_re_2').css("display","inline-block");
                    $('.id_input_re_1').css("display", "none");
                    idckCheck = false;
                }	
            }// success 종료
        }); // ajax 종료	
    });// function 종료
    
     //닉네임 중복검사
    //$('.nickName_input').on("propertychange change keyup paste input", function(){
    //	/* console.log("keyup 테스트"); */
    //	
    //	var memberNickName = $('.nickName_input').val();	// .nickName_input에 입력되는 값
    //	var data = {memberNickName : memberNickName}				// '컨트롤에 넘길 데이터 이름' : '데이터(.nickName_input에 입력되는 값)'
    //	
    //	$.ajax({
    //		type : "post",
    //		url : "/member/memberNickNameCheck",
    //		data : data,
    //		success : function(result){
    //			// console.log("성공 여부" + result);
    //			if(result != 'fail'){
    //				$('.nickName_input_re_1').css("display","inline-block");
    //				$('.nickName_input_re_2').css("display", "none");	
    //				nickNameCheck = true;
    //			} else {
    //				$('.nickName_input_re_2').css("display","inline-block");
    //				$('.nickName_input_re_1').css("display", "none");
    //				nickNameCheck = false;
    //			}	
    //		}// success 종료
    //	}); // ajax 종료	
    //});// function 종료
    
    /* 다음 주소 연동 */
    function execution_daum_address(){
        
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                    addr += ' ';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address_input_1").val(data.zonecode);
                //$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
                $(".address_input_2").val(addr);
                //$("[name=memberAddr2]").val(addr);			// 대체가능
                // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
                $(".address_input_3").attr("readonly",false);
                $(".address_input_3").focus();
                
            }
        }).open();   
        
    }
    /* 비밀번호 확인 일치 유효성 검사 */
    $('.pwck_input').on("propertychange change keyup paste input", function(){
        
        var pw = $('.pw_input').val();
        var pwck = $('.pwck_input').val();
        $('.final_pwck_ck').css('display', 'none');
        
        if(pw == pwck){
            $('.pwck_input_re_1').css('display','block');
            $('.pwck_input_re_2').css('display','none');
            pwckcorCheck = true;
        }else{
            $('.pwck_input_re_1').css('display','none');
            $('.pwck_input_re_2').css('display','block');
            pwckcorCheck = false;
        }
        
        
    });
    </script>

</body>

</html>