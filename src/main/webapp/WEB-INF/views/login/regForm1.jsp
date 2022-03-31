<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- codepen -->
<link rel="stylesheet" href="${path}/resources/common/css/style.css">
<link rel="stylesheet" href="${path}/resources/common/css/codepen.css">

<script src="${path}/resources/common/js/codepen.js"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style type="text/css">
select, input {
	margin-bottom: 20px;
}

label {
	margin-bottom: 5px;
}

textarea {
	height: 88px;
	resize: none;
}
</style>

</head>


<body>


</body>


<div class="container-fluid">

	<div class="text-dark bi bi-arrow-left d-md-none fs-1 p-3"></div>

	<div class="width80">
		<div class="d-none d-md-block">

			<div class="row d-flex align-items-end border-bottom border-4 py-3">
				<div class="col-12 col-md-6">
					<h1 class="fw-bold">회원가입</h1>
				</div>
				<div class="col col-md d-flex justify-content-end">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">Home</li>
							<li class="breadcrumb-item">로그인</li>
							<li class="breadcrumb-item active fw-bold" aria-current="page">회원가입</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>

		<!-- 웹 -->
		<div class="row my-5 justify-content-center d-none d-md-block border py-5 bg-light">

			<div class="col-12 text-center">

				<a href="/infra/home"><img src="/infra/resources/images/xdmin/coupang2.png" alt="coupang_logo" class="p-0" style="width: 254px; height: 60px;"></a>

				<!-- 
				<h1 style="color: lightslategray">
					MEMBER <span class="fw-bold">LOGIN</span>
				</h1>
				 -->
			</div>


			<form method="" action="">


				<div class="col-12 d-flex justify-content-center">

					<div class="row justify-content-center" style="width: 460px;">

						<div class="col-12 mt-4 border container1 box-white p-4">
							<div class="row px-2">
								<div class="form-check">
									<input id="selectConsentAll" name="" onclick="selectAll(this)" type="checkbox" class="form-check-input rounded-circle">
									<label class="form-check-label" for="selectConsentAll">쿠팡 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.</label>
								</div>
							</div>

							<div class="row px-2">
								<div class="form-check col">
									<input id="consentRequired1" name="chk" type="checkbox" class="form-check-input rounded-circle require">
									<label class="form-check-label" for="consentRequired1">쿠팡 이용약관 동의<span class="text-danger">(필수)</span></label>
								</div>
								<div class="col-1">></div>
							</div>

							<div class="row px-2">
								<div class="form-check col">
									<input id="consentRequired2" name="chk" type="checkbox" class="form-check-input rounded-circle require">
									<label class="form-check-label" for="consentRequired2">전자금융거래 이용약관 동의<span class="text-danger">(필수)</span></label>
								</div>
								<div class="col-1">></div>
							</div>
							<div class="row px-2">
								<div class="form-check col">
									<input id="consentRequired3" name="chk" type="checkbox" class="form-check-input rounded-circle require">
									<label class="form-check-label" for="consentRequired3">개인정보 수집 및 이용 동의<span class="text-danger">(필수)</span></label>
								</div>
								<div class="col-1">></div>
							</div>
							<div class="row px-2">
								<div class="form-check col">
									<input id="consentRequired4" name="chk" type="checkbox" class="form-check-input rounded-circle require">
									<label class="form-check-label" for="consentRequired4">개인정보 제3자 제공 동의<span class="text-danger">(필수)</span></label>
								</div>
								<div class="col-1">></div>
							</div>
							<div class="row px-2">
								<div class="form-check col">
									<input id="consentAd" name="chk" type="checkbox" class="form-check-input rounded-circle">
									<label class="form-check-label" for="consentAd">광고성 목적의 개인정보 수집 및 이용 동의<span class="text-secondary">(선택)</span></label>
								</div>
								<div class="col-1">></div>
							</div>

							<div class="form-check">
								<input id="consentAdAll" name="chk" type="checkbox" class="form-check-input rounded-circle">
								<label class="form-check-label" for="consentAdAll">광고성 정보 수신 동의<span class="text-secondary">(선택)</span></label>
							</div>

							<div class="ps-4">
								<div class="form-check">
									<input id="consentEmail" name="chk" type="checkbox" class="form-check-input rounded-circle child">
									<label class="form-check-label" for="consentEmail">이메일 수신 동의<span class="text-secondary">(선택)</span></label>
								</div>
								<div class="form-check">
									<input id="consentSms" name="chk" type="checkbox" class="form-check-input rounded-circle child">
									<label class="form-check-label" for="consentSms">SMS, MMS 수신 동의<span class="text-secondary">(선택)</span></label>
								</div>
								<div class="form-check">
									<input id="consentPush" name="chk" type="checkbox" class="form-check-input rounded-circle child">
									<label class="form-check-label" for="consentPush">앱 푸시 수신 동의<span class="text-secondary">(선택)</span></label>
								</div>
							</div>



						</div>
						<div class="row p-0">
							<div class="col d-flex justify-content-center p-0">
								<button class="btn btn-lg btn-secondary" style="width: 50%;">취소</button>
								<a href="/infra/login/regForm2" id="btnCon" class="btn btn-lg btn-danger" style="width: 50%;">확인</a>
							</div>
						</div>


					</div>
				</div>
			</form>

		</div>
	</div>



</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${path}/resources/common/js/validation.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#selectConsentAll").click(function() {
		if($("#selectConsentAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#selectConsentAll").prop("checked", false);
		else $("#selectConsentAll").prop("checked", true); 
	});
	
	$("#consentAd").click(function(){
		if($("#consentAd").is(":checked")){
			$("#consentAdAll").prop("checked", true);
			$("input.child").prop("checked", true);
		} else {
			$("#consentAdAll").prop("checked", false);
			$("input.child").prop("checked", false);
		}
	});
	
	$("#consentAdAll").click(function(){
		if($("#consentAdAll").is(":checked")){
			$("#consentAd").prop("checked", true);
			$("input.child").prop("checked", true);
		} else {
			$("input.child").prop("checked", false);
		}
	});
	
	$("input.child").click(function(){
		$("#consentAdAll").prop("checked", true);
		if(!$("#consentEmail").is(":checked") && !$("#consentSms").is(":checked") && !$("#consentPush").is(":checked")){
			$("#consentAdAll").prop("checked", false);
		}
	});
	
	$("#btnCon").click(function(){
		
		if(!$("#consentRequired1").is(":checked")){
			alert("필수항목을 체크해주십시오");
			$("#consentRequired1").focus();
			return false;
		}
		if(!$("#consentRequired2").is(":checked")){
			alert("필수항목을 체크해주십시오");
			$("#consentRequired2").focus();
			return false;
		}
		if(!$("#consentRequired3").is(":checked")){
			alert("필수항목을 체크해주십시오");
			$("#consentRequired3").focus();
			return false;
		}
		if(!$("#consentRequired4").is(":checked")){
			alert("필수항목을 체크해주십시오");
			$("#consentRequired4").focus();
			return false;
		}
		
	});
	
});

</script>

</body>
</html>