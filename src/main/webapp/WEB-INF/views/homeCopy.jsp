<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CategoryServiceImpl" class="com.yym.infra.modules.category.CategoryServiceImpl"/>	<!-- CategoryServiceImpl 클래스 바로 사용 -->

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
	
</style>

</head>
<body>

	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}"/>	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}"/>	<!-- 패션의류/잡화 -->

	<div class="container-fluid">
		
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
					<li class="nav-item">
						<c:choose>
							<c:when test="${empty sessSeq}">
								<a class="nav-link link-dark" href="/infra/login/loginForm">로그인</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link link-dark" href="javascript:logOut()">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="nav-item"><a class="nav-link link-dark" href="/infra/login/regForm1">회원가입</a></li>
					<li class="nav-item"><a class="nav-link link-dark" href="#">고객센터</a></li>
				</ul>
			</div>
		</div>


		<div class="row border-bottom align-items-center">

			<div class="col-1 offset-2 justify-content-end">
				<ul class="nav">
					<li class="nav-item dropdown"><a class="nav-link link-light dropdown-toggle p-0" href="#">
							<!-- data-bs-toggle="dropdown" -->
							<button class="btn btn-primary btn-lg rounded-0" style="width: 110px; height: 115px;">
								<i class="bi bi-list fs-2"></i>
								<div class="btnText">카테고리</div>
							</button>
						</a>
						<ul class="dropdown-menu">
							<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
								<li class="nav-item dropdown">
									<c:choose>
										<c:when test="${not empty item.ifctUrl}">
											<a class="dropdown-item" href="javascript:goCategory(<c:out value="${item.ifctSeq}"/>)"><c:out value="${item.ifctName}"/></a>
										</c:when>
										<c:otherwise>
											<div class="btn-group dropend">
											<a class="d-block dropdown-item nav-link link-dark dropdown-toggle" style="width: 158px;" data-bs-toggle="dropdown"><c:out value="${item.ifctName}"/></a>
											  <ul class="dropdown-menu">
													<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
														<li class="dropdown">
															<a class="dropdown-item"><c:if test="${item.ifctSeq eq item2.ifctParents}"><c:out value="${item2.ifctName}"/></c:if></a>
														</li>
													</c:forEach>											    
											  </ul>
											</div>
										</c:otherwise>
									</c:choose>
								</li>
							</c:forEach>
							
							<!-- 
							<li><a class="dropdown-item" href="#">패션의류/잡화</a></li>
							<li><a class="dropdown-item" href="#">뷰티</a></li>
							<li><a class="dropdown-item" href="#">식품</a></li>
							<li><a class="dropdown-item" href="#">주방용품</a></li>
							<li><a class="dropdown-item" href="#">생활용품</a></li>
							<li><a class="dropdown-item" href="#">문구/취미</a></li>
							 -->
						</ul></li>
				</ul>

			</div>

			<div class="col">

				<div class="row">
					<div class="col-2">
						<a href="home" title="COUPANG"><img src="${path}/resources/images/user/mainPage/coupang2.png" style="width: 175px;"></a>
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

	<%@include file="./include/footer.jsp" %>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	
	<script type="text/javascript">
		
		logOut = function(){
			
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "/infra/member/logOutProc"
				,success: function(response) {
					if(response.rt == "success") {
						location.href = "/infra/home";
					} else {
						alert("로그아웃 실패");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
			
		}
	
	</script>
</body>
</html>