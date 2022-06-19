<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.yym.infra.modules.code.CodeServiceImpl" />
<!-- 코드서비스임플 클래스 바로 사용 -->

<%
pageContext.setAttribute("br", "\n");
%>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link href="${path}/resources/css/style.css" rel="stylesheet" />
<link href="${path}/resources/css/sidebars.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<title>회원정보</title>
</head>
<body>

	<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('2')}" />
	<!-- listCodeGender에 값을 담음 -->
	<c:set var="listCodeTelecom" value="${CodeServiceImpl.selectListCachedCode('9')}" />
	<!-- listCodeTelecom(list 변수)에 값을 담음 -->



	<c:forEach items="${listPhone}" var="item" varStatus="status">
		<c:choose>
			<c:when test="${item.ifmpDeviceCd eq 25}">
				<c:set var="ifmpNumberHome" value="${item.ifmpNumber}" />
			</c:when>
			<c:when test="${item.ifmpDeviceCd eq 26}">
				<c:set var="ifmpNumberMobile" value="${item.ifmpNumber}" />
				<c:set var="ifmpTelecomMobile" value="${item.ifmpTelecomCd}" />
			</c:when>
			<c:when test="${item.ifmpDeviceCd eq 27}">
				<c:set var="ifmpNumberFax" value="${item.ifmpNumber}" />
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
	</c:forEach>

	<form id="formView" action="" method="post">


		<input type="hidden" id="shIfmmGrade" name="shIfmmGrade" value="<c:out value="${vo.shIfmmGrade}"/>">
		<input type="hidden" id="shIfmmEmailConsentNy" name="shIfmmEmailConsentNy" value="<c:out value="${vo.shIfmmEmailConsentNy}"/>">
		<input type="hidden" id="shIfmmSmsConsentNy" name="shIfmmSmsConsentNy" value="<c:out value="${vo.shIfmmSmsConsentNy}"/>">
		<input type="hidden" id="shIfmmPushConsentNy" name="shIfmmPushConsentNy" value="<c:out value="${vo.shIfmmPushConsentNy}"/>">
		<input type="hidden" id="shIfscSeq" name="shIfscSeq" value="<c:out value="${vo.shIfscSeq}"/>">
		<input type="hidden" id="searchBar" name="searchBar" value="<c:out value="${vo.searchBar}"/>">
		<input type="hidden" id="thisPage" name="thisPage" value="<c:out value="${vo.thisPage}"/>">
		<input type="hidden" id="rowNumToShow" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
		<input type="hidden" id="sort" name="sort" value="<c:out value="${vo.sort}"/>">
		<input type="hidden" id="orderby" name="orderby" value="<c:out value="${vo.orderby}"/>">
		<input type="hidden" id="ifmmSeq" name="ifmmSeq" value="<c:out value="${rt.ifmmSeq}"/>">
		<input type="hidden" id="shOptionDate" name="shOptionDate" value="<c:out value="${vo.shOptionDate}"/>">
		<input type="hidden" id="shDateStart" name="shDateStart" value="<c:out value="${vo.shDateStart}"/>">
		<input type="hidden" id="shDateEnd" name="shDateEnd" value="<c:out value="${vo.shDateEnd}"/>">
		<input type="hidden" id="checkboxNoteArray" name="checkboxNoteArray">
		<input type="hidden" id="ifntWriterCd" name="ifntWriterCd" value="${sessSeq}">

		<div class="container-fluid">
			<div class="row bg-dark mb-2" style="height: 42px;">
				<div class="col col-md-12 text-white d-flex align-items-center">
					<c:out value="${rt.ifmmId}" />
					님의 회원정보입니다.
				</div>
			</div>

			<div class="row mb-2">
				<div class="col col-md-12 d-flex">
					<i class="bi bi-caret-right-square-fill text-primary"></i>
					<span class="ms-2 fw-bold">회원 기본 정보</span>
				</div>
			</div>

			<!-- table -->

			<table class="table" style="border-collapse: collapse;">
				<tr>
					<td style="width: 200px;" class="bg-light text-start">아이디</td>
					<td class="text-start">
						<c:out value="${rt.ifmmId}" />
						<span class="ms-2">
							<a href="#" class="fs-6" style="text-decoration: none;">비번변경</a>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">이름</td>
					<td class="text-start">
						<c:out value="${rt.ifmmName}" />
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">이메일</td>
					<td class="text-start">
						<c:out value="${rt.ifmeEmailFull}" />
						<span class="badge <c:choose>
											<c:when test="${rt.ifmmEmailConsentNyText eq '수신동의'}">bg-primary</c:when>
											<c:when test="${rt.ifmmEmailConsentNyText eq '수신거부'}">bg-secondary</c:when>
										</c:choose> ms-1">
							<c:out value="${rt.ifmmEmailConsentNyText}" />
						</span>
					</td>

				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">회원등급</td>
					<td class="text-start">
						<span class="fw-bold">
							<c:out value="${rt.ifmmGrade}" />
						</span>
						<span class="ms-2">
							<a href="#" class="" style="text-decoration: none;">등급변경</a>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">주소</td>
					<td class="text-start">
						<c:out value="${rt.ifmaAddress1} ${rt.ifmaAddress2}" />
						<span class="badge bg-primary">
							<fmt:formatNumber value="${rt.ifmaLat}" />
						</span>
						<span class="badge bg-danger">
							<fmt:formatNumber value="${rt.ifmaLng}" />
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">휴대폰</td>
					<td class="text-start">
						<span class="badge bg-info">
							<c:forEach items="${listCodeTelecom}" var="item" varStatus="status">
								<c:if test="${item.ifcdSeq eq ifmpTelecomMobile}">
									<c:out value="${item.ifcdName}" />
								</c:if>
							</c:forEach>
						</span>
						<%-- <c:out value="${rt1.ifmpNumberMobile}" /> --%>
						<c:set var="numberPhone" value="${ifmpNumberMobile}" />
						<c:choose>
							<c:when test="${fn:length(numberPhone) eq 10 }">
								<c:out value="${fn:substring(numberPhone,0,3)}" />
									- <c:out value="${fn:substring(numberPhone,3,6)}" />
									- <c:out value="${fn:substring(numberPhone,6,10)}" />
							</c:when>
							<c:otherwise>
								<c:out value="${fn:substring(numberPhone,0,3)}" />
									- <c:out value="${fn:substring(numberPhone,3,7)}" />
									- <c:out value="${fn:substring(numberPhone,7,11)}" />
							</c:otherwise>
						</c:choose>
						<span class="badge <c:choose>
											<c:when test="${rt.ifmmSmsConsentNyText eq '수신동의'}">bg-primary</c:when>
											<c:when test="${rt.ifmmSmsConsentNyText eq '수신거부'}">bg-secondary</c:when>
										</c:choose> ms-1">
							<c:out value="${rt.ifmmSmsConsentNyText}" />
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">전화번호</td>
					<td class="text-start">
						<%-- <c:out value="${rt2.ifmpNumberHome}" /> --%>
						<c:set var="numberPhone" value="${ifmpNumberHome}" />
						<c:choose>
							<c:when test="${fn:length(numberPhone) eq 9 }">
								<c:out value="${fn:substring(numberPhone,0,2)}" />
									- <c:out value="${fn:substring(numberPhone,2,5)}" />
									- <c:out value="${fn:substring(numberPhone,5,9)}" />
							</c:when>
							<c:when test="${fn:length(numberPhone) eq 10}">
								<c:out value="${fn:substring(numberPhone,0,3)}" />
									- <c:out value="${fn:substring(numberPhone,3,6)}" />
									- <c:out value="${fn:substring(numberPhone,6,10)}" />
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">팩스번호</td>
					<td class="text-start">
						<c:out value="${ifmpNumberFax}" />
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">홈페이지</td>
					<td class="text-start">
						<c:forEach items="${listAddressOnline}" var="item" varStatus="status">
							<c:choose>
								<c:when test="${item.ifaoTypeCd eq 33}">
									<c:out value="${item.ifaoUrl}" />
									<br>
								</c:when>
							</c:choose>
						</c:forEach>
					</td>
				</tr>
				<%-- <c:choose><c:when></c:when></c:choose> 이나 <c:if></c:if>를 사용. 둘 다 가능한 듯 --%>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">SNS</td>
					<td class="text-start">
						<c:forEach items="${listAddressOnline}" var="item" varStatus="status">
							<c:if test="${item.ifaoTypeCd eq 34}">
								<c:out value="${item.ifaoUrl}" />
								<br>
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">이미지</td>
					<td class="text-start">
						<c:forEach items="${listUploaded}" var="item" varStatus="status">
							<c:if test="${item.type eq 0}">
								<img style="height: 200px;" src="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>">
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">파일</td>
					<td class="text-start">
						<c:forEach items="${listUploaded}" var="item" varStatus="status">
							<c:if test="${item.type eq 1}">
								<a download="<c:out value="${item.originalName}"/>" href="<c:out value="${item.path}"/><c:out value="${item.uuidName}"/>"><c:out value="${item.originalName }"/></a>
								<br>
							</c:if>
						</c:forEach>
					</td>
				</tr>
			</table>

			<div class="text-center">
				<a href="javascript:goList();" type="button" class="btn btn-outline-dark btn-sm border border-3 container1">목록으로</a>
				<a href="javascript:goEdit();" type="button" class="btn btn-outline-dark btn-sm border border-3 container1">정보수정</a>

				<%-- <a href="/infra/member/memberList?rowNumToShow=<c:out value="${vo.rowNumToShow}"/>&shIfmmGrade=<c:out value="${vo.shIfmmGrade}"/>&shIfmmEmailConsentNy=<c:out value="${vo.shIfmmEmailConsentNy}"/>&shIfmmSmsConsentNy=<c:out value="${vo.shIfmmSmsConsentNy}"/>&shIfmmPushConsentNy=<c:out value="${vo.shIfmmPushConsentNy}"/>&shIfscSeq=<c:out value="${vo.shIfscSeq}"/>&searchBar=<c:out value="${vo.searchBar}"/>&thisPage=<c:out value="${vo.thisPage}"/>&sort=<c:out value="${vo.sort}"/>&orderby=<c:out value="${vo.orderby}"/>" type="button" class="btn btn-outline-dark btn-sm border border-3 container1">목록으로</a> --%>
				<%-- <a href="/infra/member/memberEditForm?ifmmSeq=<c:out value="${rt.ifmmSeq}"/>" type="button" class="btn btn-outline-dark btn-sm border border-3 container1">정보수정</a> --%>
			</div>

			<div class="row mb-2">
				<div class="col col-md-12 d-flex">
					<i class="bi bi-caret-right-square-fill text-primary"></i>
					<span class="ms-2 fw-bold">추가 정보</span>
				</div>
			</div>

			<!-- table -->

			<table class="table">

				<tr>
					<td style="width: 200px;" class="bg-light text-start">국적</td>
					<td class="text-start">
						<c:out value="${rt.ifnaName}" />
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">가입일시</td>
					<td class="text-start">
						<fmt:formatDate value="${rt.regDateTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">수정일시</td>
					<td class="text-start">
						<fmt:formatDate value="${rt.modDateTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">로그인</td>
					<td class="text-start">총 로그인 119회 (마지막 로그인 : 2022.02.17)</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">생년월일</td>
					<td class="text-start">
						<c:out value="${rt.ifmmDob}" />
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">성별</td>
					<td class="text-start">
						<c:forEach items="${listCodeGender}" var="itemGender" varStatus="statusGender">
							<c:if test="${rt.ifmmGenderCd eq itemGender.ifcdSeq}">
								<c:out value="${itemGender.ifcdName}" />
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">마케팅 수신동의</td>
					<td class="text-start">
						<c:out value="${rt.ifmmPushConsentNyText}" />
					</td>
				</tr>
				<tr>
					<td style="width: 200px;" class="bg-light text-start">ifmmDesc</td>
					<td class="text-start">
						<%-- <p>${fn:replace(rt.ifmmDesc, br, '<br/>')}</p> 둘 다 가능 --%>
						<%-- <% pageContext.setAttribute("br", "\n"); %> 같이 써줘야 함, 위에 이미 있음 --%>
						<p>
							<c:out value="${fn:replace(rt.ifmmDesc, br, '<br/>')}" escapeXml="false" />
					</td>
				</tr>
			</table>

			<!-- 관리자 운영 메모 -->

			<div class="row mb-2">
				<div class="col col-md-12 d-flex">
					<i class="bi bi-caret-right-square-fill text-primary"></i>
					<span class="ms-2 fw-bold">관리자 운영 메모</span>
				</div>
			</div>

			<div class="row mb-4">
				<div class="col-12 col-lg-10 pe-0">
					<input type="text" class="form-control" id="ifntContent" name="ifntContent" autocomplete="off">
				</div>
				<div class="col-12 col-lg text-end">
					<a class="btn btn-outline-primary" href="javascript:addNote();">등록</a>
					<a id="btnDelete" class="btn btn-outline-danger" href="javascript:deleteNote();">삭제</a>
				</div>
			</div>
			<div class="table-responsive">
				<c:choose>
					<c:when test="${fn:length(noteList) eq 0}">
						<table class="table table-hover table-sm border border-1 box-white" style="min-width: 1000px; border-collapse: collapse;">
							<thead>
								<tr>
									<th style="width: 50px;">
										<input type="checkbox" disabled class="form-check-input" id="" name="">
									</th>
									<th style="width: 100px;">번호</th>
									<th>내용</th>
									<th style="width: 200px;">작성일</th>
									<th style="width: 100px;">작성자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">관리자 메모가 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</c:when>

					<c:otherwise>

						<table class="table table-hover table-sm border border-1 box-white" style="min-width: 700px; border-collapse: collapse;">
							<thead>
								<tr>
									<th style="width: 50px;">
										<input type="checkbox" class="form-check-input" id="checkboxNoteAll" name="" value="">
									</th>
									<th style="width: 100px;">번호</th>
									<th>내용</th>
									<th style="width: 200px;">작성일</th>
									<th style="width: 100px;">작성자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noteList}" var="item" varStatus="status">
									<tr>
										<td style="width: 50px;">
											<input type="checkbox" class="form-check-input" id="" name="checkboxNote" value="<c:out value="${item.ifntOrder}"/>">
										</td>
										<td style="width: 100px;">
											<c:out value="${item.ifntOrder}" />
										</td>
										<td>
											<c:out value="${item.ifntContent}" />
										</td>
										<td style="width: 200px;">
											<fmt:formatDate value="${item.regDateTime}" pattern="yy.MM.dd HH:mm:ss" />
										</td>
										<td style="width: 100px;">
											<c:out value="${item.ifntWriter}" />
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</c:otherwise>
				</c:choose>
			</div>

		</div>
	</form>






	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<script src="${path}/resources/js/sidebars.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- <script type="text/javascript">
		var count = 1;

		function add_row() {
			var my_tbody = document.getElementById('my-tbody');
			// var row = my_tbody.insertRow(0); // 상단에 추가
			var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			cell1.innerHTML = count;
			cell2.innerHTML = document.getElementById("inputNote").value;
			cell3.innerHTML = new Date().toLocaleString();
			cell4.innerHTML = 'Master';

			count += 1;

			var input = document.getElementById('inputNote');
			input.value = null;
		}

		function delete_row() {
			var my_tbody = document.getElementById('my-tbody');
			if (my_tbody.rows.length < 1)
				return;
			// my_tbody.deleteRow(0); // 상단부터 삭제
			my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
		}
	</script> -->


	<!-- 체크박스 전체선택 -->
	<script type="text/javascript">
		$("#checkboxNoteAll").click(function() {
			if ($(this).is(":checked")) {
				$("input[name=checkboxNote]").prop("checked", true);
			} else {
				$("input[name=checkboxNote]").prop("checked", false);
			}
		});

		$("input[name=checkboxNote]").click(function() {
			var total = $("input[name=checkboxNote]").length;
			var checked = $("input[name=checkboxNote]:checked").length;

			if (total != checked) {
				$("#checkboxNoteAll").prop("checked", false);
			} else {
				$("#checkboxNoteAll").prop("checked", true);
			}
		});
	</script>


	<script type="text/javascript">
		goList = function() {
			$("#formView").attr("action", "/infra/member/memberList");
			$("#formView").submit();
		}

		goEdit = function() {
			$("#formView").attr("action", "/infra/member/memberEditForm");
			$("#formView").submit();
		}

		addNote = function() {
			$("#formView").attr("action", "/infra/member/memberNoteInst");
			$("#formView").submit();
		}

		deleteNote = function() {

			$("#formView").attr("action", "/infra/member/memberNoteDele");
			$("#formView").submit();
		}

		/* $("input:checkbox[Name='checkboxNote']").on("change", function(){
			alert($(this).val() + "번 메모");
		}); */

		$("#btnDelete").on("click", function() {

			var checkboxNoteArray = [];

			$("input[name=checkboxNote]:checked").each(function() {
				checkboxNoteArray.push($(this).val());
			});

			$("input:hidden[name=checkboxNoteArray]").val(checkboxNoteArray);

			var numberString = $("input:hidden[name=checkboxNoteArray]").val();

			if (!$("input:checked[Name='checkboxNote']").is(":checked")) {
				alert("한 개 이상 선택해주세요");
				return false;
			} else {
				var delConfirm = confirm(numberString + "번 메모를 삭제할까요?");
				if (delConfirm) {
					var delConfirm2 = confirm("삭제하면 복구할 수 없습니다. 정말로 삭제할까요?");

					if (delConfirm2) {
						alert("삭제 완료.");
					} else {
						return false;
					}

				} else {
					return false;
				}
			}
		});
	</script>
</body>

</html>


