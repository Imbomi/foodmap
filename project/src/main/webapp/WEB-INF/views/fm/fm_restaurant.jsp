<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | Restaurants</title>


<%@ include file="../include/header.jsp"%>
<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Responsive HTML5 Template">
<meta name="author" content="okler.net">

<!-- Favicon -->
<link rel="shortcut icon" href="/project/img/favicon.ico"
	type="image/x-icon" />
<link rel="apple-touch-icon" href="/project/img/apple-touch-icon.png">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700%7CSintony:400,700"
	rel="stylesheet" type="text/css">


<!-- Vendor CSS -->
<link rel="stylesheet"
	href="/project/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/project/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/project/vendor/animate/animate.min.css">
<link rel="stylesheet"
	href="/project/vendor/simple-line-icons/css/simple-line-icons.min.css">
<link rel="stylesheet"
	href="/project/vendor/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/project/vendor/owl.carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/project/vendor/magnific-popup/magnific-popup.min.css">
<link rel="stylesheet"
	href="/project/vendor/bootstrap-star-rating/css/star-rating.min.css">
<link rel="stylesheet"
	href="/project/vendor/bootstrap-star-rating/themes/krajee-fas/theme.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" href="/project/css/theme.css">
<link rel="stylesheet" href="/project/css/theme-elements.css">
<link rel="stylesheet" href="/project/css/theme-blog.css">
<link rel="stylesheet" href="/project/css/theme-shop.css">

<!-- Demo CSS -->
<link rel="stylesheet" href="/project/css/demos/demo-church.css">

<!-- Current Page CSS -->
<link rel="stylesheet" href="/project/vendor/rs-plugin/css/settings.css">
<link rel="stylesheet" href="/project/vendor/rs-plugin/css/layers.css">
<link rel="stylesheet"
	href="/project/vendor/rs-plugin/css/navigation.css">


<!-- Skin CSS -->
<link rel="stylesheet" href="/project/css/skins/default.css">

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="/project/css/custom.css">

<!-- Head Libs -->
<script src="/project/vendor/modernizr/modernizr.min.js"></script>
<script>
	function list(page) {
		location.href = "${path}/restaurant/list.do?curPage=" + page;
	}
</script>

</head>
<body>
	<div class="body">
		<%@ include file="../include/fm_header.jsp"%>

		<div role="main" class="main shop py-4">
			<section
				class="page-header page-header-modern page-header-background page-header-background-sm"
				style="background-image: url(../images/restaurant.jpg); opacity: 0.6;">
				<div class="container">
					<div class="row">
						<div
							class="col-md-12 align-self-center p-static order-2 text-center">
							<h1>Restaurants</h1>

						</div>
						<div class="col-md-12 align-self-center order-1">
							<ul class="breadcrumb breadcrumb-light d-block text-center">
								<li><a href="${path}/main/main.do">Main</a></li>
								<li class="active">restaurants</li>
							</ul>
						</div>
					</div>
				</div>
			</section>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="accordion accordion-modern" id="accordion">
							<div class="card card-default">
								<div class="card-header">
									<h4 class="card-title m-0">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"> Search </a>
									</h4>
								</div>
								<div id="collapseOne" class="collapse show">
									<div class="card-body">
										<form id="form1" method="post"
											action="${path}/restaurant/list.do">
											<div class="form-row">
												<div class="simple-search input-group">
													<label class="font-weight-bold text-dark text-2">By
														Category &nbsp;&nbsp;&nbsp;&nbsp; </label><select
														class="form-control" name="category">
														<option value="All"
															<c:out value="${map.category=='all'?'selected':''}"/>>All</option>
														<option value="Chinese"
															<c:out value="${map.category=='chinese'?'selected':''}"/>>Chinese</option>
														<option value="Korean"
															<c:out value="${map.category=='korean'?'selected':''}"/>>Korean</option>
														<option value="Japanese"
															<c:out value="${map.category=='japanese'?'selected':''}"/>>Japanese</option>
													</select> <span class="input-group-append"> </span>
												</div>

												<div class="simple-search input-group">
													<label class="font-weight-bold text-dark text-2">
														Restauant &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label> <input
														class="form-control text-1" name="restaurant"
														type="search" value="" placeholder="Search..."
														width="20px"> <span class="input-group-append">
													</span>
												</div>

												<div class="simple-search input-group">
													<label class="font-weight-bold text-dark text-2">
														Writer
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</label> <input class="form-control text-1" name="writer"
														type="search" value="" placeholder="Search..."
														width="20px"> <span class="input-group-append">
													</span>
												</div>

											</div>
											<div class="custom-control custom-checkbox pb-3">
												<input type="radio" name="orderBy" value="OrderByLikes"
													checked> order by likes
											</div>
											<div class="custom-control custom-checkbox pb-3">
												<input type="radio" name="orderBy" value="OrderByLowPrice">order
												of low price
											</div>
											<input class="btn btn-primary float-right" type="submit"
												value="Search">
										</form>
									</div>
								</div>
							</div>
						</div>
						<hr>
						There are ${map.count} posts.
						<c:if test="${sessionScope.userid != null}">
							<input type="button" value="New post"
								class="btn btn-primary float-right"
								onclick="location.href='${path}/restaurant/write.do';">
						</c:if>
						<br><br><br>
					</div>
				</div>
			</div>
				<div class="container">
							<div class="masonry-loader masonry-loader-showing">
								<div class="row  products product-thumb-info-list" data-plugin-masonry data-plugin-options="{'layoutMode': 'fitRows'}">
									<c:forEach var="dto" items="${map.list}">
										<div class="col-md-4 col-lg-3">
											<article class="post post-medium border-0 pb-0 mb-5">
												<div class="post-image" style="height: 180px;">
													<img src="${path}/images/${dto.picture_url}"
														class="img-fluid img-thumbnail img-thumbnail-no-borders rounded-0" width="300" height="150" />
												</div>

												<div class="post-content">

													<h2
														class="font-weight-semibold text-5 line-height-6 mt-3 mb-2">
														<a href="${path}/restaurant/view.do/${dto.rt_idx}">${dto.rt_name}</a>
													</h2>
													<p>${dto.rt_summary}</p>

													<div class="post-meta">
														<span><i class="far fa-user"></i> By ${dto.writer}
														</span> <span><i class="fas fa-won-sign"></i>/<i
															class="far fa-user"></i>${dto.ppp} </span><span><i
															class="fas fa-heart" style="color: red;"></i>${dto.goodcount}
														</span><br> <span><i class="fas fa-utensils"></i>${dto.category}
														</span> <br> <span><fmt:formatDate
																value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm" /></span><span
															class="d-block mt-2"><a
															href="${path}/restaurant/view.do/${dto.rt_idx}"
															class="btn btn-xs btn-light text-1 text-uppercase">Read
																More</a></span>
													</div>
													<input type="hidden" id="resto_idx" value="${dto.rt_idx}">

												</div>
											</article>
										</div>
									</c:forEach>
								</div>
							</div>
					<table align="center">
						<tr align="center">
							<td colspan="7">
								<div class="row">
									<div class="col">
										<ul class="pagination justify-content-center">
											<c:if test="${map.page.curPage > 1}">
												<a class="page-link" href="javascript:list('1')">[first]</a>
											</c:if>
											<c:if test="${map.page.curBlock > 1}">
												<a class="page-link"
													href="javascript:list('${map.page.prevPage}')"><i
													class="fas fa-angle-left"></i></a>
											</c:if>
											<c:forEach var="num" begin="${map.page.blockBegin}"
												end="${map.page.blockEnd}">
												<c:choose>
													<c:when test="${num == map.page.curPage}">
														<span class="page-link" style="color: red">${num}</span>
													</c:when>
													<c:otherwise>
														<a class="page-link" href="javascript:list('${num}')">${num}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${map.page.curBlock < map.page.totBlock}">
												<a class="page-link"
													href="javascript:list('${map.page.nextPage}')"> <i
													class="fas fa-angle-right"></i></a>
											</c:if>
											<c:if test="${map.page.curPage < map.page.totPage}">
												<a class="page-link"
													href="javascript:list('${map.page.totPage}')">[last]</a>
											</c:if>

										</ul>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
		</div>
		<%@ include file="../include/fm_footer.jsp"%>
	</div>
	<!-- Vendor -->
	<script src="/project/vendor/jquery/jquery.min.js"></script>
	<script src="/project/vendor/jquery.appear/jquery.appear.min.js"></script>
	<script src="/project/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="/project/vendor/jquery.cookie/jquery.cookie.min.js"></script>
	<script src="/project/vendor/popper/umd/popper.min.js"></script>
	<script src="/project/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/project/vendor/common/common.min.js"></script>
	<script src="/project/vendor/jquery.validation/jquery.validate.min.js"></script>
	<script
		src="/project/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/project/vendor/jquery.gmap/jquery.gmap.min.js"></script>
	<script src="/project/vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
	<script src="/project/vendor/isotope/jquery.isotope.min.js"></script>
	<script src="/project/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="/project/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="/project/vendor/vide/jquery.vide.min.js"></script>
	<script src="/project/vendor/vivus/vivus.min.js"></script>
	<script
		src="/project/vendor/bootstrap-star-rating/js/star-rating.min.js"></script>
	<script
		src="/project/vendor/bootstrap-star-rating/themes/krajee-fas/theme.min.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="/project/js/theme.js"></script>

	<!-- Current Page Vendor and Views -->
	<script src="/project/js/views/view.shop.js"></script>

	<!-- Theme Custom -->
	<script src="/project/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="/project/js/theme.init.js"></script>
</body>
</html>