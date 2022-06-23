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
<title>쿠팡!</title>

<link rel="shortcut icon" href="/infra/resources/images/index/favicon.ico">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link href="/infra/resources/css/assets/aos.css" rel="stylesheet"/>
<link href="/infra/resources/css/assets/iconsmind.css" rel="stylesheet"/>
<link href="/infra/resources/css/assets/theme.min.css" rel="stylesheet"/>

<link href="${path}/resources/common/css/style.css" rel="stylesheet" />
<link href="${path}/resources/common/css/sidebars.css" rel="stylesheet" />
<link href="${path}/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<script src="https://kit.fontawesome.com/fbbc6db919.js" crossorigin="anonymous"></script>

</head>
<body>

<div class="container-fluid bg-light">
	<div class="row mb-5">
		<div class="col text-center my-3" style="height: 80px;">
			<c:if test="${not empty sessSeq}">
				<span style="float: right;">
					<span class="fw-bold"><c:out value="${sessName}"/></span>님 <button id="btnLogOut" name="btnLogOut" class="btn btn-sm btn-outline-danger">로그아웃</button>
				</span>
			</c:if>
			<h1 class="fw-bold" style="clear: both;">Index</h1>
			<h6 class="fw-bold">회원관리 / 쇼핑몰 페이지</h6>
		</div>
	</div>
	 
	 <div class="row">
            <div class="col-lg-6 mb-4 mb-lg-0 aos-init aos-animate" data-aos="fade-up" style="height:400px;">
                <article class="card card-hover text-center hover-shadow-lg overflow-hidden border-0 rounded-3">
                    <div class="overflow-hidden position-relative">

                        <!--Article image-->
                        <img src="/infra/resources/images/index/coupangManagement.png" alt="" class="img-fluid">

                        <!--Article image divider-->
                        <svg class="position-absolute start-0 bottom-0 mb-n1 text-white" preserveAspectRatio="none" width="100%" height="48" viewBox="0 0 1460 120" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M122 22.8261L0 0V120H1460V0L1338 22.8261C1217 44.1304 973 88.2609 730 88.2609C487 88.2609 243 44.1304 122 22.8261Z" fill="currentColor"></path>
                        </svg>
                    </div>
                    <!--Content-body-->
                    <div class="card-body pb-5 position-relative">
                        <small class="text-muted"><i class="bx bx-calendar-alt me-1"></i> 2022/03 ~ </small>
                        <h3 class="py-3 mb-0 fw-bold">회원관리 페이지</h3>
                        <p class="mb-0 text-truncate px-lg-4">
                            회원목록, 회원상세, 회원수정, 회원삭제
                        </p>
                    </div>

                    <!--Article link-->
                    <a href="/infra/member/memberList" class="stretched-link"></a>
                </article>
            </div>
            <div class="col-lg-6 mb-4 mb-lg-0 aos-init aos-animate" data-aos="fade-up" style="height:400px;">
                <article class="card card-hover text-center hover-shadow-lg overflow-hidden border-0 rounded-3">
                    <div class="overflow-hidden position-relative">

                        <!--Article image-->
                        <img src="/infra/resources/images/index/coupangMain.png" alt="" class="img-fluid">

                        <!--Article image divider-->
                        <svg class="position-absolute start-0 bottom-0 mb-n1 text-white" preserveAspectRatio="none" width="100%" height="48" viewBox="0 0 1460 120" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M122 22.8261L0 0V120H1460V0L1338 22.8261C1217 44.1304 973 88.2609 730 88.2609C487 88.2609 243 44.1304 122 22.8261Z" fill="currentColor"></path>
                        </svg>
                    </div>
                    <!--Article text-->
                    <div class="card-body pb-5 position-relative">
                        <small class="text-muted"><i class="bx bx-calendar-alt me-1"></i> 2022/04 ~ </small>
                        <h3 class="py-3 mb-0 fw-bold">쇼핑몰 페이지</h3>
                        <p class="mb-0 text-truncate px-lg-4">
                            홈, 상품등록, 검색, 상세, 주문, 주문완료
                        </p>
                    </div>

                    <!--Article link-->
                    <a href="/infra/home" class="stretched-link"></a>
                </article>
            </div>
        </div>
	 
	 
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/infra/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>

<script type="text/javascript">

$("#btnLogOut").click(function(){
	
	$.ajax({
		async: true 
		,cache: false
		,type: "post"
		,url: "/infra/member/logOutProc"
		,success: function(response) {
			if(response.rt == "success") {
				location.href = "/infra/login/loginForm";
			} else {
				alert("로그아웃 실패");
			}
		}
		,error : function(jqXHR, textStatus, errorThrown){
			alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
		}
	});
	
});
	
</script>
	
</body>
</html>

