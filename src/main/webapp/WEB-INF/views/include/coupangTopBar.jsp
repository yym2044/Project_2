<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="row bg-light">
				<div class="col">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link link-dark">즐겨찾기</a></li>
						<li class="nav-item"><a href="/infra/product/productForm" class="nav-link link-dark">상품등록</a></li>
						<!-- 
						<li class="nav-item dropdown"><a class="nav-link link-dark dropdown-toggle">입점신청</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">오픈마켓</a></li>
								<li><a class="dropdown-item" href="#">여행·티켓</a></li>
								<li><a class="dropdown-item" href="#">로켓배송</a></li>
								<li><a class="dropdown-item" href="#">제휴마케팅</a></li>
							</ul>
						</li>
						 -->
					</ul>
				</div>
				<div class="col text-center">
					<button type="button" onclick="location.href='/infra/index/indexView'" class="btn btn-sm btn-outline-dark rounded-circle" data-bs-toggle="tooltip" title="INDEX" data-bs-placement="bottom"><i class="bi bi-signpost-split"></i></button>
					<button type="button" onclick="location.href='/infra/member/memberList'" class="btn btn-sm btn-outline-dark rounded-circle" data-bs-toggle="tooltip" title="Manage" data-bs-placement="bottom"><i class="bi bi-people"></i></button>
				</div>
				<div class="col d-flex justify-content-end">
					<ul class="nav">

						<c:choose>
							<c:when test="${empty sessSeq}">
								<li class="nav-item"><a class="nav-link link-dark" href="/infra/login/regForm1">회원가입</a></li>
								<li class="nav-item"><a class="nav-link link-dark" href="/infra/login/loginForm">로그인</a></li>
							</c:when>
							<c:otherwise>
								
								<li class="nav-item"><a class="nav-link link-dark">
										<span class="fw-bold">
											<c:out value="${sessName}" />
										</span>
										님, 반갑습니다
									</a>
								</li>
								<li class="nav-item"><a class="nav-link link-dark" href="javascript:logOut()">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
						<li class="nav-item"><a class="nav-link link-dark" href="#">고객센터</a></li>
					</ul>
				</div>
			</div>