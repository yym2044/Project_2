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
<%@include file="../include/cssLinks.jsp"%>

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

	<!-- 기본 배송지 세팅 -->
	<c:forEach items="${listShippingAddress}" var="item" varStatus="status">
		<c:if test="${item.ifsaDefaultNy eq 1}">
			<c:set var="ifsaName" value="${item.ifsaName}"/>
			<c:set var="ifsaAddress1" value="${item.ifsaAddress1}"/>
			<c:set var="ifsaAddress2" value="${item.ifsaAddress2}"/>
			<c:set var="ifsaZipCode" value="${item.ifsaZipCode}"/>
			<c:set var="ifsaContact" value="${item.ifsaContact}"/>
		</c:if>
	</c:forEach>


	<div class="container-fluid">
		<form id="formCheck1" method="post" action="">
			<input type="hidden" name="ifmmSeq" value="${sessSeq}">

			<div class="row border-bottom py-3 pt-4">
				<div class="col offset-2">
					<a href="/infra/home">
						<img src="${path}/resources/images/user/mainPage/coupang2.png" style="width: 175px;">
					</a>
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
									<td class="px-2">
										<c:out value="${rt.ifmmName}" />
									</td>
								</tr>
								<tr>
									<th class="bg-light px-2">이메일</th>
									<td class="px-2">
										<c:out value="${rt.ifmeEmailFull}" />
									</td>
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
					<c:choose>
						<c:when test="${fn:length(listShippingAddress) eq 0}">
							<a class="btn border container3" style="width: 8%; font-size: x-small;" data-bs-toggle="modal" data-bs-target="#addressAddModal">배송지추가</a>
						</c:when>
						<c:otherwise>
							<a class="btn border container3" style="width: 8%; font-size: x-small;" data-bs-toggle="modal" data-bs-target="#addressModal">배송지변경</a>
						</c:otherwise>
					</c:choose>
					<div class="col-12 p-0 pt-2">
						<c:choose>
							<c:when test="${fn:length(listShippingAddress) eq 0}">
								<div style="height: 120px;" class="border-top border-3 border-bottom d-flex justify-content-center align-items-center">
									<p style="font-size: small">저장되어 있는 배송지가 없습니다. 배송지를 추가해주세요.</p>
								</div>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${empty ifsaName}">
										<div class="table-responsive">
											<table class="table table-sm p-0 border-top border-3">
												<tr>
													<th class="bg-light px-2">이름</th>
													<td class="px-2">
														<c:out value="${listShippingAddress[0].ifsaName}" />
													</td>
												</tr>
												<tr>
													<th class="bg-light px-2">배송주소</th>
													<td class="px-2">
														<c:out value="${listShippingAddress[0].ifsaAddress1}" />
														<br>
														<c:out value="${listShippingAddress[0].ifsaAddress2}" />
													</td>
												</tr>
												<tr>
													<th class="bg-light px-2">연락처</th>
													<td class="px-2">
														<c:choose>
															<c:when test="${fn:length(listShippingAddress[0].ifsaContact) eq 10 }">
																<c:out value="${fn:substring(listShippingAddress[0].ifsaContact,0,3)}" />-<c:out value="${fn:substring(listShippingAddress[0].ifsaContact,3,6)}" />-<c:out value="${fn:substring(listShippingAddress[0].ifsaContact,6,10)}" />
															</c:when>
															<c:otherwise>
																<c:out value="${fn:substring(listShippingAddress[0].ifsaContact,0,3)}" />-<c:out value="${fn:substring(listShippingAddress[0].ifsaContact,3,7)}" />-<c:out value="${fn:substring(listShippingAddress[0].ifsaContact,7,11)}" />
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
												<tr>
													<th class="bg-light px-2">배송 요청사항</th>
													<td class="px-2">
														<span id="deliveryRequestSpan" class="pe-3">문 앞</span>
														<button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#deliveryRequestModal">변경</button>
													</td>
												</tr>
											</table>
										</div>
									</c:when>
									<c:otherwise>
										<div class="table-responsive">
											<table class="table table-sm p-0 border-top border-3">
												<tr>
													<th class="bg-light px-2">이름</th>
													<td class="px-2">
														<c:out value="${ifsaName}" />
														<span class="badge rounded-pill bg-primary">기본배송지</span>
													</td>
												</tr>
												<tr>
													<th class="bg-light px-2">배송주소</th>
													<td class="px-2">
														<c:out value="${ifsaAddress1}" />
														<br>
														<c:out value="${ifsaAddress2}" />
													</td>
												</tr>
												<tr>
													<th class="bg-light px-2">연락처</th>
													<td class="px-2">
														<c:choose>
															<c:when test="${fn:length(ifsaContact) eq 10 }">
																<c:out value="${fn:substring(ifsaContact,0,3)}" />-<c:out value="${fn:substring(ifsaContact,3,6)}" />-<c:out value="${fn:substring(ifsaContact,6,10)}" />
															</c:when>
															<c:otherwise>
																<c:out value="${fn:substring(ifsaContact,0,3)}" />-<c:out value="${fn:substring(ifsaContact,3,7)}" />-<c:out value="${fn:substring(ifsaContact,7,11)}" />
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
												<tr>
													<th class="bg-light px-2">배송 요청사항</th>
													<td class="px-2">
														<span id="deliveryRequestSpan" class="pe-3">문 앞</span>
														<button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#deliveryRequestModal">변경</button>
													</td>
												</tr>
											</table>
										</div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="addressAddModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 style="padding-left: 190px;" class="modal-title" id="exampleModalLabel">배송지 추가</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body px-5">
								<div class="row">
									<div class="input-group flex-nowrap mb-2">
										<span class="input-group-text">
											<i class="bi bi-person"></i>
										</span>
										<input id="ifsaName" name="ifsaName" type="text" class="form-control" placeholder="받는 사람">
									</div>
									<div class="input-group flex-nowrap">
										<span class="input-group-text">
											<i class="bi bi-geo-alt"></i>
										</span>
										<input id="ifsaZipCode" name="ifsaZipCode" type="text" class="form-control" placeholder="우편번호" readonly>
										<button type="button" class="btn btn-sm btn-outline-primary" id="btnAddress">우편번호 검색</button>
										<!--  onclick="sample6_execDaumPostcode()" -->
										<button type="button" class="btn btn-outline-danger" id="btnAddressClear">X</button>
									</div>
									<div class="input-group flex-nowrap">
										<input id="ifsaAddress1" name="ifsaAddress1" type="text" class="form-control" placeholder="주소" readonly>
									</div>
									<div class="input-group flex-nowrap mb-2">
										<input id="ifsaAddress2" name="ifsaAddress2" type="text" class="form-control" placeholder="상세주소">
									</div>
									<div class="input-group flex-nowrap mb-2">
										<span class="input-group-text">
											<i class="bi bi-phone"></i>
										</span>
										<input id="ifsaContact" name="ifsaContact" type="text" class="form-control" placeholder="연락처">
									</div>
									<div class="form-check-inline">
										<input id="ifsaDefault" name="ifsaDefault" type="checkbox" class="form-check-input">
										<input type="hidden" id="ifsaDefaultNy" name="ifsaDefaultNy" value="0">
										<label for="ifsaDefault" class="form-check-label">기본 배송지로 선택</label>
									</div>
								</div>
							</div>
							<div class="modal-footer px-5">
								<a type="button" class="btn btn-primary w-100" href="javascript:addShippingAddress();">배송지 추가</a>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="modal fade" id="addressEditModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addressModal"><i class="bi bi-arrow-left"></i></button>
								<h5 style="padding-left: 140px;" class="modal-title" id="exampleModalLabel">배송지 수정</h5>
								<button type="button" class="btn-close pe-5" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body px-5">
								<div class="row">
									<div class="input-group flex-nowrap mb-2">
										<span class="input-group-text">
											<i class="bi bi-person"></i>
										</span>
										<input id="ifsaSeqEdit" name="ifsaSeqEdit" type="hidden">
										<input id="ifsaNameEdit" name="ifsaNameEdit" type="text" class="form-control" placeholder="받는 사람">
									</div>
									<div class="input-group flex-nowrap">
										<span class="input-group-text">
											<i class="bi bi-geo-alt"></i>
										</span>
										<input id="ifsaZipCodeEdit" name="ifsaZipCodeEdit" type="text" class="form-control" placeholder="우편번호" readonly>
										<button type="button" class="btn btn-sm btn-outline-primary" id="btnAddress">우편번호 검색</button>
										<!--  onclick="sample6_execDaumPostcode()" -->
										<button type="button" class="btn btn-outline-danger" id="btnAddressClearEdit">X</button>
									</div>
									<div class="input-group flex-nowrap">
										<input id="ifsaAddress1Edit" name="ifsaAddress1Edit" type="text" class="form-control" placeholder="주소" readonly>
									</div>
									<div class="input-group flex-nowrap mb-2">
										<input id="ifsaAddress2Edit" name="ifsaAddress2Edit" type="text" class="form-control" placeholder="상세주소">
									</div>
									<div class="input-group flex-nowrap mb-2">
										<span class="input-group-text">
											<i class="bi bi-phone"></i>
										</span>
										<input id="ifsaContactEdit" name="ifsaContactEdit" type="text" class="form-control" placeholder="연락처">
									</div>
									<div class="form-check-inline">
										<input id="ifsaDefaultEdit" name="ifsaDefaultEdit" type="checkbox" class="form-check-input">
										<input type="hidden" id="ifsaDefaultNyEdit" name="ifsaDefaultNyEdit" value="0">
										<label for="ifsaDefaultEdit" class="form-check-label">기본 배송지로 선택</label>
									</div>
								</div>
							</div>
							<div class="modal-footer px-5">
								<a type="button" class="btn btn-primary w-100" href="javascript:updateShippingAddress();">저장</a>
								<a type="button" class="btn text-danger border w-100" href="javascript:deleteShippingAddress();">삭제</a>
							</div>
						</div>
					</div>
				</div>


				<div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 style="padding-left: 190px;" class="modal-title" id="exampleModalLabel">배송지 선택</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body px-5">
								<div id="addRow" class="row">
									<c:forEach items="${listShippingAddress}" var="item" varStatus="status">
										<div class="col-12">
											<div class="card" style="width: 100%;">
												<div class="card-body">
													<h5 class="card-title">
														<c:out value="${item.ifsaName}" />
														<c:if test="${item.ifsaDefaultNy eq 1}">
															<span class="badge rounded-pill bg-primary" style="font-size: small;">기본 배송지</span>
														</c:if>
													</h5>
													<p class="card-text">
														<c:out value="${item.ifsaAddress1}" />
														,
														<c:out value="${item.ifsaAddress2}" />
													</p>
													<p class="card-text">
														<c:choose>
															<c:when test="${fn:length(item.ifsaContact) eq 10 }">
																<c:out value="${fn:substring(item.ifsaContact,0,3)}" />-<c:out value="${fn:substring(item.ifsaContact,3,6)}" />-<c:out value="${fn:substring(item.ifsaContact,6,10)}" />
															</c:when>
															<c:otherwise>
																<c:out value="${fn:substring(item.ifsaContact,0,3)}" />-<c:out value="${fn:substring(item.ifsaContact,3,7)}" />-<c:out value="${fn:substring(item.ifsaContact,7,11)}" />
															</c:otherwise>
														</c:choose>
													</p>
													<div class="d-flex justify-content-between">
														<a href="javascript:callAddressEditModal(${item.ifsaSeq});" class="card-link btn text-primary border">수정</a>
														<a href="javascript:applyShippingAddress(${item.ifsaSeq});" class="card-link btn btn-primary">선택</a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="modal-footer px-5">
								<button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#addressAddModal">배송지 추가</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="deliveryRequestModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 style="padding-left: 170px;" class="modal-title" id="exampleModalLabel">배송 요청사항</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row">
									<p class="py-3" style="background-color: #FFF5C1">
										사회적 거리두기를 위해, 모든 배송을 비대면으로 진행합니다.
										<br>
										'직접 받고 부재 시 문 앞'을 선택해도 문 앞으로 배송합니다.
									</p>
								</div>
								<div class="d-flex align-items-center border px-2">
									<input id="trorDeliveryRequest1" name="trorDeliveryRequest" class="form-check-input m-0" type="radio" value="1" checked>
									<label class="form-check-label btn w-100 text-start" for="trorDeliveryRequest1">문 앞</label>
								</div>
								<div class="d-flex align-items-center border px-2">
									<input id="trorDeliveryRequest2" name="trorDeliveryRequest" class="form-check-input m-0" type="radio" value="2">
									<label class="form-check-label btn w-100 text-start" for="trorDeliveryRequest2">직접 받고 부재 시 문 앞</label>
								</div>
								<div class="d-flex align-items-center border px-2">
									<input id="trorDeliveryRequest3" name="trorDeliveryRequest" class="form-check-input m-0" type="radio" value="3">
									<label class="form-check-label btn w-100 text-start" for="trorDeliveryRequest3">경비실</label>
								</div>
								<div class="d-flex align-items-center border px-2">
									<input id="trorDeliveryRequest4" name="trorDeliveryRequest" class="form-check-input m-0" type="radio" value="4">
									<label class="form-check-label btn w-100 text-start" for="trorDeliveryRequest4">택배함</label>
								</div>
								<div id="trorDeliveryRequest4Div" class="bg-light border p-2">
									<input id="trorDeliveryRequest4Input" type="text" class="form-control" placeholder="택배함 번호(필수)">
								</div>
								<div class="d-flex align-items-center border px-2">
									<input id="trorDeliveryRequest5" name="trorDeliveryRequest" class="form-check-input m-0" type="radio" value="5">
									<label class="form-check-label btn w-100 text-start" for="trorDeliveryRequest5">기타사항</label>
								</div>
								<div id="trorDeliveryRequest5Div" class="bg-light border p-2">
									<input id="trorDeliveryRequest5Input" type="text" class="form-control" placeholder="장소만 입력(필수)">
								</div>
							</div>
							<div class="modal-footer">
								<a type="button" class="btn btn-primary w-100" href="javascript:saveDeliveryRequest();">확인</a>
							</div>
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
											<c:out value="${rtProductName[i]}" />
										</td>
										<td class="text-end px-2" style="font-weight: lighter;">
											수량
											<c:out value="${rtProductQuantity[i]}" />
											개 / 무료배송
										</td>
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
									<td class="px-2">
										<fmt:formatNumber value="${dto.totalProduct}" />
										원
										<input type="hidden" name="totalProduct" value="${dto.totalProduct}">
									</td>
								</tr>
								<tr>
									<th class="bg-light px-2">할인쿠폰</th>
									<td class="px-2">0원</td>
								</tr>
								<tr>
									<th class="bg-light px-2">배송비</th>
									<td class="px-2">
										<fmt:formatNumber value="${dto.totalDelivery}" />
										원
										<input type="hidden" name="totalDelivery" value="${dto.totalDelivery}">
									</td>
								</tr>
								<tr>
									<th class="bg-light px-2">쿠팡캐시</th>
									<td class="px-2">0원</td>
								</tr>
								<tr>
									<th class="bg-light px-2">총결제금액</th>
									<td class="px-2">
										<fmt:formatNumber value="${dto.totalMoney}" />
										원
										<input type="hidden" name="totalMoney" value="${dto.totalMoney}">
									</td>
								</tr>
								<tr>
									<th class="bg-light px-2">결제방법</th>
									<td class="px-2">
										<div class="form-check form-check-inline">
											<input name="paymentMethod" id="paymentMethod1" type="radio" class="form-check-input">
											<label for="paymentMethod1" style="cursor: pointer;">계좌이체</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="paymentMethod" id="paymentMethod2" type="radio" class="form-check-input">
											<label for="paymentMethod2" style="cursor: pointer;">신용/체크카드</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="paymentMethod" id="paymentMethod3" type="radio" class="form-check-input">
											<label for="paymentMethod3" style="cursor: pointer;">무통장입금(가상계좌)</label>
										</div>
									</td>
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

	<%@include file="../include/footer.jsp"%>
	<%@include file="../include/jsLinks.jsp"%>

	<script type="text/javascript">
		const arrivalDate = document.querySelector("#arrivalDate");

		const today = new Date();
		const tomorrow = new Date(today.setDate(today.getDate() + 1));

		const month = tomorrow.getMonth() + 1;
		const date = tomorrow.getDate();
		const day = tomorrow.getDay();
		let weekDay = "";

		if (day == 0)
			weekDay = "일";
		else if (day == 1)
			weekDay = "월";
		else if (day == 2)
			weekDay = "화";
		else if (day == 3)
			weekDay = "수";
		else if (day == 4)
			weekDay = "목";
		else if (day == 5)
			weekDay = "금";
		else if (day == 6)
			weekDay = "토";

		arrivalDate.innerText = "내일(" + weekDay + ") " + month + "/" + date;
	</script>

	<script type="text/javascript">
		$("#checkboxTrprArray").val(JSON.parse($("#checkboxTrprArray").val()));

		goPurchase = function() {
			$("#formCheck1").attr("action", "/infra/product/productCheckOut2")
					.submit();
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
		$("#trorDeliveryRequest4Div").hide();
		$("#trorDeliveryRequest5Div").hide();

		const checkbox = $("input[name=trorDeliveryRequest]");
		const span = $("#deliveryRequestSpan");

		console.dir(checkbox[0]);

		checkbox.on("change", function() {

			if ($(this).val() == 4) {
				$("#trorDeliveryRequest4Div").show();
				$("#trorDeliveryRequest5Div").hide();
			} else if ($(this).val() == 5) {
				$("#trorDeliveryRequest4Div").hide();
				$("#trorDeliveryRequest5Div").show();
			} else {
				$("#trorDeliveryRequest4Div").hide();
				$("#trorDeliveryRequest5Div").hide();
			}

		});

		saveDeliveryRequest = function() {

			if (checkbox[0].checked) {
				deliveryRequestSpan.innerText = "문 앞";
			} else if (checkbox[1].checked) {
				deliveryRequestSpan.innerText = "직접 받고 부재 시 문 앞";
			} else if (checkbox[2].checked) {
				deliveryRequestSpan.innerText = "경비실";
			} else if (checkbox[3].checked) {
				if (!checkNull($("#trorDeliveryRequest4Input"), $(
						"#trorDeliveryRequest4Input").val(), "필수 입력사항을 확인해주세요.")) {
					return false;
				} else {
					deliveryRequestSpan.innerText = "택배함("
							+ $("#trorDeliveryRequest4Input").val() + ")";
				}
			} else if (checkbox[4].checked) {
				if (!checkNull($("#trorDeliveryRequest5Input"), $(
						"#trorDeliveryRequest5Input").val(), "필수 입력사항을 확인해주세요.")) {
					return false;
				} else {
					deliveryRequestSpan.innerText = "기타사항("
							+ $("#trorDeliveryRequest5Input").val() + ")";
				}
			}

			$("#deliveryRequestModal").modal('hide');
		}
	</script>

	<script type="text/javascript">
		setCheckboxValue = function(obj, targetObj) {
			if (obj.is(":checked")) {
				targetObj.val("1");
			} else {
				targetObj.val("0");
			}
		}

		addShippingAddress = function() {

			setCheckboxValue($("#ifsaDefault"), $("#ifsaDefaultNy"));

			let insertRow = "";

			$
					.ajax({
						async : true,
						cache : false,
						type : "post",
						url : "/infra/product/insertShippingAddress",
						data : {
							"ifmmSeq" : "<c:out value="${sessSeq}"/>",
							"ifsaName" : $("#ifsaName").val(),
							"ifsaAddress1" : $("#ifsaAddress1").val(),
							"ifsaAddress2" : $("#ifsaAddress2").val(),
							"ifsaZipCode" : $("#ifsaZipCode").val(),
							"ifsaContact" : $("#ifsaContact").val(),
							"ifsaDefaultNy" : $("#ifsaDefaultNy").val()
						},
						success : function(response) {
							$("#addressAddModal").modal('hide');

							console.log(response);
							console.dir(response);

							insertRow += "<div class='col-12'>";
							insertRow += "<div class='card' style='width: 100%;'>";
							insertRow += "<div class='card-body'>";
							insertRow += "<h5 class='card-title'>";
							insertRow += response.ifsaName;
							if (response.ifsaDefaultNy == 1) {
								insertRow += '<span class="badge rounded-pill bg-primary" style="font-size: small;">기본 배송지</span>';
							}
							insertRow += "</h5>";
							insertRow += '<p class="card-text">';
							insertRow += response.ifsaAddress1 + ", "
									+ response.ifsaAddress2;
							insertRow += "</p>";
							insertRow += '<p class="card-text">';
							insertRow += response.ifsaContact;
							insertRow += "</p>";
							insertRow += '<div class="d-flex justify-content-between"><a href="#" class="card-link btn text-primary border">수정</a><a href="#" class="card-link btn btn-primary">선택</a></div></div></div></div>';

							$("#addRow").append(insertRow);

							$("#addressModal").modal('show');
							/*
							<div class="col-12">
								<div class="card" style="width: 100%;">
									<div class="card-body">
										<h5 class="card-title"><c:out value="${item.ifsaName}"/><c:if test="${item.ifsaDefaultNy eq 1}"><span class="badge rounded-pill bg-primary" style="font-size: small;">기본 배송지</span></c:if></h5>
										<p class="card-text"><c:out value="${item.ifsaAddress1}"/>, <c:out value="${item.ifsaAddress2}"/></p>
										<p class="card-text"><c:out value="${item.ifsaContact}"/></p>
										<div class="d-flex justify-content-between">
											<a href="#" class="card-link btn text-primary border">수정</a>
											<a href="#" class="card-link btn btn-primary">선택</a>
										</div>
									</div>
								</div>
							</div>
							 */

						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("ajaxUpdate " + jqXHR.textStatus + " : "
									+ jqXHR.errorThrown);
						}
					});
			
			$("#ifsaName").val("");
			$("#ifsaZipCode").val("");
			$("#ifsaAddress1").val("");
			$("#ifsaAddress2").val("");
			$("#ifsaContact").val("");
			$("#ifsaDefault").prop("checked", false);

		}
		
		
		callAddressEditModal = function(ifsaSeq){
			$("#addressModal").modal('hide');
			

			$.ajax({
				async : true,
				cache : false,
				type : "post",
				url : "/infra/product/selectOneShippingAddress",
				data : {
					"ifmmSeq" : "<c:out value="${sessSeq}"/>",
					"ifsaSeq" : ifsaSeq
				},
				success : function(response) {
					console.log(response);
					console.dir(response);
					
					$("#ifsaSeqEdit").val(response.ifsaSeq);
					$("#ifsaNameEdit").val(response.ifsaName);
					$("#ifsaZipCodeEdit").val(response.ifsaZipCode);
					$("#ifsaAddress1Edit").val(response.ifsaAddress1);
					$("#ifsaAddress2Edit").val(response.ifsaAddress2);
					$("#ifsaContactEdit").val(response.ifsaContact);
					
					if(response.ifsaDefaultNy == 1){
						$("#ifsaDefaultEdit").prop("checked", true);
					} else {
						$("#ifsaDefaultEdit").prop("checked", false);
					}
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("ajaxUpdate " + jqXHR.textStatus + " : "
							+ jqXHR.errorThrown);
				}
			});
			
			$("#addressEditModal").modal('show');
			
		}
		
		updateShippingAddress = function(){
			
			setCheckboxValue($("#ifsaDefaultEdit"), $("#ifsaDefaultNyEdit"));
			
			let insertRow = "";
			
			$.ajax({
				async : true,
				cache : false,
				type : "post",
				url : "/infra/product/updateShippingAddress",
				data : {
					"ifmmSeq" : "<c:out value="${sessSeq}"/>",
					"ifsaSeqEdit" : $("#ifsaSeqEdit").val(),
					"ifsaNameEdit" : $("#ifsaNameEdit").val(),
					"ifsaZipCodeEdit" : $("#ifsaZipCodeEdit").val(),
					"ifsaAddress1Edit" : $("#ifsaAddress1Edit").val(),
					"ifsaAddress2Edit" : $("#ifsaAddress2Edit").val(),
					"ifsaContactEdit" : $("#ifsaContactEdit").val(),
					"ifsaDefaultNyEdit" : $("#ifsaDefaultNyEdit").val()
				},
				success : function(response){
					$("#addressEditModal").modal('hide');
					
					console.log(response);
					console.dir(response);
					
					$("#addRow").children().remove();
					
					<c:forEach items="${response}" var="item" varStatus="status">
					insertRow += "하이";
					</c:forEach>
					
					$("#addRow").append(insertRow);
					
					$("#addressModal").modal('show');
					
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("ajaxUpdate " + jqXHR.textStatus + " : "
							+ jqXHR.errorThrown);
				}
			});
			
		}
		
	</script>


	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								/* document.getElementById("sample6_extraAddress").value = extraAddr; */

							} else {
								/* document.getElementById("sample6_extraAddress").value = ''; */
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('ifsaZipCode').value = data.zonecode;
							document.getElementById("ifsaAddress1").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("ifsaAddress2").focus();

						}
					}).open();
		}

		$("#btnAddress").on("click", function() {
			sample6_execDaumPostcode();
		});

		$("#btnAddressClear").on("click", function() {
			$("#ifsaZipCode").val('');
			$("#ifsaAddress1").val('');
			$("#ifsaAddress2").val('');
		});
		
		$("#btnAddressClearEdit").on("click", function(){
			$("#ifsaZipCodeEdit").val('');
			$("#ifsaAddress1Edit").val('');
			$("#ifsaAddress2Edit").val('');
		});
	</script>

</body>
</html>