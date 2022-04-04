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

<style type="text/css">
@charset "UTF-8";
html * {
  box-sizing: border-box;
}

p {
  margin: 0;
}

.upload__box {
  padding: 40px;
}
.upload__inputfile {
  width: 0.1px;
  height: 0.1px;
  opacity: 0;
  overflow: hidden;
  position: absolute;
  z-index: -1;
}
.upload__btn {
  display: inline-block;
  font-weight: 600;
  color: #fff;
  text-align: center;
  min-width: 116px;
  padding: 5px;
  transition: all 0.3s ease;
  cursor: pointer;
  border: 2px solid;
  background-color: #4045ba;
  border-color: #4045ba;
  border-radius: 10px;
  line-height: 26px;
  font-size: 14px;
}
.upload__btn:hover {
  background-color: unset;
  color: #4045ba;
  transition: all 0.3s ease;
}
.upload__btn-box {
  margin-bottom: 10px;
}
.upload__img-wrap {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -10px;
}
.upload__img-box {
  width: 200px;
  padding: 0 10px;
  margin-bottom: 12px;
}
.upload__img-close {
  width: 24px;
  height: 24px;
  border-radius: 50%;
  background-color: rgba(0, 0, 0, 0.5);
  position: absolute;
  top: 10px;
  right: 10px;
  text-align: center;
  line-height: 24px;
  z-index: 1;
  cursor: pointer;
}
.upload__img-close:after {
  content: "✖";
  font-size: 14px;
  color: white;
}

.img-bg {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  position: relative;
  padding-bottom: 100%;
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
							<h6 class="fw-bold" class="fw-bold">노출상품명 <span class="text-danger">♥</span></h6>
							<input type="text" class="form-control" placeholder="노출상품명 입력(브랜드명 + 제품명)">
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold" class="fw-bold">카테고리 <span class="text-danger">♥</span></h6>
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
							<h6 class="fw-bold">옵션 <span class="text-danger">♥</span></h6>
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
							<h6 class="fw-bold">태그</h6>
							<input type="text" class="form-control" placeholder="태그명 ( 최대 3개까지 ,로 구분 )">
						</div>
					</div>
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold">상품 이미지 <span class="text-danger">♥</span></h6>
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
					<div class="row border p-3 mb-2">
						<div class="col">
							<h6 class="fw-bold">상세설명 <span class="text-danger">♥</span></h6>
							<div class="input-group input-group-sm mb-2">
								<input type="radio" class="btn-check" name="descMethod" id="descImage" autocomplete="off" checked>
								<label class="btn btn-outline-primary" for="descImage">이미지 업로드</label>
								
								<input type="radio" class="btn-check" name="descMethod" id="descEditor" autocomplete="off">
								<label class="btn btn-outline-primary" for="descEditor">에디터 작성</label>
							</div>
							
							<div id="descImageForm">
								<div class="upload__box">
									<div class="upload__btn-box">
										<label class="upload__btn">
											<p>Upload images</p>
											<input type="file" multiple="" data-max_length="20" class="upload__inputfile">
										</label>
									</div>
									<div class="upload__img-wrap">
											
										
									</div>
								</div>
							</div>
							<div id="descEditorForm">
							
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
	
	<script type="text/javascript">
	jQuery(document).ready(function () {
		  ImgUpload();
		});

		function ImgUpload() {
		  var imgWrap = "";
		  var imgArray = [];

		  $('.upload__inputfile').each(function () {
		    $(this).on('change', function (e) {
		      imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
		      var maxLength = $(this).attr('data-max_length');

		      var files = e.target.files;
		      var filesArr = Array.prototype.slice.call(files);
		      var iterator = 0;
		      filesArr.forEach(function (f, index) {

		        if (!f.type.match('image.*')) {
		          return;
		        }

		        if (imgArray.length > maxLength) {
		          return false
		        } else {
		          var len = 0;
		          for (var i = 0; i < imgArray.length; i++) {
		            if (imgArray[i] !== undefined) {
		              len++;
		            }
		          }
		          if (len > maxLength) {
		            return false;
		          } else {
		            imgArray.push(f);

		            var reader = new FileReader();
		            reader.onload = function (e) {
		              var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div></div>";
		              imgWrap.append(html);
		              iterator++;
		            }
		            reader.readAsDataURL(f);
		          }
		        }
		      });
		    });
		  });

		  $('body').on('click', ".upload__img-close", function (e) {
		    var file = $(this).parent().data("file");
		    for (var i = 0; i < imgArray.length; i++) {
		      if (imgArray[i].name === file) {
		        imgArray.splice(i, 1);
		        break;
		      }
		    }
		    $(this).parent().parent().remove();
		  });
		}
	</script>

</body>
</html>