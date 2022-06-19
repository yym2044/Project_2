<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.yym.infra.modules.code.CodeServiceImpl" />

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link href="${path}/resources/css/style.css" rel="stylesheet" />
<link href="${path}/resources/css/sidebars.css" rel="stylesheet" />
<link href="${path}/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<title>회원정보 수정</title>
<style type="text/css">
table th {
	text-align: start;
	vertical-align: middle;
}
</style>
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

	<form id="formEditForm" method="post" action="/infra/member/memberUpdt">

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
		<input type="hidden" id="shOptionDate" name="shOptionDate" value="<c:out value="${vo.shOptionDate}"/>">
		<input type="hidden" id="shDateStart" name="shDateStart" value="<c:out value="${vo.shDateStart}"/>">
		<input type="hidden" id="shDateEnd" name="shDateEnd" value="<c:out value="${vo.shDateEnd}"/>">


		<!-- ifmmSeq -->
		<input type="hidden" name="ifmmSeq" value="<c:out value="${rt.ifmmSeq}"/>">
		<!-- ifmmEditDate -->

		<div class="container-fluid">
			<div class="row bg-dark mb-2" style="height: 42px;">
				<div class="col col-md-12 text-white d-flex align-items-center ps-4 fw-bold fs-4">회원 정보 수정</div>
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
					<th style="width: 200px;" class="bg-light">
						아이디
						<span class="text-danger">*</span>
					</th>
					<td class="text-start" colspan="3">
						<input type="text" name="ifmmId" id="ifmmId" class="form-control d-inline" style="width: 200px;" placeholder="영문(대소문자),숫자,특수문자" value="<c:out value="${rt.ifmmId}"/>" autocomplete="off">
						<!-- 
					<span class="ms-2"><a href="#" class="fs-6"
							style="text-decoration: none;">아이디 중복체크</a></span>
					 -->
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">
						비밀번호
						<span class="text-danger">*</span>
					</th>
					<td class="text-start">
						<input type="password" name="ifmmPwd" id="ifmmPwd" class="pwd form-control" style="width: 200px;" value="<c:out value="${rt.ifmmPwd}"/>">
						<div class="valid-feedback" id="ifmmPwdValidFeedBack">사용가능한 비밀번호입니다.</div>
						<div class="invalid-feedback" id="ifmmPwdInvalidFeedBack">사용 불가능한 비밀번호입니다.</div>
					</td>
					<th style="width: 200px;" class="bg-light">
						비밀번호확인
						<span class="text-danger">*</span>
					</th>
					<td class="text-start">
						<input type="password" name="ifmmPwdConfirm" id="ifmmPwdConfirm" class="pwd form-control" style="width: 200px;" value="<c:out value="${rt.ifmmPwd}"/>">
						<div class="valid-feedback" id="ifmmPwdConfirmValidFeedBack">비밀번호가 일치합니다.</div>
						<div class="invalid-feedback" id="ifmmPwdConfirmInvalidFeedBack">비밀번호가 일치하지 않습니다.</div>

					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">
						이름
						<span class="text-danger">*</span>
					</th>
					<td class="text-start" colspan="3">
						<input type="text" name="ifmmName" id="ifmmName" class="form-control" style="width: 200px;" value="<c:out value="${rt.ifmmName}"/>" autocomplete="off">
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">이메일</th>
					<td class="text-start" colspan="3">
						<%-- 
						<input type="email" id="ifmeEmailFull" name="ifmeEmailFull" class="form-control d-inline" style="width: 200px;" value="<c:out value="${rt.ifmeEmailFull}"/>">
						 --%>
						<input type="text" id="ifmeEmailAccount" name="ifmeEmailAccount" class="form-control d-inline" style="width: 200px;" value="<c:out value="${rt.ifmeEmailAccount}"/>">
						<span>@</span>
						<input type="text" id="ifmeEmailDomain" name="ifmeEmailDomain" class="form-control d-inline" style="width: 200px;" value="<c:out value="${rt.ifmeEmailDomain}"/>" autocomplete="off">
						<select id="ifmeEmailDomainCd" name="ifmeEmailDomainCd" class="form-select d-inline" style="width: 200px;">
							<c:forEach items="${codeEmailDomain}" var="item" varStatus="status">
								<option value="<c:out value="${item.ifcdSeq}"/>" <c:if test="${item.ifcdSeq eq rt.ifmeEmailDomainCd}">selected</c:if>>
									<c:out value="${item.ifcdName}" />
								</option>
							</c:forEach>
						</select>
						<!-- 
						<span class="ms-2"><a href="#" class="fs-6" style="text-decoration: none;">이메일 중복체크</a></span>
						 -->
						<span class="ms-2">
							<%-- 
						<input type="checkbox" name="ifmmEmailConsentNy" id="email_check" value="1" <c:if test="${rt.ifmmEmailConsentNyText eq '수신동의'}">checked</c:if>><label for="email_check">이메일 수신 동의</label>
						<input type="hidden" name="ifmmEmailConsentNy" id="email_check_hidden" value="0">
						 --%>
							<input type="checkbox" name="ifmmEmailConsent" id="ifmmEmailConsent" <c:if test="${rt.ifmmEmailConsentNyText eq '수신동의'}">checked</c:if>>
							<label for="ifmmEmailConsent">이메일 수신 동의</label>
							<input type="hidden" name="ifmmEmailConsentNy" id="ifmmEmailConsentNy" value="0">

						</span>
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">등급설정</th>
					<td class="text-start" colspan="3">
						<select id="ifmmGradeCd" name="ifmmGradeCd" class="form-select" style="width: 150px;">
							<option value="0">::선택::</option>
							<c:forEach items="${codeMemberGrade}" var="item" varStatus="status">
								<option value="<c:out value="${item.ifcdSeq}"/>" <c:if test="${rt.ifmmGrade eq item.ifcdName}"> selected</c:if>>
									<c:out value="${item.ifcdName}" />
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">주소</th>
					<td class="text-start" colspan="3">

						<div class="row g-2">
							<div class="col-12 d-flex align-items-center">
								<div class="input-group input-group-sm" style="width: 300px;">
									<input type="text" name="ifmaZipCode" id="sample6_postcode" class="form-control d-inline bg-light" value="<c:out value="${rt.ifmaZipCode}"/>" placeholder="우편번호" readonly>
									<button type="button" class="btn btn-sm btn-outline-primary ms-1" id="btnAddress">우편번호 검색</button>
									<!--  onclick="sample6_execDaumPostcode()" -->
									<button type="button" class="btn btn-outline-danger" id="btnAddressClear">X</button>
								</div>
							</div>
							<div class="col-12">
								<input type="text" name="ifmaAddress1" id="sample6_address" class="form-control d-block" placeholder="주소" readonly style="width: 300px;" value="<c:out value="${rt.ifmaAddress1}"/>">
								<input type="text" name="ifmaAddress2" id="sample6_detailAddress" class="form-control d-inline mt-2" placeholder="상세주소" autocomplete="off" style="width: 300px;" value="<c:out value="${rt.ifmaAddress2}"/>">
								<input type="text" name="ifmaAddressReferences" id="sample6_extraAddress" class="form-control d-inline" style="width: 300px;" readonly placeholder="참고항목" value="<c:out value="${rt.ifmaAddressReferences}"/>">
								<div class="row mt-1">
									<div class="col">
										<input type="text" name="ifmaLat" id="ifmaLat" value="${rt.ifmaLat}" class="form-control d-inline" style="width: 147px;" readonly placeholder="위도">
										<input type="text" name="ifmaLng" id="ifmaLng" value="${rt.ifmaLng}" class="form-control d-inline" style="width: 147px;" readonly placeholder="경도">
									</div>
								</div>
							</div>
						</div>

					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">휴대폰</th>
					<td class="text-start" colspan="3">
						<select id="ifmpTelecomCdArray0" name="ifmpTelecomCdArray" class="form-select d-inline" style="width: 100px;">
							<option value="0">통신사</option>
							<c:forEach items="${codeTelecom}" var="item" varStatus="status">
								<option value="<c:out value="${item.ifcdSeq}"/>" <c:if test="${ifmpTelecomMobile eq item.ifcdSeq}">selected</c:if>>
									<c:out value="${item.ifcdName}" />
								</option>
							</c:forEach>
						</select>
						<input type="hidden" id="ifmpDefaultNyArray0" name="ifmpDefaultNyArray" value="1">
						<input type="hidden" id="ifmpTypeCdArray0" name="ifmpTypeCdArray" value="22">
						<input type="hidden" id="ifmpDeviceCdArray0" name="ifmpDeviceCdArray" value="26">
						<input type="text" id="ifmpNumberArray0" name="ifmpNumberArray" class="form-control d-inline" style="width: 200px;" placeholder="01012345678" value="<c:out value="${ifmpNumberMobile}"/>" autocomplete="off">
						<%-- 
						<input type="checkbox" name="ifmmSmsConsentNy" id="sms_check" value="1" <c:if test="${rt.ifmmSmsConsentNyText eq '수신동의'}">checked</c:if>><label for="sms_check">SMS 수신 동의</label>
						<input type="hidden" name="ifmmSmsConsentNy" id="sms_check_hidden" value="0">
						 --%>
						<input type="checkbox" name="ifmmSmsConsent" id="ifmmSmsConsent" <c:if test="${rt.ifmmSmsConsentNyText eq '수신동의'}">checked</c:if>>
						<label for="ifmmSmsConsent">SMS 수신 동의</label>
						<input type="hidden" name="ifmmSmsConsentNy" id="ifmmSmsConsentNy" value="0">
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">전화번호</th>
					<td class="text-start">
						<input type="hidden" id="ifmpDefaultNyArray1" name="ifmpDefaultNyArray" value="0">
						<input type="hidden" id="ifmpTypeCdArray1" name="ifmpTypeCdArray" value="22">
						<input type="hidden" id="ifmpDeviceCdArray1" name="ifmpDeviceCdArray" value="25">
						<input type="hidden" id="ifmpTelecomCdArray1" name="ifmpTelecomCdArray" value="">
						<input type="text" id="ifmpNumberArray1" name="ifmpNumberArray" class="form-control" style="width: 200px;" placeholder="02" value="<c:out value="${ifmpNumberHome}"/>" autocomplete="off">
					</td>
					<th style="width: 200px;" class="bg-light">팩스번호</th>
					<td class="text-start">
						<input type="hidden" id="ifmpDefaultNyArray2" name="ifmpDefaultNyArray" value="0">
						<input type="hidden" id="ifmpTypeCdArray2" name="ifmpTypeCdArray" value="22">
						<input type="hidden" id="ifmpDeviceCdArray2" name="ifmpDeviceCdArray" value="27">
						<input type="hidden" id="ifmpTelecomCdArray2" name="ifmpTelecomCdArray" value="">
						<input type="text" id="ifmpNumberArray2" name="ifmpNumberArray" class="form-control" style="width: 200px;" placeholder="021234567" value="<c:out value="${ifmpNumberFax}"/>" autocomplete="off">
					</td>
				</tr>
			</table>

			<div class="row mb-2">
				<div class="col col-md-12 d-flex">
					<i class="bi bi-caret-right-square-fill text-primary"></i>
					<span class="ms-2 fw-bold">추가 정보</span>
				</div>
			</div>

			<!-- table -->

			<table class="table">

				<tr>
					<th style="width: 200px;" class="bg-light">
						국적
						<span class="text-danger">*</span>
					</th>
					<td class="text-start">
						<select id="ifnaSeq" name="ifnaSeq" class="form-select" style="width: 200px;">
							<option value="0">::선택::</option>
							<c:forEach items="${listNation}" var="item" varStatus="status">
								<option value="${item.ifnaSeq}" <c:if test="${item.ifnaSeq eq rt.ifnaSeq}">selected</c:if>>
									<c:out value="${item.ifnaSeq}" /> |
									<c:out value="${item.ifnaName}" />
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">
						생년월일
						<span class="text-danger">*</span>
					</th>
					<td class="text-start">
						<input type="text" name="ifmmDob" id="ifmmDob" class="form-control" style="width: 200px;" value="<c:out value="${rt.ifmmDob}"/>" autocomplete="off">
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">성별</th>
					<td class="text-start">
						<input type="radio" name="ifmmGenderCd" id="man" value="3" <c:if test="${rt.ifmmGenderCd eq 3}">checked</c:if>>
						<label for="man">남성</label>
						<input type="radio" name="ifmmGenderCd" id="woman" value="4" <c:if test="${rt.ifmmGenderCd eq 4}">checked</c:if>>
						<label for="woman">여성</label>
					</td>
					
					
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">마케팅 수신동의</th>
					<td class="text-start">
						<select id="ifmmPushConsentNy" name="ifmmPushConsentNy" class="form-select" style="width: 100px;">
							<option value="1">예</option>
							<option value="0" <c:if test="${rt.ifmmPushConsentNyText eq '수신거부'}">selected</c:if>>아니오</option>
						</select>
					</td>
				</tr>
				<tr style="height: 95px;">
					<th style="width: 200px;" class="bg-light">ifmmDesc</th>
					<td class="text-start">
						<textarea id="ifmmDesc" name="ifmmDesc" class="form-control" style="font-size: small; height: 78px; resize: none;"><c:out value="${rt.ifmmDesc}" /></textarea>
					</td>
				</tr>
			</table>
			<!-- 
			<div class="row mb-2">
				<div class="col col-md-12 d-flex">
					<i class="bi bi-caret-right-square-fill text-primary"></i> <span class="ms-2 fw-bold">관리자 운영 메모</span>
				</div>
			</div>

			<div class="row mb-4">
				<div class="col-12 col-lg-10 pe-0">
					<input type="text" class="form-control" id="inputMemo" name="inputMemo" autocomplete="off">
				</div>
				<div class="col-12 col-lg text-end">
					<a class="btn btn-outline-primary" onclick="add_row()" onclick="clearInput()">등록</a> <a
						class="btn btn-outline-danger" onclick="delete_row()">삭제</a>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table container2" style="border-collapse: separate; min-width: 800px;">
					<thead>
						<tr>
							<th style="width: 100px;">번호</th>
							<th>내용</th>
							<th style="width: 200px;">작성일</th>
							<th style="width: 100px;">작성자</th>
						</tr>
					</thead>
					<tbody id="my-tbody">
						
			<tr>
			<td colspan="5">관리자 메모가 없습니다.</td>
			</tr> 
		
					</tbody>
				</table>
			</div>
			 -->
			<div class="text-center">
				<a type="button" class="btn btn-sm btn-outline-info border border-3 container1" href="javascript:goList();">목록</a>
				<input type="submit" id="btnSubmit" class="btn btn-sm btn-outline-success border border-3 container1" value="수정">
				<a type="button" class="btn btn-sm btn-outline-danger border border-3 container1" href="javascript:goView();">취소</a>
				<%-- <a type="button" class="btn btn-sm btn-outline-dark border border-3 container1" href="/infra/member/memberView?ifmmSeq=<c:out value="${rt.ifmmSeq}"/>">취소</a> --%>
			</div>



		</div>
	</form>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<script src="${path}/resources/js/sidebars.js"></script>

	<script type="text/javascript">
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
			cell2.innerHTML = document.getElementById("inputMemo").value;
			cell3.innerHTML = new Date().toLocaleString();
			cell4.innerHTML = 'Master';

			count += 1;

			var input = document.getElementById('inputMemo');
			input.value = null;
		}

		function delete_row() {
			var my_tbody = document.getElementById('my-tbody');
			if (my_tbody.rows.length < 1)
				return;
			// my_tbody.deleteRow(0); // 상단부터 삭제
			my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
		}

		/* 
		if(document.getElementById("email_check").checked) {
		    document.getElementById("email_check_hidden").disabled = true;
		}
		
		if(document.getElementById("sms_check").checked) {
		    document.getElementById("sms_check_hidden").disabled = true;
		}
		 */
	</script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/infra/resources/js/validation.js"></script>
	<script src="/infra/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#ifmmDob").datepicker();
		});

		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			showMonthAfterYear : true,
			yearSuffix : '년'
		});

		$("#btnSubmit")
				.on(
						"click",
						function() {

							if (!checkId($("#ifmmId"), $("#ifmmId").val(),
									"아이디가 유효하지 않습니다. 다시 입력해주세요.")) {
								return false;
							}

							if (!checkPassword($("#ifmmPwd"), $("#ifmmPwd")
									.val(), "비밀번호가 유효하지 않습니다.")) {
								return false;
							}

							if ($("#ifmmPwd").val() != $("#ifmmPwdConfirm")
									.val()) {
								alert("비밀번호를 다르게 입력하였습니다.");
								$("#ifmmPwdConfirm").focus();
								return false;
							}

							if (!checkNull($("#ifmmName"),
									$("#ifmmName").val(), "이름을 입력해주세요.")) {
								/* $("#ifmmName").addClass("is-invalid"); */
								return false;
							}

							if (!checkNull($("#ifmeEmailAccount"), $(
									"#ifmeEmailAccount").val(), "이메일을 입력해주세요")) {
								return false;
							}

							if (!checkNull($("#ifmeEmailDomain"), $(
									"#ifmeEmailDomain").val(), "도메인을 입력해주세요")) {
								return false;
							}

							if (!checkNoSelect($("#ifmmGradeCd"), $(
									"#ifmmGradeCd").val(), "등급을 설정해주세요.")) {
								return false;
							}

							if (!checkNoSelect($("#ifmpTelecomCd"), $(
									"#ifmpTelecomCd").val(), "통신사를 선택하세요.")) {
								return false;
							}

							if (!checkOnlyNumber($("#ifmpNumberArray0"), $(
									"#ifmpNumberArray0").val(), "숫자로만 입력해주세요.")) {
								return false;
							}

							if (!checkNoSelect($("#ifnaSeq"), $("#ifnaSeq")
									.val(), "국적을 선택하세요.")) {
								return false;
							}

							if (!checkNull($("#ifmmDob"), $("#ifmmDob").val(),
									"생년월일을 입력해주세요.")) {
								return false;
							}

							if (!$("input:checked[Name='ifmmGenderCd']").is(
									":checked")) {
								alert("성별을 선택해주세요.");
								$("input[Name='ifmmGenderCd']").addClass(
										"is-invalid");
								return false;
							}

							setCheckboxValue($("#ifmmEmailConsent"),
									$("#ifmmEmailConsentNy"));
							setCheckboxValue($("#ifmmSmsConsent"),
									$("#ifmmSmsConsentNy"));

						});

		$("input").keyup(function() {
			$(this).removeClass("is-invalid");
		});
		$("input").on("change", function() {
			$(this).removeClass("is-invalid");
		});
		$("#ifmeEmailDomainCd").on("change", function() {
			$("#ifmeEmailDomain").removeClass("is-invalid");
		});
		$("select").on("change", function() {
			$(this).removeClass("is-invalid");
		});

		$("#ifmeEmailDomain").keyup(function() {

			if ($('#ifmeEmailDomain').val() == "naver.com") {

				$(this).prop("readonly", true);
				$("#ifmeEmailDomainCd").val("18").prop("selected", true);

			} else if ($('#ifmeEmailDomain').val() == "daum.net") {

				$(this).prop("readonly", true);
				$("#ifmeEmailDomainCd").val("19").prop("selected", true);

			} else if ($('#ifmeEmailDomain').val() == "gmail.com") {

				$(this).prop("readonly", true);
				$("#ifmeEmailDomainCd").val("20").prop("selected", true);

			}

		});

		$("#btnAddress").on("click", function() {
			sample6_execDaumPostcode();
		});

		$("#btnAddressClear").on("click", function() {
			$("#sample6_postcode").val('');
			$("#sample6_address").val('');
			$("#sample6_detailAddress").val('');
			$("#sample6_extraAddress").val('');
		});

		$(document).ready(function() {
			if ($("#ifmeEmailDomainCd").val() == 21) {
				$("#ifmeEmailDomain").attr('readonly', false);
				$("#ifmeEmailDomain").val('');
				$("#ifmeEmailDomain").attr("placeholder", "example.com");
			} else if ($("#ifmeEmailDomainCd").val() != 21) {
				$("#ifmeEmailDomain").attr('readonly', true);
				if ($("#ifmeEmailDomainCd").val() == 18) {
					$("#ifmeEmailDomain").val("naver.com");
				} else if ($("#ifmeEmailDomainCd").val() == 19) {
					$("#ifmeEmailDomain").val("daum.net");
				} else if ($("#ifmeEmailDomainCd").val() == 20) {
					$("#ifmeEmailDomain").val("gmail.com");
				}
			}
		});

		$("#ifmeEmailDomainCd").on("change", function() {
			if ($("#ifmeEmailDomainCd").val() == 21) {
				$("#ifmeEmailDomain").attr('readonly', false);
				$("#ifmeEmailDomain").val('');
				$("#ifmeEmailDomain").attr("placeholder", "example.com");
			} else if ($("#ifmeEmailDomainCd").val() != 21) {
				$("#ifmeEmailDomain").attr('readonly', true);
				if ($("#ifmeEmailDomainCd").val() == 18) {
					$("#ifmeEmailDomain").val("naver.com");
				} else if ($("#ifmeEmailDomainCd").val() == 19) {
					$("#ifmeEmailDomain").val("daum.net");
				} else if ($("#ifmeEmailDomainCd").val() == 20) {
					$("#ifmeEmailDomain").val("gmail.com");
				}
			}
		});
	</script>


	<script type="text/javascript">
		$(function() {
			$("#ifmmPwdValidFeedBack").hide();
			$("#ifmmPwdInvalidFeedBack").hide();

			$("#ifmmPwdConfirmValidFeedBack").hide();
			$("#ifmmPwdConfirmInvalidFeedBack").hide();

			$("input.pwd")
					.keyup(
							function() {

								var pwd1 = $("#ifmmPwd").val();
								var pwd2 = $("#ifmmPwdConfirm").val();
								var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{8,20}$/;

								if (regExp.test(pwd1)) {
									$("#ifmmPwd").addClass("is-valid");
									$("#ifmmPwd").removeClass("is-invalid");
									$("#ifmmPwdValidFeedBack").show();
									$("#ifmmPwdInvalidFeedBack").hide();
									$("#ifmmPwdConfirm").removeAttr("disabled");
								} else if (!regExp.test(pwd1)
										&& pwd1.length > 1) {
									$("#ifmmPwd").addClass("is-invalid");
									$("#ifmmPwd").removeClass("is-valid");
									$("#ifmmPwdValidFeedBack").hide();
									$("#ifmmPwdInvalidFeedBack").show();
									$("#ifmmPwdConfirm").attr("disabled",
											"disabled");
								}

								if (pwd1 != "" && pwd2 != "") {
									if (pwd1 == pwd2) {
										$("#ifmmPwdConfirm").addClass(
												"is-valid");
										$("#ifmmPwdConfirm").removeClass(
												"is-invalid");
										$("#ifmmPwdConfirmValidFeedBack")
												.show();
										$("#ifmmPwdConfirmInvalidFeedBack")
												.hide();
										$("#btnSubmit").removeAttr("disabled");
									} else {
										$("#ifmmPwdConfirm").addClass(
												"is-invalid");
										$("#ifmmPwdConfirm").removeClass(
												"is-valid");
										$("#ifmmPwdConfirmValidFeedBack")
												.hide();
										$("#ifmmPwdConfirmInvalidFeedBack")
												.show();
										$("#btnSubmit").attr("disabled",
												"disabled");
									}
								}
							});
		});
	</script>

	<script type="text/javascript">
		goView = function() {
			$("#formEditForm").attr("action", "/infra/member/memberView");
			$("#formEditForm").submit();
		}

		goList = function() {
			$("#formEditForm").attr("action", "/infra/member/memberList");
			$("#formEditForm").submit();
		}

		setCheckboxValue = function(obj, targetObj) {
			if (obj.is(":checked")) {
				targetObj.val("1");
			} else {
				targetObj.val("0");
			}
		}
	</script>

</body>

</html>