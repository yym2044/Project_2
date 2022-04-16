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
<%@include file="../include/cssLinks.jsp" %>


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
							
							<c:forEach items="${listCartGeneral}" var="item" varStatus="status">
								<tr style="height: 120px;">
									<td class="px-3 text-start" style="width: 50px;">
										<input type="checkbox" value="${item.trctSeq}">
									</td>
									<td class="px-2" style="width: 94px;">
										<img src="${item.path}${item.uuidName}" style="width: 78px;">
									</td>
									<td class="px-2">
										<div class="row">
											<div class="col-12 text-start border-bottom py-2">
												<a class="m-0 text-muted fw-bold" style="text-decoration: none;" href="/infra/product/productView"><c:out value="${item.trpdName}"/>
													<c:if test="${!empty item.trprOptionChildName1}">,${item.trprOptionChildName1}</c:if>
													<c:if test="${!empty item.trprOptionChildName2}">,${item.trprOptionChildName2}</c:if>
													<c:if test="${!empty item.trprOptionChildName3}">,${item.trprOptionChildName3}</c:if>
												</a>
											</div>
											
											<div class="col-6 text-start pt-3">
												<p class="m-0">
													<span class="arrivalDate fs-6 fw-light">내일(월) 3/28</span>
													도착 보장
												</p>
											</div>
											<div class="col-3 text-end pt-2">
												<span class="fw-light"><fmt:formatNumber value="${item.trprDiscountPrice}"/>원</span>
												<input id="trctDiscountPrice${status.index}" type="hidden" value="<c:out value="${item.trprDiscountPrice}"/>">
												<input id="trctQuantity${status.index}" name="trctQuantity" type="text" value="${item.trctQuantity}" style="width: 38px;">
											</div>
											<div id="priceQuantity${status.index}" class="col-3 pt-2">
												<span class="fw-light"><fmt:formatNumber value="${item.trprDiscountPrice * item.trctQuantity}"/>원</span>
												<button class="btn btn-outline-secondary">X</button>
											</div>
										</div>
									</td>
									<td class="px-2">28,900원</td>
									<td class="px-2">무료</td>
								</tr>
							</c:forEach>
							<%-- 
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
							 --%>
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
	</script>
	
	<script type="text/javascript">
	
	function addComma(value){
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return value; 
    }
	
	$("input[name=trctQuantity]").each(function(i){
		$("#trctQuantity" + i).spinner({
			min: 1
			, spin : function(event, ui){
				$("#priceQuantity" + i).children().remove();
				
				var totalPrice = ui.value * Number($("#trctDiscountPrice" + i).val());	//숫자형
				var totalPriceWithComma = addComma(String(totalPrice));					//문자형으로 변환해야 addComma 함수 사용 가능
				
				$("#priceQuantity" + i).append("<span class='fw-light'>" + totalPriceWithComma + "원</span>");
				$("#priceQuantity" + i).append(" <button class='btn btn-outline-secondary'>X</button>");
			}
		})
	})
	
	</script>
	
	<script type="text/javascript">
	
	$(function() {
		
		console.log("<c:out value="${vo.ifmmSeq}"/>")
		
	});
	
	</script>
	
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