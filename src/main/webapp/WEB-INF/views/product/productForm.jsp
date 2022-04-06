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

#addTr tr td {
	height: 40px;
}
</style>

<link href="${path}/resources/common/css/multipleImageInput.css" rel="stylesheet">

</head>
<body>

	<c:set var="listCategoryParents1" value="${CategoryServiceImpl.selectCategoryWithParentsCachedCode('1')}" />
	<!-- listCategory에 값을 담음 -->
	<c:set var="listCategoryDepth2" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('2')}" />
	<c:set var="listCategoryDepth3" value="${CategoryServiceImpl.selectCategoryWithDepthCachedCode('3')}" />

	<div class="container-fluid">
		<form id="formForm" method="post" action="" autocomplete="off">
		
		<!-- 
		<div class="fixed-top">
			<input type="text" id="tropNameArray1" name="tropNameArray">
			<input type="text" id="tropNameArray2" name="tropNameArray">
			<input type="text" id="tropNameArray3" name="tropNameArray">
		</div>
		 -->

			<%@include file="../include/coupangTopBar.jsp"%>


			<aside class="sticky p-3">
				<h1>상품관리</h1>
				<h1>가격관리</h1>
				<h1>주문/배송</h1>
				<h1>고객관리</h1>
			</aside>

			<section class="main-content p-3">
				<article>
					<h1 class="fw-bold">상품등록 <span class="fs-6 fw-bold text-danger" style="vertical-align: middle;">Ο 필수항목</span></h1>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold" class="fw-bold">노출상품명 <span class="text-danger">Ο</span></h6>
							<input id="trpdName" name="trpdName" type="text" class="form-control" placeholder="노출상품명 입력(브랜드명 + 제품명)">
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold" class="fw-bold">카테고리 <span class="text-danger">Ο</span></h6>
							<div class="input-group input-group-sm mb-2">
								<input type="radio" class="btn-check" name="categoryMethod" id="categorySearch" autocomplete="off" checked>
								<label class="btn btn-outline-primary" for="categorySearch">카테고리 검색</label>
								
								<input type="radio" class="btn-check" name="categoryMethod" id="categorySelect" autocomplete="off">
								<label class="btn btn-outline-primary" for="categorySelect">카테고리 선택</label>
							</div>
							<div id="inputCategorySearchForm">
								<input id="" name="" type="text" class="form-control form-control-sm w-50" placeholder="키테고리명 입력">
							</div>
							<div id="inputCategorySelectForm">
								<select id="trpdCategoryCd1" name="trpdCategoryCd1" size="10" class="form-select form-select-sm d-inline" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<option value="${item.ifctSeq}"><c:out value="${item.ifctName}"/></option>
										<c:set var="select1" value="${item.ifctSeq}"/>
									</c:forEach>
								</select>
								
								<select id="trpdCategoryCd2" name="trpdCategoryCd2" size="10" class="form-select form-select-sm d-inline" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
											<c:if test="${item.ifctSeq eq item2.ifctParents}">
												<option value="<c:out value="${item2.ifctSeq}"/>"><c:out value="${item2.ifctName}"/></option>
											</c:if>										
										</c:forEach>
									</c:forEach>
								</select>
								
								<select id="trpdCategoryCd3" name="trpdCategoryCd3" size="10" class="form-select form-select-sm d-inline" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
											<c:forEach items="${listCategoryDepth3}" var="item3" varStatus="status3">
												<c:if test="${item2.ifctSeq eq item3.ifctParents}">
													<option value="<c:out value="${item3.ifctSeq}"/>"><c:out value="${item3.ifctName}"/></option>
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
							<h6 class="fw-bold">옵션 <span class="text-danger">Ο</span></h6>
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
											<input id="optionName1" type="text" class="form-control d-inline" placeholder="옵션명" style="width: 200px;">
											<input id="optionValue1" type="text" class="form-control d-inline" placeholder="옵션값 ( ,로 구분 )" style="width: 400px;">
										</div>
										<div class="mb-1" id="option2">
											<input id="optionName2" type="text" class="form-control d-inline" placeholder="옵션명" style="width: 200px;">
											<input id="optionValue2" type="text" class="form-control d-inline" placeholder="옵션값 ( ,로 구분 )" style="width: 400px;">
										</div>
										<div class="mb-1" id="option3">
											<input id="optionName3" type="text" class="form-control d-inline" placeholder="옵션명" style="width: 200px;">
											<input id="optionValue3" type="text" class="form-control d-inline" placeholder="옵션값 ( ,로 구분 )" style="width: 400px;">
										</div>
										<button id="btnGetOp" name="btnGetOp" type="button" class="btn btn-primary" style="width: 200px;"><i class="bi bi-chevron-down"></i> 옵션목록으로 적용</button>
									</td>
								</tr>
							</table>
							<p class="ps-3" style="width: 100px; vertical-align: middle;">옵션목록</p>
							<table class="table table-borderless" width:70%;">
								<thead class="bg-light">
									<tr>
										<td style="width: 50px;"><input class="form-check-input" type="checkbox"></td>
										<td>옵션명</td>										
										<td>옵션값</td>										
										<td>추가금액</td>
									</tr>
								</thead>
								<tbody id="addTr">
									<!-- <tr>
										<td class="p-0"><input class="form-check-input" type="checkbox"></td>
										<td class="p-0"><input class="borderX fullWH" type="text"></td>
										<td class="p-0"><input class="borderX fullWH" type="text"></td>
										<td class="p-0"><input class="borderX fullWH" type="text"></td>
									</tr> -->
								</tbody>
							</table>
							<!-- <table class="table table-borderless">
								<thead class="bg-light">
									<tr>
										<td rowspan="2" style="vertical-align: middle;"><input type="checkbox"></td>
										<td>옵션명</td>										
										<td rowspan="2" style="vertical-align: top;">정상가 (원)</td>
										<td rowspan="2" style="vertical-align: top;">판매가 (원)</td>
										<td rowspan="2" style="vertical-align: top;">재고수량</td>
									</tr>
									<tr>
										<td>옵션1, 옵션2</td>
									</tr>
								</thead>
								<tr>
									
									<td>
										
									</td>
								</tr>
							</table> -->
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold">태그</h6>
							<input id="trpdTag" name="trpdTag" type="text" class="form-control" placeholder="태그명 ( ,로 구분 )">
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold">상품 이미지 <span class="text-danger">Ο</span></h6>
							<table class="table">
								<tr>
									<td class="text-start" style="width: 130px;">대표이미지 <span class="text-danger">Ο</span></td>
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
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold">상세설명 <span class="text-danger">Ο</span></h6>
							<div class="input-group input-group-sm mb-2">
								<input type="radio" class="btn-check" name="descMethod" id="descImage" autocomplete="off" checked>
								<label class="btn btn-outline-primary" for="descImage">이미지 업로드</label>
								
								<input type="radio" class="btn-check" name="descMethod" id="descEditor" autocomplete="off">
								<label class="btn btn-outline-primary" for="descEditor">에디터 작성</label>
							</div>
							
							<div id="descImageForm">
								<div class="upload__box border">
									<div class="upload__btn-box text-center">
										<label class="upload__btn">
											<p>이미지 등록</p>
											<input type="file" multiple="" data-max_length="20" class="upload__inputfile">
										</label>
									</div>
									<div class="upload__img-wrap">
											
									</div>
								</div>
							</div>
							<div id="descEditorForm">
								<textarea style="height: 200px;" id="trpdDesc" name="trpdDesc">
								</textarea>
								<!-- <textarea id="trpdDesc" name="trpdDesc"></textarea> -->
							</div>
							
						</div>
					</div>
					
					<div class="row">
						<div class="col">
							<button id="btnSubmit" name="btnSubmit" class="btn btn-primary">등록</button>
						</div>
					</div>
					
				</article>
			</section>

		</form>
	</div>

	<%@include file="../include/footer.jsp"%>
	<%@include file="../include/jsLinks.jsp"%>
	
	<script type="text/javascript">
	
	$("#btnGetOp").on("click", function(){
		var optionName;
		var optionValue;
		var insertTr = "";
		var index = 1;
		
		$("#addTr").empty();
		
		if($("#optionN").val() == 1){
			/* 
			optionName = $.trim($("#optionName1").val()); 
			optionValue = $("#optionValue1").val().split(",");
			
			insertTr += "<tr class='align-items-center'>";
			insertTr += "<td><input type='checkbox' class='form-check-input' tabindex='-1'></td>";
			insertTr += "<td class='p-0' rowspan='" + optionValue.length + "'><input type='text' class='fullWH borderX text-center fw-bold' readonly value='" + optionName + "'></td>";
			insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[0]) + "'></td>";
			insertTr += "<td class='p-0'><input id='trocAdditionalPrice" + index + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
			insertTr += "</tr>";
			
			index++;
			
			for(var i=1;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' class='form-check-input'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "'></td>";
				insertTr += "<td class='p-0'><input id='trocAdditionalPrice" + index + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
				
				index++;
			}
			 */	
			optionName = $.trim($("#optionName1").val()); 
			$("#tropNameArray1").val(optionName);
			optionValue = $("#optionValue1").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' class='form-check-input'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray1' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray1' id='trocAdditionalPrice" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			} 
			
			 
			$("#addTr").append(insertTr);
			
			
		} else if($("#optionN").val() == 2){
			optionName = $.trim($("#optionName1").val()); 
			$("#tropNameArray1").val(optionName);
			optionValue = $("#optionValue1").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' class='form-check-input'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray1' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray1' id='trocAdditionalPrice" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
				
			optionName = $.trim($("#optionName2").val()); 
			$("#tropNameArray2").val(optionName);
			optionValue = $("#optionValue2").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' class='form-check-input'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray2' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray2' id='trocAdditionalPrice" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
				
			$("#addTr").append(insertTr); 
			
		} else {
			optionName = $.trim($("#optionName1").val());  
			$("#tropNameArray1").val(optionName);
			optionValue = $("#optionValue1").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' class='form-check-input'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray1' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray1' id='trocAdditionalPrice" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
				
			optionName = $.trim($("#optionName2").val());  
			$("#tropNameArray2").val(optionName);
			optionValue = $("#optionValue2").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' class='form-check-input'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray2' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray2' id='trocAdditionalPrice" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
			
			optionName = $.trim($("#optionName3").val());
			$("#tropNameArray3").val(optionName);
			optionValue = $("#optionValue3").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' class='form-check-input'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray3' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray3' id='trocAdditionalPrice" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
			
			$("#addTr").append(insertTr);
		}
	});
	
	</script>
	
	<script type="text/javascript">
	$("#btnSubmit").on("click", function(){
		$("#formForm").attr("action", "/infra/product/productInst");
		$("#formForm").submit();
		
		alert("상품 '" + $("#trpdName").val() + "'을 등록하였습니다.");
	});
	</script>

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
			$("#tropNameArray2").prop("disabled", true);
			$("#tropNameArray3").prop("disabled", true);
		}
	});
	
	$("#optionN").on("change", function() {
		if($("#optionN").val() == 1){
			$("#option2").hide();
			$("#option3").hide();
			$("#tropNameArray2").prop("disabled", true);
			$("#tropNameArray3").prop("disabled", true);
		} else if($("#optionN").val() == 2) {
			$("#option2").show();
			$("#option3").hide();
			$("#tropNameArray2").prop("disabled", false);
			$("#tropNameArray3").prop("disabled", true);
		} else {
			$("#option2").show();
			$("#option3").show();
			$("#tropNameArray2").prop("disabled", false);
			$("#tropNameArray3").prop("disabled", false);
		}
	});
	
	$(document).ready(function(){
		if($("#descImage").is(":checked")){
	        $("#descImageForm").show();
	        $("#descEditorForm").hide();
	    }else{
	        $("#descEditorForm").show();
	        $("#descImageForm").hide();
	    }
	});

	$("input[name=descMethod]").on("change", function(){
		if($("#descImage").is(":checked")){
	        $("#descImageForm").show();
	        $("#descEditorForm").hide();
	    }else{
	        $("#descEditorForm").show();
	        $("#descImageForm").hide();
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
	
	<script src="${path}/resources/common/js/multipleImageInput.js"></script>
	
	<!-- textarea에 editor 적용 start -->
	<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>

	<script type="text/javascript">
    ClassicEditor
        .create( document.querySelector( '#trpdDesc' ) )
        .catch( error => {
            console.error( error );
        } );
	</script>
	<!-- textarea에 editor 적용 end -->
	

</body>
</html>