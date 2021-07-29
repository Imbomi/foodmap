<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | Restaurants views</title>


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
	$(function() {
		$("#btnDelete").click(function() {
			if (confirm("Are you sure you want to delete?")) {
				location.href =  "${path}/restaurant/delete.do?rt_idx="+${dto.rt_idx};
			}
		});
		
		listReply(1);
		$("#btnReply").click(function() {
			if ($('#replytext').val() == "") {
				alert("Please enter the comment");
				replytext.focus();
				return;
			}
			reply();
			//listReply("1");
			listReply(1);
			document.getElementById("replytext").value = '';
		});
	});

	function reply() {
		var replytext = $("#replytext").val(); //댓글 내용
		var rt_idx = "${dto.rt_idx}"; //게시물번호
		var secret_reply = $("#secret_reply").is(":checked") == true ? "y"
				: "n";
		var param = {
			"replytext" : replytext,
			"rt_idx" : rt_idx,
			"secret_reply" : secret_reply
		};
		$.ajax({
			type : "post",
			url : "${path}/reply/insert.do",
			data : param,
			success : function() { //콜백함수
				alert("Your comment has been posted.");
				listReply(1);
			}
		});
	}

	function listReply(num) {
		$.ajax({
			type : "get",
			url : "${path}/reply/list/${dto.rt_idx}/" + num,
			success : function(result) {
				// 컨트롤러에서 뷰로 포워딩되어 출력된 responseText를
				// id가 listReply인 태그의 innertHTML영역에 출력시킴
				$("#listReply").html(result);
			}
		});
	}
	function showModify(reply_idx) {
		$.ajax({
			type : "get",
			url : "${path}/reply/detail/" + reply_idx,
			success : function(result) {
				$("#modifyReply").html(result);
				// 태그.css("속성","값")
				$("#modifyReply").css("visibility", "visible");
			}
		});
	}
	function like(rt_idx) {
<%String userid = (String) session.getAttribute("userid");
if (userid == null) { // null이면%>
	alert("please log in first");
		location.href = "${path}/main/login.do";
<%}%>
	
<%if (userid != null) {
	if (!session.getAttribute("userid").equals("admin")) {%>
	location.href = "${path}/good/insert.do/" + rt_idx;
<%} else {%>
	alert("This feature is not available to the administrator.");
<%}%>
	
<%}%>
	}
</script>


</head>
<body>
	<div class="body">
		<%@ include file="../include/fm_header.jsp"%>

		<div role="main" class="main shop py-4">

			<div class="container">

				<div class="row">
					<div class="col-lg-6">

						<div class="owl-carousel owl-theme"
							data-plugin-options="{'items': 1}">
							<div>
								<img alt="" class="img-fluid"
									src="${path}/images/${dto.picture_url}" width="200"
									height="200">
							</div>
						</div>

					</div>

					<div class="col-lg-6">

						<div class="summary entry-summary">

							<h1 class="mb-0 font-weight-bold text-7">${dto.rt_name}</h1>

							<p class="price" style="font-size: 1.5em;">
								<i class="fas fa-won-sign"></i> <span class="amount">${dto.ppp}</span>
							</p>

							<div class="product-meta">
								<span class="posted-in">Categories: ${dto.category}</span>
							</div>
							<hr>
							<p class="mb-4">${dto.rt_summary}</p>
							<hr>
							<div class="pb-0 clearfix">
								<div title="Comments" class="float-left">
									<i class="far fa-comment fa-2x"></i>
								</div>
								<div class="review-num" style="font-size: 1.2em;">
									${reply_count} reviews</div>
							</div>

							<div class="pb-0 clearfix">
								<div title="Likes" class="float-left">
									<i class="fas fa-hand-holding-heart fa-2x"
										style="color: purple;"></i>
								</div>
								<div title="Likes" style="font-size: 1.2em;">
									&nbsp;${dto.goodcount} likes</div>
							</div>


							<!-- 만약, session.userid & goodcount=1 $ rt_idx가 테이블에 없으면, 회색하트(add). 있으면, 빨간하트(already) -->
							<c:if test="${goodcheck!=1}">

								<a href="javascript:like('${dto.rt_idx}')"> <i
									class="far fa-heart fa-3x float-right" style="color: gray"></i></a>
								<span class="float-right">add to my list&nbsp;&nbsp;</span>
							</c:if>
							<c:if test="${goodcheck==1}">
								<a href="${path}/good/list.do"> <i
									class="fas fa-heart fa-3x float-right" style="color: pink"></i></a>
								<span class="float-right">edit my list&nbsp;&nbsp;</span>
							</c:if>



						</div>
						<br> <br>
						<div>
							<c:if test="${sessionScope.name==dto.writer}">
								<button
									onclick="location.href='${path}/restaurant/edit.do/${dto.rt_idx}';"
									class="btn-lg btn-primary btn float-right">edit</button>
							</c:if>
							<c:if test="${sessionScope.name=='관리자'}">
								<button id="btnDelete"
									class="btn-lg btn-primary btn float-right">delete</button>
							</c:if>
							<button onclick="location.href='${path}/restaurant/list.do';"
								class="btn-lg btn-primary btn float-right">list</button>
						</div>
					</div>


				</div>

				<div class="row">
					<div class="col">
						<div class="tabs tabs-product mb-2">
							<ul class="nav nav-tabs">
								<li class="nav-item active"><a class="nav-link py-3 px-4"
									href="#productDescription" data-toggle="tab">Description</a></li>
								<li class="nav-item"><a class="nav-link py-3 px-4"
									href="#productLocation" data-toggle="tab">Address</a></li>
								<li class="nav-item"><a class="nav-link py-3 px-4"
									href="#productReviews" data-toggle="tab">Reviews
										(${reply_count})</a></li>
							</ul>
							<div class="tab-content p-0">
								<div class="tab-pane p-4 active" id="productDescription">
									<p>${dto.rt_content}</p>
								</div>

								<div class="tab-pane p-4" id="productLocation">
									<p>${dto.address1}, ${dto.address2}</p>
									<a href="${path}/restaurant/showmap.do?address=${dto.address1}${dto.address2}">→ 지도로 이동하기</a>
								</div>

								<div class="tab-pane p-4" id="productReviews">
									<div id="modifyReply"></div>
									<ul class="comments">
										<c:if test="${reply_count==0}">
											<div id="noReply">No comments yet</div>
										</c:if>
										<li>
											<div id="noReply"></div>
											<div id="listReply"></div>
										</li>

									</ul>
									<c:if test="${sessionScope.userid != null }">
										<hr class="solid my-5">
										<h4>Add a review</h4>
										<div class="row">
											<div class="col">

												<form id="form1" method="post" name="form1">
													<div class="form-row">
														<div class="form-group col">
															<label class="required font-weight-bold text-dark ">Review</label>
															&nbsp; &nbsp;<input type="checkbox" id="secret_reply">
															secret
															<textarea maxlength="500"
																placeholder="Please enter your review." rows="4"
																class="form-control" name="review" id="replytext"
																required></textarea>
														</div>
													</div>
													<div class="form-row">
														<div class="form-group col mb-0">
															<input type="button" id="btnReply" value="Post Review"
																class="btn btn-primary btn-modern"
																data-loading-text="Loading...">
														</div>
													</div>
												</form>
											</div>

										</div>
									</c:if>
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