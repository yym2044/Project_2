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
	margin-top: 10px;
	margin-bottom: 10px;
}

label {
	margin-bottom: 5px;
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
							<li class="breadcrumb-item"><a href="/infra/home" class="">Home</a></li>
							<li class="breadcrumb-item"><a href="/infra/login/loginForm">로그인</a></li>
							<li class="breadcrumb-item active fw-bold" aria-current="page">회원가입</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>

		<!-- 웹 -->
		<div class="row my-5 justify-content-center d-none d-md-block border py-5 bg-light">

			<div class="col-12 text-center">

				<img src="/infra/resources/images/xdmin/coupang2.png" alt="coupang_logo" class="p-0" style="width: 254px; height: 60px;">

				<!-- 
				<h1 style="color: lightslategray">
					MEMBER <span class="fw-bold">LOGIN</span>
				</h1>
				 -->
			</div>


			<form id="formRegForm2" method="post" action="/infra/member/insertMember">


				<div class="col-12 d-flex justify-content-center">

					<div class="row justify-content-center" style="width: 460px;">

						<div class="col-12 mt-4">
							<label for="ifmmId">아이디</label>
							<input name="ifmmId" id="ifmmId" type="text" class="form-control">

							<label for="ifmmPwd">비밀번호</label>
							<input name="ifmmPwd" id="ifmmPwd" type="password" class="form-control">
							<div class="valid-feedback" id="ifmmPwdValidFeedBack">사용가능한 비밀번호입니다.</div>
							<div class="invalid-feedback" id="ifmmPwdInvalidFeedBack">사용 불가능한 비밀번호입니다.</div>

							<label for="ifmmPwdConfirm">비밀번호 확인</label>
							<input name="ifmmPwdConfirm" id="ifmmPwdConfirm" type="password" class="form-control" disabled>
							<div class="valid-feedback" id="ifmmPwdConfirmValidFeedBack">비밀번호가 일치합니다.</div>
							<div class="invalid-feedback" id="ifmmPwdConfirmInvalidFeedBack">비밀번호가 일치하지 않습니다.</div>

							<label for="ifmmName">이름</label>
							<input name="ifmmName" id="ifmmName" type="text" class="form-control">

							<label for="ifmmDob">생년월일</label>
							<input name="ifmmDob" id="ifmmDob" type="date" class="form-control">


							<label for="ifmmGenderCd">성별</label>
							<select name="ifmmGenderCd" id="ifmmGenderCd" class="form-select">
								<option value="0">성별</option>
								<option value="3">남자</option>
								<option value="4">여자</option>
							</select>

							<label for="ifmeEmailFull">본인 확인 이메일(선택)</label>
							<input name="ifmeEmailFull" id="ifmeEmailFull" type="text" class="form-control" placeholder="선택입력">

							<label for="ifmpNumber">휴대전화</label>
							<!-- 
							<select name="nationCode" id="nationCode" class="form-select">
								<option>대한민국 +82</option>
							</select>
							 -->
							<div class="input-group">
								<input name="ifmpNumber" id="ifmpNumber" type="text" class="form-control" placeholder="전화번호 입력">
								<input type="button" class="btn btm-sm btn-outline-dark" value="인증번호 받기">
							</div>
							<input name="" id="" type="text" class="form-control" placeholder="인증번호를 입력하세요">


							<input type="button" id="btnSubmit" class="btn btn-outline-dark d-block w-100" value="가입하기">

						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="${path}/resources/common/js/validation.js"></script>

<script type="text/javascript">
	$("#btnSubmit").on("click",function() {
		
		
		if (!checkId($("#ifmmId"), $("#ifmmId").val(),"아이디가 유효하지 않습니다. 다시 입력해주세요.")) {
			return false;
		}
		
		if (!checkPassword($("#ifmmPwd"), $("#ifmmPwd").val(),"비밀번호가 유효하지 않습니다.")) {
			return false;
		}
		
		if ($("#ifmmPwd").val() != $("#ifmmPwdConfirm").val()) {
			alert("비밀번호를 다르게 입력하였습니다.");
			$("#ifmmPwdConfirm").focus();
			return false;
		}
		
		if(!checkNoSelect($("#ifmmGenderCd"), $("#ifmmGenderCd").val(), "성별을 선택해주세요.")){
			return false;
		}
		
		$("#formRegForm2").submit();
		
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#ifmmPwdValidFeedBack").hide();
		$("#ifmmPwdInvalidFeedBack").hide();

		$("#ifmmPwdConfirmValidFeedBack").hide();
		$("#ifmmPwdConfirmInvalidFeedBack").hide();
		$("input").keyup(function() {
			var pwd1 = $("#ifmmPwd").val();
			var pwd2 = $("#ifmmPwdConfirm").val();
			var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{8,20}$/;
	
			if (regExp.test(pwd1)) {
				$("#ifmmPwd").addClass("is-valid");
				$("#ifmmPwd").removeClass("is-invalid");
				$("#ifmmPwdValidFeedBack").show();
				$("#ifmmPwdInvalidFeedBack").hide();
				$("#ifmmPwdConfirm").removeAttr("disabled");
			} else if (!regExp.test(pwd1) && pwd1.length > 1) {
				$("#ifmmPwd").addClass("is-invalid");
				$("#ifmmPwd").removeClass("is-valid");
				$("#ifmmPwdValidFeedBack").hide();
				$("#ifmmPwdInvalidFeedBack").show();
				$("#ifmmPwdConfirm").attr("disabled",
						"disabled");
			}
	
			if (pwd1 != "" && pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#ifmmPwdConfirm").addClass("is-valid");
					$("#ifmmPwdConfirm").removeClass(
							"is-invalid");
					$("#ifmmPwdConfirmValidFeedBack").show();
					$("#ifmmPwdConfirmInvalidFeedBack").hide();
					$("#btnSubmit").removeAttr("disabled");
				} else {
					$("#ifmmPwdConfirm").addClass("is-invalid");
					$("#ifmmPwdConfirm")
							.removeClass("is-valid");
					$("#ifmmPwdConfirmValidFeedBack").hide();
					$("#ifmmPwdConfirmInvalidFeedBack").show();
					$("#btnSubmit")
							.attr("disabled", "disabled");
				}
			}
		});
	});
</script>


</body>
</html>