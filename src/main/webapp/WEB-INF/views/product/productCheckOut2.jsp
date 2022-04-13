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
	width: 30%;
	text-align: left;
	vertical-align: middle;
}

td {
	text-align: left;
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
			<div class="row border-bottom border-4 py-2 mt-2 align-items-end">
				<div class="col p-0">
					<h2>주문완료</h2>
				</div>
				<div class="col text-end p-0">주문결제>주문완료</div>
			</div>

			<div class="row border-bottom border-4 py-5 text-center">
				<div class="col-12 p-0 pt-2 fs-4 fw-bold">
					주문이 완료되었습니다.
				</div>
				<div class="col-12 p-0 pt-2 mb-4 fw-bold" style="font-size: x-small;">
					주문일 2022-03-28 | 주문번호 112312112
				</div>
				<div class="col-12 p-0 pt-2">
					<a class="btn btn-outline-primary rounded-0" href="/infra/home">계속 쇼핑하기</a>
				</div>
			</div>

			<div class="row py-3">
				<div class="col-6">
					<p class="col-2 p-0 mb-0 fw-bold fs-4 text-muted d-inline">받는 사람 정보</p>
					<div class="col-12 p-0 pt-2">
						<div class="table-responsive px-3 py-4 bg-light">
							<table class="table table-sm table-borderless">
								<tr>
									<th class="bg-light px-2">이름</th>
									<td class="px-2">윤영민</td>
								</tr>
								<tr>
									<th class="bg-light px-2">휴대폰</th>
									<td class="px-2">010-4635-6670</td>
								</tr>
								<tr>
									<th class="bg-light px-2">연락처</th>
									<td class="px-2">031-123-4567</td>
								</tr>
								<tr>
									<th class="bg-light px-2">배송주소</th>
									<td class="px-2">경기도 남양주시 불암로 336</td>
								</tr>
								<tr>
									<th class="bg-light px-2">배송 요청사항</th>
									<td class="px-2">문 앞</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="col-6">
					<p class="col-12 p-0 mb-0 fw-bold text-muted fs-4">결제정보</p>
					<div class="col p-0 pt-2">
						<div class="table-responsive px-3 py-4 bg-light">
							<table class="table table-sm p-0 table-borderless">
								<tr>
									<th class="bg-light px-2">주문금액</th>
									<td class="px-2 text-end">28,900원</td>
								</tr>
								<tr>
									<th class="bg-light px-2">쿠폰할인</th>
									<td class="px-2 text-end">0원</td>
								</tr>
								<tr>
									<th class="bg-light px-2">쿠팡캐시</th>
									<td class="px-2 text-end">0원</td>
								</tr>
								<tr>
									<th class="bg-light px-2">배송비</th>
									<td class="px-2 text-end">0원</td>
								</tr>
								<tr>
									<th class="bg-light px-2">총결제금액</th>
									<td class="px-2 text-end">28,900원</td>
								</tr>
							</table>
						</div>
					</div>
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