<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | Notice-view</title>


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
	$(function() {
		$("#btnEdit").click(function() {
			document.form1.action = "${path}/notice/edit/${dto.notice_idx}";
			document.form1.submit();

		});
		$("#btnList").click(function() {
			location.href = "${path}/notice/notice_list.do";
		});
		$("#btnDelete").click(function() {
			if (confirm("Are you sure you want to delete?")) {
				document.form1.action = "${path}/notice/delete.do";
				document.form1.submit();
			}
		});
		/*comment_list();
		$("#btnSave").click(function() {
			comment_add();
		});
		 $("#btnReply").click(function(){
			document.form1.action="/jsp02/board_servlet/reply.do";
			document.form1.submit();
		}); */
	});

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
												Notice</h4>

											<form method="post" name="form1"
												enctype="multipart/form-data">
												<table class="table">
													<tr>
														<td width="10%" align="center" style="font-weight: bold;">date</td>
														<td width="40%">${dto.regdate}</td>
														<td width="10%" style="font-weight: bold;">views</td>
														<td width="40%">${dto.readcount}</td>
													</tr>
													<tr>
														<td align="center" style="font-weight: bold;">writer</td>
														<td colspan="3">${dto.writer}</td>
													</tr>
													<tr>
														<td align="center" style="font-weight: bold;">title</td>
														<td colspan="3">${dto.title}</td>
													</tr>
													<tr>
														<td rowspan="2" align="left" style="font-weight: bold;">
															content</td>
													</tr>
													<tr>
														<td colspan="3" border="1">${dto.content}</td>
													</tr>
													<tr>
														<td align="center" style="font-weight: bold;">file</td>
														<td colspan="3"><c:if test="${dto.filename != null}">
														${dto.filename} <a
																	href="${path}/notice/download.do?notice_idx=${dto.notice_idx}">[download]</a>
															</c:if></td>
													</tr>
												</table>
												<div class="form-group">
													<div align="right">
														<input type="button" class="btn btn-primary" value="list"
															id="btnList">
														<c:if test="${sessionScope.userid == 'admin'}">

															<input type="hidden" name="notice_idx" id="notice_idx"
																value="${dto.notice_idx}">
															<input type="button" class="btn btn-Info" value="edit"
																id="btnEdit">
															<input type="button" class="btn btn-secondary"
																value="Delete" id="btnDelete">
														</c:if>
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