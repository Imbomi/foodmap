<header id="header"
	data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 135, 'stickySetTop': '-95px', 'stickyChangeLogo': true}">
	<div
		class="header-body border-color-primary border-bottom-0 box-shadow-none"
		data-sticky-header-style="{'minResolution': 0}"
		data-sticky-header-style-active="{'background-color': '#f7f7f7'}"
		data-sticky-header-style-deactive="{'background-color': '#FFF'}">
		<div class="header-container container">
			<div class="header-row py-2">
				<div class="header-column">
					<div class="header-row">
						<div class="header-logo">
							<a href="${path}/main/main.do"> <img alt="FoodMap" width="100"
								height="48" data-sticky-width="82" data-sticky-height="40"
								data-sticky-top="84" src="/project/images/FoodMap.jpg">
							</a>
						</div>
					</div>
				</div>
				<div class="header-column justify-content-end">
					<div class="header-row">
								<div style="text-align: right;">
									<%@ include file="../include/menu.jsp"%>
								</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="header-nav-bar bg-color-light-scale-1 mb-3 px-3 px-lg-0">
				<div class="header-row">
					<div class="header-column">
						<div class="header-row justify-content-end">
							<div class="header-nav header-nav-links justify-content-start"
								data-sticky-header-style="{'minResolution': 991}"
								data-sticky-header-style-active="{'margin-left': '150px'}"
								data-sticky-header-style-deactive="{'margin-left': '0'}">
								<div
									class="header-nav-main header-nav-main-square header-nav-main-dropdown-no-borders header-nav-main-dropdown-arrow header-nav-main-effect-3 header-nav-main-sub-effect-1">
									<nav class="collapse">
										<ul class="nav nav-pills" id="mainNav">
										<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
											<li class="dropdown"><a
												class="dropdown-item dropdown-toggle" href="${path}/notice/notice_list.do">
													Notice</a></li>
													<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
											<li class="dropdown"><a
												class="dropdown-item dropdown-toggle" href="${path}/restaurant/list.do">
													Restaurants </a>
												</li>
												<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
											<li class="dropdown"><a
												class="dropdown-item dropdown-toggle" href="${path}/main/foodmap.do">food map</a></li>
												<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
											<li class="dropdown"><a
												class="dropdown-item dropdown-toggle" href="#">Survey<span
													class="tip tip-dark">coupon</span> &nbsp;&nbsp;&nbsp;
											</a>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item" href="${path}/survey/list.do">Do Survey
													</a></li>
													<li><a class="dropdown-item" href="${path}/survey/survey_event.do">Survey
															Event<span class="tip tip-dark">coupon</span></a></li>
												</ul></li>
										</ul>
									</nav>
								</div>
								<button class="btn header-btn-collapse-nav"
									data-toggle="collapse" data-target=".header-nav-main nav">
									<i class="fas fa-bars"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>