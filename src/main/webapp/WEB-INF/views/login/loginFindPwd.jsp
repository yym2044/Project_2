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
<title>로그인 화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- codepen -->
<link rel="stylesheet" href="${path}/resources/common/css/style.css">
<link rel="stylesheet" href="${path}/resources/common/css/codepen.css">

<script src="${path}/resources/common/js/codepen.js"></script>

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
					<h1 class="fw-bold">계정정보 찾기</h1>
				</div>
				<div class="col col-md d-flex justify-content-end">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">Home</li>
							<li class="breadcrumb-item">로그인</li>
							<li class="breadcrumb-item active fw-bold" aria-current="page">비밀번호 찾기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>

		<ul class="nav nav-tabs my-3">
			<li class="nav-item"><a class="nav-link" href="/infra/login/loginFindId">아이디 찾기</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">비밀번호 찾기</a></li>
		</ul>

		<!-- 웹 -->
		<div class="row my-5 justify-content-center d-none d-md-block border py-5 bg-light">




			<div class="col-12 d-flex justify-content-center">

				<div class="row justify-content-center" style="width: 600px;">

					<div class="col-12 my-4">

						<p class="text-center">본인확인을 통해 비밀번호 재설정 하실 수 있습니다.</p>
						<p class="text-center">쿠팡 가입 시 입력했던 이름과 아이디를 입력해주세요.</p>
						<div class="mt-5 box-white p-5">
							<table class="table table-sm">
								<tr>
									<th>이름</th>
									<td>
										<input type="text" class="form-control">
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<input type="text" class="form-control">
									</td>
								</tr>
							</table>

							<p class="text-center">비밀번호 찾기 방법을 선택해주세요.</p>
							<div class="row">
								<div class="col text-center">
									<input id="identification" name="findIdMethod" type="radio" class="form-check-input" checked>
									<label for="identification" class="form-check-label">이메일 주소</label>
									<input id="usePhoneNumber" name="findIdMethod" type="radio" class="form-check-input">
									<label for="usePhoneNumber" class="form-check-label">등록된 휴대폰</label>
								</div>
							</div>

							<div class="text-center mt-5">
								<button class="btn btn-lg btn-outline-primary" style="width: 40%;">비밀번호 찾기</button>
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