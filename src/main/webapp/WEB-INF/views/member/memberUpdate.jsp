<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdate</title>

</head>
<body>
<div class="container-fluid">
		<div class="row">
			<h1>MemberUpdate Page</h1>
		</div>
		
		<div class="row">
			<form action="./memberUpdate" method="post" id=update_form>
				
				
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="memberName">
					</div>					
				</div>
				
				<div class="pw_wrap">
					<div class="pw_name">Password</div>
					<div class="pw_input_box">
						<input type="password" class="pw_input" name="memberPw">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				
				<div class="pwck_wrap">
					<div class="pwck_name">Re Password</div>
					<div class="pwck_input_box">
						<input type="password" class="pwck_input">
					</div>
					<span class="final_pwck_ck">비밀번호를 한번더 입력해주세요.</span>
					<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
					<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
			
				<div class="phone_wrap">
					<div class="user_phone">Tel</div>
					<div class="user_phone_input_box">
						<input class="user_phone_input" name="memberPhone">
					</div>					
				</div>
				
				<div class="mail_wrap">
					<div class="mail_name">Email</div> 
					<div class="mail_input_box">
						<input class="mail_input" name="memberEmail">
					</div>
					<span class="mail_input_box_warn"></span>
				</div>
				
				<div class="gender_wrap">
					<label for="memberGender" class="user_gender">성별</label><br>
					<input type="radio" name="memberGender" value="남성" class="gender_radio">남성
					<input type="radio" name="memberGender" value="여성" class="gender_radio">여성
				</div>
				
				<div class="SI_wrap">
					<div class="user_SI">Self-Introduction</div>
					<div class="user_SI_input_box">
						<input class="user_SI_input" name="memberSI">
					</div>
				</div>
				
				<div class="age_wrap">
					<div class="user_age">Age</div>
					<div class="user_age_input_box">
						<input class="user_age_input" name="memberAge">
					</div>
				</div>
				
				<div class="mb-3">
					<button class="update_btn" type="submit">Update</button> 
				</div>
				
			</form>		
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
 /* 유효성 검사 통과유무 변수 */
 var pwCheck = false;			// 비번
 var pwckCheck = false;			// 비번 확인
 var pwckcorCheck = false;		// 비번 확인 일치 확인
$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".update_btn").click(function(){
		
		/* 입력값 변수 */
		var pw = $('.pw_input').val();				// 비밀번호 입력란
		var pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란
		
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
		
		/* 최종 유효성 검사 */
		if(pwCheck&&pwckCheck&&pwckcorCheck){
			$("#update_form").attr("action", "/member/memberUpdate");
			$("#update_form").submit();			
		}		
		
		return false;
	});
});

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