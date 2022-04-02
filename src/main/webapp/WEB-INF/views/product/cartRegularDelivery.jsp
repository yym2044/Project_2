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
					<li class="nav-item"><a class="nav-link fs-4" href="/infra/product/cartWishlist">찜 목록</a></li>
					<li class="nav-item"><a class="nav-link active fs-4" aria-current="page" href="">정기배송</a></li>
				</ul>
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


			<div class="row">
				<div class="col text-center">
					<a class="lh-lg btn btn-outline-danger" href="javascript:history.back();" style="width: 200px;">계속 쇼핑하기</a>
					<a class="lh-lg btn btn-outline-primary" style="width: 200px;">구매하기</a>
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