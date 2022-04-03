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

				<div class="row">
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
						<button type="button" >
							<i class="bi bi-person"></i>
							<div class="btnText">마이쿠팡</div>
						</button>
						<button type="button" >
							<i class="bi bi-cart4"></i>
							<div class="btnText">장바구니</div>
						</button>
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