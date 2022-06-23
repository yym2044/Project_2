<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="row border-bottom align-items-center">

			<div class="col-2" style="padding-left: 100px;">
				<nav id="topBar" style="font-size: small;">
					<ul class="m-0">
						<li>
							<button type="button"  class="btn btn-primary btn-lg rounded-0" style="width: 110px; height: 115px;">
								<i class="bi bi-list fs-2"></i>
								<div class="btnText">카테고리</div>
							</button>
							<ul class="subMenu p-0">
								<c:forEach items="${listCategoryParents1}" var="item1" varStatus="status1">
									<li><a>
											<c:out value="${item1.ifctName }" />
										</a>
										<ul class="subMenu p-0">
											<c:forEach items="${listCategoryDepth2}" var="item2" varStatus="status2">
												<c:if test="${item1.ifctSeq eq item2.ifctParents}">
													<li><a>
															<c:out value="${item2.ifctName}" />
														</a>
														<ul class="subMenu p-0">
															<c:forEach items="${listCategoryDepth3}" var="item3" varStatus="status3">
																<c:if test="${item2.ifctSeq eq item3.ifctParents}">
																	<li><a>
																			<c:out value="${item3.ifctName}" />
																		</a></li>
																</c:if>
															</c:forEach>
														</ul></li>
												</c:if>
											</c:forEach>
										</ul></li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</nav>

			</div>

			<div class="col">

				<div class="row d-flex align-items-center">
					<div class="col-2">
						<a href="/infra/home" title="COUPANG">
							<img src="${path}/resources/images/user/mainPage/coupang2.png" style="width: 175px;">
						</a>
					</div>
					<div class="col-8">
						<div class="input-group">
							<div class="col-2">
								<select id="shCategory" name="shCategory" class="form-select">
									<option value="0">전체</option>
										<c:forEach items="${listCategoryDepth2}" var="item" varStatus="status">
											<c:if test="${item.shCategoryNy eq 1}">
												<option value="<c:out value="${item.ifctSeq}"/>" <c:if test="${item.ifctSeq eq vo.shCategory}">selected</c:if>><c:out value="${item.ifctName}"/></option>
											</c:if>
										</c:forEach>
								</select>
							</div>
							<input id="shBar" name="shBar" onkeyup="enterkey();" class="form-control" type="text" placeholder="찾고 싶은 상품을 검색해보세요!" value="<c:out value="${vo.shBar}"/>">
							<button id="btnSearch" name="btnSearch" class="btn btn-outline-secondary" type="button">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
					<div class="col">
						<ul class="nav">
							<li class="nav-item dropdown">
								<a class="btn borderX dropdown">
									<i class="bi bi-person fs-3"></i><br>
									<span class="btnText">마이쿠팡</span>
								</a>
								<ul class="dropdown-menu">
									<li><a href="javascript:goOrderList();" class="dropdown-item">주문목록</a></li>
									<!-- <li><a class="dropdown-item">취소/반품</a></li> -->
									<li><a href="javascript:goWishList();" class="dropdown-item">찜 리스트</a></li>
								</ul>
							</li>
							<li class="nav-item">
								<a id="btnMyCart" class="btn borderX">
									<i class="bi bi-cart4 fs-3"></i><br>
									<span class="btnText">장바구니</span>
								</a>
							</li>
						</ul>
					</div>

				</div>

				<div class="row">

					<ul class="nav">
						<li class="nav-item"><a class="nav-link link-dark" href="#">이벤트/쿠폰</a></li>
						<li class="nav-item"><a class="nav-link link-dark" href="#">VIP멤버 할인</a></li>
						<li class="nav-item"><a class="nav-link link-dark" href="#">해외직구</a></li>
						<li class="nav-item"><a class="nav-link link-dark" href="#">기획전</a></li>
						<li class="nav-item"><a class="nav-link link-dark" href="#">여행/티켓</a></li>
					</ul>


				</div>

			</div>

		</div>