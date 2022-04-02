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
					<li class="nav-item"><a class="nav-link fs-4" href="/infra/product/cartGeneral">일반구매</a></li>
					<li class="nav-item"><a class="nav-link active fs-4" aria-current="page" href="">찜 목록</a></li>
					<li class="nav-item"><a class="nav-link fs-4" href="/infra/product/cartRegularDelivery">정기배송</a></li>
				</ul>
			</div>

			<div class="row py-3">
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0 border-top border-3">
							<tr>
								<th colspan="4" class="bg-light text-start px-3">
									<input type="checkbox">
								</th>
							</tr>
							<tr style="height: 120px;">
								<td class="px-3 text-start" style="width: 50px;">
									<input type="checkbox">
								</td>
								<td class="px-2" style="width: 94px;">
									<img src="${path}/resources/images/user/mainPage/product/randomProduct17.jpg" style="width: 78px;">
								</td>
								<td class="px-2">
									<div class="row">
										<div class="col-12 text-start pb-1 fw-light" style="font-size: small;">
											무료배송
										</div>
										<div class="col-12 text-start pb-2">
											<a class="m-0 text-muted fw-bold" style="text-decoration: none;" href="/infra/product/productView">참나린 2022 설선물세트 견과류세트, 3호견과류선물세트(아몬드/크렌베리/호두)</a>
										</div>
										<div class="col-12 text-start pb-2 fw-bold text-danger">
											19,900원
										</div>
									</div>
								</td>
								<td class="px-2">
									<button class="btn btn-outline-primary w-100 mb-1">장바구니 담기</button>
									<button class="btn btn-outline-danger w-100">삭제</button>
								</td>
							</tr>
						</table>
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