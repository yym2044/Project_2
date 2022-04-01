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
<title>쿠팡! 장바구니</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${path}/resources/common/css/style.css">
<link rel="stylesheet" href="${path}/resources/common/css/styleCoupang.css">
<script src="https://kit.fontawesome.com/fbbc6db919.js" crossorigin="anonymous"></script>

<style type="text/css">
th {
	vertical-align: middle;
}

td {
	vertical-align: middle;
}
</style>

</head>
<body>

	<div class="container-fluid">

		<div class="row border-bottom py-3 pt-4">
			<div class="col offset-2">
				<a href="/infra/home"><img src="${path}/resources/images/user/mainPage/coupang2.png" style="width: 175px;"></a>
			</div>
		</div>

		<div class="width65">
			<div class="row border-bottom border-4 py-2 align-items-end mb-3">
				<div class="col p-0">
					<h2>장바구니</h2>
				</div>
				<div class="col text-end p-0">장바구니>주문결제>주문완료</div>
			</div>

			<div class="row">
				<ul class="nav nav-tabs nav-justified">
					<li class="nav-item"><a class="nav-link active fs-4" aria-current="page" href="">일반구매</a></li>
					<li class="nav-item"><a class="nav-link fs-4" href="/infra/product/cartWishlist">찜 목록</a></li>
					<li class="nav-item"><a class="nav-link fs-4" href="/infra/product/cartRegularDelivery">정기배송</a></li>
				</ul>
			</div>

			<div class="row py-3">
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0 border-top border-3">
							<tr>
								<th colspan="2" class="bg-light text-start px-3">
									<input type="checkbox">
								</th>
								<th class="bg-light px-2">상품정보</th>
								<th class="bg-light px-2" style="width: 89px;">상품금액</th>
								<th class="bg-light px-2" style="width: 88px;">배송비</th>
							</tr>
							<tr style="height: 120px;">
								<td class="px-3 text-start" style="width: 50px;">
									<input type="checkbox">
								</td>
								<td class="px-2" style="width: 94px;">
									<img src="${path}/resources/images/user/mainPage/product/randomProduct4.jpg" style="width: 78px;">
								</td>
								<td class="px-2">
									<div class="row">
										<div class="col-12 text-start border-bottom pb-2">
											<a class="m-0 text-muted fw-bold" style="text-decoration: none;" href="/infra/product/productView">언탭트 남성용 오버핏 스웨트 고중량 후드, XL, 블랙</a>
										</div>
										
										<div class="col-6 text-start pt-3">
											<p class="m-0">
												<span class="arrivalDate fs-6 fw-light">내일(월) 3/28</span>
												도착 보장
											</p>
										</div>
										<div class="col-3 text-end py-2">
											<span class="fw-light">28,900원</span>
											<select class="form-select d-inline w-50">
												<option>1</option>
												<option>2</option>
												<option>3</option>
											</select>
										</div>
										<div class="col-3 py-2">
											<span class="fw-light">28,900원</span>
											<button class="btn btn-outline-secondary">X</button>
										</div>
									</div>
								</td>
								<td class="px-2">28,900원</td>
								<td class="px-2">무료</td>
							</tr>
							<tr style="height: 120px;">
								<td class="px-3 text-start" style="width: 50px;">
									<input type="checkbox">
								</td>
								<td class="px-2" style="width: 94px;">
									<img src="${path}/resources/images/user/mainPage/product/randomProduct16.jpg" style="width: 78px;">
								</td>
								<td class="px-2">
									<div class="row">
										<div class="col-12 text-start border-bottom pb-2">
											<a class="m-0 text-muted fw-bold" style="text-decoration: none;" href="/infra/product/productView"> 빅사이즈클럽 SG 오버핏 데일리 맨투맨, 4XL, 챠콜</a>
										</div>
										<div class="col-6 text-start pt-3">
											<p class="m-0">
												<span class="arrivalDate fs-6 fw-light">내일(월) 3/28</span>
												도착 보장
											</p>
										</div>
										<div class="col-3 text-end py-2">
											<span class="fw-light">21,900원</span>
											<select class="form-select d-inline w-50">
												<option>1</option>
												<option>2</option>
												<option>3</option>
											</select>
										</div>
										<div class="col-3 py-2">
											<span class="fw-light">21,900원</span>
											<button class="btn btn-outline-secondary">X</button>
										</div>
									</div>
								</td>
								<td class="px-2">21,900원</td>
								<td class="px-2">무료</td>
							</tr>
							<tr>
								<td colspan="5" class="bg-light text-end p-3">
									상품가격
									<span class="fs-5">50,800</span>원
									<button class="rounded-pill"><i class="fa-solid fa-plus"></i></button>
									배송비
									<span class="fs-5">무료</span>
									<button class="rounded-pill"><i class="fa-solid fa-equals"></i></button>
									주문금액
									<span class="fs-5 fw-bold">50,800</span>원
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col text-center">
					<a class="lh-lg btn btn-outline-danger" href="javascript:history.back();" style="width: 200px;">계속 쇼핑하기</a>
					<a href="/infra/product/productCheckOut2" class="lh-lg btn btn-outline-primary" style="width: 200px;">구매하기</a>
				</div>
			</div>
		</div>






	</div>

	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/jsLinks.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnCart").popover({
				html : true,
				trigger : "click"
			});
		})

		$("#closePop").on("click", function() {
			$("#btnCart").popover({
				trigger : "click"
			});
		})
	</script>

</body>
</html>