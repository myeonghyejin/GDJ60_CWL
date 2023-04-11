<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Password modify</title>
</head>
<body>
	<!-- 전체화면 -->
	<div class="container-fluid" style="background-color: #fafafa;">
	
		<!-- contentBox -->
		<div class="contentBox">
		
			<div class="accountBox">				
				<article class="accountArticle">					
					<form class="editForm" method="post" action="<c:url value='/member/pw-change' />">
						<div class="eachEdit">
							<aside class="eachEditText">현재 비밀번호</aside>
							<div class="eachEditForm">
								<input id="oldPw" class="eachEditInput" type="password">
								<span class="error_next_box" id="pwMsg" style="margin-top: 15px;"></span>
							</div>
						</div>
						<div class="eachEdit">
							<aside class="eachEditText">새 비밀번호</aside>
							<div class="eachEditForm">
								<input id="newPw" class="eachEditInput" type="password">
							</div>
						</div>
						<div class="eachEdit">
							<aside class="eachEditText">새 비밀번호 확인</aside>
							<div class="eachEditForm">
								<input id="newPwCheck" class="eachEditInput" type="password">
								<span class="error_next_box" id="newPwMsg" style="margin-top: 15px;"></span>
							</div>
						</div>
						
						<input type="hidden" id="memberId" value="${member.memberId}">
						<input type="hidden" id="memberEmail" value="${member.memberEmail}">
						<input type="hidden" id="memberName" value="${member.memberName}">						
						
						<div class="eachEdit" style="margin-top: 25px;">
							<aside class="eachEditText"></aside>
							<div class="eachEditForm">
								<c:if test="${empty login.social}">
									<button class="emailChkBtn" type="button">비밀번호 변경</button>
								</c:if>
								<c:if test="${not empty login.social}">
									<p>소셜 로그인 이용자는 비밀번호를 변경할 수 없습니다.</p>
								</c:if>

							</div>
						</div>						
					</form>
				</article>
			</div>		
		</div>		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		
		$(function() {
			const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
			let chk1 = false, chk2 = false, chk3 = false;
			
			
			//현재 비밀번호
			$('#oldPw').on('keyup', function() {
				//비밀번호 공백 확인
				if($("#oldPw").val() === ""){
					$('#pwMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
					chk1 = false;
					
				} else {
					
					const memberPw = $('#oldPw').val();
					
					$.ajax({
						type: "POST",
						url: "/member/checkPw",
						headers: {
							"Content-Type": "application/json",
			                "X-HTTP-Method-Override": "POST"
						},
						data: memberPw,
						datatype: "json",
						success: function(result) {
							
							console.log(result);
							
							if(result === "pwConfirmOK") {
								$('#pwMsg').html('');
								chk1 = true;
							} else {
								$('#pwMsg').html('');
								chk1 = false;
							}
							
							
						},
						error : function(error) {
			                
			                console.log("error : " + error);
			            }
					});
					
				}
				
			}); //end of old password
			
			
			//새로운 비번
			$('#newPw').on('keyup', function() {
				//비밀번호 공백 확인
				if($("#newPw").val() === ""){
					$('#newPwMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
					chk2 = false;
				}		         
				//비밀번호 유효성검사
				else if(!getPwCheck.test($("#newPw").val()) || $("#newPw").val().length < 8){
					$('#newPwMsg').html('<b>특수문자 포함 8자 이상 입력하세요</b>');
					chk2 = false;
				} else {
					$('#newPwMsg').html('');
					chk2 = true;
				}
				
			}); //end of new password
			
			
			//비밀번호 확인
			$('#newPwCheck').on('keyup', function() {
				
				if($("#newPwCheck").val() === "") {
					$('#newPwMsg').html('<b">비밀번호 확인은 필수 정보입니다.</b>');
					chk3 = false;
				} else if( $("#newPw").val() != $("#newPwCheck").val() ) {
					$('#newPwMsg').html('<b>비밀번호가 일치하지 않습니다.</b>');
					chk3 = false;
				} else {
					$('#newPwMsg').html('');
					chk3 = true;
				}
				
			});//end of passwordCheck
			
			
			//비밀번호 변경 요청처리하기
			$('.emailChkBtn').click(function(e) {
				
				if(chk1 == false) {
					alert('현재 비밀번호가 틀렸습니다.');	
				
				} else if(chk2 == false){
					alert('2번 틀림');
				} else if(chk3 == false){
					alert('3번 틀림');
					
				} else if(chk1 && chk2 && chk3) {
					
					const memberId = $('#memberId').val();
					const memberPw = $("#memberPw").val();
					const memberEmail = $("#memberEmail").val();					
					const memberName = $('#memberName').val();
					const member = {
						memberId: memberId,
			            memberPw: memberPw,
			            memberEmail: memberEmail,
			            memberName: memberName
					};
					console.log(member);
					
					$.ajax({
						type: "POST",
						url: "/member/pw-change",
			            headers: {
			                "Content-Type": "application/json",
			                "X-HTTP-Method-Override": "POST"
			            },
			            dataType: "text",
			            data: JSON.stringify(member),
			            success: function(result) {
			            	
			            	console.log("result: " + result);
			            	if(result === "changeSuccess") {
			            		alert('비밀번호가 변경되었습니다.');
			            		location.href ="/member/pw-change";
			            	} else {
			            		alert('현재 비밀번호가 틀렸습니다.');
			            	}
			            }
					});
					
				} else {
					alert('입력정보를 다시 확인하세요.');	
				}
			});
			
		});//end of function
		
	</script>
	
</body>
</html>