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
<title>쿠팡! 상품검색</title>
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
		<form id="formSearch" method="post">
		<input type="hidden" id="trpdSeq" name="trpdSeq">
		<input type="hidden" id="thisPage" name="thisPage" value="${vo.thisPage}">
		<input type="hidden" id="shSort" name="shSort" value="${vo.shSort}">
		<input type="hidden" id="rowNumToShow" name="rowNumToShow" value="${vo.rowNumToShow}">


			<%@include file="../include/coupangTopBar.jsp"%>

			<%@include file="../include/coupangShSection2.jsp"%>




			<!-- width65 start -->
			<div class="width65">
				<div class="row p-3">
					<div class="col">
						'
						<span class="fw-bold">
							<c:out value="${vo.shBar}" />
						</span>
						'에 대한 검색결과
					</div>
				</div>
				
				<div class="row bg-light m-0 py-1 mb-2 align-items-center" style="font-size: small;">
					<div class="col text-start px-3">
						<a href="javascript:goSort('lowPrice')" class="linkG <c:if test="${vo.shSort eq 'lowPrice'}">fw-bold text-primary</c:if>">낮은가격순</a>
						<a href="javascript:goSort('highPrice')" class="linkG <c:if test="${vo.shSort eq 'highPrice'}">fw-bold text-primary</c:if>">높은가격순</a>
						<a href="javascript:goSort('highStar')" class="linkG <c:if test="${vo.shSort eq 'highStar'}">fw-bold text-primary</c:if>">별점순</a>
						<a href="javascript:goSort('latest')" class="linkG <c:if test="${vo.shSort eq 'latest'}">fw-bold text-primary</c:if>">최신순</a>
					</div>
					<div class="col px-1">
						<ul class="nav d-flex justify-content-end text-end">
							<li class="nav-item dropdown"><a class="nav-link link-dark dropdown-toggle"><c:out value="${vo.rowNumToShow}"/>개씩 보기</a>
								<ul class="dropdown-menu borderX py-0" style="min-width: 118px; font-size: small; margin-top: 2px;">
									<li><a class="dropdown-item <c:if test="${vo.rowNumToShow eq 4}">active</c:if>" href="javascript:changeRow(4);">4개씩 보기</a></li>
									<li><a class="dropdown-item <c:if test="${vo.rowNumToShow eq 8}">active</c:if>" href="javascript:changeRow(8);">8개씩 보기</a></li>
									<li><a class="dropdown-item <c:if test="${vo.rowNumToShow eq 16}">active</c:if>" href="javascript:changeRow(16);">16개씩 보기</a></li>
									<li><a class="dropdown-item <c:if test="${vo.rowNumToShow eq 32}">active</c:if>" href="javascript:changeRow(32);">32개씩 보기</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				
				<%-- <div class="table-responsive">
					<table class="table">
						<tr>
							<c:forEach items="${list}" var="item" varStatus="status">
								<td>
									<c:out value="${item.trpdSeq}" />
								</td>
								<td>
									<c:out value="${item.trpdName }" />
								</td>
								<td>
									<c:out value="${item.trpdPrice }" />
								</td>
								<td>
									<c:out value="${item.trpdDiscountPercent }" />
								</td>
								<td>
									<c:out value="${item.trpdDeliveryFee }" />
								</td>
								<td>
									<c:out value="${item.trpdStarRating }" />
								</td>
							</c:forEach>
						</tr>
					</table>
				</div>	 --%>

				<div class="card-group row row-cols-4">
					<c:forEach items="${list}" var="item" varStatus="status">
						<div class="col">
							<div class="card borderX">
								<a href="javascript:goView(<c:out value="${item.trpdSeq}"/>);" class="productLink link-dark">
									<img class="randomProduct" src="${path}/resources/images/user/productSearch/img_sample.jpg">
									<span class="d-block pt-2 px-1" style="height: 50px; font-size: small">
										<c:out value="${item.trpdName }" />
									</span>
								</a>
								<c:choose>
								<c:when test="${item.trpdDiscountPercent ne 0.0}">
									<div class="row">
										<div class="col-12">
											<span class="d-inline ps-1 text-warning" style="font-size: x-small"><fmt:formatNumber value="${item.trpdDiscountPercent}" type="percent"/></span>
											<span class="d-inline text-decoration-line-through px-1" style="font-size: x-small"><fmt:formatNumber value="${item.trpdPrice}"/></span>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="row">
										<div class="col-12">
											<span class="d-inline ps-1" style="font-size: x-small; color : white;"> </span>
										</div>
									</div>
								</c:otherwise>
								</c:choose>
								<fmt:parseNumber integerOnly="true" var="PRICE" value="${ (item.trpdPrice * (1-item.trpdDiscountPercent)) / 10 }"/>
								<span class="d-inline fw-bold px-1 text-danger"><fmt:formatNumber value="${PRICE * 10}" />원</span>
								<c:if test="${item.trpdDeliveryFee eq 0}"><span class="d-block px-1 pt-1" style="font-size: x-small;">무료배송</span></c:if>								
								
								<div class="px-1">
									<div class="starDiv mb-5" style="background: url(${path}/resources/images/user/icon_star2.gif) 0px 0px;">
										<p class="starP" style="width: <c:out value="${item.trpdStarRating * 20}"/>%; background: url(${path}/resources/images/user/icon_star.gif) 0px 0px;">
										</p>
									</div>
								</div>
								
								
								<%-- <p class="card-text fw-bold pt-2 px-1 mb-5">
									별점 : <c:out value="${item.trpdStarRating }"/>
								</p> --%>
								
							</div>
						</div>
					</c:forEach>
				</div>
				
				
			</div>
			<!-- width65 end -->
			
			
			
			<!-- pagination start -->
			<nav class="mt-3" aria-label="...">
				<ul class="pagination justify-content-center">
					<c:if test="${vo.startPage gt vo.pageNumToShow}">
						<li class="page-item"><a class="page-link" href="javascript:goPage(<c:out value="${vo.startPage - 1}"/>)"><<</a></li>
					</c:if>
					
					<li class="page-item <c:if test="${vo.thisPage eq vo.startPage}">disabled</c:if>"><a class="page-link" href="javascript:goPage(<c:out value="${vo.thisPage - 1}"/>)"><</a></li>
					
					<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
						<c:choose>
							<c:when test="${i.index eq vo.thisPage}">
								<li class="page-item active"><a class="page-link disableLink" href="javascript:goPage(<c:out value="${i.index}"/>)">${i.index}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="javascript:goPage(<c:out value="${i.index}"/>)">${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item <c:if test="${vo.thisPage eq vo.endPage}">disabled</c:if>"><a class="page-link" href="javascript:goPage(<c:out value="${vo.thisPage + 1}"/>)">></a></li>
					<c:if test="${vo.endPage ne vo.totalPages}">
						<li class="page-item"><a class="page-link" href="javascript:goPage(<c:out value="${vo.endPage + 1}"/>)">>></a></li>
					</c:if>
				</ul>
			</nav>
			<!-- pagination end -->
			
			
			



			<!-- today's recommendation start -->
			<div class="row width65 my-2">
				<div class="col">
					<span class="fs-5 fw-bold p-1">최근 다른 고객이 많이 구매한 상품</span>
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
		logOut = function() {

			$.ajax({
				async : true,
				cache : false,
				type : "post",
				url : "/infra/member/logOutProc",
				success : function(response) {
					if (response.rt == "success") {
						location.href = "/infra/product/productSearch";
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

	<script type="text/javascript">
		$("#btnSearch").on("click", function() {
			$("#formSearch").attr("action", "/infra/product/productSearch");
			$("#formSearch").submit();
		});
	</script>
	
	<script type="text/javascript">
	
	goView = function(seq){
		$("#trpdSeq").val(seq);
		$("#formSearch").attr("action", "/infra/product/productView");
		$("#formSearch").submit();
	}
	
	goPage = function(pageNum){
		$("#thisPage").val(pageNum);
		$("#formSearch").attr("action", "/infra/product/productSearch");
		$("#formSearch").submit();
	}
	
	goSort = function(what){
		$("#shSort").val(what);
		$("#formSearch").attr("action", "/infra/product/productSearch");
		$("#formSearch").submit();
	}
	
	changeRow = function(Num){
		$("#rowNumToShow").val(Num);
		$("#formSearch").attr("action", "/infra/product/productSearch");
		$("#formSearch").submit();
	}
	
	</script>


</body>
</html>