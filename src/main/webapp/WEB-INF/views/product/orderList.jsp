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

</head>
<body>

	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}" />
	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}" />
	<c:set var="listCategoryDepth3" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('3')}" />

	<div class="container-fluid">
		
		<form id="formOrderList" method="post" action="">
			<input id="ifmmSeq" name="ifmmSeq" type="hidden" value="${sessSeq}">

			<%@include file="../include/coupangTopBar.jsp"%>

			<%@include file="../include/coupangShSection1.jsp"%>
			
			<!-- width65 start -->
			<div class="width65 mt-5">
				<div class="row">
					<h6 class="fw-bold">주문목록</h6>
					<div class="input-group">
						<input class="form-control" type="text" placeholder="주문한 상품을 검색할 수 있어요!">
						<span class="input-group-text">검색</span>
					</div>
				</div>
				
				<c:forEach items="${orderList}" var="item" varStatus="status">
				
					<div class="card my-2 mt-5">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<span class="card-title fw-bold fs-5"><fmt:formatDate value="${item.regDateTime}" pattern="yyyy. M. d"/> 주문</span>
								<span><a href="javascript:goViewOrder(<c:out value="${item.trorSeq}"/>);" style="text-decoration: none;">주문 상세보기 ></a></span>
							</div>
							<table class="card">
							<c:forEach items="${productOrderList}" var="item2" varStatus="status2">
								<c:if test="${item.trorSeq eq item2.trorSeq}">
										<tr>
											<td class="p-3">
												<img style="width:64px; height:64px;" src="<c:out value="${item2.path}"/><c:out value="${item2.uuidName}"/>">
											</td>
											<td class="text-start">
												<c:out value="${item2.trpoName}"/><br>
												<fmt:formatNumber value="${item2.trprDiscountPrice}"/>원 · <c:out value="${item2.trpoQuantity }"/>개
											</td>
										</tr>
								</c:if>
							</c:forEach>
							</table>
						</div>
					</div>
				
				</c:forEach>
				
				
			</div>
			<!-- width65 end -->
			


			
		</form>
	</div>

	<%@include file="../include/footer.jsp"%>
	<%@include file="../include/jsLinks.jsp"%>
	
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
			$("#formOrderList").attr("action", "/infra/product/productSearch");
			$("#formOrderList").submit();
		});
		
		function enterkey(){
			if (window.event.keyCode == 13){
				$("#formOrderList").attr("action", "/infra/product/productSearch");
				$("#formOrderList").submit();
			}
		}
		
	</script>
	
	<script type="text/javascript">
	
	$("#btnMyCart").on("click", function(){
		$("#formOrderList").attr("action", "/infra/product/cartGeneral").submit();
	});
	
	goWishList = function(){
		$("#formOrderList").attr("action", "/infra/product/cartWishlist").submit();
	}
	
	goOrderList = function(){
		$("#formOrderList").attr("action", "/infra/product/orderList").submit();
	}
	
	</script>
	
</body>
</html>