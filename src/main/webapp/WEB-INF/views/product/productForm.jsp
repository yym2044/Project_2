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


			<aside class="sticky">
				<h1>This is a sticky sidebar</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				<p>Duis quis nibh gravida, gravida nisl ac, imperdiet sem. Fusce quis malesuada magna.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
			</aside>

			<section class="main-content">
				<article>
					<h1>Heading</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis nibh gravida, gravida nisl ac, imperdiet sem. Fusce quis malesuada magna. Vivamus dignissim gravida tellus sed pulvinar. Morbi eleifend dolor vel velit viverra aliquam. In pharetra felis non leo congue, id iaculis dui laoreet. Pellentesque accumsan ligula sed nisl eleifend consequat. Proin at orci purus. Praesent dignissim at odio nec fringilla. Nulla lacinia ultricies auctor. Mauris vel diam nunc. Ut lorem arcu, interdum id tortor a, tincidunt vestibulum eros. Vivamus sit amet mattis turpis. Nullam auctor ut velit nec adipiscing. Morbi et vehicula diam.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis nibh gravida, gravida nisl ac, imperdiet sem. Fusce quis malesuada magna. Vivamus dignissim gravida tellus sed pulvinar. Morbi eleifend dolor vel velit viverra aliquam. In pharetra felis non leo congue, id iaculis dui laoreet. Pellentesque accumsan ligula sed nisl eleifend consequat. Proin at orci purus. Praesent dignissim at odio nec fringilla. Nulla lacinia ultricies auctor. Mauris vel diam nunc. Ut lorem arcu, interdum id tortor a, tincidunt vestibulum eros. Vivamus sit amet mattis turpis. Nullam auctor ut velit nec adipiscing. Morbi et vehicula diam.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis nibh gravida, gravida nisl ac, imperdiet sem. Fusce quis malesuada magna. Vivamus dignissim gravida tellus sed pulvinar. Morbi eleifend dolor vel velit viverra aliquam. In pharetra felis non leo congue, id iaculis dui laoreet. Pellentesque accumsan ligula sed nisl eleifend consequat. Proin at orci purus. Praesent dignissim at odio nec fringilla. Nulla lacinia ultricies auctor. Mauris vel diam nunc. Ut lorem arcu, interdum id tortor a, tincidunt vestibulum eros. Vivamus sit amet mattis turpis. Nullam auctor ut velit nec adipiscing. Morbi et vehicula diam.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis nibh gravida, gravida nisl ac, imperdiet sem. Fusce quis malesuada magna. Vivamus dignissim gravida tellus sed pulvinar. Morbi eleifend dolor vel velit viverra aliquam. In pharetra felis non leo congue, id iaculis dui laoreet. Pellentesque accumsan ligula sed nisl eleifend consequat. Proin at orci purus. Praesent dignissim at odio nec fringilla. Nulla lacinia ultricies auctor. Mauris vel diam nunc. Ut lorem arcu, interdum id tortor a, tincidunt vestibulum eros. Vivamus sit amet mattis turpis. Nullam auctor ut velit nec adipiscing. Morbi et vehicula diam.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis nibh gravida, gravida nisl ac, imperdiet sem. Fusce quis malesuada magna. Vivamus dignissim gravida tellus sed pulvinar. Morbi eleifend dolor vel velit viverra aliquam. In pharetra felis non leo congue, id iaculis dui laoreet. Pellentesque accumsan ligula sed nisl eleifend consequat. Proin at orci purus. Praesent dignissim at odio nec fringilla. Nulla lacinia ultricies auctor. Mauris vel diam nunc. Ut lorem arcu, interdum id tortor a, tincidunt vestibulum eros. Vivamus sit amet mattis turpis. Nullam auctor ut velit nec adipiscing. Morbi et vehicula diam.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis nibh gravida, gravida nisl ac, imperdiet sem. Fusce quis malesuada magna. Vivamus dignissim gravida tellus sed pulvinar. Morbi eleifend dolor vel velit viverra aliquam. In pharetra felis non leo congue, id iaculis dui laoreet. Pellentesque accumsan ligula sed nisl eleifend consequat. Proin at orci purus. Praesent dignissim at odio nec fringilla. Nulla lacinia ultricies auctor. Mauris vel diam nunc. Ut lorem arcu, interdum id tortor a, tincidunt vestibulum eros. Vivamus sit amet mattis turpis. Nullam auctor ut velit nec adipiscing. Morbi et vehicula diam.</p>
				</article>
			</section>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

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

</body>
</html>