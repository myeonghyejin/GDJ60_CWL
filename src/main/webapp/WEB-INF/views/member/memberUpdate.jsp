<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
	<link rel="stylesheet" href="/resources/css/member/member.css">
	
	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="display-1 text-white font-weight-bold font-primary">My Page</h1>
				</div>
			</div>
		</div>
	</section>
</head>
<body>
	<c:import url="../template/newheader.jsp"></c:import>
<div class="wrapper">
	<form action="./memberUpdate" method="post" id="update_form">
	<div class="wrap">
		<div class="mt-5 mb-3 row">
			<label for="memberId" class="col-sm-2 col-form-label"><b>ID</b></label>
			<div class="col-sm-10">
				<input type="text" class="form-control id_input" id="memberId" name="memberId" value="${dto.memberId}" readonly>
			</div>
		</div>
			
		<div class="mb-3 row">
			<label for="memberPw" class="col-sm-2 col-form-label"><b>비밀번호</b></label>
			<div class="col-sm-10">
				<input type="password" class="pw_input form-control" id="memberPw" name="memberPw">				
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="memberPw" class="col-sm-2 col-form-label"><b>비밀번호 확인</b></label>
			<div class="col-sm-10">
				<input type="password" class="pwck_input form-control" id="memberPw">		
				<span class="pwck_input_re_1 mx-2 mt-2">비밀번호가 일치합니다.</span>
				<span class="pwck_input_re_2 mx-2 mt-2">비밀번호가 일치하지 않습니다.</span>
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="memberName" class="col-sm-2 col-form-label"><b>이름</b></label>
			<div class="col-sm-10">
				<input type="text" class="form-control user_input" id="memberName" name="memberName" value="${dto.memberName}" readonly>
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="memberGender" class="col-sm-2 col-form-label"><b>성별</b></label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="memberGender" name="memberGender" value="${dto.memberGender}" readonly>
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="memberAge" class="col-sm-2 col-form-label"><b>나이</b></label>
			<div class="col-sm-10">
				<input type="number" class="form-control" id="memberAge" name="memberAge" value="${dto.memberAge}">
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="memberPhone" class="col-sm-2 col-form-label"><b>전화 번호</b></label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="memberPhone" name="memberPhone" value="${dto.memberPhone}">				
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="memberEmail" class="col-sm-2 col-form-label"><b>이메일</b></label>
			<div class="col-sm-10">
				<input type="text" class="form-control mail_input" id="memberEmail" name="memberEmail" value="${dto.memberEmail}">				
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="memberAddress1" class="col-sm-2 col-form-label"><b>주소</b></label>
			<div class="col-sm-8">
				<input class="form-control address_input_1" name="memberAddress1" value="${dto.memberAddress1}" readonly="readonly">
			</div>
			<div class="address_button col-auto row" onclick="execution_daum_address()">
				<span class="btn btn-primary">주소 찾기</span>
			</div>
		</div>
		<div class="mb-3 row justify-content-end">
			<div class="col-sm-10">
				<input class="form-control address_input_2" name="memberAddress2" value="${dto.memberAddress2}" readonly="readonly">
			</div>
		</div>
		<div class="mb-3 row justify-content-end">
			<div class="col-sm-10">
				<input class="form-control address_input_3" name="memberAddress3" value="${dto.memberAddress3}" readonly="readonly">				
			</div>
		</div>
		
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label"><b>자기소개</b></label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="memberSI">${dto.memberSI}</textarea>
		</div>
		
		<div class="join_button_wrap row justify-content-center my-5">
			<button class="update_btn" type="submit">Update</button>
		</div>
	</div>
	</form>
</div>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>	
<script>
 /* 유효성 검사 통과유무 변수 */
 var pwCheck = false;			// 비번
 var pwckCheck = false;			// 비번 확인
 var pwckcorCheck = false;		// 비번 확인 일치 확인
 var addressCheck = false 		// 주소
$(document).ready(function(){
	//업데이트 버튼(업데이트 기능 작동)
	$(".update_button").click(function(){
		
		/* 입력값 변수 */		
		var pw = $('.pw_input').val();				// 비밀번호 입력란
		var pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란		
		var mail = $('.mail_input').val();			// 이메일 입력란
		var addr = $('.address_input_3').val();		// 주소 입력란				
		
		/* 최종 유효성 검사 */
		if(pwCheck&&pwckCheck&&pwckcorCheck&&addressCheck){
			$("#update_form").attr("action", "/member/memberUpdate");
			$("#update_form").submit();			
		}		
		
		return false;
	});
});

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