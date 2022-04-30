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

#addTr tr td, #addTr3 tr td, #singleTbody tr td {
	height: 40px;
}

.ui-autocomplete {
	max-height: 150px;
	overflow-y: scroll;
	overflow-x: hidden;
}
</style>

<style type="text/css">
@import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);
}
@import url(https://fonts.googleapis.com/css?family=Titillium+Web:300);
.fa-2x {
font-size: 2em;
}
.fa {
position: relative;
display: table-cell;
width: 60px;
height: 36px;
text-align: center;
vertical-align: middle;
font-size:20px;
}


.main-menu:hover,nav.main-menu.expanded {
width:250px;
overflow:visible;
}

.main-menu {
background:#212121;
border-right:1px solid #e5e5e5;
position:absolute;
top:0;
bottom:0;
height:100%;
left:0;
width:60px;
overflow:hidden;
-webkit-transition:width .05s linear;
transition:width .05s linear;
-webkit-transform:translateZ(0) scale(1,1);
z-index:1000;
}

.main-menu>ul {
margin:7px 0;
}

.main-menu li {
position:relative;
display:block;
width:250px;
}

.main-menu li>a {
position:relative;
display:table;
border-collapse:collapse;
border-spacing:0;
color:#999;
 font-family: arial;
font-size: 14px;
text-decoration:none;
-webkit-transform:translateZ(0) scale(1,1);
-webkit-transition:all .1s linear;
transition:all .1s linear;
  
}

.main-menu .nav-icon {
position:relative;
display:table-cell;
width:60px;
height:36px;
text-align:center;
vertical-align:middle;
font-size:18px;
}

.main-menu .nav-text {
position:relative;
display:table-cell;
vertical-align:middle;
width:190px;
  font-family: 'Titillium Web', sans-serif;
}

.main-menu>ul.logout {
position:absolute;
left:0;
bottom:0;
}

.no-touch .scrollable.hover {
overflow-y:hidden;
}

.no-touch .scrollable.hover:hover {
overflow-y:auto;
overflow:visible;
}

a:hover,a:focus {
text-decoration:none;
}

nav {
-webkit-user-select:none;
-moz-user-select:none;
-ms-user-select:none;
-o-user-select:none;
user-select:none;
}

nav ul,nav li {
outline:0;
margin:0;
padding:0;
}
.main-menu li:hover>a,nav.main-menu li.active>a,.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus,.no-touch .dashboard-page nav.dashboard-menu ul li:hover a,.dashboard-page nav.dashboard-menu ul li.active a {
color:#fff;
background-color:#5fa2db;
}
.area {
float: left;
background: #e2e2e2;
width: 100%;
height: 100%;
}
@font-face {
  font-family: 'Titillium Web';
  font-style: normal;
  font-weight: 300;
  src: local('Titillium WebLight'), local('TitilliumWeb-Light'), url(http://themes.googleusercontent.com/static/fonts/titilliumweb/v2/anMUvcNT0H1YN4FII8wpr24bNCNEoFTpS2BTjF6FB5E.woff) format('woff');
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
		<form id="formForm" method="post" action="" autocomplete="off" enctype="multipart/form-data">
		
		
		<div class="fixed-top">
			<input type="hidden" id="tropNameArray1" name="tropNameArray">
			<input type="hidden" id="tropNameArray2" name="tropNameArray">
			<input type="hidden" id="tropNameArray3" name="tropNameArray">
		</div>
		

			<%@include file="../include/coupangTopBar.jsp"%>


			<aside class="p-3">
				<!-- 
				<h1>상품관리</h1>
				<h1>가격관리</h1>
				<h1>주문/배송</h1>
				<h1>고객관리</h1>
				 -->
				 
				 
<div class="area"></div>
<nav class="main-menu sticky" style="margin-top : 36px;">
         <ul>
             <li>
                 <a href="http://justinfarrow.com">
                     <i class="fa fa-home fa-2x"></i>
                     <span class="nav-text">
                         Dashboard
                     </span>
                 </a>
               
             </li>
             <li class="has-subnav">
                 <a href="#">
                     <i class="fa fa-laptop fa-2x"></i>
                     <span class="nav-text">
                         Stars Components
                     </span>
                 </a>
                 
             </li>
             <li class="has-subnav">
                 <a href="#">
                    <i class="fa fa-list fa-2x"></i>
                     <span class="nav-text">
                         Forms
                     </span>
                 </a>
                 
             </li>
             <li class="has-subnav">
                 <a href="#">
                    <i class="fa fa-folder-open fa-2x"></i>
                     <span class="nav-text">
                         Pages
                     </span>
                 </a>
                
             </li>
             <li>
                 <a href="#">
                     <i class="fa fa-bar-chart-o fa-2x"></i>
                     <span class="nav-text">
                         Graphs and Statistics
                     </span>
                 </a>
             </li>
             <li>
                 <a href="#">
                     <i class="fa fa-font fa-2x"></i>
                     <span class="nav-text">
                        Quotes
                     </span>
                 </a>
             </li>
             <li>
                <a href="#">
                    <i class="fa fa-table fa-2x"></i>
                     <span class="nav-text">
                         Tables
                     </span>
                 </a>
             </li>
             <li>
                <a href="#">
                     <i class="fa fa-map-marker fa-2x"></i>
                     <span class="nav-text">
                         Maps
                     </span>
                 </a>
             </li>
             <li>
                 <a href="#">
                    <i class="fa fa-info fa-2x"></i>
                     <span class="nav-text">
                         Documentation
                     </span>
                 </a>
             </li>
         </ul>

         <ul class="logout">
             <li>
                <a href="#">
                      <i class="fa fa-power-off fa-2x"></i>
                     <span class="nav-text">
                         Logout
                     </span>
                 </a>
             </li>  
         </ul>
  				 </nav>
				 
				 
				 
				 
				 
			</aside>

			<section class="main-content">
				<article class="p-4">
					<h1 class="fw-bold mb-3">상품등록 <span class="fs-6 fw-bold text-danger" style="vertical-align: middle;">Ο 필수항목</span></h1>
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
								<input id="shNameString" list="ctList" name="shNameString" type="text" class="form-control form-control-sm w-50 d-inline" placeholder="카테고리명 입력">
								<input id="ifctSeqString" name="ifctSeqString" type="hidden" class="form-control form-control-sm d-inline" style="width:200px;" placeholder="ifctSeq 그릇">
								<input id="trpdCategoryCdString1" name="trpdCategoryCd1" class="categorySearch" type="hidden">
								<input id="trpdCategoryCdString2" name="trpdCategoryCd2" class="categorySearch" type="hidden">
								<input id="trpdCategoryCdString3" name="trpdCategoryCd3" class="categorySearch" type="hidden">
								<datalist id="ctList">
								</datalist>
							</div>
							<div id="inputCategorySelectForm">
								<select id="trpdCategoryCd1" name="trpdCategoryCd1" size="10" class="form-select form-select-sm d-inline categorySelect" style="width: 200px;">
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<option value="${item.ifctSeq}"><c:out value="${item.ifctName}"/></option>
										<c:set var="select1" value="${item.ifctSeq}"/>
									</c:forEach>
								</select>
								
								<select id="trpdCategoryCd2" name="trpdCategoryCd2" size="10" class="form-select form-select-sm d-inline d-none categorySelect" style="width: 200px;">
									<%-- 
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
											<c:if test="${item.ifctSeq eq item2.ifctParents}">
												<option value="<c:out value="${item2.ifctSeq}"/>"><c:out value="${item2.ifctName}"/></option>
											</c:if>										
										</c:forEach>
									</c:forEach>
									 --%>
								</select>
								
								<select id="trpdCategoryCd3" name="trpdCategoryCd3" size="10" class="form-select form-select-sm d-inline d-none categorySelect" style="width: 200px;">
									<%-- 
									<c:forEach items="${listCategoryParents1}" var="item" varStatus="status">
										<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
											<c:forEach items="${listCategoryDepth3}" var="item3" varStatus="status3">
												<c:if test="${item2.ifctSeq eq item3.ifctParents}">
													<option value="<c:out value="${item3.ifctSeq}"/>"><c:out value="${item3.ifctName}"/></option>
												</c:if>										
											</c:forEach>
										</c:forEach>
									</c:forEach>
									 --%>
								</select>
							</div>
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold">옵션 <span class="text-danger">Ο</span></h6>
							<div class="input-group input-group-sm mb-2">
								<input type="radio" class="btn-check" name="optionMethod" value="1" id="optionPlural" autocomplete="off" checked>
								<label class="btn btn-outline-primary" for="optionPlural">옵션상품 등록</label>
								
								<input type="radio" class="btn-check" name="optionMethod" value="2" id="optionSingular" autocomplete="off">
								<label class="btn btn-outline-primary" for="optionSingular">단일상품 등록</label>
							</div>
							<div id="optionPluralForm">
								<table id="optionPluralTable" class="table table-borderless">
									<tr>
										<td style="width: 100px; vertical-align: middle;">기본 가격</td>
										<td>
											<div class="input-group" style="width:200px;">
												<span class="input-group-text" style="border-right: none;">￦</span>
												<input id="trpdPrice" name="trpdPrice" type="text" style="border-left: none;" class="form-control text-end">
											</div>
										</td>
									</tr>
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
												<input id="optionName1" type="text" class="optionName form-control d-inline" placeholder="옵션명(예:색상)" style="width: 200px;">
												<input data-bs-toggle="tooltip" data-bs-placement="right" title=",로 구분해주세요" id="optionValue1" type="text" class="optionValue form-control d-inline" placeholder="옵션값 (예:블루,레드)" style="width: 400px;">
											</div>
											<div class="mb-1" id="option2">
												<input id="optionName2" type="text" class="optionName form-control d-inline" placeholder="옵션명(예:사이즈)" style="width: 200px;">
												<input data-bs-toggle="tooltip" data-bs-placement="right" title=",로 구분해주세요" id="optionValue2" type="text" class="optionValue form-control d-inline" placeholder="옵션값 (예:S,M,L)" style="width: 400px;">
											</div>
											<div class="mb-1" id="option3">
												<input id="optionName3" type="text" class="optionName form-control d-inline" placeholder="옵션명(예:타입)" style="width: 200px;">
												<input data-bs-toggle="tooltip" data-bs-placement="right" title=",로 구분해주세요" id="optionValue3" type="text" class="optionValue form-control d-inline" placeholder="옵션값 (예:A타입,B타입)" style="width: 400px;">
											</div>
											<button id="btnGetOp" name="btnGetOp" type="button" class="btn btn-primary mt-1" style="width: 200px;"><i class="bi bi-chevron-down"></i> 옵션목록으로 적용</button>
										</td>
									</tr>
								</table>
								<p id="tableCap" class="ps-3 fw-bold" style="width: 100px; vertical-align: middle;">옵션 목록</p>
							
								<table id="optionList1" class="table table-borderless" style="font-size: small;">
									<thead class="bg-light">
										<tr>
											<td style="width: 50px;"><input id="checkboxAll1" class="form-check-input" type="checkbox"></td>
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
							
								<table id="optionList2" class="table table-borderless" style="font-size: small;">
									<thead id="addTr2" class="bg-light">
										<!-- 								
										<tr>
											<td rowspan="2" style="vertical-align: middle;"><input type="checkbox"></td>
											<td colspan="3">옵션명</td>										
											<td rowspan="2" style="vertical-align: top;">정상가 (원)</td>
											<td rowspan="2" style="vertical-align: top;">판매가 (원)</td>
											<td rowspan="2" style="vertical-align: top;">재고수량</td>
										</tr>
										<tr>
											<td>옵션1이름</td>
											<td>옵션2이름</td>
											<td>옵션3이름</td>
										</tr>
										 -->
									</thead>
									<tbody id="addTr3">
									</tbody>
								</table>
							
							
								<div id="divOptNav" class="row align-items-center">
									<div class="col text-start" style="padding-left: 20px;">
										<button id="btnDelete" type="button" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
									</div>
									<div class="col text-end">
										<button id="btnPrevious" type="button" class="btn btn-sm btn-outline-primary"><i class="bi bi-chevron-left"></i></button>
										<button id="btnNext" type="button" class="btn btn-sm btn-outline-primary"><i class="bi bi-chevron-right"></i></button>
									</div>
								</div>
							</div>
							<!-- optionPluralForm end -->
							<div id="optionSingularForm">
							
								<table id="" class="table table-borderless" style="font-size: small;">
									<thead id="" class="bg-light">
										<tr>
											<td>옵션명</td>										
											<td>정상가 (원)</td>
											<td>판매가 (원)</td>
											<td>재고수량</td>
										</tr>
									</thead>
									<tbody id="singleTbody">
										<tr>
											<td class="p-0 px-1"><input id="trpdNameCopy" type="text" class="fullWH borderX text-center box-white" readonly></td>
											<td class="p-0 px-1"><input id="trprListPriceArraySingle" name="trprListPriceArray" type="text" class="form-control optionSingularArray fullWH borderX text-center"></td>
											<td class="p-0 px-1"><input id="trprDiscountPriceArraySingle" name="trprDiscountPriceArray" type="text" class="form-control optionSingularArray fullWH borderX text-center"></td>
											<td class="p-0 px-1"><input id="trprStockArraySingle" name="trprStockArray" type="text" class="form-control optionSingularArray fullWH borderX text-center"></td>
										</tr>
									</tbody>
								</table>
							
							</div>
							
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
							<button id="checkImg" type="button">파일체크버튼</button>
							<table class="table">
								<tr>
									<td class="text-start py-5" style="width: 130px; vertical-align: middle;"><label for="file0" class="upload__btn d-inline">대표이미지</label> <span class="text-danger">Ο</span></td>
									<td class="text-start">
										<%-- 
										<label for="avatar">
											<img src="${path}/resources/images/user/productForm/inputFile.png" style="width:120px; height:120px;" id="img"/>
										</label>
										<input class="d-none" type="file" id="avatar" name="avatar" />
										 --%>
										 <div class="upload__box p-0">
											<div class="upload__btn-box text-center">
												<input id="file0" name="file0" type="file" data-max_length="1" class="upload__inputfile">
											</div>
											<div class="upload__img-wrap">
													
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-start py-5" style="width: 130px; vertical-align: middle;"><label for="file1" class="upload__btn d-inline">추가이미지</label></td>
									<td class="text-start">
										<%-- 
										<label for="avatar2">
											<img src="${path}/resources/images/user/productForm/inputFile.png" height="96" id="img"/>
										</label>
										<input class="d-none" type="file" id="avatar2" name="avatar2" />
										 --%>
										<div class="upload__box p-0">
											<div class="upload__btn-box text-center">
												<input id="file1" name="file1" type="file" multiple="multiple" data-max_length="20" class="upload__inputfile">
											</div>
											<div class="upload__img-wrap">
													
											</div>
										</div>
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
											<input type="file" multiple="multiple" data-max_length="20" class="upload__inputfile">
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
							<button id="btnSubmit" name="btnSubmit" type="button" class="btn btn-primary">등록</button>
						</div>
					</div>
					
				</article>
			</section>

		</form>
	</div>

	<%-- <%@include file="../include/footer.jsp"%> --%>
	<%@include file="../include/jsLinks.jsp"%>
	
	<script type="text/javascript">
	
	
	$(function(){
		
		var availableArray = [];
		
		$.ajax({
			async: true
			, cache: false
			, type: "post"
			, url: "/infra/category/selectCategoryNameString"
			, success: function(data){
				
				$.each(data, function(i){
					availableArray.push(data[i].ifctNameString);
				});
			}
		})
		
		$("#shNameString").autocomplete({
			minLength: 2
			, source: availableArray
		});
		
	})
	
	$("#shNameString").on("change", function(){
		
		$.ajax({
			async: false
			, cache: false
			, type: "post"
			, url: "/infra/category/selectOneifctSeqString"
			, data : { "shNameString" : $("#shNameString").val() }
			, success: function(data){
				
				$("#ifctSeqString").val(data.ifctSeqString);
			}
		});
		
		$("#trpdCategoryCdString1").val($("#ifctSeqString").val().split("-")[0]);
		$("#trpdCategoryCdString2").val($("#ifctSeqString").val().split("-")[1]);
		$("#trpdCategoryCdString3").val($("#ifctSeqString").val().split("-")[2]);
		
	});
	
	</script>
	
	<!-- <script type="text/javascript">
	
	var seqString = "";
	
	$("#shNameString").on("keyup", function(){
		
		$("#ctList").empty();
		
			
			
			
			/* alert($(this).val()); */
			// ajax
			 $.ajax({
				async: true
				,cache: false
				,type:"post"
				,url: "/infra/category/selectCategoryNameString"
				,data : { "shNameString" : $("#shNameString").val() }
				,success: function(data){
					
					seqString = "";
					seqString += data[0].ifctSeqString;
					$("#ifctSeqString").val(seqString);
					
					
					
					
					$.each(data, function(i){
						$("#ctList").append("<option>" + data[i].ifctNameString + "</option>");
					});
					
					$("#shNameString").focus();
					
					/* 					
					$.each(data, function(idx, val) {
						console.log(idx + " " + val.ifctNameString);
						console.log(idx + " " + val.ifctSeqString);
					});
					 */
					/* $.each(data, function(i){
					$trpdCategoryCd2.append("<option value=" + data[i].ifctSeq + ">" + data[i].ifctName + "</option>")
					}); */
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			}); 
			//
			
	});
	
	</script> -->
	
	<script type="text/javascript">
	const input = document.querySelector('.number');
	input.addEventListener('keyup', function(e) {
	  let value = e.target.value;
	  value = Number(value.replaceAll(',', ''));
	  if(isNaN(value)) {
	    input.value = 0;
	  }else {
	    const formatValue = value.toLocaleString('ko-KR');
	    input.value = formatValue;
	  }
	})
	
	
	</script>
	
	
	
	<script type="text/javascript">
	$("#checkImg").on("click", function(){
		alert("대표이미지 : " + $("#file0").val());

/* 		var fileCount = $("input[type=file]")[1].files.length; */
		var fileCount = $("#file1")[0].files.length;
		for(var i = 0 ; i<fileCount;i++) {
/* 			alert("추가이미지" + (i+1) + " : " +  $("input[type=file]")[1].files[i].name); */
			alert("추가이미지" + (i+1) + " : " +  $("#file1")[0].files[i].name);
		}
	});

	</script>
	
	<script type="text/javascript">
	
	var $trpdCategoryCd2 = $("#trpdCategoryCd2");
	var $trpdCategoryCd3 = $("#trpdCategoryCd3");
	
	
	$("#trpdCategoryCd1").on("click", function(){
		/* alert($("#trpdCategoryCd1").val()); */
		
		$trpdCategoryCd2.removeClass('d-none');
		$trpdCategoryCd3.addClass('d-none');
		
		$trpdCategoryCd2.children().remove();
		$trpdCategoryCd3.children().remove();
		
		// ajax
		 $.ajax({
			  async: true
			  ,cache: false
			  ,type:"post"
			  ,url: "/infra/category/categoryList"
			  ,data : { "ifctParents" : $("#trpdCategoryCd1").val() }
			  ,success: function(data){
				  /* console.log(data); */
				  /* 
				  $.each(data, function(idx, val) {
					  console.log(idx + " " + val.ifctName);
				  });
				   */
				  $.each(data, function(i){
					   $trpdCategoryCd2.append("<option value=" + data[i].ifctSeq + ">" + data[i].ifctName + "</option>")
				   });
			  }
			  ,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
		  });
		 //
		 
	});
	
	$("#trpdCategoryCd2").on("click", function(){
		
		$trpdCategoryCd3.removeClass('d-none');
		$trpdCategoryCd3.children().remove();
		
		// ajax
		 $.ajax({
			  async: true
			  ,cache: false
			  ,type:"post"
			  ,url: "/infra/category/categoryList"
			  ,data : { "ifctParents" : $("#trpdCategoryCd2").val() }
			  ,success: function(data){
				  /* console.log(data); */
				  /* 
				  $.each(data, function(idx, val) {
					  console.log(idx + " " + val.ifctName);
				  });
				   */
				  $.each(data, function(i){
					   $trpdCategoryCd3.append("<option value=" + data[i].ifctSeq + ">" + data[i].ifctName + "</option>")
				   });
			  }
			  ,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
		  });
		 //
		 
	});
	</script>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#divOptNav").hide();
		$("#btnPrevious").hide();
		$("#optionList1").hide();
		$("#tableCap").hide();
	});
	
	$("#btnNext").click(function(){
		$("#btnNext").hide();
		$("#btnPrevious").show();
		$("#optionList1").hide();
		$("#optionList2").show();
		
			
		if($("#optionN").val() == 1){
			$("input[name=trprListPriceArray]").each(function(index, item){
				var trprPrice = Number($("#trpdPrice").val()) + Number($("#trocAdditionalPrice" + (index+1)).val());
				$(item).val(trprPrice);
			});
		} else if($("#optionN").val() == 2){
			
			$("input[name=trocAdditionalPriceArray1]").each(function(i, item1){
				$("input[name=trocAdditionalPriceArray2]").each(function(j, item2){
				
					var trprPrice = Number($("#trpdPrice").val()) + Number($(item1).val()) + Number($(item2).val());
					
					$("#trprListPriceArray" + (i+1) + "_" + (j+1)).val(trprPrice);
					
				});
			});
			
			
		} else {
			
			$("input[name=trocAdditionalPriceArray1]").each(function(i, item1){
				$("input[name=trocAdditionalPriceArray2]").each(function(j, item2){
					$("input[name=trocAdditionalPriceArray3]").each(function(k, item3){
						
						var trprPrice = Number($("#trpdPrice").val()) + Number($(item1).val()) + Number($(item2).val()) + Number($(item3).val());
						
						$("#trprListPriceArray" + (i+1) + "_" + (j+1) + "_" + (k+1)).val(trprPrice);
						
					});
				});
			});
			
		}
		
	});
	
	
	$("#btnPrevious").click(function(){
		$("#btnPrevious").hide();
		$("#btnNext").show();
		$("#optionList2").hide();
		$("#optionList1").show();
	});
	
	</script>
	
	<script type="text/javascript">
	
	$("#btnGetOp").on("click", function(){
		
		if(!checkNull($("#trpdPrice"), $("#trpdPrice").val(),"기본 가격을 입력해주세요.")) return false;
		if(!checkOnlyNumber($("#trpdPrice"),$("#trpdPrice").val(), "잘못된 값입니다.")) return false;
		
		if($("#optionN").val() == 1){
			if(!checkNull($("#optionName1"), $("#optionName1").val(),"옵션명을 입력해주세요.")) return false;
			if(!checkNull($("#optionValue1"), $("#optionValue1").val(),"옵션값을 입력해주세요.")) return false;
		} else if($("#optionN").val() == 2){
			if(!checkNull($("#optionName1"), $("#optionName1").val(),"옵션명을 입력해주세요.")) return false;
			if(!checkNull($("#optionValue1"), $("#optionValue1").val(),"옵션값을 입력해주세요.")) return false;
			if(!checkNull($("#optionName2"), $("#optionName2").val(),"옵션명을 입력해주세요.")) return false;
			if(!checkNull($("#optionValue2"), $("#optionValue2").val(),"옵션값을 입력해주세요.")) return false;
		} else if($("#optionN").val() == 3){
			if(!checkNull($("#optionName1"), $("#optionName1").val(),"옵션명을 입력해주세요.")) return false;
			if(!checkNull($("#optionValue1"), $("#optionValue1").val(),"옵션값을 입력해주세요.")) return false;
			if(!checkNull($("#optionName2"), $("#optionName2").val(),"옵션명을 입력해주세요.")) return false;
			if(!checkNull($("#optionValue2"), $("#optionValue2").val(),"옵션값을 입력해주세요.")) return false;
			if(!checkNull($("#optionName3"), $("#optionName3").val(),"옵션명을 입력해주세요.")) return false;
			if(!checkNull($("#optionValue3"), $("#optionValue3").val(),"옵션값을 입력해주세요.")) return false;
		}
			
		
		$("#divOptNav").show();
		$("#btnPrevious").click();
		$("#optionList1").show();
		$("#tableCap").show();
		
		var optionName;
		var optionValue;
		var insertTr = "";
		var insertTr2 = "";
		var index = 1;
		
		$("#addTr").empty();
		$("#addTr2").empty();
		$("#addTr3").empty();
		
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
			 
			//optionList1 start
			optionName = $.trim($("#optionName1").val()); 
			$("#tropNameArray1").val(optionName);
			optionValue = $("#optionValue1").val().split(",");
			
			//모든 공백 제거
			$("#optionValue1").val($("#optionValue1").val().replace(/\s/gi, ""));
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input name='checkbox1' type='checkbox' class='form-check-input' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray1' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray1' id='trocAdditionalPrice" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			} 
			
			$("#addTr").append(insertTr);
			//optionList1 end
			
			//optionList2 start
			insertTr2 = "";
			
			insertTr2 += "<tr>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'><input id='checkboxAll2' type='checkbox' class='form-check-input'></td>";
			insertTr2 += "<td colspan='1' style='width: 200px;'>옵션명</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>정상가 (원)</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>판매가 (원)</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>재고수량</td>";
			insertTr2 += "</tr>";
			insertTr2 += "<tr>";
			insertTr2 += "<td>" + $.trim($("#optionName1").val()) + "</td>";
			insertTr2 += "</tr>";
			
			$("#addTr2").append(insertTr2);
			
			///////
			insertTr2 = "";
			
			for(var i=0;i<optionValue.length;i++){
				insertTr2 += "<tr>";
				insertTr2 += "<td style='vertical-align: middle;'><input name='checkbox2' type='checkbox' class='form-check-input' tabindex='-1'></td>";
				insertTr2 += "<td style='vertical-align: middle;'>" + $.trim(optionValue[i]) + "</td>";
				insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input id='trprListPriceArray" + (i+1) + "' name='trprListPriceArray' type='text' class='fullWH borderX text-center' readonly></td>";
				insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input name='trprDiscountPriceArray' type='text' class='fullWH borderX text-center'></td>";
				insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input name='trprStockArray' type='text' class='fullWH borderX text-center'></td>";
				insertTr2 += "</tr>";
			}
			
			
			
			
			$("#addTr3").append(insertTr2);
			
			$("#optionList2").hide();
			
			 
			//optionList2 end
			
			
			
		} else if($("#optionN").val() == 2){
			optionName = $.trim($("#optionName1").val()); 
			$("#tropNameArray1").val(optionName);
			optionValue = $("#optionValue1").val().split(",");
			
			//모든 공백 제거
			$("#optionValue1").val($("#optionValue1").val().replace(/\s/gi, ""));
			$("#optionValue2").val($("#optionValue2").val().replace(/\s/gi, ""));
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' name='checkbox1' class='form-check-input' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray1' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray1' id='trocAdditionalPrice1_" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
				
			optionName = $.trim($("#optionName2").val()); 
			$("#tropNameArray2").val(optionName);
			optionValue = $("#optionValue2").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input type='checkbox' name='checkbox1' class='form-check-input' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray2' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray2' id='trocAdditionalPrice2_" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
				
			$("#addTr").append(insertTr); 
			
			
			//optionList2 start
			insertTr2 = "";
			
			insertTr2 += "<tr>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'><input id='checkboxAll2' type='checkbox' class='form-check-input'></td>";
			insertTr2 += "<td colspan='2' style='width: 200px;'>옵션명</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>정상가 (원)</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>판매가 (원)</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>재고수량</td>";
			insertTr2 += "</tr>";
			insertTr2 += "<tr>";
			insertTr2 += "<td>" + $.trim($("#optionName1").val()) + "</td>";
			insertTr2 += "<td>" + $.trim($("#optionName2").val()) + "</td>";
			insertTr2 += "</tr>";
			
			$("#addTr2").append(insertTr2);
			
			//////
			var optionV1 = $("#optionValue1").val().split(",");
			var optionV2 = $("#optionValue2").val().split(",");
			
			insertTr2 = "";
			
			for(var i=0;i<optionV1.length;i++){
				for(var j=0;j<optionV2.length;j++){
					insertTr2 += "<tr>";
					insertTr2 += "<td style='vertical-align: middle;'><input name='checkbox2' type='checkbox' class='form-check-input' tabindex='-1'></td>";
					insertTr2 += "<td style='vertical-align: middle;'>" + $.trim(optionV1[i]) + "</td>";
					insertTr2 += "<td style='vertical-align: middle;'>" + $.trim(optionV2[j]) + "</td>";
					insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input id='trprListPriceArray" + (i+1) + "_" + (j+1) + "' name='trprListPriceArray' type='text' class='fullWH borderX text-center' readonly></td>";
					insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input name='trprDiscountPriceArray' type='text' class='fullWH borderX text-center'></td>";
					insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input name='trprStockArray' type='text' class='fullWH borderX text-center'></td>";
					insertTr2 += "</tr>";
				}
			}
			
			$("#addTr3").append(insertTr2);
			
			$("#optionList2").hide();
			
			//optionList2 end
			
			
			
		} else {
			optionName = $.trim($("#optionName1").val());  
			$("#tropNameArray1").val(optionName);
			optionValue = $("#optionValue1").val().split(",");
			
			//모든 공백 제거
			$("#optionValue1").val($("#optionValue1").val().replace(/\s/gi, ""));
			$("#optionValue2").val($("#optionValue2").val().replace(/\s/gi, ""));
			$("#optionValue3").val($("#optionValue3").val().replace(/\s/gi, ""));
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input name='checkbox1' type='checkbox' class='form-check-input' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray1' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray1' id='trocAdditionalPrice1_" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
				
			optionName = $.trim($("#optionName2").val());  
			$("#tropNameArray2").val(optionName);
			optionValue = $("#optionValue2").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input name='checkbox1' type='checkbox' class='form-check-input' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray2' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray2' id='trocAdditionalPrice2_" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
			
			optionName = $.trim($("#optionName3").val());
			$("#tropNameArray3").val(optionName);
			optionValue = $("#optionValue3").val().split(",");
			
			for(var i=0;i<optionValue.length;i++){
				
				insertTr += "<tr class='align-items-center'>";
				insertTr += "<td><input name='checkbox1' type='checkbox' class='form-check-input' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input type='text' class='fullWH borderX text-center' readonly value='" + optionName + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocNameArray3' type='text' class='fullWH borderX text-center' readonly value='" + $.trim(optionValue[i]) + "' tabindex='-1'></td>";
				insertTr += "<td class='p-0'><input name='trocAdditionalPriceArray3' id='trocAdditionalPrice3_" + (i+1) + "' type='text' class='fullWH borderX text-center' placeholder='추가금액'></td>";
				insertTr += "</tr>";
			}
			
			$("#addTr").append(insertTr);
			
			
			//optionList2 start
			insertTr2 = "";
			
			insertTr2 += "<tr>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'><input id='checkboxAll2' type='checkbox' class='form-check-input'></td>";
			insertTr2 += "<td colspan='3' style='width: 200px;'>옵션명</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>정상가 (원)</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>판매가 (원)</td>";
			insertTr2 += "<td rowspan='2' style='vertical-align: middle;'>재고수량</td>";
			insertTr2 += "</tr>";
			insertTr2 += "<tr>";
			insertTr2 += "<td>" + $.trim($("#optionName1").val()) + "</td>";
			insertTr2 += "<td>" + $.trim($("#optionName2").val()) + "</td>";
			insertTr2 += "<td>" + $.trim($("#optionName3").val()) + "</td>";
			insertTr2 += "</tr>";
			
			$("#addTr2").append(insertTr2);
			
			//////
			var optionV1 = $("#optionValue1").val().split(",");
			var optionV2 = $("#optionValue2").val().split(",");
			var optionV3 = $("#optionValue3").val().split(",");
			
			insertTr2 = "";
			
			for(var i=0;i<optionV1.length;i++){
				for(var j=0;j<optionV2.length;j++){
					for(var k=0;k<optionV3.length;k++){
						insertTr2 += "<tr>";
						insertTr2 += "<td style='vertical-align: middle;'><input name='checkbox2' type='checkbox' class='form-check-input' tabindex='-1'></td>";
						insertTr2 += "<td style='vertical-align: middle;'>" + $.trim(optionV1[i]) + "</td>";
						insertTr2 += "<td style='vertical-align: middle;'>" + $.trim(optionV2[j]) + "</td>";
						insertTr2 += "<td style='vertical-align: middle;'>" + $.trim(optionV3[k]) + "</td>";
						insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input id='trprListPriceArray" + (i+1) + "_" + (j+1) + "_" + (k+1) + "' name='trprListPriceArray' type='text' class='fullWH borderX text-center' readonly></td>";
						insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input name='trprDiscountPriceArray' type='text' class='fullWH borderX text-center'></td>";
						insertTr2 += "<td class='p-0' style='vertical-align: middle;'><input name='trprStockArray' type='text' class='fullWH borderX text-center'></td>";
						insertTr2 += "</tr>";
					}
				}
			}
			
			$("#addTr3").append(insertTr2);
			
			$("#optionList2").hide();
			
			
			//optionList2 end
			
			
		}
	});
	
	
	
	</script>
	
	<script type="text/javascript">
	$("#checkboxAll1").click(function(){
		if($("#checkboxAll1").is(":checked")){
			$("input[name=checkbox1]").prop("checked", true);
		} else {
			$("input[name=checkbox1]").prop("checked", false);
		}
	});
	
	$("input[name=checkbox1]").click(function(){
		var total = $("input[name=checkbox1]").length;
		var checked = $("input[name=checkbox1]:checked").length;
		
		if(total != checked){
			$("#checkboxAll1").prop("checked", false);
		} else {
			$("#checkboxAll1").prop("checked", true);
		}
	});
	
	//동적으로 생성한 태그에 이벤트 적용할 때는 살짝 다르게 해야함
	
	$(document).on("click", '#checkboxAll2', function(){
		if($("#checkboxAll2").is(":checked")){
			$("input[name=checkbox2]").prop("checked", true);
		} else {
			$("input[name=checkbox2]").prop("checked", false);
		}
	})
	
	
	$(document).on("click" , "input[name=checkbox2]", function(){
		var total = $("input[name=checkbox2]").length;
		var checked = $("input[name=checkbox2]:checked").length;
		
		if(total != checked){
			$("#checkboxAll2").prop("checked", false);
		} else {
			$("#checkboxAll2").prop("checked", true);
		}
	})
	
	$("#btnDelete").click(function(){
			
		var checkRows1 = $("[name='checkbox1']:checked");
		var checkRows2 = $("[name='checkbox2']:checked");
		
		for(var i = checkRows1.length-1 ; i > -1; i--){
			checkRows1.eq(i).closest('tr').remove();
		}
		for(var i = checkRows2.length-1 ; i > -1; i--){
			checkRows2.eq(i).closest('tr').remove();
		}
		
	});
	</script>
	
	<script type="text/javascript">
	$("#btnSubmit").on("click", function(){
		
		if(!checkNull($("#trpdName"), $("#trpdName").val(), "상품명을 입력해주세요.")){
			return false;
		}
		
		if($("#categorySearch").is(":checked")){
			if(!checkNull($("#shNameString"), $("#shNameString").val(), "카테고리를 입력해주세요.")){
				return false;
			}
		} else if($("#categorySelect").is(":checked")) {
			if(!checkNull($("#trpdCategoryCd1"), $("#trpdCategoryCd1").val(), "1차 카테고리를 선택해주세요.")){
				return false;
			}
			if(!checkNull($("#trpdCategoryCd2"), $("#trpdCategoryCd2").val(), "2차 카테고리를 선택해주세요.")){
				return false;
			}
			if(!checkNull($("#trpdCategoryCd3"), $("#trpdCategoryCd3").val(), "3차 카테고리를 선택해주세요.")){
				return false;
			}
		}
		if($("#optionPlural").is(":checked")){
			
		} else if($("#optionSingular").is(":checked")){
			if(!checkNull($("#trprListPriceArraySingle"),$("#trprListPriceArraySingle").val(), "정상가를 입력해주세요.")) return false;
			if(!checkOnlyNumber($("#trprListPriceArraySingle"),$("#trprListPriceArraySingle").val(), "잘못된 값입니다.")) return false;
			if(!checkNull($("#trprDiscountPriceArraySingle"),$("#trprDiscountPriceArraySingle").val(), "판매가를 입력해주세요.")) return false;
			if(!checkOnlyNumber($("#trprDiscountPriceArraySingle"),$("#trprDiscountPriceArraySingle").val(), "잘못된 값입니다.")) return false;
			if(!checkNull($("#trprStockArraySingle"),$("#trprStockArraySingle").val(), "재고수량을 입력해주세요.")) return false;
			if(!checkOnlyNumber($("#trprStockArraySingle"),$("#trprStockArraySingle").val(), "잘못된 값입니다.")) return false;
		}
	
		
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
	        $(".categorySearch").prop("disabled", false);
	        
	        $("#inputCategorySelectForm").hide();
	        $(".categorySelect").prop("disabled", true);
	    }else{
	        $("#inputCategorySelectForm").show();
	        $(".categorySelect").prop("disabled", false);
	        
	        $("#inputCategorySearchForm").hide();
	        $(".categorySearch").prop("disabled", true);
	    }
	});

	$("input[name=categoryMethod]").on("change", function(){
		if($("#categorySearch").is(":checked")){
	        $("#inputCategorySearchForm").show();
	        $(".categorySearch").prop("disabled", false);
	        $("#inputCategorySelectForm").hide();
	        $(".categorySelect").prop("disabled", true);
	        $("#trpdCategoryCd1").val("");
	        /* $("#trpdCategoryCd1").prop("selectedIndex", 0); */
	        $("#trpdCategoryCd2").addClass('d-none');
	        $("#trpdCategoryCd3").addClass('d-none');
	    }else{
	        $("#inputCategorySelectForm").show();
	        $(".categorySelect").prop("disabled", false);
	        $("#inputCategorySearchForm").hide();
	        $(".categorySearch").prop("disabled", true);
	        $("#shNameString").val("");
	        $("#ifctSeqString").val("");
	        $("#trpdCategoryCdString1").val("");
	        $("#trpdCategoryCdString2").val("");
	        $("#trpdCategoryCdString3").val("");
	        
	    }
	});
	
	$(document).ready(function(){
		if($("#optionPlural").is(":checked")){
			$("#optionPluralForm").show();
			$("#optionSingularForm").hide();
			$(".optionSingularArray").prop("disabled", true);
		} else {
			$("#optionPluralForm").hide();
			$("#optionSingularForm").show();
			$(".optionSingularArray").prop("disabled", false);
		}
	});
	
	//라디오박스 변경 확인취소 만들기
	$(document).ready(function(){
		var preValueOptionMethod = $("input[name=optionMethod]:checked").val();
		
		$("input[name=optionMethod]").on("click", function(){
			var confirmNy = confirm("\"" + $(this).val() + "\"으로 변경시, 다시 옵션정보를 등록해야합니다. \n그래도 실행하시겠습니까?");
			if(confirmNy){
				//by pass
			} else {
				$(this).prop('checked', false);
				$("input[name=optionMethod]:radio[value='" + preValueOptionMethod + "']").prop('checked', true);
				return;
			}
			preValueOptionMethod = $(this).val();
		});
		
	});	
	
	$("input[name=optionMethod]").on("change", function(){
		
		if($("#optionPlural").is(":checked")){
			$("#optionPluralForm").show();
			$("#optionSingularForm").hide();
			$(".optionSingularArray").prop("disabled", true);
		} else {
			$("#optionPluralForm").hide();
			$("#optionSingularForm").show();
			$("#addTr").children().remove();
			$("#addTr2").children().remove();
			$("#addTr3").children().remove();
			$("#trpdNameCopy").val($("#trpdName").val());
			$(".optionSingularArray").prop("disabled", false);
		}
	});
	
	$("#trpdName").on("change", function(){
		$("#trpdNameCopy").val($("#trpdName").val());
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
		
		$("input.optionName").removeClass("is-invalid");
		$("input.optionValue").removeClass("is-invalid");
		
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
	<!-- 
	<script type="text/javascript">
	let avatarInput2 = document.getElementById('avatar2');
	let img2 = document.querySelector('label[for=avatar2] img');

	avatarInput2.onchange = async (e) => {
	  
	  img2.classList.add('preview2');
	  img2.src = URL.createObjectURL(e.target.files[0]);  
	  
	  await console.log(img2.offsetHeight, img2.offsetWidth)
	  
	}
	</script>
	 -->
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
	
	<script type="text/javascript">
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	  return new bootstrap.Tooltip(tooltipTriggerEl)
	})
	</script>

</body>
</html>