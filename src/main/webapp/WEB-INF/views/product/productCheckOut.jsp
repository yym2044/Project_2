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
<title>쿠팡! 주문/결제</title>
<%@include file="../include/cssLinks.jsp" %>

<style type="text/css">
th {
	width: 20%;
	text-align: right;
	vertical-align: middle;
}

td {
	height: 50px;
	text-align: left;
	vertical-align: middle;
}
</style>

</head>
<body>

	<div class="container-fluid">
	<form id="formCheck1" method="post" action="">
		<input type="hidden" name="ifmmSeq" value="${sessSeq}">

		<div class="row border-bottom py-3 pt-4">
			<div class="col offset-2">
				<a href="/infra/home"><img src="${path}/resources/images/user/mainPage/coupang2.png" style="width: 175px;"></a>
			</div>
		</div>

		<div class="width65">
			<div class="row border-bottom border-4 py-2 mt-2 align-items-end">
				<div class="col p-0">
					<h2>주문/결제</h2>
				</div>
				<div class="col text-end p-0">주문결제>주문완료</div>
			</div>

			<div class="row py-3">
				<p class="col-12 p-0 mb-0 fw-bold fs-5">구매자 정보</p>
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0 border-top border-3">
							<tr>
								<th class="bg-light px-2">이름</th>
								<td class="px-2"><c:out value="${rt.ifmmName}"/></td>
							</tr>
							<tr>
								<th class="bg-light px-2">이메일</th>
								<td class="px-2"><c:out value="${rt.ifmeEmailFull}"/></td>
							</tr>
							<tr>
								<th class="bg-light px-2">휴대폰 번호</th>
								<td class="px-2">
								<c:choose>
									<c:when test="${fn:length(rt.ifmpNumber) eq 10 }">
										<c:out value="${fn:substring(rt.ifmpNumber,0,3)}" />-<c:out value="${fn:substring(rt.ifmpNumber,3,6)}" />-<c:out value="${fn:substring(rt.ifmpNumber,6,10)}" />
									</c:when>
									<c:otherwise>
										<c:out value="${fn:substring(rt.ifmpNumber,0,3)}" />-<c:out value="${fn:substring(rt.ifmpNumber,3,7)}" />-<c:out value="${fn:substring(rt.ifmpNumber,7,11)}" />
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="row py-3">
				<p class="col-2 p-0 mb-0 fw-bold fs-5 d-inline">받는 사람 정보</p>
				<button class="btn btn-primary" style="width: 8%; font-size: x-small;">배송지변경</button>
				<div class="col-12 p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0 border-top border-3">
							<tr>
								<th class="bg-light px-2">이름</th>
								<td class="px-2">
									<c:out value="${rt.ifmmName}"/>
									<span class="badge rounded-pill bg-primary">기본배송지</span>
								</td>
							</tr>
							<tr>
								<th class="bg-light px-2">배송주소</th>
								<td class="px-2"><c:out value="${rt.ifmaAddress1}"/><br><c:out value="${rt.ifmaAddress2}"/></td>
							</tr>
							<tr>
								<th class="bg-light px-2">연락처</th>
								<td class="px-2">
								<c:choose>
									<c:when test="${fn:length(rt.ifmpNumber) eq 10 }">
										<c:out value="${fn:substring(rt.ifmpNumber,0,3)}" />-<c:out value="${fn:substring(rt.ifmpNumber,3,6)}" />-<c:out value="${fn:substring(rt.ifmpNumber,6,10)}" />
									</c:when>
									<c:otherwise>
										<c:out value="${fn:substring(rt.ifmpNumber,0,3)}" />-<c:out value="${fn:substring(rt.ifmpNumber,3,7)}" />-<c:out value="${fn:substring(rt.ifmpNumber,7,11)}" />
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<th class="bg-light px-2">배송 요청사항</th>
								<td class="px-2"><span class="pe-3">문 앞</span><button class="btn btn-sm btn-primary">변경</button></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="row py-3">
				<p class="col-12 p-0 mb-0 fw-bold fs-5">배송 1건 중 1</p>
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<input type="hidden" id="checkboxTrprArray" name="checkboxTrprArray" value="<c:out value="${rtProductSeq}"/>">
						<table class="table table-sm p-0">
							<tr>
								<td colspan="2" class="bg-light px-2">
									<span id="arrivalDate" class="arrivalDate">내일(월) 3/28</span>
									도착 보장
								</td>
							</tr>
							<c:forEach var="i" begin="0" end="${fn:length(dto.checkboxTrprArray)-1}">
							<tr>
								<td class="productName px-2">
								<%-- <input type="text" name="checkboxTrprArray" value="<c:out value="${rtProductSeq[i]}"/>"> --%>
								<c:out value="${rtProductName[i]}"/>
								</td>
								<td class="text-end px-2" style="font-weight: lighter;">수량 <c:out value="${rtProductQuantity[i]}"/>개 / 무료배송</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>

			<div class="row py-3">
				<p class="col-12 p-0 mb-0 fw-bold fs-5">결제정보</p>
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0 border-top border-3">
							<tr>
								<th class="bg-light px-2">총상품가격</th>
								<td class="px-2"><fmt:formatNumber value="${dto.totalProduct}"/>원<input type="hidden" name="totalProduct" value="${dto.totalProduct}"></td>
							</tr>
							<tr>
								<th class="bg-light px-2">할인쿠폰</th>
								<td class="px-2">0원</td>
							</tr>
							<tr>
								<th class="bg-light px-2">배송비</th>
								<td class="px-2"><fmt:formatNumber value="${dto.totalDelivery}"/>원<input type="hidden" name="totalDelivery" value="${dto.totalDelivery}"></td>
							</tr>
							<tr>
								<th class="bg-light px-2">쿠팡캐시</th>
								<td class="px-2">0원</td>
							</tr>
							<tr>
								<th class="bg-light px-2">총결제금액</th>
								<td class="px-2"><fmt:formatNumber value="${dto.totalMoney}"/>원<input type="hidden" name="totalMoney" value="${dto.totalMoney}"></td>
							</tr>
							<tr>
								<th class="bg-light px-2">결제방법</th>
								<td class="px-2"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col text-center">
					<a class="lh-lg btn btn-outline-danger rounded-0" href="javascript:history.back();" style="width: 200px;">취소</a>
					<a class="lh-lg btn btn-outline-primary rounded-0" href="javascript:goPurchase();" style="width: 200px;">결제하기</a>
				</div>
			</div>
		</div>




</form>

	</div>

	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/jsLinks.jsp" %>
	
	<script type="text/javascript">
	
	const arrivalDate = document.querySelector("#arrivalDate");
	
	const today = new Date();
	const tomorrow = new Date(today.setDate(today.getDate() + 1));
	
	const month = tomorrow.getMonth() + 1;
	const date = tomorrow.getDate();
	const day = tomorrow.getDay();
	let weekDay = "";
	
	if(day == 0) weekDay = "일"; else if(day == 1) weekDay = "월"; else if(day == 2) weekDay = "화"; else if(day == 3) weekDay = "수";
	else if(day == 4) weekDay = "목"; else if(day == 5) weekDay = "금"; else if(day == 6) weekDay = "토";
	
	arrivalDate.innerText = "내일(" + weekDay + ") " + month + "/" + date;
	
	</script>
	
	<script type="text/javascript">
	
	$("#checkboxTrprArray").val(JSON.parse($("#checkboxTrprArray").val()));
	
	goPurchase = function(){
		$("#formCheck1").attr("action", "/infra/product/productCheckOut2").submit();
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

</body>
</html>