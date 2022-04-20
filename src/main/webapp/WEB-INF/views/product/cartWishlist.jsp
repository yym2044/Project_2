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

	<form id="formCart" method="post">
		<input type="hidden" value="${sessSeq}" name="ifmmSeq">
		<input type="hidden" id="trpdSeq" name="trpdSeq">
	</form>

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
					<li class="nav-item"><a class="nav-link fs-4" href="javascript:goCartGeneral();">일반구매</a></li>
					<li class="nav-item"><a class="nav-link active fs-4 disabled" aria-current="page" href="">찜 목록</a></li>
					<li class="nav-item"><a class="nav-link fs-4" href="javascript:goCartRegular();">정기배송</a></li>
				</ul>
			</div>

			<div class="row py-3">
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0 border-top border-3">
							<c:choose>
								<c:when test="${fn:length(wishList) eq 0}">
									<tr style="height: 100px;">
										<td colspan="5" class="text-center fs-6 fw-bold">찜한 상품이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th colspan="4" class="bg-light text-start px-3">
											<input id="checkboxAll" class="form-check-input" type="checkbox">
										</th>
									</tr>
									<c:forEach items="${wishList}" var="item" varStatus="status">
										<tr style="height: 120px;">
											<td class="px-3 text-start" style="width: 50px;">
												<input name="checkboxTrpd" class="form-check-input" type="checkbox">
											</td>
											<td class="px-2" style="width: 94px;">
												<c:choose>
													<c:when test="${!empty item.uuidName}">
														<img src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>" style="width: 78px;">
													</c:when>
													<c:otherwise>
														<img src="${path}/resources/images/user/productSearch/img_sample.jpg" style="width: 78px;">
													</c:otherwise>
												</c:choose>
											</td>
											<td class="px-2">
												<div class="row">
													<div class="col-12 text-start pb-1 fw-light" style="font-size: small;">
														<c:choose>
															<c:when test="${item.trpdDeliveryFee eq 0 or empty item.trpdDeliveryFee}">
																무료배송
															</c:when>
															<c:otherwise>
																배송비 <fmt:formatNumber value="${item.trpdDeliveryFee}"/>원
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-12 text-start pb-2">
														<a class="m-0 text-muted fw-bold" style="text-decoration: none;" href="javascript:goView(<c:out value="${item.trpdSeq}"/>)"><c:out value="${item.trpdName}"/></a>
													</div>
													<div class="col-12 text-start pb-2 fw-bold text-danger">
														<c:if test="${!empty item.trpdPrice}">
															<fmt:formatNumber value="${item.trpdPrice}"/>원
														</c:if>
													</div>
												</div>
											</td>
											<td class="px-2">
												<button class="btn btn-outline-primary w-100 mb-1">장바구니 담기</button>
												<a href="javascript:goDelete(<c:out value="${item.trpdSeq}"/>)" class="btn btn-outline-danger w-100">삭제</a>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
			</div>
		</div>






	</div>

	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/jsLinks.jsp" %>

	<script type="text/javascript">
	
	goView = function(trpdSeq){
		$("#trpdSeq").val(trpdSeq);
		$("#formCart").attr("action", "/infra/product/productView").submit();
	}
	
	goDelete = function(trpdSeq){
		var confirmNy = confirm("상품을 찜 목록에서 삭제할까요?");
		if(confirmNy){
			$.ajax({
				async: false
				, cache: false
				, type: "post"
				, url: "/infra/product/deleteWishList"
				, data: { "ifmmSeq" : "<c:out value="${sessSeq}"/>" ,"trpdSeq" : trpdSeq }
				, success : function(response){
					
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
		location.reload();
	}
	
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
			$("input[name=checkboxTrpd]").prop("checked", true);
		} else {
			$("input[name=checkboxTrpd]").prop("checked", false);
		}
	});
	
	$("input[name=checkboxTrpd]").click(function(){
		var total = $("input[name=checkboxTrpd]").length;
		var checked = $("input[name=checkboxTrpd]:checked").length;
		
		if(total != checked){
			$("#checkboxAll").prop("checked", false);
		} else {
			$("#checkboxAll").prop("checked", true);
		}
	});
	</script>
	
	<script src="${path}/resources/common/js/cart.js"></script>
</body>
</html>