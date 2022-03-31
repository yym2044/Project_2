<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.yym.infra.modules.code.CodeServiceImpl" scope="page"/>	<!-- 코드서비스임플 클래스 바로 사용 -->

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- codepen -->
<link rel="stylesheet" href="${path}/resources/css/style.css">
<link rel="stylesheet" href="${path}/resources/css/codepen.css">

<script src="${path}/resources/js/codepen.js"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>


<body>


</body>


<div class="container-fluid">

	<div class="text-dark bi bi-arrow-left d-md-none fs-1 p-3"></div>

	<div class="width80">
		<div class="d-none d-md-block">

			<div class="row d-flex align-items-end border-bottom border-4 py-3">
				<div class="col-12 col-md-6">
					<h1 class="fw-bold">회원 로그인</h1>
				</div>
				<div class="col col-md d-flex justify-content-end">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">Home</li>
							<li class="breadcrumb-item">로그인</li>
							<li class="breadcrumb-item active fw-bold" aria-current="page">로그인</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>

		<!-- 웹 -->
		<div class="row my-5 justify-content-center d-none d-md-block border py-5 bg-light">

			<div class="col-12 text-center">

				<img src="${path}/resources/images/xdmin/coupang2.png" alt="coupang_logo" class="p-0" style="width: 195px; height: 46px;">

				<!-- 
				<h1 style="color: lightslategray">
					MEMBER <span class="fw-bold">LOGIN</span>
				</h1>
				 -->
			</div>



			<div class="col-12 d-flex justify-content-center">

				<div class="row justify-content-center" style="width: 600px;">

					<div class="col-8 mt-4">

						<div class="input-group input-group-lg mb-3">
							<!-- <span class="input-group-text bg-light" id="userIcon"> <label for="Username"> <i
										class="bi bi-person-circle text-secondary"></i>
								</label>
								</span> -->
							<input type="text" class="form-control" onkeyup="enterkey();" id="ifmmId" name="ifmmId" placeholder="아이디" autocomplete="on" aria-label="Username"
								aria-describedby="userIcon">
						</div>

						<div class="input-group input-group-lg">
							<!-- <span class="input-group-text bg-light" id="passwordIcon"> <label for="Password"> <i
										class="bi bi-file-lock2-fill text-secondary"></i>
								</label>
								</span> -->
							<input type="password" class="form-control" onkeyup="enterkey();" id="ifmmPwd" name="ifmmPwd" placeholder="비밀번호" aria-label="Password"
								aria-describedby="passwordIcon">
						</div>

					</div>
					<div class="col-4 mt-4">
						<button id="btnLogin" name="btnLogin" class="btn btn-outline-dark container3" style="width: 100%; height: 100%; border-radius: 10px;">
							<span class="fw-bold">로그인</span>
						</button>
					</div>

				</div>
			</div>

			<div class="col-12 d-flex justify-content-center mb-4">
				<div class="row d-flex justify-content-start mt-3" style="width: 600px;">
					<div class="col-3 col-md-3 form-check ms-3">
						<input type="checkbox" class="form-check-input" id="autoLogin" name="checkbox1" onclick="selectAll1(this)">
						<label for="autoLogin" class="form-check-label"> <span class="fw-light"> 자동 로그인 </span>
						</label>
					</div>
					<div class="col-3 col-md-3 form-check ms-3">
						<input type="checkbox" class="form-check-input" id="saveId" name="checkbox1"> <label for="saveId"
							class="form-check-label"><span class="fw-light">아이디 저장</span></label>
					</div>
				</div>
			</div>





			<div class="col-md-12 text-center my-4 fw-bold">
				<button class="btn btn-sm p-2 container3" data-bs-toggle="collapse" data-bs-target="#socialLogin">다른 계정으로
					로그인</button>
			</div>

			<div class="col-md-12 collapse show" id="socialLogin">
				<div class="row justify-content-center">
					<div class="col-md-1 text-center">
						<img src="${path}/resources/images/xdmin/sns_icon/icon_round_facebook_48.png" style="border-radius: 50%;"
							class="btn-3d blue">
					</div>
					<div class="col-md-1 text-center">
						<img src="${path}/resources/images/xdmin/sns_icon/icon_round_naver_48.png" style="border-radius: 50%;" class="btn-3d green">
					</div>
					<div class="col-md-1 text-center">
						<img src="${path}/resources/images/xdmin/sns_icon/icon_round_kakaotalk_48.png" style="border-radius: 50%;"
							class="btn-3d yellow">
					</div>
					<div class="col-md-1 text-center">
						<img src="${path}/resources/images/xdmin/sns_icon/icon_round_google_48.png" style="border-radius: 50%;"
							class="btn-3d white">
					</div>
				</div>
			</div>







		</div>

		<!-- 모바일 -->

		<div class="row my-3 justify-content-center d-md-none">
			<div class="col-12 text-center">

				<img src="${path}/resources/images/xdmin/coupang2.png" alt="coupang_logo" class="p-0" style="width: 195px; height: 46px;">
				<!-- 
				<h1 style="color: lightslategray">
					MEMBER <span class="fw-bold">LOGIN</span>
				</h1>
				 -->
			</div>



			<div class="col-12 d-flex justify-content-center">

				<div class="row justify-content-center" style="width: 600px;">

					<div class="col-12 mt-4">

						<div class="input-group input-group-lg mb-3">
							<!-- <span class="input-group-text bg-light" id="userIcon"> <label for="Username"> <i
									class="bi bi-person-circle text-secondary"></i>
							</label>
							</span> -->
							<input type="text" class="form-control" id="Username" placeholder="아이디" aria-label="Username"
								aria-describedby="userIcon">
						</div>

						<div class="input-group input-group-lg">
							<!-- <span class="input-group-text bg-light" id="passwordIcon"> <label for="Password"> <i
									class="bi bi-file-lock2-fill text-secondary"></i>
							</label>
							</span> -->
							<input type="password" class="form-control" id="Password" placeholder="비밀번호" aria-label="Password"
								aria-describedby="passwordIcon">
						</div>

					</div>

				</div>
			</div>

			<div class="col-12 d-flex justify-content-center" style="min-width: 350px;">
				<div class="row d-flex justify-content-start mt-3" style="width: 600px;">
					<div class="col-5 form-check ms-4">
						<input type="checkbox" class="form-check-input" id="autoLogin" name="checkbox1" onclick="selectAll1(this)">
						<label for="autoLogin" class="form-check-label"> <span class="fw-light"> 자동 로그인 </span>
						</label>
					</div>
					<div class="col-5 form-check ms-3">
						<input type="checkbox" class="form-check-input" id="saveId" name="checkbox1"> <label for="saveId"
							class="form-check-label"><span class="fw-light">아이디 저장</span></label>
					</div>
				</div>
			</div>

			<div class="col-9 my-5" style="min-width: 350px;">
				<button class="btn container3 btn-outline-dark" style="width: 100%; height: 100%;">
					<span class="fw-bold">로그인</span>
				</button>
			</div>

			<div class="col-9 my-3 text-center" style="min-width: 350px;">
				<div class="row d-flex justify-content-center align-items-center">
					<div class="col p-2 border-end border-2">
						<a class="nodeco text-gray">아이디찾기</a>
					</div>
					<div class="col p-2">
						<a class="nodeco text-gray">비밀번호찾기</a>
					</div>
					<div class="col p-2 border-start border-2">
						<a class="nodeco text-gray">회원가입</a>
					</div>
				</div>
			</div>

		</div>


		<!-- social login -->

		<!-- 웹 -->
		<!-- 
		<div class="row d-flex justify-content-center g-3 d-none d-md-block mb-4">
			<div class="col-md-12 text-center">다른 계정으로 로그인</div>

			<div class="col-md-12">
				<div class="row justify-content-center">
					<div class="col-md-1 text-center">
						<img src="${path}/resources/images/xdmin/sns_icon/icon_round_facebook_48.png" style="border-radius: 50%;">
					</div>
					<div class="col-md-1 text-center">
						<img src="${path}/resources/images/xdmin/sns_icon/icon_round_naver_48.png" style="border-radius: 50%;">
					</div>
					<div class="col-md-1 text-center">
						<img src="${path}/resources/images/xdmin/sns_icon/icon_round_kakaotalk_48.png" style="border-radius: 50%;">
					</div>
					<div class="col-md-1 text-center">
						<img src="${path}/resources/images/xdmin/sns_icon/icon_round_google_48.png" style="border-radius: 50%;">
					</div>
				</div>
			</div>
		</div>
		 -->
		<!-- 모바일 -->
		<div class="d-flex justify-content-center d-md-none">
			<div class="row mb-5" style="min-width: 350px;">
				<button type="button" class="btn btn-primary mb-1 text-white">
					<div class="row">
						<div class="col-1 col-md-1 text-start">
							<img src="${path}/resources/images/xdmin/sns_icon/icon_round_facebook_48.png">
						</div>
						<div class="col col-md fw-bold" style="margin: auto;">페이스북 계정으로 로그인</div>
					</div>
				</button>
				<button type="button" class="btn btn-warning mb-1 text-white">
					<div class="row">
						<div class="col-1 col-md-1 text-start">
							<img src="${path}/resources/images/xdmin/sns_icon/icon_round_kakaotalk_48.png">
						</div>
						<div class="col col-md fw-bold" style="margin: auto;">카카오 계정으로 로그인</div>
					</div>
				</button>
				<button type="button" class="btn btn-success mb-1 text-white">
					<div class="row">
						<div class="col-1 col-md-1 text-start">
							<img src="${path}/resources/images/xdmin/sns_icon/icon_round_naver_48.png">
						</div>
						<div class="col col-md fw-bold" style="margin: auto;">네이버 계정으로 로그인</div>
					</div>
				</button>
				<button type="button" class="btn btn-default mb-1 border border-2 box-white">
					<div class="row">
						<div class="col-1 col-md-1 text-start">
							<img src="${path}/resources/images/xdmin/sns_icon/icon_round_google_48.png">
						</div>
						<div class="col col-md fw-bold" style="margin: auto;">구글 계정으로 로그인</div>
					</div>
				</button>
			</div>
		</div>


		<div class="footer">
			<div class="row d-flex align-items-end border-top border-4 pb-3 pt-4 d-none d-md-block">

				<div class="bg-light p-4">
					<div class="col-12">

						<div class="row align-items-center mb-1">
							<div class="col-6 fw-light">아직 회원이 아니세요? 회원가입을 하시면 보다 많은 혜택이 있습니다.</div>
							<div class="col-6 text-end">
								<a href="./regForm1.html" class="btn btn-outline-dark" style="width: 125px;">회원가입하기</a>
							</div>
						</div>

						<div class="row align-items-center mb-1">
							<div class="col-6 fw-light">아이디가 기억나지 않으세요? '아이디 찾기'를 해주세요.</div>
							<div class="col-6 text-end">
								<a href="./loginFindId.html" class="btn btn-outline-dark" style="width: 125px;">아이디찾기</a>
							</div>
						</div>

						<div class="row align-items-center">
							<div class="col-6 fw-light">비밀번호가 기억나지 않으세요? '비밀번호 찾기'를 해주세요.</div>
							<div class="col-6 text-end">
								<a href="./loginFindPwd.html" class="btn btn-outline-dark" style="width: 125px;">비밀번호찾기</a>
							</div>
						</div>

					</div>
				</div>

			</div>
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

<script type="text/javascript">
	
$("#btnLogin").on("click", function(){
	
	$.ajax({
		async: true 
		,cache: false
		,type: "post"
		,url: "/infra/member/loginProc"
		,data : { "ifmmId" : $("#ifmmId").val(), "ifmmPwd" : $("#ifmmPwd").val()}
		,success: function(response) {
			if(response.rt == "successGoIndex") {
				location.href = "/infra/index/indexView";
			} else if(response.rt == "successGoMain") {
				location.href = "/infra/coupang/mainPage";
			} else {
				alert("로그인 실패");
			}
		}
		,error : function(jqXHR, textStatus, errorThrown){
			alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
		}
	});
	
});
	
	//엔터키 쳤을 때 로그인 하는 방법 (input id칸이랑 pwd칸에 [onkeyup="enterkey();"] 추가)
	function enterkey() {
        if (window.event.keyCode == 13) {
 				
        	$.ajax({
    			async: true 
    			,cache: false
    			,type: "post"
    			,url: "/infra/member/loginProc"
    			,data : { "ifmmId" : $("#ifmmId").val(), "ifmmPwd" : $("#ifmmPwd").val()}
    			,success: function(response) {
    				if(response.rt == "successGoIndex") {
    					location.href = "/infra/index/indexView";
    				} else if(response.rt == "successGoMain") {
    					location.href = "/infra/coupang/mainPage";
    				} else {
    					alert("로그인 실패");
    				}
    			}
    			,error : function(jqXHR, textStatus, errorThrown){
    				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
    			}
    		});
        	
             
        	}
		}




</script>

<script type="text/javascript">
	function selectAll1(selectAll1) {
		const checkboxes 
			= document.getElementsByName("checkbox1");
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll1.checked;
		})
	}
</script>
</html>

