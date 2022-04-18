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

	<form id="formCart" method="post">
		<input type="hidden" name="ifmmSeq" value="${sessSeq}">
		<input type="hidden" name="checkboxTrprArray">
		<input type="hidden" name="trprFullNameArray">

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
					<li class="nav-item"><a class="nav-link active fs-4 disabled" aria-current="page" href="">일반구매</a></li>
					<li class="nav-item"><a class="nav-link fs-4" href="javascript:goCartWishList();">찜 목록</a></li>
					<li class="nav-item"><a class="nav-link fs-4" href="javascript:goCartRegular()">정기배송</a></li>
				</ul>
			</div>

			<div class="row py-3">
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0 border-top border-3">
							<tr>
								<th colspan="2" class="bg-light text-start px-3">
									<input id="checkboxAll" class="form-check-input" type="checkbox">
								</th>
								<th class="bg-light px-2">상품정보</th>
								<th class="bg-light px-2" style="width: 89px;">상품금액</th>
								<th class="bg-light px-2" style="width: 88px;">배송비</th>
							</tr>
							
							<c:forEach items="${listCartGeneral}" var="item" varStatus="status">
								<tr style="height: 120px;">
									<td class="px-3 text-start" style="width: 50px;">
										<input id="checkboxTrpr${status.index}" name="checkboxTrpr" class="form-check-input" type="checkbox" value="${item.trprSeq}">
										<input id="trprFullName${status.index}" name="trprFullName" type="text" value="<c:out value="${item.trpdName}"/><c:if test="${!empty item.trprOptionChildName1}"> ${item.trprOptionChildName1}</c:if><c:if test="${!empty item.trprOptionChildName2}"> ${item.trprOptionChildName2}</c:if><c:if test="${!empty item.trprOptionChildName3}"> ${item.trprOptionChildName3}</c:if>">
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
												<input id="priceQuantityHidden${status.index}" name="priceQuantityHidden" type="hidden" value="<c:out value="${item.trprDiscountPrice * item.trctQuantity}"/>">
												<input id="trctQuantity${status.index}" name="trctQuantityArray" type="text" value="${item.trctQuantity}" style="width: 38px;">
											</div>
											<div id="priceQuantity1_${status.index}" class="col-3 pt-2">
												<span class="fw-light"><fmt:formatNumber value="${item.trprDiscountPrice * item.trctQuantity}"/>원</span>
												<button onclick="goDelete(${item.trctSeq})" class="btn btn-outline-secondary">X</button>
											</div>
										</div>
									</td>
									<td id="priceQuantity2_${status.index}" class="px-2"><span><fmt:formatNumber value="${item.trprDiscountPrice * item.trctQuantity}"/>원</span></td>
									<td class="px-2">
										<c:choose>
											<c:when test="${item.trpdDeliveryFee eq 0 or empty item.trpdDeliveryFee}">무료<input id="trctDeliveryFee${status.index}" type="hidden" value="0"></c:when>
											<c:otherwise><fmt:formatNumber value="${item.trpdDeliveryFee}"/>원<input id="trctDeliveryFee${status.index}" type="hidden" value="${item.trpdDeliveryFee}"></c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" class="bg-light text-end p-3">
									상품가격
									<span id="priceQuantityTotal" class="fs-5"></span>원
									<button class="rounded-pill" disabled><i class="fa-solid fa-plus"></i></button>
									배송비
									<span id="deliveryFeeTotal" class="fs-5"></span>원
									<button class="rounded-pill" disabled><i class="fa-solid fa-equals"></i></button>
									주문금액
									<span id="moneyTotal" class="fs-5 fw-bold"></span>원
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col text-center">
					<a class="lh-lg btn btn-outline-danger" href="/infra/home" style="width: 200px;">계속 쇼핑하기</a>
<!-- 				<a href="/infra/product/productCheckOut2" class="lh-lg btn btn-outline-primary" style="width: 200px;">구매하기</a> -->
					<a id="btnCheckOut" class="lh-lg btn btn-outline-primary" style="width: 200px;">구매하기</a>
				</div>
			</div>
		</div>






	</div>
</form>
	
	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/jsLinks.jsp" %>
	
	
	<script type="text/javascript">
		
	goDelete = function(trctSeq){
		var confirmNy = confirm("해당 상품을 삭제합니다." + trctSeq);
		if(confirmNy){
			$.ajax({
				async: true
				, cache: false
				, type: "post"
				, url: "/infra/product/deleteCartGeneral"
				, data: { "trctSeq" : trctSeq }
				, success : function(response){
					if(response.rt == "success"){
						alert("삭제성공");
						location.reload();
					} else {
						return false;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		} else {
			return false;
		}
	}
	
	</script>
	
	<script type="text/javascript">
	
	function addComma(value){
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return value; 
    };
	
	$(document).ready(function(){
		var allTotalPrice = 0;
		var allDeliveryFee = 0;
		$("input[name=priceQuantityHidden]").each(function(i){
			allTotalPrice += Number($(this).val());
			allDeliveryFee += Number($("#trctDeliveryFee" + i).val());
		});
		var allMoney = allTotalPrice + allDeliveryFee;
		var allTotalPriceWithComma = addComma(String(allTotalPrice));
		var allDeliveryFeeWithComma = addComma(String(allDeliveryFee));
		var allMoneyWithComma = addComma(String(allMoney));
		
		$("#priceQuantityTotal").append("<span>" + allTotalPriceWithComma + "</span>");
		$("#deliveryFeeTotal").append("<span>" + allDeliveryFeeWithComma + "</span>");
		$("#moneyTotal").append("<span>" + allMoneyWithComma + "</span>")
	});	
	
	$("input[name=trctQuantityArray]").each(function(i){
		$("#trctQuantity" + i).spinner({
			min: 1
			, spin : function(event, ui){
				$("#priceQuantity1_" + i).children().remove();
				$("#priceQuantity2_" + i).children().remove();
				$("#priceQuantityTotal").children().remove();
				$("#moneyTotal").children().remove();
				
				var totalPrice = ui.value * Number($("#trctDiscountPrice" + i).val());	//숫자형
				var totalPriceWithComma = addComma(String(totalPrice));					//문자형으로 변환해야 addComma 함수 사용 가능
				allTotalPrice = 0;
				allDeliveryFee = 0;
				
				$("#priceQuantity1_" + i).append("<span class='fw-light'>" + totalPriceWithComma + "원</span>");
				$("#priceQuantity1_" + i).append(" <button class='btn btn-outline-secondary'>X</button>");
				$("#priceQuantity2_" + i).append("<span>" + totalPriceWithComma + "원</span>");
				
				$("#priceQuantityHidden" + i).val(totalPrice);
				
				$("input[name=priceQuantityHidden]").each(function(){
					allTotalPrice += Number($(this).val());
					allDeliveryFee += Number($("#trctDeliveryFee" + i).val());
				});
				
				allTotalPriceWithComma = addComma(String(allTotalPrice));
				
				allMoney = allTotalPrice + allDeliveryFee;
				allMoneyWithComma = addComma(String(allMoney));
				
				$("#priceQuantityTotal").append("<span>" + allTotalPriceWithComma + "</span>");
				$("#moneyTotal").append("<span>" + allMoneyWithComma + "</span>");
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
	
	<script type="text/javascript">
	$("#checkboxAll").click(function(){
		if($("#checkboxAll").is(":checked")){
			$("input[name=checkboxTrpr]").prop("checked", true);
		} else {
			$("input[name=checkboxTrpr]").prop("checked", false);
		}
	});
	
	$("input[name=checkboxTrpr]").click(function(){
		var total = $("input[name=checkboxTrpr]").length;
		var checked = $("input[name=checkboxTrpr]:checked").length;
		
		if(total != checked){
			$("#checkboxAll").prop("checked", false);
		} else {
			$("#checkboxAll").prop("checked", true);
		}
	});
	
	//체크박스 다수를 담을 배열
	var checkboxTrprArray = [];
	var trprFullNameArray = [];
	
	$("#btnCheckOut").on("click", function(){
		if($("input[name=checkboxTrpr]:checked").length == 0){
			alert("상품을 선택해주세요");
			return false;
		} else {
			$("input[name=checkboxTrpr]:checked").each(function(){
				checkboxTrprArray.push($(this).val());
			});
			
			for(var i=0; i<$("input[name=checkboxTrpr]").length; i++){
				if($("#checkboxTrpr" + i).is(":checked")){
					trprFullNameArray.push($("#trprFullName" + i).val());
				}
			}
			
			$("input:hidden[name=checkboxTrprArray]").val(checkboxTrprArray);
			$("input:hidden[name=trprFullNameArray]").val(trprFullNameArray);
			
			$("#formCart").attr("action", "/infra/product/productCheckOut").submit();
		}
	});
	
	</script>
	
	<script src="${path}/resources/common/js/cart.js"></script>
	
</body>
</html>