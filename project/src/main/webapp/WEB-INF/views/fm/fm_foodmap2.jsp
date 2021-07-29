<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | Foodmap</title>


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
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyAlKD1XIfrpqSpv_q-XkEm5xpVSpQmcKrk"></script>
<style>
#map_ma {
	width: 100%;
	height: 500px;
	clear: both;
}
</style>
</head>
<body>
	<%@ include file="../include/fm_header.jsp"%>
	<div class="body">
		<div role="main" class="main shop py-4">
			<section
				class="page-header page-header-modern page-header-background page-header-background-sm"
				style="background-image: url(../images/map.jpg); opacity: 0.6;">
				<div class="container">
					<div class="row"">
						<div
							class="col-md-12 align-self-center p-static order-2 text-center">
							<h1>Food Map</h1>

						</div>
						<div class="col-md-12 align-self-center order-1">
							<ul class="breadcrumb breadcrumb-light d-block text-center">
								<li><a href="${path}/main/main.do">Main</a></li>
								<li class="active">foodmap</li>
							</ul>
						</div>
					</div>
				</div>
			</section>

			<div class="container">
				<div class="rows">
					<div id="map_ma"></div>
					<script type="text/javascript">
						$(document)
								.ready(
										function() {
											var myLatlng = new google.maps.LatLng(
													37.53444839364424,
													126.99459063380027); // 위치값 위도 경도 
											var Y_point = 37.53444839364424; // Y 좌표 
											var X_point = 126.99459063380027; // X 좌표 
											var zoomLevel = 15; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼 
											var markerTitle = "이태원역"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보 
											var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기 
											// 말풍선 내용 
											var contentString = '<div>'
													+ '<h2>대구남구</h2>'
													+ '<p>안녕하세요. 구글지도입니다.</p>'
													+ '</div>';
											var myLatlng = new google.maps.LatLng(
													Y_point, X_point);
											var mapOptions = {
												zoom : zoomLevel,
												center : myLatlng,
												mapTypeId : google.maps.MapTypeId.ROADMAP
											}
											var map = new google.maps.Map(
													document
															.getElementById('map_ma'),
													mapOptions);
											var marker = new google.maps.Marker(
													{
														position : myLatlng,
														map : map,
														title : markerTitle
													});
											var infowindow = new google.maps.InfoWindow(
													{
														content : contentString,
														maxWizzzdth : markerMaxWidth
													});
											google.maps.event.addListener(
													marker, 'click',
													function() {
														infowindow.open(map,
																marker);
													});
										});
					</script>
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