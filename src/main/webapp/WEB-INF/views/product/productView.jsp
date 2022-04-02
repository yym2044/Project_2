<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>


<jsp:useBean id="CategoryServiceImpl" class="com.yym.infra.modules.category.CategoryServiceImpl" />
<!-- CategoryServiceImpl 클래스 바로 사용 -->

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠팡!</title>
<%@include file="../include/cssLinks.jsp"%>


<style type="text/css">
</style>

</head>
<body>

	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}" />
	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}" />
	<c:set var="listCategoryDepth3" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('3')}" />

	<div class="container-fluid">
		<form id="formView" method="post">


			<%@include file="../include/coupangTopBar.jsp"%>

			<%@include file="../include/coupangShSection1.jsp"%>

			<div class="row">
				<div class="col offset-2 py-3 d-flex">
					<nav style="-bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
						<ol class="breadcrumb" style="font-size: small;">
							<li class="breadcrumb-item">쿠팡 홈</li>
							<li class="breadcrumb-item">남성패션</li>
							<li class="breadcrumb-item">의류</li>
							<li class="breadcrumb-item">맨투맨/후드티</li>
							<li class="breadcrumb-item active" aria-current="page">후드티</li>
						</ol>
					</nav>
				</div>
			</div>


			<!-- width65 start -->
			<div class="width65">
				<div class="row">
					<div class="col-5">
						<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct4.jpg">
					</div>
					<div class="col">
						<div class="row border-bottom border-2 m-1 align-items-center">
							<div class="col p-0">
								<p class="productName m-0">언탭트 남성용 오버핏 스웨트 고중량 후드</p>
								<p>
									<img src="${path}/resources/images/user/productView/starRatingImg.png">
									<span>
										<a href="" style="text-decoration: none;">32개 상품평</a>
									</span>
								</p>
							</div>
							<div class="col-3 text-end">
								<button class="btn btn-outline-danger rounded-circle">
									<i class="bi bi-heart"></i>
								</button>
								<button class="btn btn-outline-primary rounded-circle">
									<i class="bi bi-share-fill"></i>
								</button>
							</div>
						</div>
						<div class="row border-bottom border-1 m-1 py-2">
							<div class="col p-0 py-1">
								<p class="productPrice m-0">28,900 원</p>
							</div>
						</div>
						<div class="row border-bottom border-1 m-1 py-2">
							<div class="col p-0 py-1">
								<p class="m-0 fw-bold">무료배송</p>
								<p class="m-0" style="font-size: small;">
									<span class="arrivalDate">내일(일) 3/27</span>
									도착 보장 (2시간 36분 내 주문 시 / 서울⋅경기 기준)
								</p>
							</div>
						</div>
						<div class="row border-bottom border-1 m-1 py-2">
							<div class="col p-0 py-1" style="font-size: small">
								사이즈
								<br>
								<select class="form-select" style="width: 18%; font-size: small;">
									<option>::선택::</option>
									<option>XL</option>
									<option>L</option>
									<option>M</option>
									<option>S</option>
								</select>
								<br>
								색상
								<br>
								<select class="form-select" style="width: 18%; font-size: small;">
									<option>::선택::</option>
									<option>화이트</option>
									<option>블랙</option>
								</select>
							</div>
						</div>
						<div class="row m-1 py-2 align-items-center">
							<div class="col-2 p-0">
								<input class="form-control" type="number" value="1" min="1" style="height: 38px;">
							</div>
							<div class="col px-1">
								<a tabindex="0" id="btnCart" class="btn btn-info w-100 rounded-0 text-white" data-bs-toggle="popover" data-bs-html="true" data-bs-placement="top" data-bs-trigger="focus" data-bs-content="
							<!-- 
							<div class='row p-0'>
								<div class='col text-end'>
									<a id='closePop' type='button' class='btn-close btn-lg' data-dismiss='popover'></a>
								</div>
							</div>
							 -->
							<div class='row p-3 text-center'>
								<div class='col pb-3'>상품이 장바구니에 담겼습니다.</div>
								<a class='btn btn-outline-primary' href='/infra/product/cartGeneral'>장바구니 바로가기 ></a>
							</div>
							">장바구니 담기</a>
							</div>
							<div class="col p-0">
								<a href="/infra/product/productCheckOut" class="btn btn-primary w-100 rounded-0">바로 구매 ></a>
							</div>
						</div>
						<div class="row m-1 py-2">
							<ul class="productDetails">
								<li>의류 핏: 오버핏</li>
								<li>안감 종류: 기본</li>
								<li>소재: 폴리에스터</li>
								<li>색상계열: 블랙계열</li>
								<li>상의 사이즈: 남성 XL (105)</li>
								<li>쿠팡상품번호: 6111245966 - 11519354261</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- width65 end -->



			<!-- today's recommendation start -->
			<div class="row width65 my-4">
				<div class="col">
					<i class="bi bi-bag-heart-fill fs-3 text-danger"></i>
					<span class="fs-3 fw-bold p-1">함께보면 좋은 상품</span>
				</div>
			</div>

			<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="card-group width65">
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct1.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct2.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct3.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct4.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct5.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="card-group width65">
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct6.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct7.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct8.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct9.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct10.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="card-group width65">
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct11.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct12.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct13.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct14.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
							<div class="card">
								<a class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct15.jpg">
									<span class="fs-5 d-block pt-2 px-1">상품이름</span>
								</a>
								<p class="card-text fw-bold pt-2 px-1 mb-5">상품가격</p>
								<div class="card-footer box-white">
									<small class="text-muted">Last updated 3 mins ago</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- today's recommendation end -->


		</form>
	</div>

	<%@include file="../include/footer.jsp"%>
	<%@include file="../include/jsLinks.jsp"%>

	<script type="text/javascript">
		var popoverTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})

		var popover = new bootstrap.Popover(document
				.querySelector('.popover-dismiss'), {
			trigger : 'focus'
		})
	</script>

	<script type="text/javascript">
		$("#btnSearch").on("click", function() {
			$("#formView").attr("action", "/infra/product/productSearch");
			$("#formView").submit();
		});
	</script>



</body>
</html>