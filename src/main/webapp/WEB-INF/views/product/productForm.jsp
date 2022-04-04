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

<link rel="stylesheet" href="https://unpkg.com/css-pro-layout@1.1.0/dist/css/css-pro-layout.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css">
<script src="https://unpkg.com/@popperjs/core@2"></script>

<link rel="stylesheet" href="${path}/resources/common/css/sideBarForm.css">
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
				<h1>상품등록</h1>
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



			<div class="layout has-sidebar fixed-sidebar fixed-header">
				<aside id="sidebar" class="sidebar break-point-lg has-bg-image sticky">
					<div class="image-wrapper">
						<img src="https://user-images.githubusercontent.com/25878302/144499035-2911184c-76d3-4611-86e7-bc4e8ff84ff5.jpg" alt="sidebar background" />
					</div>
					<div class="sidebar-layout">
						<div class="sidebar-header">
							<span style="text-transform: uppercase; font-size: 15px; letter-spacing: 3px; font-weight: bold;">Pro Sidebar</span>
						</div>
						<div class="sidebar-content">
							<nav class="menu open-current-submenu">
								<ul>
									<li class="menu-item sub-menu"><a href="#">
											<span class="menu-icon">
												<i class="ri-vip-diamond-fill"></i>
											</span>
											<span class="menu-title">Components</span>
											<span class="menu-suffix">&#x1F525;</span>
										</a>
										<div class="sub-menu-list">
											<ul>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Grid</span>
													</a></li>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Layout</span>
													</a></li>
												<li class="menu-item sub-menu"><a href="#">
														<span class="menu-title">Forms</span>
													</a>
													<div class="sub-menu-list">
														<ul>
															<li class="menu-item"><a href="#">
																	<span class="menu-title">Input</span>
																</a></li>
															<li class="menu-item"><a href="#">
																	<span class="menu-title">Select</span>
																</a></li>
															<li class="menu-item sub-menu"><a href="#">
																	<span class="menu-title">More</span>
																</a>
																<div class="sub-menu-list">
																	<ul>
																		<li class="menu-item"><a href="#">
																				<span class="menu-title">CheckBox</span>
																			</a></li>
																		<li class="menu-item"><a href="#">
																				<span class="menu-title">Radio</span>
																			</a></li>
																		<li class="menu-item sub-menu"><a href="#">
																				<span class="menu-title">Want more ?</span>
																				<span class="menu-suffix">&#x1F914;</span>
																			</a>
																			<div class="sub-menu-list">
																				<ul>
																					<li class="menu-item"><a href="#">
																							<span class="menu-prefix">&#127881;</span>
																							<span class="menu-title">You made it </span>
																						</a></li>
																				</ul>
																			</div></li>
																	</ul>
																</div></li>
														</ul>
													</div></li>
											</ul>
										</div></li>
									<li class="menu-item sub-menu"><a href="#">
											<span class="menu-icon">
												<i class="ri-bar-chart-2-fill"></i>
											</span>
											<span class="menu-title">Charts</span>
										</a>
										<div class="sub-menu-list">
											<ul>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Pie chart</span>
													</a></li>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Line chart</span>
													</a></li>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Bar chart</span>
													</a></li>
											</ul>
										</div></li>
									<li class="menu-item sub-menu"><a href="#">
											<span class="menu-icon">
												<i class="ri-shopping-cart-fill"></i>
											</span>
											<span class="menu-title">E-commerce</span>
										</a>
										<div class="sub-menu-list">
											<ul>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Products</span>
													</a></li>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Orders</span>
													</a></li>
												<li class="menu-item"><a href="#">
														<span class="menu-title">credit card</span>
													</a></li>
											</ul>
										</div></li>
									<li class="menu-item sub-menu"><a href="#">
											<span class="menu-icon">
												<i class="ri-global-fill"></i>
											</span>
											<span class="menu-title">Maps</span>
										</a>
										<div class="sub-menu-list">
											<ul>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Google maps</span>
													</a></li>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Open street map</span>
													</a></li>
											</ul>
										</div></li>
									<li class="menu-item sub-menu"><a href="#">
											<span class="menu-icon">
												<i class="ri-brush-3-fill"></i>
											</span>
											<span class="menu-title">Theme</span>
										</a>
										<div class="sub-menu-list">
											<ul>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Dark</span>
													</a></li>
												<li class="menu-item"><a href="#">
														<span class="menu-title">Light</span>
													</a></li>
											</ul>
										</div></li>
									<li class="menu-item"><a href="#">
											<span class="menu-icon">
												<i class="ri-book-2-fill"></i>
											</span>
											<span class="menu-title">Documentation</span>
										</a></li>
									<li class="menu-item"><a href="#">
											<span class="menu-icon">
												<i class="ri-calendar-fill"></i>
											</span>
											<span class="menu-title">Calendar</span>
										</a></li>
									<li class="menu-item"><a href="#">
											<span class="menu-icon">
												<i class="ri-service-fill"></i>
											</span>
											<span class="menu-title">Examples</span>
										</a></li>
								</ul>
							</nav>
						</div>
						<div class="sidebar-footer">
							<span>Sidebar footer</span>
						</div>
					</div>
				</aside>
				<div id="overlay" class="overlay"></div>
				<div class="layout">
					<header class="header">
						<a id="btn-collapse" href="#">
							<i class="ri-menu-line ri-xl"></i>
						</a>
						<a id="btn-toggle" href="#" class="sidebar-toggler break-point-lg">
							<i class="ri-menu-line ri-xl"></i>
						</a>
					</header>
					<main class="content">
						<div>
							<h1>Pro Sidebar</h1>
							<p>Responsive layout with advanced sidebar menu built with SCSS and vanilla Javascript</p>
							<p>
								Full Code and documentation available on
								<a href="https://github.com/azouaoui-med/pro-sidebar-template" target="_blank">Github</a>
							</p>
							<div>
								<a href="https://github.com/azouaoui-med/pro-sidebar-template" target="_blank">
									<img alt="GitHub stars" src="https://img.shields.io/github/stars/azouaoui-med/pro-sidebar-template?style=social" />
								</a>
								<a href="https://github.com/azouaoui-med/pro-sidebar-template" target="_blank">
									<img alt="GitHub forks" src="https://img.shields.io/github/forks/azouaoui-med/pro-sidebar-template?style=social" />
								</a>
							</div>
						</div>
						<div>
							<h2>Features</h2>
							<ul>
								<li>Fully responsive</li>
								<li>Collapsable sidebar</li>
								<li>Multi level menu</li>
								<li>RTL support</li>
								<li>Customizable</li>
							</ul>
						</div>
						<div>
							<h2>Resources</h2>
							<ul>
								<li><a target="_blank" href="https://github.com/azouaoui-med/css-pro-layout"> Css Pro Layout</a></li>
								<li><a target="_blank" href="https://github.com/popperjs/popper-core"> Popper Core</a></li>
								<li><a target="_blank" href="https://remixicon.com/"> Remix Icons</a></li>
							</ul>
						</div>
						<footer class="footer">
							<small style="margin-bottom: 20px; display: inline-block"> © 2022 made with <span style="color: red; font-size: 18px">&#10084;</span> by - <a target="_blank" href="https://azouaoui.netlify.com"> Mohamed Azouaoui </a>
							</small>
							<br />
							<div>
								<a href="https://github.com/azouaoui-med" target="_blank" rel="noopener noreferrer">
									<img alt="GitHub followers" src="https://img.shields.io/github/followers/azouaoui-med?label=github&style=social" />
								</a>
								<a href="https://twitter.com/azouaoui_med" target="_blank" rel="noopener noreferrer">
									<img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/azouaoui_med?label=twitter&style=social" />
								</a>
							</div>
						</footer>
					</main>
					<div class="overlay"></div>
				</div>
			</div>






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
	<script src="${path}/resources/common/js/sideBarForm.js"></script>

</body>
</html>