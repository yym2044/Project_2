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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link href="${path}/resources/common/css/style.css?after" rel="stylesheet" />
<link rel="stylesheet" href="${path}/resources/common/css/styleCoupang.css?after">

<style type="text/css">

/*** Base Styling (Scroll for the useful part) ***/
/* Layout */
/* Typography */
body {
	font-size: 100%;
}

p {
	font-weight: 400;
	margin: .6rem 0;
}

/*******************************/
/********* USEFUL PART *********/
/*******************************/
#topBar {
	position: relative;
	z-index: 1000;
	background: #d63932;
}

#topBar ul li {
	position: relative;
	display: inline-block;
}

#topBar>ul>li {
	float: left;
}

#topBar a {
	display: inline-block;
	padding: 1.2rem 1.8rem;
	line-height: 1.2rem;
	transition: .2s ease-out;
}

#topBar a:hover, li.active {
	
}

ul.subMenu {
	box-sizing: border-box;
	position: absolute;
	top: 100%;
	left: 0;
	width: 130%;
}

ul.subMenu li {
	width: 100%;
	background: white;
}

#topBar ul.subMenu li a {
	width: 100%;
	padding: 1rem 1rem;
	border-bottom: 1px solid rgba(0, 0, 0, .05);
	border-top: 1px solid rgba(255, 255, 255, .1);
}

#topBar ul.subMenu li a:hover, #topBar ul.subMenu li.active>a {
	color: blue;
	padding-left: 1.1rem;
}

ul.subMenu ul.subMenu {
	position: absolute;
	top: 0;
	left: 100%;
	width: 100%;
}
</style>

</head>
<body>

	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}" />
	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}" />
	<c:set var="listCategoryDepth3" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('3')}" />

	<div class="container-fluid">

<%-- 
		<!--Content-->
		<nav id="topBar" style="font-size: small;">
			<ul>
				<li>
					<button class="btn btn-primary btn-lg rounded-0" style="width: 110px; height: 115px;">
						<i class="bi bi-list fs-2"></i>
						<div class="btnText">카테고리</div>
					</button>
					<ul class="subMenu p-0">
						<c:forEach items="${listCategoryParents1}" var="item1" varStatus="status1">
							<li><a>
									<c:out value="${item1.ifctName }" />
								</a>
								<ul class="subMenu p-0">
									<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
										<c:if test="${item1.ifctSeq eq item2.ifctParents}">
											<li><a>
													<c:out value="${item2.ifctName}" />
												</a>
												<ul class="subMenu p-0">
													<c:forEach items="${listCategoryDepth3}" var="item3" varStatus="status3">
														<c:if test="${item2.ifctSeq eq item3.ifctParents}">
															<li><a>
																	<c:out value="${item3.ifctName}" />
																</a></li>
														</c:if>
													</c:forEach>
												</ul></li>
										</c:if>
									</c:forEach>
								</ul></li>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</nav> --%>
		<!-- <nav id="topBar">
			<ul>
				<li><a href="#">
						카테고리 <i class="fa fa-angle-down"></i>
					</a>
					<ul class="subMenu">
						<li><a href="#">Item 1.1</a></li>
						<li><a href="#">
								Item 1.2 &nbsp;<i class="fa fa-angle-right"></i>
							</a>
							<ul class="subMenu">
								<li><a href="#">Item 1.2.1 with a veeeeeeeery looooong name</a></li>
								<li><a href="#">
										Item 1.2.2 &nbsp;<i class="fa fa-angle-right"></i>
									</a>
									<ul class="subMenu">
										<li><a href="#">Item 1.2.2.1</a></li>
										<li><a href="#">
												Item 1.2.2.2 &nbsp;<i class="fa fa-angle-right"></i>
											</a>
											<ul class="subMenu">
												<li><a href="#">Item 1.2.2.2.1</a></li>
												<li><a href="#">Item 1.2.2.2.2</a></li>
												<li><a href="#">Item 1.2.2.2.3</a></li>
											</ul></li>
									</ul></li>
							</ul>
						</li>
						<li><a href="#">Item 1.3</a></li>
						<li><a href="#">Item 1.4</a></li>
					</ul></li>
			</ul>
		</nav> -->






		<div class="row bg-light">
			<div class="col">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link link-dark">즐겨찾기</a></li>
					<li class="nav-item dropdown"><a class="nav-link link-dark dropdown-toggle">입점신청</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">오픈마켓</a></li>
							<li><a class="dropdown-item" href="#">여행·티켓</a></li>
							<li><a class="dropdown-item" href="#">로켓배송</a></li>
							<li><a class="dropdown-item" href="#">제휴마케팅</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="col d-flex justify-content-end">
				<ul class="nav">
					<li class="nav-item"><c:choose>
							<c:when test="${empty sessSeq}">
								<a class="nav-link link-dark" href="/infra/login/loginForm">로그인</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link link-dark" href="javascript:logOut()">로그아웃</a>
							</c:otherwise>
						</c:choose></li>
					<li class="nav-item"><a class="nav-link link-dark" href="/infra/login/regForm1">회원가입</a></li>
					<li class="nav-item"><a class="nav-link link-dark" href="#">고객센터</a></li>
				</ul>
			</div>
		</div>


		<div class="row border-bottom align-items-center">

			<div class="col-2 offset-1" style="padding-left: 100px;">
				<nav id="topBar" style="font-size: small;">
					<ul>
						<li>
							<button class="btn btn-primary btn-lg rounded-0" style="width: 110px; height: 115px;">
								<i class="bi bi-list fs-2"></i>
								<div class="btnText">카테고리</div>
							</button>
							<ul class="subMenu p-0">
								<c:forEach items="${listCategoryParents1}" var="item1" varStatus="status1">
									<li><a>
											<c:out value="${item1.ifctName }" />
										</a>
										<ul class="subMenu p-0">
											<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
												<c:if test="${item1.ifctSeq eq item2.ifctParents}">
													<li><a>
															<c:out value="${item2.ifctName}" />
														</a>
														<ul class="subMenu p-0">
															<c:forEach items="${listCategoryDepth3}" var="item3" varStatus="status3">
																<c:if test="${item2.ifctSeq eq item3.ifctParents}">
																	<li><a>
																			<c:out value="${item3.ifctName}" />
																		</a></li>
																</c:if>
															</c:forEach>
														</ul></li>
												</c:if>
											</c:forEach>
										</ul></li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</nav>

			</div>

			<div class="col">

				<div class="row">
					<div class="col-2">
						<a href="home" title="COUPANG">
							<img src="${path}/resources/images/user/mainPage/coupang2.png" style="width: 175px;">
						</a>
					</div>
					<div class="col-6">
						<div class="input-group">
							<div class="col-3">
								<select class="form-select">
									<option selected>카테고리</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
							<input class="form-control" type="text" placeholder="찾고 싶은 상품을 검색해보세요!">
							<button class="btn btn-outline-secondary" type="button">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
					<div class="col">
						<button>
							<i class="bi bi-person"></i>
							<div class="btnText">마이쿠팡</div>
						</button>
						<button>
							<i class="bi bi-cart4"></i>
							<div class="btnText">장바구니</div>
						</button>
					</div>

				</div>

				<div class="row">

					<ul class="nav">
						<li class="nav-item"><a class="nav-link link-dark" href="#">이벤트/쿠폰</a></li>
						<li class="nav-item"><a class="nav-link link-dark" href="#">VIP멤버 할인</a></li>
						<li class="nav-item"><a class="nav-link link-dark" href="#">해외직구</a></li>
						<li class="nav-item"><a class="nav-link link-dark" href="#">기획전</a></li>
						<li class="nav-item"><a class="nav-link link-dark" href="#">여행/티켓</a></li>
					</ul>


				</div>

			</div>

		</div>


		<!-- 광고 carousel s -->
		<div id="carouselExampleInterval" class="carousel slide carousel-fade" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="5000">
					<img src="${path}/resources/images/user/mainPage/ad1.jpg" class="d-block w-120" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="${path}/resources/images/user/mainPage/ad2.jpg" class="d-block w-120" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="${path}/resources/images/user/mainPage/ad3.jpg" class="d-block w-120" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- 광고 carousel e -->

		<!-- width65 start -->
		<div class="width65">
			<div class="row mt-4">
				<div class="col">
					<span class="fs-3 fw-bold p-1">오늘의 발견</span>
					ㅣ 오늘 쿠팡이 엄선한 가장 HOT한 상품!
				</div>
			</div>

			<div class="row border p-2">
				<div class="col-6 ps-0 mb-1">
					<button class="todayHot btn p-0">
						<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot1.png">
					</button>
				</div>
				<div class="col-6 ps-0 mb-1">
					<button class="todayHot btn p-0">
						<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot2.png">
					</button>
				</div>

				<div class="col-3 ps-0">
					<button class="todayHot btn p-0">
						<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot3.png">
					</button>
				</div>
				<div class="col-3 ps-0">
					<button class="todayHot btn p-0">
						<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot4.png">
					</button>
				</div>
				<div class="col-6 ps-0">
					<button class="todayHot btn p-0">
						<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot5.png">
					</button>
				</div>


			</div>
		</div>
		<!-- width65 end -->



		<!-- today's recommendation start -->
		<div class="row width65 my-4">
			<div class="col">
				<i class="bi bi-bag-heart-fill fs-3 text-danger"></i>
				<span class="fs-3 fw-bold p-1">오늘의 쇼핑 제안</span>
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
							<a class="productLink link-dark" href="./productView.html">
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



	</div>

	<footer class="mt-5 bg-light">
		<div class="row p-2 border-top border-bottom">
			<div class="col d-flex justify-content-center align-items-center">
				<a href="https://www.aboutcoupang.com/ko/" target="_blank" style="border: none;" class="footerNav">회사소개</a>
				|
				<a href="https://ir.aboutcoupang.com/English/home/" target="_blank" class="footerNav">Investor Relations</a>
				|
				<a href="https://rocketyourcareer.kr.coupang.com" target="_blank" class="footerNav">인재채용</a>
				|
				<a href="https://wing.coupang.com/vendor/joining/welcome?inflow=WEB_FOOTER_B" class="footerNav">입점 / 제휴문의</a>
				|
				<a href="https://csmessenger.coupang.com/cs-center/notice/main" class="footerNav">공지사항</a>
				|
				<a href="https://csmessenger.coupang.com/cs-center/voc/main" class="footerNav">고객의 소리</a>
				|
				<a href="/np/policies/terms" class="footerNav">이용약관</a>
				|
				<a href="/np/policies/privacy" class="footerNav fw-bold"> 개인정보 처리방침 </a>
				|
				<a href="https://rocketpay.coupang.com/rocketpay/operationTerms/coupangPcFooter" class="footerNav">쿠팡페이 이용약관</a>
				|
				<a href="https://rocketpay.coupang.com/rocketpay/coupangpay-terms-v2/privacy-policy" class="footerNav fw-bold"> 쿠팡페이 개인정보처리방침 </a>
				|
				<a href="/np/safety" class="footerNav">신뢰관리센터</a>
				|
				<a href="https://partners.coupang.com/" target="_blank" class="footerNav">제휴마케팅</a>
				|
				<a href="https://ads.coupang.com" target="_blank" class="footerNav">광고안내</a>
			</div>
		</div>
		<div class="row p-5">
			<div class="col-2 offset-1">
				<h5>
					<a href="/infra/home" title="COUPANG" style="text-decoration: none; color: gray">COUPANG</a>
				</h5>
			</div>
			<div class="col-3">
				<address style="font-size: small">
					상호명 및 호스팅 서비스 제공 : 쿠팡(주)
					<br>
					대표이사 : 강한승,박대준
					<br>
					서울시 송파구 송파대로 570
					<br>
					사업자 등록번호 : 120-88-00767
					<br>
					통신판매업신고 : 2017-서울송파-0680
					<br>
					<a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767" target="_blank" class="licensee" title="사업자정  보 확인">사업자정보 확인 &gt;</a>
				</address>
			</div>
			<div class="col-3">
				<a href="https://csmessenger.coupang.com/cs-center/chat/main" class="call-center" title="365 고객센터" style="font-size: small;">
					<strong>365고객센터</strong> | 전자금융거래분쟁처리담당
					<br>
					<em style="font-size: x-large;" class="fw-bold">1577-7011 (유료)</em>
					<br>
					서울시 송파구 송파대로 570
					<br>
					<span class="contact-fax">email : help@coupang.com</span>
				</a>
			</div>
			<div class="col">
				<p class="safe-service" style="font-size: small;">
					<strong>우리은행 채무지급보증 안내</strong>
					<br>
					<span>
						당사는 고객님이 현금 결제한 금액에 대해
						<br>
						우리은행과 채무지급보증 계약을 체결하여
						<br>
						안전거래를 보장하고 있습니다.
						<br>
					</span>
					<a href="javascript:;" id="serviceCheck" class="service-check" title="서비스 가입사실 확인">서비스 가입사실 확인 &gt;</a>
				</p>
			</div>
		</div>
		<div class="bg-dark text-secondary justify-content-center">
			<div class="row pt-2 align-items-center">
				<div class="col-7 offset-2">
					<p style="font-size: x-small;">
						사이버몰 내 판매되는 상품 중에는 쿠팡에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.
						<br>
						마켓플레이스(오픈마켓) 상품의 경우 쿠팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다.
						<br>
						쿠팡은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에 대하여 책임을 지지 않습니다.
						<br>
						쿠팡은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@coupang.com)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁 처리절차에 의거 분쟁이 처리됩니다.
						<br>
						Copyright © Coupang Corp. 2010-2021 All Rights Reserved.
					</p>
				</div>
				<div class="col-3">
					<a href="https://www.facebook.com/Coupang.korea" target="_blank" class="text-light" title="쿠팡 페이스북">
						<img src="/infra/resources/images/xdmin/sns_icon/icon_round_facebook_48.png" style="width: 32px;">
					</a>
					<a href="https://news.coupang.com/" target="_blank" class="text-light" title="쿠팡 뉴스룸">
						<img src="/infra/resources/images/xdmin/sns_icon/icon_round_naver_48.png" style="width: 32px;">
					</a>
					<a href="https://www.instagram.com/coupang" target="_blank" class="text-light" title="쿠팡 인스타그램">
						<img src="/infra/resources/images/xdmin/sns_icon/icon_round_instgram_48.png" style="width: 32px;">
					</a>
				</div>
			</div>
		</div>
	</footer>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript">
		//Hide SubMenus.
		$(".subMenu").hide();

		// Shows SubMenu when it's parent is hovered.
		$(".subMenu").parent("li").hover(function() {
			$(this).find(">.subMenu").not(':animated').slideDown(300);
			$(this).toggleClass("active ");
		});

		// Hides SubMenu when mouse leaves the zone.
		$(".subMenu").parent("li").mouseleave(function() {
			$(this).find(">.subMenu").slideUp(150);
		});

		// Prevents scroll to top when clicking on <a href="#"> 
		$("a[href=\"#\"]").click(function() {
			return false;
		});
	</script>

	<script type="text/javascript">
		logOut = function() {

			$.ajax({
				async : true,
				cache : false,
				type : "post",
				url : "/infra/member/logOutProc",
				success : function(response) {
					if (response.rt == "success") {
						location.href = "/infra/home";
					} else {
						alert("로그아웃 실패");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("ajaxUpdate " + jqXHR.textStatus + " : "
							+ jqXHR.errorThrown);
				}
			});

		}
	</script>
</body>
</html>