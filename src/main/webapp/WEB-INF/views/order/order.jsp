<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ORDER</title>
	<c:import url="../template/common_css.jsp"></c:import>
	<link rel="stylesheet" href="/resources/css/common/style.css">
	<link rel="stylesheet" href="/resources/css/order/order.css">
	
	<!-- 다음 주소 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- page-title -->
	<section class="page-title bg-cover" data-background="/resources/images/banner/page-title.jpg">
		<div class="container">
		   <div class="row">
			  <div class="col-12 text-center">
				 <h1 class="display-1 text-white font-weight-bold font-primary">Order</h1>
			  </div>
		   </div>
		</div>
	</section>
</head>
<body>
	<c:import url="../template/newheader.jsp"></c:import>
<div class="wrapper">
	<div class="wrap">
		<div class="content_area5">
			<div class="content_main my-5">
				<!-- 회원정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td width="*">${memberInfo.memberName} | ${memberInfo.memberEmail}</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="showAddress('1')" style="background-color: #FF008C;">사용자 정보 주소록</button>
						<button class="address_btn address_btn_2" onclick="showAddress('2')">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="17%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${memberInfo.memberName}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${memberInfo.memberAddress1} ${memberInfo.memberAddress2}<br>${memberInfo.memberAddress3}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input" value="${memberInfo.memberName}" type="hidden" id="memberName">
											<input class="address1_input" type="hidden" value="${memberInfo.memberAddress1}" id="memberAddress1">
											<input class="address2_input" type="hidden" value="${memberInfo.memberAddress2}" id="memberAddress2">
											<input class="address3_input" type="hidden" value="${memberInfo.memberAddress3}" id="memberAddress3">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2">
							<table>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input class="form-control addressee_input">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input class="selectAddress" value="F" type="hidden">
											<a class="address_search_btn btn btn-primary btn-sm" onclick="execution_daum_address()">주소 찾기</a><br>
											<input class="form-control address1_input my-1" readonly="readonly">
											<input class="form-control address2_input my-1" readonly="readonly">
											<input class="form-control address3_input my-1" readonly="readonly">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 상품 정보 -->
				<div class="orderGoods_div my-5">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_stock"></span>개						
					</div>
					<!-- 상품 테이블 -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">							
						</colgroup>
						<tbody>
							<tr>
								<th>이미지</th>
								<th>상품 정보</th>
								<th>판매가</th>
							</tr>
						</tbody>
					</table>
					<table class="goods_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>
						<tbody>
							<c:forEach items="${orderList}" var="ol">
								<tr>
									<td>
										<div class="image_wrap" data-productNum="${ol.imageList[0].productNum}" data-path="${ol.imageList[0].uploadPath}" data-uuid="${ol.imageList[0].uuid}" data-fileName="${ol.imageList[0].fileName}">
											<img alt="" src="">
										</div>
									</td>
									<td class="goods_table_product_td">
										<input type="submit" class="individual_productName_input" id="productName" value="${ol.productName}"> 
									</td>
									<td class="goods_table_price_td">
										<fmt:formatNumber value="${ol.productPrice}" pattern="###,###,###,###원" /> | ${ol.orderStock}개
										<br><fmt:formatNumber value="${ol.totalPrice}" pattern="###,###,###,###원" />
										<input type="hidden" class="individual_productPrice_input" value="${ol.productPrice}">
										<input type="hidden" class="individual_orderStock_input" value="${ol.orderStock}">
										<input type="hidden" class="individual_totalPrice_input" id="totalPrice" value="${ol.productPrice * ol.orderStock}">
										<input type="hidden" class="individual_productNum_input" value="${ol.productNum}">
									</td>
								</tr>							
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 주문 종합 정보 -->
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
					<div class="total_info_price_div">
						<ul>
							<li>
								<span class="price_span_label">상품 금액</span>
								<span class="totalPrice_span">0</span>원
							</li>
							<li>
								<span class="price_span_label">배송비</span>
								<span class="orderFee_price_span">0</span>원
							</li>
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">0</span>원
								</strong>																
							</li>
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<div class="total_info_btn_div">
						<a class="order_btn">결제하기</a>
					</div>						
				</div>
			</div>
			<!-- 주문 요청 form -->
			<form class="order_form" action="/order" method="POST">
				<!-- 주문자 회원번호 -->
				<input name="memberId" value="${memberInfo.memberId}" type="hidden">
				<!-- 주소록 & 받는이-->
				<input name="addressee" type="hidden">

				<input name="memberAddress1" type="hidden" id="memberAddress1" value="${member.memberAddress1}">
				<input name="memberAddress2" type="hidden" id="memberAddress2" value="${member.memberAddress2}">
				<input name="memberAddress3" type="hidden" id="memberAddress3" value="${member.memberAddress3}">
				<!-- 상품 정보 -->
			</form>
		</div>
	</div>
</div>


	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
<!-- iamport.payment.js -->
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

let finalTotalPrice = 0;

$(document).ready(function() {
	
	/* 주문 종합정보란 최신화 */
	setTotalInfo();
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
		
		if(bobj.data("productNum")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("fileName");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/images/iu2.jpg');
		}
		
	});
	
	
});


function showAddress(className) {
	
	$(".addressInfo_input_div").css('display', 'none');
	
	$(".addressInfo_input_div_" + className).css('display', 'block');
	
	$(".address_btn").css('backgroundColor', '#07085d');
	
	$(".address_btn_" + className).css('backgroundColor', '#FF008C');
	
	$(".addressInfo_input_div").each(function(i, obj) {
		$(obj).find(".selectAddress").val("F");
	});
	
	$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");
}

/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
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
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}

/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
function setTotalInfo() {
	let totalPrice = 0;
	let totalStock = 0;
	let totalKind = 0;
	let orderFeePrice = 0;
	
	
	
	$(".goods_table_price_td").each(function(index, element) {
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalStock += parseInt($(element).find(".individual_orderStock_input").val());
		// 총 종류
		totalKind += 1;		
	});
	
	/* 배송비 결정 */
	if(totalPrice >= 30000) {
		orderFeePrice = 0;
	} else if(totalPrice == 0) {
		orderFeePrice = 0;
	} else {
		orderFeePrice = 3000;
	}
	
	finalTotalPrice = totalPrice + orderFeePrice;
	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".goods_kind_div_stock").text(totalStock);
	// 총 종류
	$(".goods_kind_div_kind").text(totalKind);
	// 배송비
	$(".orderFee_price_span").text(orderFeePrice.toLocaleString());
	// 최종 가격(총 가격 + 배송비) 
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	
}

/* 주문 요청 */
$(".order_btn").click(()=>{
	let payment = iamport()
	
	function iamport() {
		IMP.init('imp86115306');
		
		IMP.request_pay({
		    pg : 'kicc',
		    pay_method : 'card',
		    merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
		    name : $('#productName').val(),
		    amount : finalTotalPrice,
		    buyer_name : $('#memberName').val(),
		    buyer_tel : $('#memberPhone').val(),
		    buyer_email : $('#memberEmail').val(),		    
		    buyer_address : $('#memberAddress1').val() + $('#memberAddress2').val() + $('#memberAddress3').val()
		    
		}, function(rsp) {
		    console.log(rsp);
			if ( rsp.success ) {
	   			let msg = '결제가 완료되었습니다.';
	   			msg += '고유ID : ' + rsp.imp_uid;
	   			msg += '상점 거래ID : ' + rsp.merchant_uid;
	   			msg += '결제 금액 : ' + rsp.paid_amount;
	   			msg += '카드 승인번호 : ' + rsp.apply_num;
	   			console.log('결제 성공')
	   			alert(msg);
	   			$('#paymentForm').submit()
	   		} else {
	   			let msg = '결제에 실패하였습니다.';
	   	        msg += '에러내용 : ' + rsp.error_msg;
	   	        console.log('결제 실패')
	   	        alert(msg);
	   		}
		});
	}
	
	
	/* 주소 정보 & 받는이*/
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() === 'T'){
			$("input[name='addressee']").val($(obj).find(".addressee_input").val());
			$("input[name='memberAddress1']").val($(obj).find(".address1_input").val());
			$("input[name='memberAddress2']").val($(obj).find(".address2_input").val());
			$("input[name='memberAddress3']").val($(obj).find(".address3_input").val());
		}
	});
	
	/* 상품정보 */
	let form_contents = ''; 
	$(".goods_table_price_td").each(function(index, element){
		let productNum = $(element).find(".individual_productNum_input").val();
		let orderStock = $(element).find(".individual_orderStock_input").val();
		//let productNum_input = "<input name='productNum' type='hidden' value='" + productNum + "'>";
		let productNum_input = "<input name='orders[" + index + "].productNum' type='hidden' value='" + productNum + "'>";
		form_contents += productNum_input;
		//let productStock_input = "<input name='productStock' type='hidden' value='" + productStock + "'>";
		let orderStock_input = "<input name='orders[" + index + "].orderStock' type='hidden' value='" + orderStock + "'>";
		form_contents += orderStock_input;
	});	
	$(".order_form").append(form_contents);
	
	/* 서버 전송 */
	/* $(".order_form").submit(); */
	
	
});
</script>
</body>
</html>