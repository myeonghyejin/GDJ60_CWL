const id = document.getElementById("id");
const idResult = document.getElementById("idResult");

const pw = document.getElementById("pw");
const pwResult = document.getElementById("pwResult");

const pwCheck = document.getElementById("pwCheck");
const pwCheckResult = document.getElementById("pwCheckResult");

const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

const name = document.getElementById("name");
const nameResult = document.getElementById("nameResult");

const phone = document.getElementById("phone");
const phoneResult = document.getElementById("phoneResult");

const email = document.getElementById("email");
const emailResult = document.getElementById("emailResult");

const address = document.getElementById("address");
const addressResult = document.getElementById("addressResult");

// let idCheck = false;
// let pwLengthCheck = false;
// let pwNullCheck = false;
// let pwEqualCheck = false;
let checks = [false, false, false, false, false, false, false, false];

// ID 검증
id.addEventListener("blur", function() {
    // 중복검사
    let xhttp = new XMLHttpRequest();

    // url, method
    xhttp.open("POST", "./memberIdCheck");

    // header
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    // 요청 발생 POST일 경우 parameter 전송
    xhttp.send("id="+id.value);

    // 응답 처리
    xhttp.addEventListener("readystatechange", function(){
        if(this.readyState==4 && this.status==200) {
            if(this.responseText.trim()=='true') {
                checks[0]=true;
                idResult.innerHTML="사용이 가능한 아이디입니다.";                
                idResult.classList.add('blueResult');
                idResult.classList.remove("redResult");
            } else {
                checks[0] = false;
                idResult.innerHTML="중복된 아이디입니다.";
                idResult.classList.add('redResult');
                idResult.classList.remove("blueResult");
            }
        }
        // if(this.readyState==4 && this.status!=200) {

        // }
    });
});

// PW 검증
pw.addEventListener("keyup", function() {
    if(pw.value.length>5 && pw.value.length<13) {
        pwResult.innerHTML='정상적인 비밀번호입니다.'
        // pwLengthCheck = true;
        checks[1]=true;
        pwResult.classList.add('blueResult');
        pwResult.classList.remove("greenResult");
        pwResult.classList.remove("redResult");
    } else {
        pwResult.innerHTML='비밀번호는 6글자 이상 12글자 이하여야 합니다.'
        checks[1] = false;
        pwResult.classList.add('greenResult')
    }
});

pw.addEventListener("blur", function() {
    if(pw.value.length != '') {
        // pwNullCheck = true;
        checks[2] = true;
    } else {
        pwResult.innerHTML='비밀번호는 필수 입력입니다.'
        checks[2] = false;
        pwResult.classList.add('redResult');
        pwResult.classList.remove('blueResult');
        pwResult.classList.remove('greenResult');
    }
});

pw.addEventListener("change", function(){
    checks[3] = false;
    pwCheck.value='';
    pwCheckResult.innerHTML='비밀번호가 일치하지 않습니다.';
    pwCheckResult.classList.add("redResult");
    pwCheckResult.classList.remove("blueResult");

    
});

// PW Equal 검증
pwCheck.addEventListener("blur", function() {
    if(pwCheck.value == pw.value) {
        pwCheckResult.innerHTML="비밀번호가 일치합니다."
        // pwEqualCheck = true;
        checks[3] = true;
        pwCheckResult.classList.add("blueResult");
        pwCheckResult.classList.remove("redResult");
    } else {
        pwCheckResult.innerHTML="비밀번호가 일치하지 않습니다."
        checks[3] = false;
        pwCheckResult.classList.add("redResult");
        pwCheckResult.classList.remove("blueResult");
    }
});


// 이름 검증
name.addEventListener("blur", function() {
    if(name.value.length != 0) {
        nameResult.innerHTML='';
        checks[4] = true;        
    } else {
        nameResult.innerHTML="이름은 필수 입력입니다."
        checks[4] = false;
        nameResult.classList.add("redResult");
    }
});

// 번호 검증
phone.addEventListener("blur", function() {
    if(phone.value.length != 0) {
        phoneResult.innerHTML='';
        checks[5] = true;
    } else {
        phoneResult.innerHTML="번호는 필수 입력입니다."
        checks[5] = false;
        phoneResult.classList.add("redResult");
    }
});

// 이메일 검증
email.addEventListener("blur", function() {
    if(email.value.length != 0) {
        emailResult.innerHTML='';
        checks[6] = true;
    } else {
        emailResult.innerHTML="이메일은 필수 입력입니다."
        checks[6] = false;
        emailResult.classList.add("redResult");
    }
});

// 주소 검증
address.addEventListener("blur", function() {
    if(address.value.length != 0) {
        addressResult.innerHTML='';
        checks[7] = true;
    } else {
        addressResult.innerHTML="주소는 필수 입력입니다."
        checks[7] = false;
        addressResult.classList.add("redResult");
    }
});

// form 전송
btn.addEventListener("click", function() {
    // if(idCheck && pwLengthCheck && pwNullCheck && pwEqualCheck) {
    if(!checks.includes(false)) {
        alert('회원가입 성공');
        frm.submit();
    } else {
        alert("필수 사항을 입력해주세요.");
    }
});