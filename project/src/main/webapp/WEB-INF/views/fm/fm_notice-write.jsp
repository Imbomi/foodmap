<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | Notice-write Admin Authorized</title>
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
<script type="text/javascript">
$(function(){
 	$("#btnSave").click(function() {
		var title = $("#title").val();
		if (title == "") {
			alert("Please enter a title.");
			$("#title").focus();
			return;
		}
		
		var content = $("#content").val();
		if (content == "") {
			alert("Please enter a content.");
			$("#content").focus();
			return;
		}
		
		var filename = document.form1.file.value;
		var start = filename.lastIndexOf(".") + 1; 
		if (start != -1) {
			var ext = filename.substring(start, filename.length);
			if (ext == "jsp" || ext == "exe") {
				alert("The file cannot be uploaded.");
				return;
			}
		}
		document.form1.submit();
	});	
});

/* $(function() {
	
	

}); */
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
							<h1>Notice</h1>

						</div>
						<div class="col-md-12 align-self-center order-1">
							<ul class="breadcrumb breadcrumb-light d-block text-center">
								<li><a href="#">Main</a></li>
								<li class="active">notice</li>
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
											<h4
												class="color-primary font-weight-semibold text-4 text-uppercase mb-3">
												New Notice</h4>
											<form method="post" name="form1"
												action="${path}/notice/notice_insert.do"
												enctype="multipart/form-data">
												<div class="container">
													<div class="form-group" id=divId>
														<label for="inputEmail" class="col-lg-2 control-label">WRITER</label>
														<div class="col-lg-10">
															<input type=text class="form-control" name="writer"
																id="writer" value="${sessionScope.name}" readOnly>
														</div>
													</div>

													<div class="form-group" id="divTitle">
														<label for="inputId" class="col-lg-2 control-label">TITLE
														</label>
														<div class="col-lg-10">
															<input type="text"
																class="form-control onlyAlphabetAndNumber" id="title"
																placeholder="Title" name="title"
																data-rule-required="true" maxlength="30">
														</div>
													</div>
													<div class="form-group" id="divContent">
														<label for="inputName" class="col-lg-2 control-label">CONTENT</label>
														<div class="col-lg-10">
															<textArea class="form-control" id="content"
																name="content" placeholder="Content"></textArea>
														</div>
													</div>
													<div class="form-group" id="divFile">
														<label for="inputName" class="col-lg-2 control-label">FILE</label>
														<div class="col-lg-10">
															<input type="file" name="file">
														</div>
													</div>
												</div>


												<div class="form-group">
													<div align="right">
														<button type="button" class="btn btn-secondary"
															onclick="location.href='${path}/notice/notice_list.do';">Cancel</button>
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
	<script src="/project/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="/project/vendor/vide/jquery.vide.min.js"></script>
	<script src="/project/vendor/vivus/vivus.min.js"></script>
	<script src="/project/vendor/bootstrap-star-rating/js/star-rating.min.js"></script>
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