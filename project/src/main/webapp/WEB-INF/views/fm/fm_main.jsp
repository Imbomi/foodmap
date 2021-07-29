<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | main</title>


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
</head>
<body>
	<div class="body">

		<%@ include file="../include/fm_header.jsp"%>

		<div role="main" class="main">
		<section
				class="page-header page-header-modern page-header-background page-header-background-sm"
				style="background-image: url(../images/fm_main.jpg); opacity: 0.6;">
			<div class="container container-lg">
			
				<div class="row">
					<div class="col-lg-12 pt-5">
						<h2
							class="font-weight-bold text-10 line-height-2 appear-animation"
							data-appear-animation="fadeInRightShorter"
							data-appear-animation-delay="500">
							<span class="text-5" style="color:white">The more restaurants you share, <br>
							the greater your happiness.</span>
						</h2>
						<h4
							class="text-7 line-height-6 font-weight-normal appear-animation"
							data-appear-animation="fadeInRightShorter"
							data-appear-animation-delay="800" style="font-style:italic;">
							<span style="color:white;">Search for restaurants according to your conditions, <br>
							and save them to your own list!</span>
						</h4>
					</div>
				</div>
				
			</div>
			</section>
			<br>
			
			<div class="main shop py-4">
			
				<div class="container">
					<div class="masonry-loader masonry-loader-showing">
					<h2 class="font-weight-bold text-10 line-height-2 appear-animation"
							data-appear-animation="fadeInRightShorter" style="color:gray">Most loved restaurants</h2><br>
						<div class="row products product-thumb-info-list"
							data-plugin-masonry
							data-plugin-options="{'layoutMode': 'fitRows'}">
							
							<c:forEach var="dto" items="${list}">
							<div class="col-12 col-sm-6 col-lg-3 product">
								 <span class="product-thumb-info border-0"> <a
									href="${path}/restaurant/view.do/${dto.rt_idx}"
									class="add-to-cart-product bg-color-primary"> <span
										class="text-uppercase text-1">Read more</span>
								</a> <a href="${path}/restaurant/view.do/${dto.rt_idx}"> <span
										class="product-thumb-info-image"> <img alt=""
											class="img-fluid" style="height: 150px;"
											src="${path}/images/${dto.picture_url}" width="200">
									</span>
								</a> <span
									class="product-thumb-info-content product-thumb-info-content pl-0 bg-color-light">
											<span class="text-weight-bold text-5">${dto.rt_name}</span> <span
											class="price"> <ins>
													<span class="ppp"><i class="fas fa-won-sign"></i>/<i
															class="far fa-user"></i> ${dto.ppp}</span>
												</ins>&nbsp;
												<ins>
													<span class="goodcount"><i
															class="fas fa-heart" style="color: red;"></i>${dto.goodcount}</span>
												</ins>
										</span>
								</span>
								</span>
							</div>
							</c:forEach>
							
							
							
						</div>
						<div class="row">
							<div class="col">
								<button class="btn btn-lg btn-basic float-right" onclick="location.href='${path}/restaurant/list.do';">More restaurants →</button>
							</div>
						</div>
					</div>
				</div>
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

