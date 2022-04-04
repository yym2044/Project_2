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
<title>쿠팡! 상품등록</title>
<%@include file="../include/cssLinks.jsp"%>

<style type="text/css">
</style>

</head>
<body>

	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}" />
	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}" />
	<c:set var="listCategoryDepth3" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('3')}" />

	<div class="container-fluid">
		<form id="formForm" method="post" action="">


			<%@include file="../include/coupangTopBar.jsp"%>


			<aside class="sticky p-3">
				<h1>상품관리</h1>
				<h1>가격관리</h1>
				<h1>주문/배송</h1>
				<h1>고객관리</h1>
			</aside>

			<section class="main-content p-3">
				<article>
					<h1 class="fw-bold">상품등록<span class="fs-6 fw-light text-danger" style="vertical-align: middle;">ｏ필수항목</span></h1>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6>노출상품명<span class="fw-light text-danger"> ｏ</span></h6>
							<input type="text" class="form-control" placeholder="노출상품명 입력(브랜드명 + 제품명)">
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6>카테고리<span class="fw-light text-danger"> ｏ</span></h6>
							<div class="input-group">
								<input type="radio" class="btn-check" name="categoryMethod" id="categorySearch" autocomplete="off" checked>
								<label class="btn btn-outline-primary" for="categorySearch">카테고리 검색</label>
								
								<input type="radio" class="btn-check" name="categoryMethod" id="categorySelect" autocomplete="off">
								<label class="btn btn-outline-primary" for="categorySelect">카테고리 선택</label>
							</div>
							<div id="inputCategorySearchForm">
								<input id="" name="" type="text" class="form-control form-control-sm w-50" placeholder="키테고리명 입력">
							</div>
							<div id="inputCategorySelectForm">
								<select id="" name="" size="10" class="form-select form-select-sm" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<option value="${item.ifctSeq}"><c:out value="${item.ifctName}"/></option>
										<c:set var="select1" value="${item.ifctSeq}"/>
									</c:forEach>
								</select>
								
								<select id="" name="" size="10" class="form-select form-select-sm" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
											<c:if test="${item.ifctSeq eq item2.ifctParents}">
												<option><c:out value="${item2.ifctName}"/></option>
											</c:if>										
										</c:forEach>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</article>
			</section>









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
						location.href = "/infra/home";
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
	
	$(document).ready(function(){
		if($("#categorySearch").is(":checked")){
	        $("#inputCategorySearchForm").show();
	        $("#inputCategorySelectForm").hide();
	    }else{
	        $("#inputCategorySelectForm").show();
	        $("#inputCategorySearchForm").hide();
	    }
	});

	$("input[name=categoryMethod]").on("change", function(){
		if($("#categorySearch").is(":checked")){
	        $("#inputCategorySearchForm").show();
	        $("#inputCategorySelectForm").hide();
	    }else{
	        $("#inputCategorySelectForm").show();
	        $("#inputCategorySearchForm").hide();
	    }
	});
	
	</script>

</body>
</html>