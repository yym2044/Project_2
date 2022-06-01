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

	<form id="formCart" method="post">
		<input type="hidden" value="${sessSeq}" name="ifmmSeq">
		<input type="hidden" id="trpdSeq" name="trpdSeq">
		<input type="hidden" id="checkboxTrpdArray" name="trpdSeqArray">
	</form>
	
	
	<input type="hidden" id="trpdName">
	<input type="hidden" id="trprFullNameArray">
	<input type="hidden" id="trprSeq">
	
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
					<li class="nav-item"><a class="nav-link fs-4" href="javascript:goCartGeneral();">일반구매</a></li>
					<li class="nav-item"><a class="nav-link active fs-4 disabled" aria-current="page" href="">찜 목록</a></li>
					<li class="nav-item"><a class="nav-link fs-4" href="javascript:goCartRegular();">정기배송</a></li>
				</ul>
			</div>

			<div class="row py-3">
				<div class="col p-0 pt-2">
					<div class="table-responsive">
						<table class="table table-sm p-0 border-top border-3">
							<c:choose>
								<c:when test="${fn:length(wishList) eq 0}">
									<tr style="height: 100px;">
										<td colspan="5" class="text-center fs-6 fw-bold">찜한 상품이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr style="height: 50px;">
										<th colspan="4" class="bg-light text-start px-3">
											<div class="d-flex align-items-center">
												<input id="checkboxAll" class="form-check-input me-2" type="checkbox">
												<label for="checkboxAll" class="form-check-label me-2">전체 선택</label>
												<button id="btnDelete" class="btn btn-sm btn-outline-danger" type="button">선택 삭제</button>
											</div>
										</th>
									</tr>
									<c:forEach items="${wishList}" var="item" varStatus="status">
										<tr style="height: 120px;">
											<td class="px-3 text-start" style="width: 50px;">
												<input name="checkboxTrpd" class="form-check-input" type="checkbox" value="<c:out value="${item.trpdSeq}"/>">
											</td>
											<td class="px-2" style="width: 94px;">
												<c:choose>
													<c:when test="${!empty item.uuidName}">
														<img src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>" style="width: 78px;">
													</c:when>
													<c:otherwise>
														<img src="${path}/resources/images/user/productSearch/img_sample.jpg" style="width: 78px;">
													</c:otherwise>
												</c:choose>
											</td>
											<td class="px-2">
												<div class="row">
													<div class="col-12 text-start pb-1 fw-light" style="font-size: small;">
														<c:choose>
															<c:when test="${item.trpdDeliveryFee eq 0 or empty item.trpdDeliveryFee}">
																무료배송
															</c:when>
															<c:otherwise>
																배송비 <fmt:formatNumber value="${item.trpdDeliveryFee}"/>원
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-12 text-start pb-2">
														<a class="m-0 text-muted fw-bold" style="text-decoration: none;" href="javascript:goView(<c:out value="${item.trpdSeq}"/>)"><c:out value="${item.trpdName}"/></a>
													</div>
													<div class="col-12 text-start pb-2 fw-bold text-danger">
														<c:if test="${!empty item.trpdPrice}">
															<fmt:formatNumber value="${item.trpdPrice}"/>원
														</c:if>
													</div>
												</div>
											</td>
											<td class="px-2 text-end">
												<a href="javascript:getOptions(<c:out value="${item.trpdSeq}"/>)" class="btn btn-outline-primary w-100 mb-1">장바구니 담기</a>
												<a href="javascript:goDelete(<c:out value="${item.trpdSeq}"/>)" class="btn btn-outline-danger w-100">삭제</a>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
			</div>
		</div>






	</div>
	
	<div class="modal fade" id="optionModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">옵션을 선택해주세요!</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="optionModalBody" class="row p-5">
							
							
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnAddCart" class="btn btn-outline-info">장바구니 담기</button>
					<button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="goCartModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상품이 장바구니에 담겼습니다!</h5>
				<a href="/infra/product/cartGeneral?ifmmSeq=${sessSeq}" class="btn btn-outline-info">보러 가기</a>
				<button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>



	<%@include file="../include/footer.jsp" %>
	<%@include file="../include/jsLinks.jsp" %>

	<script type="text/javascript">
	
	goView = function(trpdSeq){
		$("#trpdSeq").val(trpdSeq);
		$("#formCart").attr("action", "/infra/product/productView").submit();
	}
	
	goDelete = function(trpdSeq){
		var confirmNy = confirm("상품을 찜 목록에서 삭제할까요?");
		if(confirmNy){
			$.ajax({
				async: false
				, cache: false
				, type: "post"
				, url: "/infra/product/deleteWishList"
				, data: { "ifmmSeq" : "<c:out value="${sessSeq}"/>" ,"trpdSeq" : trpdSeq }
				, success : function(response){
					
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
		location.reload();
	}
	
	</script>

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
	<script type="text/javascript">
	$("#checkboxAll").click(function(){
		if($("#checkboxAll").is(":checked")){
			$("input[name=checkboxTrpd]").prop("checked", true);
		} else {
			$("input[name=checkboxTrpd]").prop("checked", false);
		}
	});
	
	$("input[name=checkboxTrpd]").click(function(){
		var total = $("input[name=checkboxTrpd]").length;
		var checked = $("input[name=checkboxTrpd]:checked").length;
		
		if(total != checked){
			$("#checkboxAll").prop("checked", false);
		} else {
			$("#checkboxAll").prop("checked", true);
		}
	});
	</script>
	<script type="text/javascript">
	
	var opCount = 0;
	
	getOptions = function(trpdSeq){
		
		opCount = 0;
		
		$.ajax({
			async: false
			, cache: false
			, type: "post"
			, url: "/infra/product/productViewAjax"
			, data: { "trpdSeq" : trpdSeq }
			, success : function(response){
				if(response.rt == "success"){
					console.log(response);
					
					$("#trpdSeq").val(response.item.trpdSeq);
					$("#trpdName").val(response.item.trpdName);
					
					if(response.item.trpdOptionParentName1 != null){
						
						opCount++;
						
						$("#optionModalBody").children().remove();
						
						let append = "";
						
						//옵션 부모 1
						append += '<div class="col-12 p-0 py-1" style="font-size: small">';
						append += '<span>' + response.item.trpdOptionParentName1 + '</span>';
						append += '<select id="trprOptionChildCd1" name="trprOptionChildCd1" class="form-select optSelect" style="font-size: small;">';
						append += '<option value="0">::선택::</option>';
						
						for(var i = 0; i < response.options.length; i++) {
							if(response.options[i].tropSeq == response.item.trpdOptionParentCd1){
								append += '<option value="' + response.options[i].trocSeq + '">' + response.options[i].trocName + '</option>';
							}
						}
						
						append += '</select>';
						append += '</div>';
						
						
						if(response.item.trpdOptionParentName2 != null) {
							
							opCount++;
							
							//옵션 부모 2
							append += '<div class="col-12 p-0 py-1" style="font-size: small">';
							append += '<span>' + response.item.trpdOptionParentName2 + '</span>';
							append += '<select id="trprOptionChildCd2" name="trprOptionChildCd2" class="form-select optSelect" style="font-size: small;">';
							append += '<option value="0">::선택::</option>';
							
							for(var i = 0; i < response.options.length; i++) {
								if(response.options[i].tropSeq == response.item.trpdOptionParentCd2){
									append += '<option value="' + response.options[i].trocSeq + '">' + response.options[i].trocName + '</option>';
								}
							}
							
							append += '</select>';
							append += '</div>';
							
						}
						
						if(response.item.trpdOptionParentName3 != null) {
							
							opCount++;
							
							//옵션 부모 3
							append += '<div class="col-12 p-0 py-1" style="font-size: small">';
							append += '<span>' + response.item.trpdOptionParentName3 + '</span>';
							append += '<select id="trprOptionChildCd3" name="trprOptionChildCd3" class="form-select optSelect" style="font-size: small;">';
							append += '<option value="0">::선택::</option>';
							
							for(var i = 0; i < response.options.length; i++) {
								if(response.options[i].tropSeq == response.item.trpdOptionParentCd3){
									append += '<option value="' + response.options[i].trocSeq + '">' + response.options[i].trocName + '</option>';
								}
							}
							
							append += '</select>';
							append += '</div>';
							
						}
						
						
						$("#optionModalBody").append(append);
						$("#optionModal").modal("show");
						
					} else {
						
						
						$.ajax({
							  async: true
							  ,cache: false
							  ,type:"post"
							  ,url: "/infra/product/selectOneProduct_Real"
							  ,data : { "trpdSeq" : response.item.trpdSeq }
							  ,success: function(data){
									console.log(data.trprSeq + " " + data.trprListPrice);

									$.ajax({
										async: true
										, cache: false
										, type: "post"
										, url: "/infra/product/insertCartGeneral"
										, data: { "ifmmSeq" : "<c:out value="${sessSeq}"/>", "trprSeq" : data.trprSeq, "trctQuantity" : 1}
										, success: function() {
											$("#goCartModal").modal("show");
										}
										, error: function(jqXHR, textStatus, errorThrown){
											alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
										}
									});
									
									
							  }
							  ,error : function(jqXHR, textStatus, errorThrown){
									alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
								}
						  });
						
						
						
						
					}
					
					
				} else {
					console.log("something is wrong.");
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
		
		
		
	}
	
	$(document).on("change", ".optSelect", function(){
			
			if(opCount == 1) {
				if($("#trprOptionChildCd1").val() != 0){
					
					// ajax
					 $.ajax({
						  async: true
						  ,cache: false
						  ,type:"post"
						  ,url: "/infra/product/selectOneProduct_Real"
						  ,data : { "trpdSeq" : $("#trpdSeq").val(), "trprOptionChildCd1" : $("#trprOptionChildCd1").val() }
						  ,success: function(data){
								console.log(data.trprSeq + " " + data.trprListPrice);
								$("#trprSeq").val(data.trprSeq);
						  }
						  ,error : function(jqXHR, textStatus, errorThrown){
								alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
							}
					  });
					 //
					 
					 var select1 = document.querySelector("#trprOptionChildCd1");
					 
					 $("#trprFullNameArray").val($("#trpdName").val() + "，" + select1.options[select1.selectedIndex].text);
					 
				}
			} else if(opCount == 2) {
				if($("#trprOptionChildCd1").val() != 0 && $("#trprOptionChildCd2").val() != 0){
					
					// ajax
					 $.ajax({
						  async: true
						  ,cache: false
						  ,type:"post"
						  ,url: "/infra/product/selectOneProduct_Real"
						  ,data : { "trpdSeq" : $("#trpdSeq").val() , "trprOptionChildCd1" : $("#trprOptionChildCd1").val(), "trprOptionChildCd2" : $("#trprOptionChildCd2").val() }
						  ,success: function(data){
								console.log(data.trprSeq + " " + data.trprListPrice);
								$("#trprSeq").val(data.trprSeq);
						  }
						  ,error : function(jqXHR, textStatus, errorThrown){
								alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
							}
					  });
					 //
					 
					 var select1 = document.querySelector("#trprOptionChildCd1");
					 var select2 = document.querySelector("#trprOptionChildCd2");

					 $("#trprFullNameArray").val($("#trpdName").val() + "，" + select1.options[select1.selectedIndex].text + "，" + select2.options[select2.selectedIndex].text);
					 
					 
				}
			} else if(opCount == 3) {
				if($("#trprOptionChildCd1").val() != 0 && $("#trprOptionChildCd2").val() != 0 && $("#trprOptionChildCd3").val() != 0){
					
					// ajax
					 $.ajax({
						  async: true
						  ,cache: false
						  ,type:"post"
						  ,url: "/infra/product/selectOneProduct_Real"
						  ,data : { "trpdSeq" : $("#trpdSeq").val() , "trprOptionChildCd1" : $("#trprOptionChildCd1").val(), "trprOptionChildCd2" : $("#trprOptionChildCd2").val(), "trprOptionChildCd3" : $("#trprOptionChildCd3").val() }
						  ,success: function(data){
							  console.log(data.trprSeq + " " + data.trprListPrice);
							  $("#trprSeq").val(data.trprSeq);
						  }
						  ,error : function(jqXHR, textStatus, errorThrown){
								alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
							}
					  });
					 //
					 
					 var select1 = document.querySelector("#trprOptionChildCd1");
					 var select2 = document.querySelector("#trprOptionChildCd2");
					 var select3 = document.querySelector("#trprOptionChildCd3");
					 
					 $("#trprFullNameArray").val($("#trpdName").val() + "，" + select1.options[select1.selectedIndex].text + "，" + select2.options[select2.selectedIndex].text + "，" + select3.options[select3.selectedIndex].text);
					 
				}
			}
	});
	
	
	$("#btnAddCart").on("click", function(){
		
		if($("#trprSeq").val() == ""){
			alert("옵션 선택을 완료해주세요.");
			return false;
		}
		
		$.ajax({
			async: true
			, cache: false
			, type: "post"
			, url: "/infra/product/insertCartGeneral"
			, data: { "ifmmSeq" : "<c:out value="${sessSeq}"/>", "trprSeq" : $("#trprSeq").val(), "trctQuantity" : 1}
			, success: function() {
				$("#optionModal").modal("hide");
				$("#goCartModal").modal("show");
			}
			, error: function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
		
	})
	
	
	
		
	</script>
	
	<script type="text/javascript">
	
	var trpdArray = new Array();
	
	$("#btnDelete").on("click", function(){
		
		if($("input[name=checkboxTrpd]:checked").length == 0) {
			return false;
		}
		
		const delConfirm = confirm("선택된 상품을 삭제하시겠습니까?")	;
		
		if(delConfirm){
			
			$("input[name=checkboxTrpd]:checked").each(function(){
				trpdArray.push($(this).val());
			});
			
			$("#checkboxTrpdArray").val(trpdArray);
			
			$("#formCart").attr("action", "/infra/product/deleteWishListNotAjax").submit();
			
		}
		
	});
	
	</script>
	
	<script src="${path}/resources/common/js/cart.js"></script>
</body>
</html>