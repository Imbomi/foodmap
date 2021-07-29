<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | Add new Restaurants</title>


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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btnSave")
				.click(
						function() {
							var rt_name = $("#rt_name").val();
							if (rt_name == "") {
								alert("Please enter a Restaurant Name.");
								$("#rt_name").focus();
								return;
							}

							var rt_summary = $("#rt_summary").val();
							if (rt_summary == "") {
								alert("Please enter a Restaurant Summary.");
								$("#rt_summary").focus();
								return;
							}

							var ppp = $("#ppp").val();
							if (ppp == "") {
								alert("Please enter the Price per Person.");
								$("#ppp").focus();
								return;
							}

							var content = $("#content").val();
							if (content == "") {
								alert("Please enter a Description.");
								$("#content").focus();
								return;
							}

							var post_code = $("#post_code").val();
							if (post_code == "") {
								alert("Please enter the postcode.");
								$("#post_code").focus();
								return;
							}
							var address1 = $("#address1").val();
							if (address1 == "") {
								alert("Please enter the address1.");
								return;
							}
							var address2 = $("#address2").val();
							if (address2 == "") {
								alert("Please enter the address2.");
								return;
							}
							var picture_url = document.getElementById("file").value;
							if (!picture_url) {
								alert("Please add a photo of the restaurant.");
								return;
							}

							var filename = document.getElementById("file").value;
							var start = filename.lastIndexOf(".") + 1;
							if (start != -1) {
								var ext = filename.substring(start,
										filename.length);
								if (ext == 'jpg' || ext == 'png'
										|| ext == 'jpeg' || ext == 'gif') {
								} else {
									alert("This file cannot be uploaded. Only .jpg, .jpeg, .png, .gif file can be uploaded.");
									return;
								}
							}
							document.form1.submit();
						});
	});

	function showPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address1').value = fullAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address2').focus();
					}
				}).open();
	}
</script>

</head>
<body>
</head>
<body>
	<div class="body">
		<%@ include file="../include/fm_header.jsp"%>
		<div role="main" class="main">
			<section
				class="page-header page-header-modern page-header-background page-header-background-sm"
				style="background-image: url(/project/images/notice.jpg); opacity: 0.6;">
				<div class="container">
					<div class="row">
						<div
							class="col-md-12 align-self-center p-static order-2 text-center">
							<h1>Restaurants</h1>

						</div>
						<div class="col-md-12 align-self-center order-1">
							<ul class="breadcrumb breadcrumb-light d-block text-center">
								<li><a href="#">Main</a></li>
								<li class="active">Restaurants</li>
							</ul>
						</div>
					</div>
				</div>
			</section>

			<div class="container">

				<div class="row">
					<div class="col">
						<div class="featured-boxes">
							<div class="row">
								<div class="col-md-12">
									<div class="featured-box featured-box-primary text-left mt-2">
										<div class="box-content">
											<h4 class="color-primary font-weight-semibold text-5">
												New Restaurant</h4>
											<br>
											<form method="post" name="form1"
												action="${path}/restaurant/insert.do"
												enctype="multipart/form-data">
												<div class="container">
													<div class="form-group" id=divWriter>
														<label for="writer" class="col-lg-2 control-label">WRITER</label>
														<div class="col-lg-10">
															<input type=text class="form-control" name="writer"
																id="writer" value="${sessionScope.name}" readOnly>
														</div>
													</div>

													<div class="form-group" id="divRt_name">
														<label for="rt_name" class="col-lg-2 control-label">Restaurant
															Name </label>
														<div class="col-lg-10">
															<input type="text"
																class="form-control onlyAlphabetAndNumber" id="rt_name"
																placeholder="Restaurant Name" name="rt_name">
														</div>
													</div>
													<div class="form-group" id="divContent">
														<label for="rt_summary" class="col-lg-2 control-label">Restaurant
															Summary</label>
														<div class="col-lg-10">
															<textArea class="form-control" id="rt_summary"
																name="rt_summary" placeholder="Restaurant Summary"></textArea>
														</div>
													</div>
													<div class="form-group" id="divCategory">
														<label for="category" class="col-lg-2 control-label">Category</label>
														<div class="col-lg-10">
															<select class="form-control" name="category">
																<option value="Chinese"
																	<c:out value="${map.category=='chinese'?'selected':''}"/>>Chinese</option>
																<option value="Korean"
																	<c:out value="${map.category=='korean'?'selected':''}"/>>Korean</option>
																<option value="Japanese"
																	<c:out value="${map.category=='japanese'?'selected':''}"/>>Japanese</option>
															</select>
														</div>
													</div>

													<div class="form-group" id="divPpp">
														<label for="ppp" class="col-lg-2 control-label">Price
															per person</label>
														<div class="col-lg-10">
															<input type="number" class="form-control" id="ppp"
																name="ppp" placeholder="Price per person(Number Only)">
														</div>
													</div>

													<div class="form-group" id="divRt_content">
														<label for="rt_content" class="col-lg-2 control-label">Description</label>
														<div class="col-lg-10">
															<textArea class="form-control" id="rt_content"
																name="rt_content"
																placeholder="Description of the Restaurant" rows="4"></textArea>
														</div>
													</div>

													<div class="form-group" id="divAddress">
														<label for="rt_content" class="col-lg-4 control-label">Address</label>
														<div class="col-lg-10">
															Postcode : &nbsp; <input type="button"
																class="btn btn-sm btn-light text-1 text-uppercase"
																onclick="showPostcode()" value="Check"> <input
																name="postcode" id="postcode" readonly
																class="form-control" size="10"> address1 : <input
																name="address1" id="address1" size="60"
																class="form-control"> address2 : <input
																name="address2" id="address2" class="form-control">
														</div>
													</div>


													<div class="form-group" id="divPicture_url">
														<label for="picture_url" class="col-lg-2 control-label">Photo</label>
														<div class="col-lg-10">
															<input type="file" name="file" id="file">
														</div>
													</div>
												</div>


												<div class="form-group">
													<div align="right">
														<button type="button" class="btn btn-secondary"
															onclick="location.href='${path}/restaurant/list.do';">Cancel</button>
														<input type="button" class="btn btn-primary" value="Post"
															id="btnSave">

													</div>
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
	</div>
	<%@ include file="../include/fm_footer.jsp"%>
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