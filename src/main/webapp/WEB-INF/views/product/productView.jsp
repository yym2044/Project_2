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
<title>쿠팡! 상품정보</title>
<%@include file="../include/cssLinks.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<style type="text/css">



.sns_box {
  position: relative;
  overflow: hidden;
  top: 0;
  bottom: 0;
  left: 50%;
  -moz-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
  -webkit-transform: translateX(-50%);
  transform: translateX(-50%);
  margin: auto;
  height: 44px;
  min-width: 268px;
}

.sns_button {
  float: left;
  box-shadow: inset 0 0 0 2px gray;
  border-radius: 100%;
  -moz-transition: all 280ms ease;
  -o-transition: all 280ms ease;
  -webkit-transition: all 280ms ease;
  transition: all 280ms ease;
}
.sns_button a {
  display: table-cell;
  width: 44px;
  height: 44px;
  color: gray;
  text-align: center;
  vertical-align: middle;
  -moz-transition: all 280ms ease;
  -o-transition: all 280ms ease;
  -webkit-transition: all 280ms ease;
  transition: all 280ms ease;
}
.sns_button i {
  font-size: 25px;
  vertical-align: middle;
}
.sns_button:hover {
  box-shadow: inset 0 0 0 22px #fff;
}

.sns_button + .sns_button {
  margin: 0 0 0 12px;
}

.twitter:hover a {
  color: #1B95E0;
}

.facebook:hover a {
  color: #3B5999;
}

.google:hover a {
  color: #dd4b39;
}

.instagram:hover a {
  color: #2b5c84;
}

.pocket:hover a {
  color: #EE4056;
}

</style>

<style type="text/css">

.curImg {
	border: 1px solid;
}

</style>


</head>
<body>

	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}" />
	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}" />
	<c:set var="listCategoryDepth3" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('3')}" />

	<div class="container-fluid">
		
		<form id="formView" method="post" action="/infra/product/productSearch">
			<input id="ifmmSeq" name="ifmmSeq" type="hidden" value="${sessSeq}">
			<input id="trpdSeq" name="trpdSeq" type="hidden">
			<input type="hidden" name="checkboxTrprArray" id="trprSeqValue" placeholder="trprSeq">
			<input type="hidden" id="trprFullNameArray" name="trprFullNameArray" placeholder="trprFullName" value="${rt.trpdName}" style="width: 500px;">
			<input type="hidden" id="trctQuantityArray" name="trctQuantityArray" placeholder="trctQuantity" value="1">
			<input type="hidden" id="totalProduct" name="totalProduct" placeholder="상품*수량">
			<input type="hidden" id="totalDelivery" name="totalDelivery" placeholder="배송비" value="${rt.trpdDeliveryFee}">
			<input type="hidden" id="totalMoney" name="totalMoney" placeholder="합계">
			<input type="hidden" id="trprDiscountPrice" placeholder="trprDiscountPrice" value="${rt.trprDiscountPrice}">

			<%@include file="../include/coupangTopBar.jsp"%>

			<%@include file="../include/coupangShSection1.jsp"%>
			
			

			<div class="row">
				<div class="col offset-2 py-3 d-flex">
					<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
						<ol class="breadcrumb" style="font-size: small;">
							<li class="breadcrumb-item">쿠팡 홈</li>
							
							<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
								<c:if test="${item.ifctSeq eq rt.trpdCategoryCd1}"><li class="breadcrumb-item"><c:out value="${item.ifctName}"/></li></c:if>
							</c:forEach>
							<c:forEach items="${listCategoryDepth2}" var="item" varStatus="status">
								<c:if test="${item.ifctSeq eq rt.trpdCategoryCd2}"><li class="breadcrumb-item"><c:out value="${item.ifctName}"/></li></c:if>
							</c:forEach>
							<c:forEach items="${listCategoryDepth3}" var="item" varStatus="status">
								<c:if test="${item.ifctSeq eq rt.trpdCategoryCd3}"><li class="breadcrumb-item"><c:out value="${item.ifctName}"/></li></c:if>
							</c:forEach>
							
							<!-- 
							<li class="breadcrumb-item">남성패션</li>
							<li class="breadcrumb-item">의류</li>
							<li class="breadcrumb-item">맨투맨/후드티</li>
							<li class="breadcrumb-item active" aria-current="page">후드티</li>
							 -->
						</ol>
					</nav>
				</div>
			</div>
			

			<!-- width65 start -->
			<div class="width65">
				<div class="row">
					<div class="col-1 ps-5 pe-0">
						<div class="row">
							<c:forEach items="${listUploaded}" var="item" varStatus="status">
								<c:if test="${item.type eq 0 }">
									<div class="col-12 px-0 pb-1">
										<img name="allImg" style="width: 50px; height: 50px;" src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>">
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="col-4">
						<%-- <img class="randomProduct" src="${path}/resources/images/user/mainPage/product/randomProduct4.jpg"> --%>
						<c:choose>
							<c:when test="${fn:length(listUploaded) ne 0}">
								<c:forEach items="${listUploaded}" var="item" varStatus="status">
									<c:if test="${item.defaultNy eq 1}">
										<img id="mainImg" class="randomProduct" src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>">
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<img class="randomProduct" src="${path}/resources/images/user/productSearch/img_sample.jpg">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col">
						<div class="row border-bottom border-2 m-1 align-items-center">
							<div class="col p-0">
								<p class="productName m-0"><c:out value="${rt.trpdName}"/></p>
								<div class="starDiv d-inline-block mt-1" style="background: url(${path}/resources/images/user/icon_star2.gif) 0px 0px;">
									<p class="starP" style="width: <c:out value="${rt.trpdStarRating * 20}"/>%; background: url(${path}/resources/images/user/icon_star.gif) 0px 0px;">
									</p>
								</div>
								<p class="d-inline-block mt-0 px-1">
									<span style="font-size: small;">
										<a href="#" style="text-decoration: none;">0개 상품평</a>
									</span>
								</p>
							</div>
							
							<div class="col-3 text-end">
								<button id="btnHeart" type="button" class="btn btn-outline-danger rounded-circle" data-bs-html="true" data-bs-toggle="popover" data-bs-placement="top" data-bs-trigger="focus" data-bs-content="
								<div class='row p-1 text-center'>
									<div class='col'>찜 목록에 추가되었습니다.</div>
								</div>
								">
									<i class="bi bi-heart"></i>
								</button>
								<!-- <button type="button" id="btnHeart_filled" style="display: none;" class="btn btn-danger rounded-circle"><i class="bi bi-heart"></i></button> -->
								<button id="btnShare" type="button"  class="btn btn-outline-primary rounded-circle" data-bs-html="true" data-bs-toggle="popover" data-bs-placement="top" data-bs-trigger="focus" data-bs-content="
									<div class='sns_box px-3'>
										<div class='sns_button twitter'>
										<a href='###' title='Tweet'><i class='fa fa-twitter'></i></a>
										</div>
										<div class='sns_button facebook'>
										<a href='###' title='Facebook'><i class='fa fa-facebook'></i></a>
										</div>
										<div class='sns_button google'>
										<a href='###' title='google+'><i class='fa fa-google-plus'></i></a>
										</div>
										<div class='sns_button instagram'>
										<a href='###' title='Facebook'><i class='fa fa-instagram'></i></a>
										</div>
										<div class='sns_button pocket'>
										<a href='###' title='pocket'><i class='fa fa-get-pocket'></i></a>
										</div>
									</div>
								">
									<i class="bi bi-share-fill"></i>
								</button>
							</div>
						</div>
						<div class="row border-bottom border-1 m-1 py-2">
							<div class="col p-0 py-1">
								<fmt:parseNumber var="discountPercent" value="${(rt.trprListPrice - rt.trprDiscountPrice)/rt.trprListPrice }"/>
								<c:if test="${rt.trprListPrice ne rt.trprDiscountPrice}">
									<span class="d-inline ps-1 text-warning" style="font-size: small"><fmt:formatNumber value="${discountPercent}" type="percent"/> 할인</span>
									<span class="d-inline text-decoration-line-through px-1" style="font-size: small"><fmt:formatNumber value="${rt.trprListPrice}"/></span>
								</c:if>
								<p class="fw-bold px-1 text-danger productPrice m-0"><fmt:formatNumber value="${rt.trprDiscountPrice}" />원</p>
								
							</div>
						</div>
						<div class="row border-bottom border-1 m-1 py-2">
							<div class="col p-0 py-1">
								<!-- <p class="m-0 fw-bold">무료배송</p> -->
								<c:if test="${rt.trpdDeliveryFee eq 0}"><p class="m-0 fw-bold">무료배송</p></c:if>
								
								<p class="m-0" style="font-size: small;">
									<span id="arrivalDate" class="arrivalDate"></span>
									도착 보장 (2시간 36분 내 주문 시 / 서울⋅경기 기준)
								</p>
							</div>
						</div>
						<div class="row border-bottom border-1 m-1 py-2">
							<c:if test="${not empty rt.trpdOptionParentName1}">
								<div class="col-12 p-0 py-1" style="font-size: small">
									<c:out value="${rt.trpdOptionParentName1}"/>
									<br>
									<select id="trprOptionChildCd1" name="trprOptionChildCd1" class="form-select optSelect" style="width: 25%; font-size: small;">
										<option value="0">::선택::</option>
										<c:forEach items="${listOption}" var="item" varStatus="status">
											<c:if test="${item.tropSeq eq rt.trpdOptionParentCd1}">
												<option value="<c:out value="${item.trocSeq}"/>"><c:out value="${item.trocName}"/></option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</c:if>
							<c:if test="${not empty rt.trpdOptionParentName2}">
								<div class="col-12 p-0 py-1" style="font-size: small">
									<c:out value="${rt.trpdOptionParentName2}"/>
									<br>
									<select id="trprOptionChildCd2" name="trprOptionChildCd2" class="form-select optSelect" style="width: 25%; font-size: small;">
										<option value="0">::선택::</option>
										<c:forEach items="${listOption}" var="item" varStatus="status">
											<c:if test="${item.tropSeq eq rt.trpdOptionParentCd2}">
												<option value="<c:out value="${item.trocSeq}"/>"><c:out value="${item.trocName}"/></option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</c:if>
							<c:if test="${not empty rt.trpdOptionParentName3}">
								<div class="col-12 p-0 py-1" style="font-size: small">
									<c:out value="${rt.trpdOptionParentName3}"/>
									<br>
									<select id="trprOptionChildCd3" name="trprOptionChildCd3" class="form-select optSelect" style="width: 25%; font-size: small;">
										<option value="0">::선택::</option>
										<c:forEach items="${listOption}" var="item" varStatus="status">
											<c:if test="${item.tropSeq eq rt.trpdOptionParentCd3}">
												<option value="<c:out value="${item.trocSeq}"/>"><c:out value="${item.trocName}"/></option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</c:if>
						</div>
						
						<div class="row m-1 py-2 align-items-center">
							<div class="col-2 p-0">
								<input id="trorQuantity" name="trorQuantity" type="text" value="1" style="width: 38px;">
							</div>
							<div class="col px-1">
								<a tabindex="0" id="btnCart" class="btn btn-info w-100 rounded-0 text-white" data-bs-html="true" data-bs-toggle="popover" data-bs-placement="top" data-bs-trigger="focus" data-bs-content="
								<div class='row p-3 text-center'>
									<div class='col pb-3'>상품이 장바구니에 담겼습니다.</div>
									<a href='/infra/product/cartGeneral?ifmmSeq=${sessSeq}' class='btn btn-outline-primary'>장바구니 바로가기 ></a>
								</div>
								">장바구니 담기</a>
							</div>
							<div class="col p-0">
								<a id="btnCheckOut" class="btn btn-primary w-100 rounded-0">바로 구매 ></a>
							</div>
						</div>
						<div class="row m-1 py-2">
							<!--    tradProduct_real에서 뽑아온 정보가 들어갈 예정 -->
							<!-- 
							<ul class="productDetails">
								<li>의류 핏: 오버핏</li>
								<li>안감 종류: 기본</li>
								<li>소재: 폴리에스터</li>
								<li>색상계열: 블랙계열</li>
								<li>상의 사이즈: 남성 XL (105)</li>
								<li>쿠팡상품번호: 6111245966 - 11519354261</li>
							</ul>
							 -->
							<ul class="productDetails" style="list-style: none;">
								<li> </li>
								<li> </li>
								<li> </li>
								<li> </li>
								<li> </li>
								<li> </li>
							</ul>
						</div>
					</div>
					<div class="col-12">
						<c:out value="${rt.trpdDesc}"/>
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
							<c:forEach items="${listAd}" var="item" varStatus="status">
								<c:if test="${status.index le 4 }">							
									<div class="card">
										<a href="javascript:goView(<c:out value="${item.trpdSeq}"/>)" class="productLink link-dark">
											<img class="randomProduct" src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>">
											<span class="fs-6 d-block pt-2 px-1 pName"><c:out value="${item.trpdName}"/></span>
										</a>
										<p class="card-text fw-bold pt-2 px-1 mb-5 text-danger"><fmt:formatNumber value="${item.trprDiscountPrice}"/><span class="fw-light">원</span></p>
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
										<p class="card-text fw-bold pt-2 px-1 mb-5 text-danger"><fmt:formatNumber value="${item.trprDiscountPrice}"/><span class="fw-light">원</span></p>
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



			<div class="width65 row">
				<div class="col-12 text-center border border-top border-bottom p-0">
					<c:forEach items="${listUploaded}" var="item" varStatus="status">
						<c:if test="${item.type eq 1 }">
							<img src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>">				
						</c:if>
					</c:forEach>
				</div>
			</div>
			
			
		</form>
	</div>

	<%@include file="../include/footer.jsp"%>
	<%@include file="../include/jsLinks.jsp"%>
	
	
	<script type="text/javascript">
	
	var wishNy = false;
	
	$(document).ready(function(){
		
		$("#btnHeart").popover('disable');
		
		if("<c:out value="${sessSeq}"/>"){
			
			$.ajax({
				async: false
				,cache: false
				,type: "post"
				,url: "/infra/product/selectListWishList"
				,data: {"ifmmSeq" : "<c:out value="${sessSeq}"/>"}
				,success: function(data){
					
					console.log("<c:out value="${sessSeq}"/>" + "의 찜목록");
					console.log("--------");
					$.each(data, function(i){
						console.log((i+1) + ". " + data[i].trpdSeq + "번 상품");
						if(data[i].trpdSeq == "<c:out value="${vo.trpdSeq}"/>") {
							wishNy = true;
						}
					});
					console.log("--------");
					
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			})
			
			console.log("현재 상품 찜 여부 : " + wishNy);

		}
		if(wishNy == true){
			$("#btnHeart").removeClass("btn-outline-danger");
			$("#btnHeart").addClass("btn-danger");
			$("#btnHeart").popover('disable');
			console.log("disable");
		} else {
			$("#btnHeart").addClass("btn-outline-danger");
			$("#btnHeart").removeClass("btn-danger");
			$("#btnHeart").popover('enable');
			console.log("enable");
		}
		
	});
	
	$("#btnHeart").on("click", function(){
		
		if(!"<c:out value="${sessSeq}"/>"){
			location.href="/infra/login/loginForm";
		}
		
		if(wishNy == false){
			
			//insert ajax start
			
			$.ajax({
				async: false
				,cache: false
				,type:"post"
				,url: "/infra/product/insertWishList"
				,data : { "ifmmSeq" : "<c:out value="${sessSeq}"/>" , "trpdSeq" : "<c:out value="${vo.trpdSeq}"/>" }
				,success: function(response){
					$("#btnHeart").popover('disable');
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
			
			//insert ajax end
			
			wishNy = true;
			
			console.log("현재 상품 찜 여부 : " + wishNy);		
			
			$("#btnHeart").removeClass("btn-outline-danger");
			$("#btnHeart").addClass("btn-danger");
			
		} else {
			//if(wishNy == true)
				
			//delete ajax start
			
			$.ajax({
				async: false
				,cache: false
				,type:"post"
				,url: "/infra/product/deleteWishList"
				,data : { "ifmmSeq" : "<c:out value="${sessSeq}"/>" , "trpdSeq" : "<c:out value="${vo.trpdSeq}"/>" }
				,success: function(response){
					$("#btnHeart").popover('enable');
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
			
			//delete ajax end
			
			wishNy = false;
			
			console.log("현재 상품 찜 여부 : " + wishNy);		
			$("#btnHeart").addClass("btn-outline-danger");
			$("#btnHeart").removeClass("btn-danger");
			
		}
						
			
	});
	</script>
	
	
	<!-- 
	<script type="text/javascript">
	goCartGeneral = function(){
		
		$("#formView").attr("action", "/infra/product/cartGeneral");
		$("#formView").submit();
		
	}
	</script>
	 -->
	 
	<script type="text/javascript">
	
	$("#btnMyCart").on("click", function(){
		$("#formView").attr("action", "/infra/product/cartGeneral").submit();
	});
	
	goWishList = function(){
		$("#formView").attr("action", "/infra/product/cartWishlist").submit();
	}
	
	goOrderList = function(){
		$("#formView").attr("action", "/infra/product/orderList").submit();
	}
	
	</script>

	
	<script type="text/javascript">
	
	$(function(){
		$("#btnCart").popover('disable');
		
		$("#btnShare").popover('enable');
		
	});
	
	var opCount = 0;
	
	if("<c:out value="${rt.trpdOptionParentName1}"/>" != ""){
		opCount++;
	}
	if("<c:out value="${rt.trpdOptionParentName2}"/>" != ""){
		opCount++;
	}
	if("<c:out value="${rt.trpdOptionParentName3}"/>" != ""){
		opCount++;
	}
	
	$(document).ready(function(){
		if(opCount == 0){
			// ajax
			 $.ajax({
				  async: true
				  ,cache: false
				  ,type:"post"
				  ,url: "/infra/product/selectOneProduct_Real"
				  ,data : { "trpdSeq" : "<c:out value="${vo.trpdSeq}"/>" }
				  ,success: function(data){
						console.log(data.trprSeq + " " + data.trprListPrice);
						$("#trprSeqValue").val(data.trprSeq);
						$("#btnCart").popover('enable');
				  }
				  ,error : function(jqXHR, textStatus, errorThrown){
						alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
					}
			  });
			 //
		}
	});
	
	
	
	
	
	$(".optSelect").on("change", function(){
		
		if(opCount == 1) {
			if($("#trprOptionChildCd1").val() != 0){
				/* alert("1옵션짜리 trpr결정"); */
				
				if("<c:out value="${sessSeq}"/>"){
					$("#btnCart").popover('enable');
				}
				
				// ajax
				 $.ajax({
					  async: true
					  ,cache: false
					  ,type:"post"
					  ,url: "/infra/product/selectOneProduct_Real"
					  ,data : { "trpdSeq" : "<c:out value="${vo.trpdSeq}"/>", "trprOptionChildCd1" : $("#trprOptionChildCd1").val() }
					  ,success: function(data){
							console.log(data.trprSeq + " " + data.trprListPrice);
							$("#trprDiscountPrice").val(data.trprDiscountPrice);
							$("#trprSeqValue").val(data.trprSeq);
					  }
					  ,error : function(jqXHR, textStatus, errorThrown){
							alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
						}
				  });
				 //
				 
				 var select1 = document.querySelector("#trprOptionChildCd1");
				 
				 $("#trprFullNameArray").val("<c:out value="${rt.trpdName}"/>" + "，" + select1.options[select1.selectedIndex].text);
				 
			} else {
				$("#btnCart").popover('disable');
			}
		} else if(opCount == 2) {
			if($("#trprOptionChildCd1").val() != 0 && $("#trprOptionChildCd2").val() != 0){
				/* alert("2옵션짜리 trpr결정"); */
				
				if("<c:out value="${sessSeq}"/>"){
					$("#btnCart").popover('enable');
				}
				
				// ajax
				 $.ajax({
					  async: true
					  ,cache: false
					  ,type:"post"
					  ,url: "/infra/product/selectOneProduct_Real"
					  ,data : { "trpdSeq" : "<c:out value="${vo.trpdSeq}"/>", "trprOptionChildCd1" : $("#trprOptionChildCd1").val(), "trprOptionChildCd2" : $("#trprOptionChildCd2").val() }
					  ,success: function(data){
							console.log(data.trprSeq + " " + data.trprListPrice);
							$("#trprDiscountPrice").val(data.trprDiscountPrice);
							$("#trprSeqValue").val(data.trprSeq);
					  }
					  ,error : function(jqXHR, textStatus, errorThrown){
							alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
						}
				  });
				 //
				 
				 var select1 = document.querySelector("#trprOptionChildCd1");
				 var select2 = document.querySelector("#trprOptionChildCd2");

				 $("#trprFullNameArray").val("<c:out value="${rt.trpdName}"/>" + "，" + select1.options[select1.selectedIndex].text + "，" + select2.options[select2.selectedIndex].text);
				 
				 
			} else {
				$("#btnCart").popover('disable');
			}
		} else if(opCount == 3) {
			if($("#trprOptionChildCd1").val() != 0 && $("#trprOptionChildCd2").val() != 0 && $("#trprOptionChildCd3").val() != 0){
				/* alert("3옵션짜리 trpr결정"); */
				
				if("<c:out value="${sessSeq}"/>"){
					$("#btnCart").popover('enable');
				}
				
				// ajax
				 $.ajax({
					  async: true
					  ,cache: false
					  ,type:"post"
					  ,url: "/infra/product/selectOneProduct_Real"
					  ,data : { "trpdSeq" : "<c:out value="${vo.trpdSeq}"/>", "trprOptionChildCd1" : $("#trprOptionChildCd1").val(), "trprOptionChildCd2" : $("#trprOptionChildCd2").val(), "trprOptionChildCd3" : $("#trprOptionChildCd3").val() }
					  ,success: function(data){
						  console.log(data.trprSeq + " " + data.trprListPrice);
						  $("#trprDiscountPrice").val(data.trprDiscountPrice);
						  $("#trprSeqValue").val(data.trprSeq);
					  }
					  ,error : function(jqXHR, textStatus, errorThrown){
							alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
						}
				  });
				 //
				 
				 var select1 = document.querySelector("#trprOptionChildCd1");
				 var select2 = document.querySelector("#trprOptionChildCd2");
				 var select3 = document.querySelector("#trprOptionChildCd3");
				 
				 $("#trprFullNameArray").val("<c:out value="${rt.trpdName}"/>" + "，" + select1.options[select1.selectedIndex].text + "，" + select2.options[select2.selectedIndex].text + "，" + select3.options[select3.selectedIndex].text);
				 
			} else {
				$("#btnCart").popover('disable');
			}
		}
		
	});
	
	$("#btnCart").on("click", function(){
		
		if(!"<c:out value="${sessSeq}"/>"){
			alert("로그인 시 이용가능합니다.");
			return false;
		}
		
		if(opCount == 0){
			
			
			
			$.ajax({
				async: true
				, cache: false
				, type: "post"
				, url: "/infra/product/insertCartGeneral"
				, data: { "ifmmSeq" : "<c:out value="${sessSeq}"/>", "trprSeq" : $("#trprSeqValue").val(), "trctQuantity" : $("#trorQuantity").val()}
				, success: function(response) {
					/* alert(response.rt); */
				}
				, error: function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
			
			
		} else if(opCount == 1){
			if($("#trprOptionChildCd1").val() == 0){
				alert("옵션 선택을 완료해주세요.");
				return false;
			} else {
				/* alert("상품이 장바구니에 추가되었습니다. ajax실행"); */
				$.ajax({
					async: true
					, cache: false
					, type: "post"
					, url: "/infra/product/insertCartGeneral"
					, data: { "ifmmSeq" : "<c:out value="${sessSeq}"/>", "trprSeq" : $("#trprSeqValue").val(), "trctQuantity" : $("#trorQuantity").val()}
					, success: function(response) {
						/* alert(response.rt); */
					}
					, error: function(jqXHR, textStatus, errorThrown){
						alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
					}
				});
			}
		} else if(opCount == 2){
			if($("trprOptionChildCd1").val() == 0 || $("#trprOptionChildCd2").val() == 0){
				alert("옵션 선택을 완료해주세요.");
				return false;
			} else {
				/* alert("상품이 장바구니에 추가되었습니다. ajax실행"); */
				$.ajax({
					async: true
					, cache: false
					, type: "post"
					, url: "/infra/product/insertCartGeneral"
					, data: { "ifmmSeq" : "<c:out value="${sessSeq}"/>", "trprSeq" : $("#trprSeqValue").val(), "trctQuantity" : $("#trorQuantity").val()}
					, success: function(response) {
						/* alert(response.rt); */
					}
					, error: function(jqXHR, textStatus, errorThrown){
						alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
					}
				});
			}
		} else if(opCount == 3){
			if($("trprOptionChildCd1").val() == 0 || $("#trprOptionChildCd2").val() || $("#trprOptionChildCd3").val() == 0){
				alert("옵션 선택을 완료해주세요.");
				return false;
			} else {
				/* alert("상품이 장바구니에 추가되었습니다. ajax실행"); */
				$.ajax({
					async: true
					, cache: false
					, type: "post"
					, url: "/infra/product/insertCartGeneral"
					, data: { "ifmmSeq" : "<c:out value="${sessSeq}"/>", "trprSeq" : $("#trprSeqValue").val(), "trctQuantity" : $("#trorQuantity").val()}
					, success: function(response) {
						/* alert(response.rt); */
					}
					, error: function(jqXHR, textStatus, errorThrown){
						alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
					}
				});
			}
		}
		
	});
	
	$("#btnCheckOut").on("click", function(){
		
		if(!"<c:out value="${sessSeq}"/>"){
			alert("로그인 시 이용가능합니다.");
			return false;
		}
		
		if(opCount == 0){
			// by pass
		} else if(opCount == 1){
			if($("#trprOptionChildCd1").val() == 0){
				alert("옵션 선택을 완료해주세요.");
				return false;
			}
		} else if(opCount == 2){
			if($("#trprOptionChildCd1").val() == 0 || $("#trprOptionChildCd2").val() == 0){
				alert("옵션 선택을 완료해주세요.");
				return false;
			}
		} else if(opCount == 3){
			if($("#trprOptionChildCd1").val() == 0 || $("#trprOptionChildCd2").val() == 0 || $("#trprOptionChildCd3").val() == 0){
				alert("옵션 선택을 완료해주세요.");
				return false;
			}
		}
		
		$("#totalProduct").val($("#trprDiscountPrice").val() * $("#trorQuantity").val());
		$("#totalMoney").val(Number($("#totalProduct").val()) + Number($("#totalDelivery").val()));
		$("#formView").attr("action", "/infra/product/productCheckOut").submit();
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
						location.href = "/infra/product/productView?trpdSeq=${vo.trpdSeq}";
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
			$("#formView").attr("action", "/infra/product/productSearch");
			$("#formView").submit();
		});
		
	</script>
	
	<script type="text/javascript">
	
	$("#trorQuantity").spinner({
		min: 1
		, spin : function(event, ui){
			$("#trctQuantityArray").val(ui.value);
		}
	});
	
	</script>
	
	<script type="text/javascript">
	function enterkey(){
		if (window.event.keyCode == 13){
			$("#formView").attr("action", "/infra/product/productSearch");
			$("#formView").submit();
		}
	}
	</script>
	
	<script type="text/javascript">
		const arrivalDate = document.querySelector("#arrivalDate");

		const today = new Date();
		const tomorrow = new Date(today.setDate(today.getDate() + 1));

		const month = tomorrow.getMonth() + 1;
		const date = tomorrow.getDate();
		const day = tomorrow.getDay();

		const weekDay = ["일","월","화","수","목","금","토"];
		
		arrivalDate.innerText = "내일(" + weekDay[day] + ") " + String(month).padStart(2,"0") + "/" + String(date).padStart(2,"0");
	</script>

	<script type="text/javascript">
	
	const mainImg = document.getElementById("mainImg");
	const allImg = document.getElementsByName("allImg");
	
	allImg[0].className = "curImg";
	
	$("img[name=allImg]").on("mouseenter", function(e){
		
		$("img[name=allImg]").removeClass("curImg");
		
		e.target.classList.add("curImg");
		mainImg.src = e.target.src;
	});
	
	/* 
	$("img[name=allImg]").on("mouseleave", function(e){
		e.target.className = "";
	});
	 */
	 
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
		 $("#formView").attr("action", "/infra/product/productView").submit();
	 }
	 
	</script>

</body>
</html>