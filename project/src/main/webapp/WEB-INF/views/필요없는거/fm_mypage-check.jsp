<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | Check for My Information</title>


<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Responsive HTML5 Template">
<meta name="author" content="okler.net">

<!-- Favicon -->
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="../img/apple-touch-icon.png">

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
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="../vendor/animate/animate.min.css">
<link rel="stylesheet"
	href="../vendor/simple-line-icons/css/simple-line-icons.min.css">
<link rel="stylesheet"
	href="../vendor/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="../vendor/owl.carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../vendor/magnific-popup/magnific-popup.min.css">
<link rel="stylesheet"
	href="../vendor/bootstrap-star-rating/css/star-rating.min.css">
<link rel="stylesheet"
	href="../vendor/bootstrap-star-rating/themes/krajee-fas/theme.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" href="../css/theme.css">
<link rel="stylesheet" href="../css/theme-elements.css">
<link rel="stylesheet" href="../css/theme-blog.css">
<link rel="stylesheet" href="../css/theme-shop.css">

<!-- Demo CSS -->
<link rel="stylesheet" href="../css/demos/demo-church.css">

<!-- Current Page CSS -->
<link rel="stylesheet" href="../vendor/rs-plugin/css/settings.css">
<link rel="stylesheet" href="../vendor/rs-plugin/css/layers.css">
<link rel="stylesheet" href="../vendor/rs-plugin/css/navigation.css">


<!-- Skin CSS -->
<link rel="stylesheet" href="../css/skins/default.css">

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="../css/custom.css">

<!-- Head Libs -->
<script src="../vendor/modernizr/modernizr.min.js"></script>
</head>
<body>
</head>
<body>
<%@ include file="../include/session_check.jsp"%>
	<c:if test="${message == 'error' }">
		<script>
			alert("Password do not match.");
		</script>
	</c:if>

	<div class="body">
		<%@ include file="../include/fm_header.jsp"%>
		<div role="main" class="main shop py-4">

			<div class="container">

				<div class="row">
					<div class="col">
						<div class="featured-boxes">
							<div class="row">
								<div class="col-md-12">
									<div class="featured-box featured-box-primary text-left mt-2">
										<div class="box-content">
											<h4
												class="color-primary font-weight-semibold text-4 text-uppercase mb-3">
												Check your Password</h4>
											<form method="post" name="form1"
												action="${path}/member/mypageCheck.do">
												<div class="form-row">
													<div class="form-group col">
														<label class="font-weight-bold text-dark text-2">Password</label>
														<input type="password" name="passwd" id="passwd"
															class="form-control form-control-lg">
													</div>
												</div>
												<div class="form-group float-right">
													<input type="submit" value="Confirm"
														class="btn btn-primary" data-loading-text="Loading...">
												</div>
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/fm_footer.jsp"%>
	</div>
	<!-- Vendor -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/jquery.appear/jquery.appear.min.js"></script>
	<script src="../vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="../vendor/jquery.cookie/jquery.cookie.min.js"></script>
	<script src="../vendor/popper/umd/popper.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../vendor/common/common.min.js"></script>
	<script src="../vendor/jquery.validation/jquery.validate.min.js"></script>
	<script
		src="../vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="../vendor/jquery.gmap/jquery.gmap.min.js"></script>
	<script src="../vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
	<script src="../vendor/isotope/jquery.isotope.min.js"></script>
	<script src="../vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="../vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="../vendor/vide/jquery.vide.min.js"></script>
	<script src="../vendor/vivus/vivus.min.js"></script>
	<script src="../vendor/bootstrap-star-rating/js/star-rating.min.js"></script>
	<script
		src="../vendor/bootstrap-star-rating/themes/krajee-fas/theme.min.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="../js/theme.js"></script>

	<!-- Current Page Vendor and Views -->
	<script src="../js/views/view.shop.js"></script>

	<!-- Theme Custom -->
	<script src="../js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="../js/theme.init.js"></script>
</body>
</html>