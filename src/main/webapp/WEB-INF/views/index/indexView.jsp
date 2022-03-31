<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.yym.infra.modules.code.CodeServiceImpl" scope="page"/>	<!-- 코드서비스임플 클래스 바로 사용 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인덱스!!</title>
<%-- <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet"/> --%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<link href="${path}/resources/css/style.css" rel="stylesheet" />
<link href="${path}/resources/css/sidebars.css" rel="stylesheet" />
<link href="${path}/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<script src="https://kit.fontawesome.com/fbbc6db919.js" crossorigin="anonymous"></script>

<style type="text/css">
th, td {
	text-align: center;
}

a {
	color: black;
	text-decoration: none;
}
</style>

</head>
<body>

<div class="row">
	<div class="col-12">
		sessSeq : <c:out value="${sessSeq}"/>
	</div>
	<div class="col-12">
		sessId : <c:out value="${sessId}"/> 
	</div>
	<div class="col-12">
		sessName : <c:out value="${sessName}"/>
	</div>
	<div class="col-2">
		<c:if test="${not empty sessSeq}">
			<button id="btnLogOut" name="btnLogOut" class="btn btn-outline-danger"><i class="bi bi-power"></i></button>
		</c:if>
	</div>
</div>

<c:if test="${sessAdminNy eq 1}">
	<a class="btn btn-outline-success" href="/infra/member/memberList">회원관리</a>
</c:if>




	<script type="text/javascript">

	/* function selectAll1(selectAll1) {
		const checkboxes 
			= document.getElementsByName("checkbox1");
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll1.checked;
		})
	} */
	
	function selectAll2(selectAll2) {
		const checkboxes 
			= document.getElementsByName("memberRank");
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll2.checked;
		})
	}
	
	function selectAll3(selectAll3) {
		const checkboxes
			= document.getElementsByName("shIfmmConsentNy");
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll3.checked;
		})
	}
	
    
	</script>






	<%-- <c:choose>
								<c:when test="${fn:length(list) eq 0}">
									<tr>
										<td class="text-center" colspan="9">There is no data!</td>
									</tr>
								</c:when>
								<c:otherwise>
							
									<table class="table border border-1 box-white container1" style="min-width: 1000px; border-collapse: separate;">
										<c:forEach items="${list}" var="item" varStatus="status">
											<tr>
												<td><c:out value="${item.ifmmSeq}" /></td>
												<td><c:out value="${item.ifmmName}"/></td>					
												<td><c:out value="${item.ifmmId}"/></td>					
												<td><c:out value="${item.ifmmGenderName}"/></td>					
												<td><c:out value="${item.ifmmDob}"/></td>					
												<td><c:out value="${item.ifmmFavoriteColor}"/></td>					
												<td><c:out value="${item.ifmmDelNy}"/></td>					
											<tr>
										</c:forEach>
									</table>
									
								</c:otherwise>
							</c:choose> --%>

	<%-- <script src="${path}/resources/js/bootstrap.bundel.min.js"></script> --%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<script src="${path}/resources/js/sidebars.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/infra/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
	<script src="/infra/resources/js/validation.js"></script>

	<script type="text/javascript">
	
	$("#btnLogOut").click(function(){
		
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/infra/member/logOutProc"
			,success: function(response) {
				if(response.rt == "success") {
					location.href = "/infra/member/loginForm";
				} else {
					alert("로그아웃 실패");
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
		
	});
		
	
	
	$("#checkboxAll").click(function(){
		if($("#checkboxAll").is(":checked")){
			$("input[name=checkbox1]").prop("checked", true);
		} else {
			$("input[name=checkbox1]").prop("checked", false);
		}
	});
	
	$("input[name=checkbox1]").click(function(){
		var total = $("input[name=checkbox1]").length;
		var checked = $("input[name=checkbox1]:checked").length;
		
		if(total != checked){
			$("#checkboxAll").prop("checked", false);
		} else {
			$("#checkboxAll").prop("checked", true);
		}
	});
	
	$(document).ready(function(){
		$("#shDateStart").datepicker();
		$("#shDateEnd").datepicker();
	});
	
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});
	
	</script>

	<script type="text/javascript">
	
	loadCodeList = function(){
	<%-- <%
		CodeServiceImpl.selectListForCache();
	%> --%>
	
	}
	
	$(document).ready(function(){
		if($("#shOptionDate").val() == 0){
			$("#shPeriod").attr('disabled', true);
			$("#shPeriod option:eq(3)").prop("selected", true);
			$("#shDateStart").attr('disabled', true);
			//$("#shDateStart").val('');
			$("#shDateEnd").attr('disabled', true);
			//$("#shDateEnd").val('');
			$("#shOptionDate").attr("placeholder", "시작일");
			$("#shDateEnd").attr("placeholder", "종료일");

		} else if ($("#shOptionDate").val() != 0) {
			$("#shPeriod").attr('disabled', false);
			$("#shDateStart").attr('disabled', false);
			$("#shDateEnd").attr('disabled', false);
		}
	});
	
	$("#shOptionDate").on("change", function(){
		if($("#shOptionDate").val() == 0){
			$("#shPeriod").attr('disabled', true);
			$("#shPeriod option:eq(3)").prop("selected", true);
			$("#shDateStart").attr('disabled', true);
			//$("#shDateStart").val('');
			$("#shDateEnd").attr('disabled', true);
			//$("#shDateEnd").val('');
			$("#shOptionDate").attr("placeholder", "시작일");
			$("#shDateEnd").attr("placeholder", "종료일");

		} else if ($("#shOptionDate").val() != 0) {
			$("#shPeriod").attr('disabled', false);
			$("#shDateStart").attr('disabled', false);
			$("#shDateEnd").attr('disabled', false);
		}
	});
	
	$(document).ready(function(){
		if($("#shPeriod").val() == 0){
			$("input.shDate").attr('readonly', false);
		}
	})
	
	$("#shPeriod").on("change", function(){
		if($(this).val() != 0){
			$("#formList").submit();
		} else {
			$("input.shDate").attr('readonly', false);
		}
	});
	
	
	//날짜선택 범위 잘못 지정 시 start
	var preStart;
	var preEnd;
	
	$("#shDateStart").on("click", function(){
		preStart = $("#shDateStart").val();	
		$(this).removeClass("is-invalid");
	});
	$("#shDateEnd").on("click", function(){
		preEnd = $("#shDateEnd").val();
		$(this).removeClass("is-invalid");
	});
	
	$("#shDateStart").on("change", function(){
		if($("#shDateStart").val() > $("#shDateEnd").val()){
			alert("날짜 선택이 잘못되었습니다.");
			$(this).val(preStart);
		}
	})
	
	$("#shDateEnd").on("change", function(){
		if($("#shDateStart").val() > $("#shDateEnd").val()){
			alert("날짜 선택이 잘못되었습니다.");
			$(this).val(preEnd);
		}
	})
	//날짜선택 범위 잘못 지정 시 end
	
	$(document).ready(function(){
		if($("#shIfscSeq").val() == 0){
			$("#searchBar").attr('disabled', true);
			$("#searchBar").val('');
			$("#searchBar").attr("placeholder", "search..");
		} else if ($("#shIfscSeq").val() != 0) {
			$("#searchBar").attr('disabled', false);
			if($("#shIfscSeq").val() == 1){
				$("#searchBar").attr("placeholder", "Name");
			} else if($("#shIfscSeq").val() == 2){
				$("#searchBar").attr("placeholder", "ID");
			} else if($("#shIfscSeq").val() == 3){
				$("#searchBar").attr("placeholder", "Email");
			}
		}
	});
	
	$("#shIfscSeq").on("change", function(){
		if($("#shIfscSeq").val() == 0){
			$("#searchBar").attr('disabled', true);
			$("#searchBar").val('');
			$("#searchBar").attr("placeholder", "search..");
		} else if ($("#shIfscSeq").val() != 0) {
			$("#searchBar").attr('disabled', false);
			if($("#shIfscSeq").val() == 1){
				$("#searchBar").attr("placeholder", "Name");
			} else if($("#shIfscSeq").val() == 2){
				$("#searchBar").attr("placeholder", "ID");
			} else if($("#shIfscSeq").val() == 3){
				$("#searchBar").attr("placeholder", "Email");
			}
		}
	});
	
	$("#btnSubmit").on("click", function(){
	
		
		if($("#shIfscSeq").val() == 1){
			if(!checkNull($("#searchBar"), $("#searchBar").val(), "이름을 입력해주세요")) {
				return false;
			}
		}
		if($("#shIfscSeq").val() == 2){
			if(!checkNull($("#searchBar"), $("#searchBar").val(), "아이디를 입력해주세요")) {
				return false;
			}
		}
		if($("#shIfscSeq").val() == 3){
			if(!checkNull($("#searchBar"), $("#searchBar").val(), "이메일을 입력해주세요")) {
				return false;
			}
		}
		
		if($("#shOptionDate").val() != 0 && $("#shPeriod").val() == 0){
			if(!checkNull($("#shDateStart"),$("#shDateStart").val(), "시작일을 입력해주세요.")){
				return false;
			}
			if(!checkNull($("#shDateEnd"),$("#shDateEnd").val(), "종료일을 입력해주세요.")){
				return false;
			}
		}
		
	});
	
	
	$("input:checkbox[Name='checkbox1']").on("change", function(){
		/* alert($(this).val()); */
		if($("input:checked[Name='checkbox1']").is(":checked")){
			$("#btnDelete").attr("data-bs-toggle", "modal");
			$("#btnDelete").attr("data-bs-target", "#deleteModal");
		} else {
			$("#btnDelete").removeAttr("data-bs-toggle");
			$("#btnDelete").removeAttr("data-bs-target");
		}
	});
	
	$("#checkboxAll").on("change", function(){
		if($("input:checked[Name='checkbox1']").is(":checked")){
			$("#btnDelete").attr("data-bs-toggle", "modal");
			$("#btnDelete").attr("data-bs-target", "#deleteModal");
		} else {
			$("#btnDelete").removeAttr("data-bs-toggle");
			$("#btnDelete").removeAttr("data-bs-target");
		}
	});
	
	$("#btnDelete").on("click", function(){
		if (!$("input:checked[Name='checkbox1']").is(":checked")){
			alert("한 개 이상 선택해주세요");
			return false;
		} else {
			
		}
		/* alert($("input:checked[Name='checkbox1']").val()); */
		
		
	});
	
	</script>

	<script type="text/javascript">
	
	document.querySelector(".disableLink").removeAttribute('href');

	changeRowNumToShow = function(num){
		$("#rowNumToShow").val(num);
		$("#formList").submit();
	}
	
	sortAsc = function(what){
		$("#sort").val(what);
		$("#orderby").val('top');
		$("#formList").submit();
	}
	
	sortDesc = function(what){
		$("#sort").val(what);
		$("#orderby").val('bottom');
		$("#formList").submit();
		
	}
	
	goPage = function(page){
		$("#thisPage").val(page);
		$("#formList").submit();
	}
	
	
	goView = function(ifmmSeq){
		$("#ifmmSeq").val(ifmmSeq);
		$("#formList").attr("action", "/infra/member/memberView");
		$("#formList").submit();
	}
	
	goForm = function(){
		$("#formList").attr("action", "/infra/member/memberForm");
		$("#formList").submit();
	}
	
	//체크박스 다수를 담을 배열
	var checkbox1Array = [];
	
	goDelete = function(){
		$("input[name=checkbox1]:checked").each(function(){
			checkbox1Array.push($(this).val());
		});
		
		$("input:hidden[name=checkboxSeqArray]").val(checkbox1Array);
		
		$("#formList").attr("action", "/infra/member/memberDele");
		$("#formList").submit();
	}
	
	goUpdateDelete = function(){
		$("input[name=checkbox1]:checked").each(function(){
			checkbox1Array.push($(this).val());
		});
		
		$("input:hidden[name=checkboxSeqArray]").val(checkbox1Array);
		
		$("#formList").attr("action", "/infra/member/updateDelNy");
		$("#formList").submit();
	}
	
	/* /infra/member/memberDele */
	/* /infra/member/updateDelNy */
	</script>


</body>
</html>

