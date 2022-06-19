<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link href="${path}/resources/css/style.css?after" rel="stylesheet">
<link href="${path}/resources/css/sidebars.css" rel="stylesheet" />
<link href="${path}/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<title>회원등록</title>

<style type="text/css">

	table th {
	text-align: start;
	vertical-align: middle;
}

</style>

<style type="text/css">
	.addScroll {
		overflow-y: auto;
		height : 90px;
	}
	
	.input-file-button {
		padding : auto;
		cursor : pointer;
	}

</style>

</head>
<body>
	<!-- 
	<div class="cc-selector">
		<input id="visa" type="radio" name="credit-card" value="visa" />
		<label class="drinkcard-cc visa" for="visa"></label>
		<input id="mastercard" type="radio" name="credit-card" value="mastercard" />
		<label class="drinkcard-cc mastercard"for="mastercard"></label>
	</div>
	 -->

	<form id="formForm" method="post" action="/infra/member/memberInst" enctype="multipart/form-data">
	
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
		<%-- <input type="hidden" name="ifmmSeq" value="${fn:length(list2)+1}"> --%>
		<!-- ifmmRegDate -->
		<!-- <input type="hidden" name="ifmmRegDate" value="20220309"> -->

		<div class="container-fluid">
			<div class="row bg-dark mb-2" style="height: 42px;">
				<div class="col col-md-12 text-white d-flex align-items-center ps-4 fw-bold fs-4">회원등록</div>
			</div>

			<div class="row mb-2">
				<div class="col col-md-8 d-flex">
					<i class="bi bi-caret-right-square-fill text-primary"></i>
					<span class="ms-2 fw-bold">회원 기본 정보</span>
				</div>
				<div class="col col-md text-end">
					<span class="text-danger">*</span>
					표시 항목은 필수 입력 항목입니다.
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
						<input type="text" name="ifmmId" id="ifmmId" class="form-control d-inline" style="width: 200px;" placeholder="영문(대소문자),숫자,특수문자" autocomplete="off">
						<!-- 
						<span class="ms-2">
							<a href="#" class="fs-6" style="text-decoration: none;">아이디 중복체크</a>
						</span>
						 -->
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">
						비밀번호
						<span class="text-danger">*</span>
					</th>
					<td class="text-start">
						<input type="password" name="ifmmPwd" id="ifmmPwd" class="pwd form-control" style="width: 200px;" autocomplete="off">
						<div class="valid-feedback" id="ifmmPwdValidFeedBack">사용가능한 비밀번호입니다.</div>
						<div class="invalid-feedback" id="ifmmPwdInvalidFeedBack">사용 불가능한 비밀번호입니다.</div>
					</td>
					<th style="width: 200px;" class="bg-light">
						비밀번호확인
						<span class="text-danger">*</span>
					</th>
					<td class="text-start">
						<input type="password" name="ifmmPwdConfirm" class="pwd form-control" id="ifmmPwdConfirm" style="width: 200px;" autocomplete="off" disabled>
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
						<input type="text" name="ifmmName" class="form-control" id="ifmmName" style="width: 200px;" autocomplete="off">
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">
					이메일
					<span class="text-danger">*</span>
					</th>
					<td class="text-start" colspan="3">
						<!-- 
						<input type="email" id="ifmeEmailFull" name="ifmeEmailFull" class="form-control d-inline" style="width: 200px;" autocomplete="off">
						 -->
						 
						<input type="text" id="ifmeEmailAccount" name="ifmeEmailAccount" placeholder="your account" class="form-control d-inline" style="width:200px;">
						<span>@</span>
						<input type="text" id="ifmeEmailDomain" name="ifmeEmailDomain" class="form-control d-inline" style="width:200px;" autocomplete="off">
						<select id="ifmeEmailDomainCd" name="ifmeEmailDomainCd" class="form-select d-inline" style="width: 200px;">
							<c:forEach items="${codeEmailDomain}" var="item" varStatus="status">
								<option value="<c:out value="${item.ifcdSeq}"/>" <c:if test="${item.ifcdSeq eq 21}">selected</c:if>>
									<c:out value="${item.ifcdName}"/>
								</option>
							</c:forEach>
						</select>
						<!-- 
						<span class="ms-2">
							<a href="#" class="fs-6" style="text-decoration: none;">이메일 중복체크</a>
						</span>
						 -->
						<span class="ms-2">
							<!-- 
							<input type="checkbox" name="ifmmEmailConsentNy" id="email_check" value="1">
							<input type="hidden" name="ifmmEmailConsentNy" id="email_check_hidden" value="0">
							 -->
							<input type="checkbox" name="ifmmEmailConsent" id="ifmmEmailConsent">
							<input type="hidden" name="ifmmEmailConsentNy" id="ifmmEmailConsentNy" value="0">
							
							<label for="ifmmEmailConsent">이메일 수신 동의</label>
						</span>
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">등급설정</th>
					<td class="text-start" colspan="3">
						<select name="ifmmGradeCd" id="ifmmGradeCd" class="form-select" style="width: 150px;">
							 <option value="0">::선택::</option>
							 <c:forEach items="${codeMemberGrade}" var="item" varStatus="status">
							 	<option value="<c:out value="${item.ifcdSeq}"/>">
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
									<input type="text" name="ifmaZipCode" id="sample6_postcode" class="form-control d-inline bg-light" placeholder="우편번호" readonly>
									<button type="button" class="btn btn-sm btn-outline-primary ms-1" id="btnAddress">우편번호 검색</button>	<!--  onclick="sample6_execDaumPostcode()" -->
									<button type="button" class="btn btn-outline-danger" id="btnAddressClear">X</button>
								</div>
							</div>
							<div class="col-12">
								<input type="text" name="ifmaAddress1" id="sample6_address" class="form-control d-block bg-light" placeholder="주소" readonly style="width: 300px;">
								<input type="text" name="ifmaAddress2" id="sample6_detailAddress" class="form-control d-inline mt-2" placeholder="상세주소" autocomplete="off" style="width: 300px;">
								<input type="text" name="ifmaAddressReferences" id="sample6_extraAddress" class="form-control d-inline bg-light" style="width: 300px;" readonly placeholder="참고항목">
								<div class="row mt-1">
									<div class="col">
										<input type="text" name="ifmaLat" id="ifmaLat" class="form-control d-inline" style="width: 147px;" readonly placeholder="위도">
										<input type="text" name="ifmaLng" id="ifmaLng" class="form-control d-inline" style="width: 147px;" readonly placeholder="경도">
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
							<c:forEach items="${codeTelecom}" var="itemTelecom" varStatus="statusTelecom">
								<option value="<c:out value="${itemTelecom.ifcdSeq}"/>">
									<c:out value="${itemTelecom.ifcdName}"/>
								</option>
							</c:forEach>
						</select>
						<input type="hidden" id="ifmpDefaultNyArray0" name="ifmpDefaultNyArray" value="1">
						<input type="hidden" id="ifmpTypeCdArray0" name="ifmpTypeCdArray" value="22">
						<input type="hidden" id="ifmpDeviceCdArray0" name="ifmpDeviceCdArray" value="26">
						<input type="text" id="ifmpNumberArray0" name="ifmpNumberArray" class="form-control d-inline" style="width: 200px;" placeholder="01012345678" autocomplete="off">
						<!-- 
						<input type="checkbox" name="ifmmSmsConsentNy" id="sms_check" value="1">
						<input type="hidden" name="ifmmSmsConsentNy" id="sms_check_hidden" value="0">
						 -->
						<input type="checkbox" name="ifmmSmsConsent" id="ifmmSmsConsent">
						<input type="hidden" name="ifmmSmsConsentNy" id="ifmmSmsConsentNy" value="0">
						<label for="ifmmSmsConsent">SMS 수신 동의</label>
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">전화번호</th>
					<td class="text-start">
						<input type="hidden" id="ifmpDefaultNyArray1" name="ifmpDefaultNyArray" value="0">
						<input type="hidden" id="ifmpTypeCdArray1" name="ifmpTypeCdArray" value="22">
						<input type="hidden" id="ifmpDeviceCdArray1" name="ifmpDeviceCdArray" value="25">
						<input type="hidden" id="ifmpTelecomCdArray1" name="ifmpTelecomCdArray" value="">
						<input type="text" id="ifmpNumberArray1" name="ifmpNumberArray" class="form-control" style="width: 200px;" placeholder="021234567" autocomplete="off">
					</td>
					<th style="width: 200px;" class="bg-light">팩스번호</th>
					<td class="text-start">
						<input type="hidden" id="ifmpDefaultNyArray2" name="ifmpDefaultNyArray" value="0">
						<input type="hidden" id="ifmpTypeCdArray2" name="ifmpTypeCdArray" value="22">
						<input type="hidden" id="ifmpDeviceCdArray2" name="ifmpDeviceCdArray" value="27">
						<input type="hidden" id="ifmpTelecomCdArray2" name="ifmpTelecomCdArray" value="">
						<input type="text" id="ifmpNumberArray2" name="ifmpNumberArray" class="form-control" style="width: 200px;" placeholder="021234567" autocomplete="off">
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">홈페이지</th>
					<td class="text-start">
						<input type="hidden" id="ifaoTypeCdArray1_0" name="ifaoTypeCdArray1" value="33">
						<input type="hidden" id="ifaoSnsTypeCdArray1_0" name="ifaoSnsTypeCdArray1" value="">
						<input type="hidden" id="ifaoTitleArray1_0" name="ifaoTitleArray1" value="">
						<input type="radio" id="ifaoDefaultNyArray1_0" name="ifaoDefaultNyArray1" value="1" checked>
						<input type="text" class="form-control" id="ifaoUrlArray1_0" name="ifaoUrlArray1" placeholder="https://">
					</td>
					<th style="width: 200px;" class="bg-light">SNS</th>
					<td class="text-start">
						<input type="hidden" id="ifaoTypeCdArray2_0" name="ifaoTypeCdArray2" value="34">
						<input type="hidden" id="ifaoSnsTypeCdArray2_0" name="ifaoSnsTypeCdArray2" value="">
						<input type="hidden" id="ifaoTitleArray2_0" name="ifaoTitleArray2" value="">
						<input type="radio" id="ifaoDefaultNyArray2_0" name="ifaoDefaultNyArray2" value="1" checked>
						<input type="text" class="form-control" id="ifaoUrlArray2_0" name="ifaoUrlArray2" placeholder="SNS주소">
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light"><label for="file0" class="form-label input-file-button">이미지 첨부</label></th>
					<td class="text-start">
					
						<input class="form-control form-control-sm" id="file0" name="file0" onChange="upload(0, 2);" type="file" multiple="multiple" style="display:none;">
						<div class="addScroll bg-light">
							<ul id="ulFile0" class="list-group">
							</ul>
						</div>

					</td>
					<th style="width: 200px;" class="bg-light"><label for="file1" class="form-label input-file-button">파일 첨부</label></th>
					<td class="text-start">
					
						<input class="form-control form-control-sm" id="file1" name="file1" onChange="upload(1, 1);" type="file" multiple="multiple" style="display:none;">
						<div class="addScroll bg-light">
							<ul id="ulFile1" class="list-group">
							</ul>
						</div>
						
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
									<option value="${item.ifnaSeq}">
										<c:out value="${item.ifnaSeq}"/> | <c:out value="${item.ifnaName}"/>
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
						<input type="text" id="ifmmDob" name="ifmmDob" class="form-control" style="width: 200px;" autocomplete="off">
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">
						성별
						<span class="text-danger">*</span>
					</th>
					<td class="text-start">
						<input type="radio" class="form-check-input" name="ifmmGenderCd" id="man" value="3">
						<label for="man" class="form-check-label">남성</label>
						<input type="radio" class="form-check-input" name="ifmmGenderCd" id="woman" value="4">
						<label for="woman" class="form-check-label">여성</label>
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">마케팅 수신동의</th>
					<td class="text-start">
						<select id="ifmmPushConsentNy" name="ifmmPushConsentNy" class="form-select" style="width:100px;">
							<option value="1">예</option>
							<option value="0">아니오</option>
						</select>
					</td>
				</tr>
				<tr style="height: 95px;">
					<th style="width: 200px;" class="bg-light">ifmmDesc</th>
					<td class="text-start">
						<textarea id="ifmmDesc" name="ifmmDesc" class="form-control" style="font-size: small; height: 78px; resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<th style="width: 200px;" class="bg-light">자동 등록 방지</th>
					<td class="text-start">
						<div class="g-recaptcha" data-sitekey="6Lfh2xIfAAAAADV0ECUUGtb1kWwEqZwh7z6iu-B8" data-callback="getSuccess"></div>
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
				<input type="submit" id="btnSubmit" class="btn btn-sm btn-outline-success border border-3 container1" value="등록">
				<a type="button" class="btn btn-sm btn-outline-dark border border-3 container1" href="javascript:goList();">
					<!-- onClick="window.close()" -->
					취소
				</a>
			</div>

		</div>
	</form>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/infra/resources/js/validation.js"></script>
	<script src="/infra/resources/js/checkUpload.js"></script>
	<script src="/infra/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>

	<script src="${path}/resources/js/sidebars.js"></script>
	
	<script type="text/javascript">
	
	upload = function(seq, div) {
		
		$("#ulFile" + seq).children().remove();
		
		var fileCount = $("input[type=file]")[seq].files.length;
		//파일 개수 확인
		if(checkUploadedTotalFileNumber(fileCount, seq) == false) { return false; }
		
		var totalFileSize;
		
		for (var i = 0 ; i < fileCount ; i++) {
			if(div == 1) {
				if(checkUploadedAllExt($("input[type=file]")[seq].files[i].name, seq) == false) { return false; }
			} else if(div == 2) {
				if(checkUploadedImageExt($("input[type=file]")[seq].files[i].name, seq) == false) { return false; }
			} else {
				return false;
			}
			
			if(checkUploadedEachFileSize($("input[type=file]")[seq].files[i].name, seq) == false ) { return false; }
			totalFileSize += $("input[type=file]")[seq].files[i].size;
		}
		
		if(checkUploadedTotalFileSize(totalFileSize, seq) == false) { return false; }
		
		for ( var i = 0 ; i < fileCount ; i++) {
			addUploadLi(seq, i, $("input[type=file]")[seq].files[i].name);
		}
		
	}
	
	addUploadLi = function (seq, i, name){
		
		
		var li = '';
		li += '<li id="li_' + seq + '_' + i + '" class="list-group-item d-flex justify-content-between align-items-center">';
		li += name;
		li += '<span style="cursor: pointer;" class="badge bg-danger rounded-circle" onClick="delLi(' + seq + ',' + i + ')"><i class="bi bi-x-circle"></i></span>';
		li += '</li>';		
		
		$("#ulFile" + seq).append(li);
		
	}
	
	
	
	
	
	
	delLi = function(seq, i) {
		$("#li_" + seq + "_" + i).remove();
	}
	
	</script>

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
		if (document.getElementById("email_check").checked) {
			document.getElementById("email_check_hidden").disabled = true;
		}

		if (document.getElementById("sms_check").checked) {
			document.getElementById("sms_check_hidden").disabled = true;
		}
		 */
	</script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a22eb429a9acc65dd1cdb17f32e5e275&libraries=services"></script>

	

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
							
							
							var geocoder = new daum.maps.services.Geocoder();
							
							geocoder.addressSearch(addr, function(result, status){
								
								if (status == daum.maps.services.Status.OK) {
									document.getElementById("ifmaLat").value = result[0].y;
									document.getElementById("ifmaLng").value = result[0].x;
								}
								
							});
							
							
						}
					}).open();
		}
	</script>
	
	<!-- <script type="text/javascript">
	var geocoder = new kakao.maps.services.Geocoder();
	
	geocoder.addressSearch(addr, function(result, status){
		
		if (status == kakao.maps.services.Status.OK) {
			document.getElementById("ifmaLat").value = result[0].y;
			document.getElementById("ifmaLng").value = result[0].x;
		}
		
	});
	
	</script> -->


	

	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#ifaoDefaultNyArray1_0").hide();
		$("#ifaoDefaultNyArray2_0").hide();
	});
	
	$(document).ready(function(){
		$("#ifmmDob").datepicker();
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
	
	
		$("#btnSubmit")
				.on(
						"click",
						function() {
							
							if(!checkNull($("#ifmmId"), $("#ifmmId").val(), "아이디를 입력해주세요.")){
								return false;
							}
							
							if (!checkId($("#ifmmId"), $("#ifmmId").val(),
									"아이디가 유효하지 않습니다. 다시 입력해주세요.")) {
								return false;
							}
							
							if(!checkNull($("#ifmmPwd"), $("#ifmmPwd").val(), "비밀번호를 입력해주세요.")){
								return false;
							}

							if (!checkPassword($("#ifmmPwd"), $("#ifmmPwd").val(),
									"비밀번호가 유효하지 않습니다.")) {
								return false;
							}

							if ($("#ifmmPwd").val() != $("#ifmmPwdConfirm").val()) {
								alert("비밀번호를 다르게 입력하였습니다.");
								$("#ifmmPwdConfirm").focus();
								return false;
							}

							if (!checkNull($("#ifmmName"),
									$("#ifmmName").val(), "이름을 입력해주세요.")) {
								/* $("#ifmmName").addClass("is-invalid"); */
								return false;
							}

							if (!checkNull($("#ifmeEmailAccount"), $("#ifmeEmailAccount").val(), "이메일을 입력해주세요")){
								return false;
							}
							
							if (!checkNull($("#ifmeEmailDomain"), $("#ifmeEmailDomain").val(), "도메인을 입력해주세요")){
								return false;
							}
							
							if(!checkNoSelect($("#ifmmGradeCd"),$("#ifmmGradeCd").val(), "등급을 설정해주세요.")){
								return false;
							}
							
							if(!checkNoSelect($("#ifmpTelecomCd"),$("#ifmpTelecomCd").val(), "통신사를 선택하세요.")){
								return false;
							}
							
							if(!checkNull($("#ifmpNumberArray0"), $("#ifmpNumberArray0").val(), "휴대폰 번호를 입력해주세요.")){
								return false;
							}
							
							if(!checkOnlyNumber($("#ifmpNumberArray0"),$("#ifmpNumberArray0").val(),"숫자로만 입력해주세요.")){
								return false;
							}
							
							if(!checkNoSelect($("#ifnaSeq"),$("#ifnaSeq").val(), "국적을 선택하세요.")){
								return false;
							}
							
							if (!checkNull($("#ifmmDob"), $("#ifmmDob").val(), "생년월일을 입력해주세요.")) {
								return false;
							}
							
							if (!$("input:checked[Name='ifmmGenderCd']").is(":checked")) {
								alert("성별을 선택해주세요.");
								$("input[Name='ifmmGenderCd']").addClass("is-invalid");
								return false;
							}
							
							if(!isSuccess){
								alert("자동 등록 방지를 확인해주세요.");
								return false;
							}
							
							setCheckboxValue($("#ifmmEmailConsent"), $("#ifmmEmailConsentNy"));
							setCheckboxValue($("#ifmmSmsConsent"), $("#ifmmSmsConsentNy"));
							
						});
		
		
		
		
		/* 
		$("#btnSubmit").on("click", function(){

		    if ($('#ifmeEmailDomain').val() == "naver.com"){        
		    	
		    	$("#ifmeEmailDomainCd").val("18").prop("selected", true);

		    } else if ($('#ifmeEmailDomain').val() == "daum.net") {
		        
		    	$("#ifmeEmailDomainCd").val("19").prop("selected", true);

		    } else if ($('#ifmeEmailDomain').val() == "gmail.com") {
		       
		    	$("#ifmeEmailDomainCd").val("20").prop("selected", true);
		    	
		    }
		     
		});
		 */
		$("#ifmeEmailDomain").keyup(function(){

		    if ($('#ifmeEmailDomain').val() == "naver.com"){        
		    	
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
		
		$(document).ready(function(){
			if($("#ifmeEmailDomainCd").val() == 21){
				$("#ifmeEmailDomain").attr('readonly', false);
				$("#ifmeEmailDomain").val('');
				$("#ifmeEmailDomain").attr("placeholder", "example.com");
			} else if ($("#ifmeEmailDomainCd").val() != 21) {
				$("#ifmeEmailDomain").attr('readonly', true);
				if($("#ifmeEmailDomainCd").val() == 18){
					$("#ifmeEmailDomain").val("naver.com");
				} else if($("#ifmeEmailDomainCd").val() == 19){
					$("#ifmeEmailDomain").val("daum.net");
				} else if($("#ifmeEmailDomainCd").val() == 20){
					$("#ifmeEmailDomain").val("gmail.com");
				}
			}
		});
		
		$("#ifmeEmailDomainCd").on("change", function(){
			if($("#ifmeEmailDomainCd").val() == 21){
				$("#ifmeEmailDomain").attr('readonly', false);
				$("#ifmeEmailDomain").val('');
				$("#ifmeEmailDomain").attr("placeholder", "example.com");
			} else if ($("#ifmeEmailDomainCd").val() != 21) {
				$("#ifmeEmailDomain").attr('readonly', true);
				if($("#ifmeEmailDomainCd").val() == 18){
					$("#ifmeEmailDomain").val("naver.com");
				} else if($("#ifmeEmailDomainCd").val() == 19){
					$("#ifmeEmailDomain").val("daum.net");
				} else if($("#ifmeEmailDomainCd").val() == 20){
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
					} else if (!regExp.test(pwd1) && pwd1.length > 1) {
						$("#ifmmPwd").addClass("is-invalid");
						$("#ifmmPwd").removeClass("is-valid");
						$("#ifmmPwdValidFeedBack").hide();
						$("#ifmmPwdInvalidFeedBack").show();
						$("#ifmmPwdConfirm").attr("disabled", "disabled");
					}

					if (pwd1 != "" && pwd2 != "") {
						if (pwd1 == pwd2) {
							$("#ifmmPwdConfirm").addClass("is-valid");
							$("#ifmmPwdConfirm").removeClass("is-invalid");
							$("#ifmmPwdConfirmValidFeedBack").show();
							$("#ifmmPwdConfirmInvalidFeedBack").hide();
							$("#btnSubmit").removeAttr("disabled");
						} else {
							$("#ifmmPwdConfirm").addClass("is-invalid");
							$("#ifmmPwdConfirm").removeClass("is-valid");
							$("#ifmmPwdConfirmValidFeedBack").hide();
							$("#ifmmPwdConfirmInvalidFeedBack").show();
							$("#btnSubmit").attr("disabled", "disabled");
						}
					}
				});
});
	</script>
	
	<script type="text/javascript">
	
	goList = function(){
		$("#formForm").attr("action", "/infra/member/memberList");
		$("#formForm").submit();
	}
	
	setCheckboxValue = function(obj, targetObj){
		if(obj.is(":checked")){
			targetObj.val("1");
		} else {
			targetObj.val("0");
		}
	}
	
	</script>
	
	<!-- reCAPTCHA s -->
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	
	<script type="text/javascript">
	var isSuccess = false;
	getSuccess = function(){
		isSuccess = true;
	}
	
	
	</script>
	<!-- reCAPTCHA e -->
</body>

</html>