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

		<div class="row border-bottom py-3 pt-4">
			<div class="col offset-2">
				<img src="${path}/resources/images/user/mainPage/coupang2.png" style="width: 175px;">
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
								<td class="px-2">윤영민</td>
							</tr>
							<tr>
								<th class="bg-light px-2">이메일</th>
								<td class="px-2">yym2044@naver.com</td>
							</tr>
							<tr>
								<th class="bg-light px-2">휴대폰 번호</th>
								<td class="px-2">010-4635-6670</td>
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
									윤영민
									<span class="badge rounded-pill bg-primary">기본배송지</span>
								</td>
							</tr>
							<tr>
								<th class="bg-light px-2">배송주소</th>
								<td class="px-2">경기도 남양주시 불암로 336</td>
							</tr>
							<tr>
								<th class="bg-light px-2">연락처</th>
								<td class="px-2">010-4635-6670</td>
							</tr>
							<tr>
								<th class="bg-light px-2">배송 요청사항</th>
								<td class="px-2">문 앞</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="row py-3">
				<p class="col-12 p-0 mb-0 fw-bold fs-5">배송 1건 중 1</p>
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0">
							<tr>
								<td colspan="2" class="bg-light px-2">
									<span class="arrivalDate">내일(월) 3/28</span>
									도착 보장
								</td>
							</tr>
							<tr>
								<td class="productName px-2">언탭트 남성용 오버핏 스웨트 고중량 후드, XL, 블랙</td>
								<td class="text-end px-2" style="font-weight: lighter;">수량 1개 / 무료배송</td>
							</tr>
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
								<td class="px-2">28,900원</td>
							</tr>
							<tr>
								<th class="bg-light px-2">할인쿠폰</th>
								<td class="px-2">0원</td>
							</tr>
							<tr>
								<th class="bg-light px-2">배송비</th>
								<td class="px-2">0원</td>
							</tr>
							<tr>
								<th class="bg-light px-2">쿠팡캐시</th>
								<td class="px-2">0원</td>
							</tr>
							<tr>
								<th class="bg-light px-2">총결제금액</th>
								<td class="px-2">28,900원</td>
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
					<a class="lh-lg btn btn-outline-primary rounded-0" href="./productCheckOut2.html" style="width: 200px;">결제하기</a>
				</div>
			</div>
		</div>






	</div>

	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/jsLinks.jsp" %>
	
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