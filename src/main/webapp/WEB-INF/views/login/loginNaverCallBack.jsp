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
<link rel="shortcut icon" href="/infra/resources/images/index/favicon.ico">
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<script type="text/javascript">
var naver_id_login = new naver_id_login("Yn6Xl_G7XXgjvBNNusVk", "http://13.125.216.202/infra/member/loginNaver");

//ajax
$.ajax({
	  async: true
	  ,cache: false
	  ,type:"post"
	  ,url: "/infra/member/loginProcSns"
	  /* ,data : { "ifmmId" : res.id } */
	  ,data : { ifmeEmailFull : naver_id_login.getProfileData('email') }
	  ,success: function(response){
		  
		  console.log("response :", response);
		  
		  if (response.rt == "success") {
			  location.href = "/infra/index/indexView";
		  } else {
			  alert("로그인 실패. 등록된 계정이 없습니다.");
			  location.href = "/infra/login/loginForm";
		  }
	  }
	  ,error : function(jqXHR, textStatus, errorThrown){
			alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
		}
 });

/* alert(naver_id_login.oauthParams.access_token);
naver_id_login.get_naver_userprofile("naverSignInCallback()");

function naverSignInCallback() {
	alert(naver_id_login.getProfileData('email'));
	alert(naver_id_login.getProfileData('nickname'));
	alert(naver_id_login.getProfileData('age'));
}
 */
</script>

</body>

</html>