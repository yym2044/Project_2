<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
</style>

</head>
<body>

	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}" />
	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}" />
	<c:set var="listCategoryDepth3" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('3')}" />

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

					<c:choose>
						<c:when test="${empty sessSeq}">
							<li class="nav-item"><a class="nav-link link-dark" href="/infra/login/regForm1">회원가입</a></li>
							<li class="nav-item"><a class="nav-link link-dark" href="/infra/login/loginForm">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link link-dark"><span class="fw-bold"><c:out value="${sessName}"/></span>님</a></li>
							<li class="nav-item"><a class="nav-link link-dark" href="javascript:logOut()">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link link-dark" href="#">고객센터</a></li>
				</ul>
			</div>
		</div>


		<div class="row border-bottom align-items-center">

			<div class="col-2 offset-1" style="padding-left: 100px;">
				<nav id="topBar" style="font-size: small;">
					<ul class="m-0">
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
						<a href="/infra/home" title="COUPANG">
							<img src="${path}/resources/images/user/mainPage/coupang2.png" style="width: 175px;">
						</a>
					</div>
					<div class="col-6">
						<div class="input-group">
							<div class="col-3">
								<select id="shCategory" name="shCategory" class="form-select">
									<option value="0" selected>전체</option>
										<c:forEach items="${listCategoryDepth2}" var="item" varStatus="status">
											<c:if test="${item.shCategoryNy eq 1}">
												<option value="<c:out value="${item.ifctSeq}"/>"><c:out value="${item.ifctName}"/></option>
											</c:if>
										</c:forEach>
								</select>
							</div>
							<input id="shBar" name="shBar" class="form-control" type="text" placeholder="찾고 싶은 상품을 검색해보세요!">
							<button id="btnSearch" name="btnSearch" class="btn btn-outline-secondary" type="button">
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