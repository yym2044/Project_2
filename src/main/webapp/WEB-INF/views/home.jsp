
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
<title>쿠팡! 홈</title>
<%@include file="./include/cssLinks.jsp"%>

<style type="text/css">
.randomProduct{
	width: 100%;
	height: 190px;
}
</style>

</head>
<body>
	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}" />
	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}" />
	<c:set var="listCategoryDepth3" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('3')}" />

	<div class="container-fluid px-0">
		<form id="formHome" method="post" action="/infra/product/productSearch">
			<input id="ifmmSeq" name="ifmmSeq" type="hidden" value="${sessSeq}">
			<input id="trpdSeq" name="trpdSeq" type="hidden">

			<%@include file="./include/coupangTopBar.jsp"%>
			<%@include file="./include/coupangShSection1.jsp"%>

			<!-- 광고 carousel s -->
			<div id="carouselExampleInterval" class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="5000">
						<a href="/infra/product/productView?trpdSeq=3"><img src="${path}/resources/images/user/mainPage/ad1.jpg" class="d-block w-120" alt="..."></a>
					</div>
					<div class="carousel-item" data-bs-interval="5000">
						<a href="/infra/product/productView?trpdSeq=6"><img src="${path}/resources/images/user/mainPage/ad2.jpg" class="d-block w-120" alt="..."></a>
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
						<button type="button" class="todayHot btn p-0" onclick="goView(18)">
							<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot1.png">
						</button>
					</div>
					<div class="col-6 ps-0 mb-1">
						<button type="button"  class="todayHot btn p-0" onclick="goView(19)">
							<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot2.png">
						</button>
					</div>

					<div class="col-3 ps-0">
						<button type="button"  class="todayHot btn p-0" onclick="goView(20)">
							<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot3.png">
						</button>
					</div>
					<div class="col-3 ps-0">
						<button type="button"  class="todayHot btn p-0" onclick="goView(21)">
							<img class="todayHot border" src="${path}/resources/images/user/mainPage/todayHot4.png">
						</button>
					</div>
					<div class="col-6 ps-0">
						<button type="button"  class="todayHot btn p-0" onclick="goView(22)">
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
							<c:forEach items="${listAd}" var="item" varStatus="status">
								<c:if test="${status.index le 4 }">							
									<div class="card">
										<a href="javascript:goView(<c:out value="${item.trpdSeq}"/>)" class="productLink link-dark">
											<img class="randomProduct" src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>">
											<span class="fs-6 d-block pt-2 px-1 pName"><c:out value="${item.trpdName}"/></span>
										</a>
										<p class="card-text fw-bold pt-2 px-1 mb-2 text-danger"><fmt:formatNumber value="${item.trprDiscountPrice}"/><span class="fw-light">원</span></p>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="carousel-item">
						<div class="card-group width65">
							<c:forEach items="${listAd}" var="item" varStatus="status">
								<c:if test="${status.index gt 4 }">							
									<div class="card">
										<a href="javascript:goView(<c:out value="${item.trpdSeq}"/>)" class="productLink link-dark">
											<img class="randomProduct" src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>">
											<span class="fs-6 d-block pt-2 px-1 pName"><c:out value="${item.trpdName}"/></span>
										</a>
										<p class="card-text fw-bold pt-2 px-1 mb-2 text-danger"><fmt:formatNumber value="${item.trprDiscountPrice}"/><span class="fw-light">원</span></p>
									</div>
								</c:if>
							</c:forEach>
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

	<%@include file="./include/footer.jsp"%>
	<%@include file="./include/jsLinks.jsp"%>
		
	<script type="text/javascript">
	
	$("#btnMyCart").on("click", function(){
		$("#formHome").attr("action", "/infra/product/cartGeneral").submit();
	});
	
	goWishList = function(){
		$("#formHome").attr("action", "/infra/product/cartWishlist").submit();
	}
	
	goOrderList = function(){
		$("#formHome").attr("action", "/infra/product/orderList").submit();
	}
	
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

	<script type="text/javascript">
		$("#btnSearch").on("click", function() {
			$("#formHome").attr("action", "/infra/product/productSearch");
			$("#formHome").submit();
		});
	</script>
	
	<script type="text/javascript">
	
	function enterkey(){
		if (window.event.keyCode == 13){
			$("#formHome").attr("action", "/infra/product/productSearch");
			$("#formHome").submit();
		}
	}
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
	
	const pName = document.querySelectorAll(".pName");
	
	pName.forEach((el) => {
		let name = el.innerText;
		const length = name.length;
		
		if(length >= 13){
			name = name.substring(0, 12) + "...";
			el.innerText = name;
		}
		
	});
	
	goView = function(seq){
		$("#trpdSeq").val(seq);
		$("#formHome").attr("action", "/infra/product/productView").submit();
	}
	
	</script>
	
</body>
</html>
