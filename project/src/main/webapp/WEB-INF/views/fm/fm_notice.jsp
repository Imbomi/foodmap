<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | notice</title>


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
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.href = "${path}/notice/write.do";
		});
	});
	function list(page) {
		location.href = "${path}/notice/notice_list.do?curPage=" + page;
	}
</script>
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

			<div class="container py-2">

				<div class="row">
					<div class="col">

						<div class="row">
							<div class="col pb-3">
								<h2>Notice</h2>
								There are ${map.count} notices.
								<table class="table table-sm">
									<tr>
										<th>no.</th>
										<th>writer</th>
										<th align="center" class="col-md-4">title</th>
										<th>date</th>
										<th>views</th>
										<th>file</th>
										<th>download</th>
									</tr>
									<c:forEach var="dto" items="${map.list}">
										<tr>
											<td>${dto.notice_idx}</td>
											<td>${dto.writer}</td>
											<td class="col-md-4"><a
												href="${path}/notice/view/${dto.notice_idx}">${dto.title}</a></td>
											<td>${dto.regdate}</td>
											<td align="center">${dto.readcount}</td>
											<td align="center"><c:if test="${dto.filename != null }">
													<a
														href="${path}/notice/download.do?notice_idx=${dto.notice_idx}">
														<img src="../images/file.jpg">
													</a>
												</c:if></td>
											<td align="center"><c:if test="${dto.filename != null}">${dto.down}</c:if></td>
										</tr>
									</c:forEach>

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

								<c:if test="${sessionScope.userid == 'admin'}">
									<input type="button" value="New Notice"
										class="btn btn-primary float-right"
										onclick="location.href='${path}/notice/notice_write.do';">
								</c:if>
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