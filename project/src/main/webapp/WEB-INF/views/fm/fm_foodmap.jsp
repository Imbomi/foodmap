<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">


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
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=xmyf9acuqr&submodules=geocoder"></script>
</head>
<body>
	<%@ include file="../include/fm_header.jsp"%>
	<div class="body">
		<div role="main" class="main shop py-4">
			<section
				class="page-header page-header-modern page-header-background page-header-background-sm"
				style="background-image: url(../images/map.jpg); opacity: 0.6;">
				<div class="container">
					<div class="row">
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
					<div class="control-btn control-on">
						<input id="address" type="text" placeholder="검색할 주소"> <input
							class="btn btn-sm btn-default" id="submit" type="button"
							value="주소 검색">
					</div>
					<br>
					<div id="map" style="width: 100%; height: 400px;">
						<script>
							var map = new naver.maps.Map("map", {
								center : new naver.maps.LatLng(37.5342135,
										127.0016985),
								zoom : 12,
								mapTypeControl : true
							});

							var infoWindow = new naver.maps.InfoWindow({
								anchorSkew : true
							});

							map.setCursor('pointer');

							searchAddressToCoordinate('${resto_address}'); //검색 주소 넣는 곳

							function searchAddressToCoordinate(address) {
								naver.maps.Service
										.geocode(
												{
													query : address
												},
												function(status, response) {
													if (status === naver.maps.Service.Status.ERROR) {
														return alert('Something Wrong!');
													}

													if (response.v2.meta.totalCount === 0) {
														return alert('검색된 항목: '
																+ response.v2.meta.totalCount
																+ ' 개');
													}

													var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(
															item.x, item.y);

													if (item.roadAddress) {
														htmlAddresses
																.push('[도로명 주소] '
																		+ item.roadAddress);
													}

													if (item.jibunAddress) {
														htmlAddresses
																.push('[지번 주소] '
																		+ item.jibunAddress);
													}

													if (item.englishAddress) {
														htmlAddresses
																.push('[영문명 주소] '
																		+ item.englishAddress);
													}

													infoWindow
															.setContent([
																	'<div style="padding:10px;min-width:200px;line-height:150%;">',
																	'<h4 style="margin-top:5px;">검색 주소 : '
																			+ address
																			+ '</h4><br />',
																	htmlAddresses
																			.join('<br />'),
																	'</div>' ]
																	.join('\n'));

													map.setCenter(point);
													infoWindow.open(map, point);

													// 제대로 된 query가 들어가 결과가 나올 경우 
													var result = response.v2, // 검색 결과의 컨테이너
													items = result.addresses;
													//지도에 마커찍기 
													let x = parseFloat(items[0].x); // 경도
													let y = parseFloat(items[0].y); // 위도 
												});
							}

							function initGeocoder() {
								if (!map.isStyleMapReady) {
									return;
								}

								$('#address').on(
										'keydown',
										function(e) {
											var keyCode = e.which;

											if (keyCode === 13) { // Enter Key
												searchAddressToCoordinate($(
														'#address').val());
											}
										});

								$('#submit').on(
										'click',
										function(e) {
											e.preventDefault();

											searchAddressToCoordinate($(
													'#address').val());
										});
							}

							function makeAddress(item) {
								if (!item) {
									return;
								}

								var name = item.name, region = item.region, land = item.land, isRoadAddress = name === 'roadaddr';

								var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

								if (hasArea(region.area1)) {
									sido = region.area1.name;
								}

								if (hasArea(region.area2)) {
									sigugun = region.area2.name;
								}

								if (hasArea(region.area3)) {
									dongmyun = region.area3.name;
								}

								if (hasArea(region.area4)) {
									ri = region.area4.name;
								}

								if (land) {
									if (hasData(land.number1)) {
										if (hasData(land.type)
												&& land.type === '2') {
											rest += '산';
										}

										rest += land.number1;

										if (hasData(land.number2)) {
											rest += ('-' + land.number2);
										}
									}

									if (isRoadAddress === true) {
										if (checkLastString(dongmyun, '면')) {
											ri = land.name;
										} else {
											dongmyun = land.name;
											ri = '';
										}

										if (hasAddition(land.addition0)) {
											rest += ' ' + land.addition0.value;
										}
									}
								}

								return [ sido, sigugun, dongmyun, ri, rest ]
										.join(' ');
							}

							function hasArea(area) {
								return !!(area && area.name && area.name !== '');
							}

							function hasData(data) {
								return !!(data && data !== '');
							}

							function checkLastString(word, lastString) {
								return new RegExp(lastString + '$').test(word);
							}

							function hasAddition(addition) {
								return !!(addition && addition.value);
							}

							naver.maps.onJSContentLoaded = initGeocoder;
							naver.maps.Event.once(map, 'init_stylemap',
									initGeocoder);
						</script>
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