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
.preview{
  width: 100px;
}
.preview2{
  width: 100px;
}
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
					<h1 class="fw-bold">상품등록 <span class="fs-6 fw-light text-danger" style="vertical-align: middle;">♥ 필수항목</span></h1>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6>노출상품명 <span class="text-danger">♥</span></h6>
							<input type="text" class="form-control" placeholder="노출상품명 입력(브랜드명 + 제품명)">
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6>카테고리 <span class="text-danger">♥</span></h6>
							<div class="input-group mb-2">
								<input type="radio" class="btn-check" name="categoryMethod" id="categorySearch" autocomplete="off" checked>
								<label class="btn btn-outline-primary" for="categorySearch">카테고리 검색</label>
								
								<input type="radio" class="btn-check" name="categoryMethod" id="categorySelect" autocomplete="off">
								<label class="btn btn-outline-primary" for="categorySelect">카테고리 선택</label>
							</div>
							<div id="inputCategorySearchForm">
								<input id="" name="" type="text" class="form-control form-control-sm w-50" placeholder="키테고리명 입력">
							</div>
							<div id="inputCategorySelectForm">
								<select id="" name="" size="10" class="form-select form-select-sm d-inline" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<option value="${item.ifctSeq}"><c:out value="${item.ifctName}"/></option>
										<c:set var="select1" value="${item.ifctSeq}"/>
									</c:forEach>
								</select>
								
								<select id="" name="" size="10" class="form-select form-select-sm d-inline" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
											<c:if test="${item.ifctSeq eq item2.ifctParents}">
												<option><c:out value="${item2.ifctName}"/></option>
											</c:if>										
										</c:forEach>
									</c:forEach>
								</select>
								
								<select id="" name="" size="10" class="form-select form-select-sm d-inline" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
											<c:forEach items="${listCategoryDepth3}" var="item3" varStatus="status3">
												<c:if test="${item2.ifctSeq eq item3.ifctParents}">
													<option><c:out value="${item3.ifctName}"/></option>
												</c:if>										
											</c:forEach>
										</c:forEach>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6>옵션 <span class="text-danger">♥</span></h6>
							<table class="table table-borderless">
								<tr>
									<td style="width: 100px; vertical-align: middle;">옵션 개수</td>
									<td>
										<select id="optionN" name="optionN" class="form-select" style="width:200px;">
											<option value="1">1개</option>
											<option value="2">2개</option>
											<option value="3">3개</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="pt-3" style="width: 100px; vertical-align: top;">옵션 입력</td>
									<td class="text-start">
										<div class="mb-1" id="option1">
											<input type="text" class="form-control d-inline" placeholder="옵션명" style="width: 200px;">
											<input type="text" class="form-control d-inline" placeholder="옵션값 ( ,로 구분 )" style="width: 400px;">
										</div>
										<div class="mb-1" id="option2">
											<input type="text" class="form-control d-inline" placeholder="옵션명" style="width: 200px;">
											<input type="text" class="form-control d-inline" placeholder="옵션값 ( ,로 구분 )" style="width: 400px;">
										</div>
										<div class="mb-1" id="option3">
											<input type="text" class="form-control d-inline" placeholder="옵션명" style="width: 200px;">
											<input type="text" class="form-control d-inline" placeholder="옵션값 ( ,로 구분 )" style="width: 400px;">
										</div>
									</td>
								</tr>
							</table>
							 
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6>태그</h6>
							<input type="text" class="form-control" placeholder="태그명 ( 최대 3개까지 ,로 구분 )">
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6>상품 이미지 <span class="text-danger">♥</span></h6>
							<table class="table">
								<tr>
									<td class="text-start" style="width: 130px;">대표이미지 <span class="text-danger">♥</span></td>
									<td class="text-start">
										<label for="avatar">
											<img src="${path}/resources/images/user/productForm/inputFile.png" height="96" id="img"/>
										</label>
										<input class="d-none" type="file" id="avatar" name="avatar" />
									</td>
								</tr>
								<tr>
									<td class="text-start" style="width: 130px;">추가이미지</td>
									<td class="text-start">
										<label for="avatar2">
											<img src="${path}/resources/images/user/productForm/inputFile.png" height="96" id="img"/>
										</label>
										<input class="d-none" type="file" id="avatar2" name="avatar2" />
									</td>
								</tr>
							</table>
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
	
	$(document).ready(function() {
		if($("#optionN").val() == 1){
			$("#option2").hide();
			$("#option3").hide();
		}
	});
	
	$("#optionN").on("change", function() {
		if($("#optionN").val() == 1){
			$("#option2").hide();
			$("#option3").hide();
		} else if($("#optionN").val() == 2) {
			$("#option2").show();
			$("#option3").hide();
		} else {
			$("#option2").show();
			$("#option3").show();
		}
		
		
	});
	
	</script>
	
	<!-- 업로드한 이미지 프리뷰 start -->
	<script type="text/javascript">
	let avatarInput = document.getElementById('avatar');
	let img = document.querySelector('label[for=avatar] img');

	avatarInput.onchange = async (e) => {
	  
	  img.classList.add('preview');
	  img.src = URL.createObjectURL(e.target.files[0]);  
	  
	  await console.log(img.offsetHeight, img.offsetWidth)
	  
	}
	</script>
	
	<script type="text/javascript">
	let avatarInput2 = document.getElementById('avatar2');
	let img2 = document.querySelector('label[for=avatar2] img');

	avatarInput2.onchange = async (e) => {
	  
	  img2.classList.add('preview2');
	  img2.src = URL.createObjectURL(e.target.files[0]);  
	  
	  await console.log(img2.offsetHeight, img2.offsetWidth)
	  
	}
	</script>
	<!-- 업로드한 이미지 프리뷰 end -->

</body>
</html>