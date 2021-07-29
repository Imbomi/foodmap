<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | My Information</title>


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
<script>
$("#birthday").format("MMM Do YY");
	$(function() {
		
		$("#btnSignIn").click(function() {
			var userid = $("#userid").val();
			var result = $("#result").html();
			var password = $("#password").val();
			var passwordCheck = $("#passwordCheck").val();
			var name = $("#name").val();
			var birthday = $("#birthday").val();
			var tel = $("#tel").val();
			var email = $("#email").val();

			//userid 빈값 체크, result 확인
			if (userid == "") { //빈값이면
				alert("Please enter the Id.");
				$("#userid").focus();
				return;
			}
			if (result == "It's already in used.") {
				alert("Please enter another Id. It's already in used.")
				$("#userid").focus();
				return;
			}
			//password 빈값 체크, password=paswordCheck 확인
			if (password == "") {
				alert("Please enter the password.");
				$("#password").focus();
				return;
			}
			if (passwordCheck == "") {
				alert("Please enter the password Check.");
				$("#passwordCheck").focus();
				return;
			}
			if (password != passwordCheck) {
				alert("Password and Passwordcheck is not same.");
				$("#passwordCheck").focus();
				return;
			}
			//이름 빈값 체크
			if (name == "") {
				alert("Please enter the name.");
				$("#name").focus();
				return;
			}
			if (birthday == "") {
				alert("Please enter the date of birth.");
				$("#birthday").focus();
				return;
			}
			if (tel == "") {
				alert("Please enter the phone number.");
				$("#tel").focus();
				return;
			}
			if (email == "") {
				alert("Please enter the email.");
				$("#email").focus();
				return;
			} else {
				if (!email_check(email)) {
					alert("Please check your email format.");
					return false;
				}
			}
			document.form1.submit();

		});

		$('.onlyAlphabetAndNumber').keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val($(this).val().replace(/[^_a-z0-9]/gi, ''));
			}
		});

		$(".onlyHangulAndNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[0-9]/gi, ''));
			}
		});

		$(".onlyNumber").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});

		/*function autoHypenPhone(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';
			if (str.length < 4) {
				return str;
			} else if (str.length < 7) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3);
				return tmp;
			} else if (str.length < 11) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 3);
				tmp += '-';
				tmp += str.substr(6);
				return tmp;
			} else {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 4);
				tmp += '-';
				tmp += str.substr(7);
				return tmp;
			}
			return str;
		}
		var tel = document.getElementById('tel');
		tel.onkeyup = function(event) {
			event = event || window.event;
			var _val = this.value.trim();
			this.value = autoHypenPhone(_val);
		}*/
	});

	function email_check(email) {

		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		return reg.test(email);

	}
</script>
</head>
<body>
	<div class="body">
		<%@ include file="../include/fm_header.jsp"%>

		<div role="main" class="main">
			<section
				class="page-header page-header-modern page-header-background page-header-background-sm overlay overlay-color-primary overlay-show overlay-op-8 mb-5"
				style="background-image: url(../img/page-header/page-header-elements.jpg);">
				<div class="container">
					<div class="row">
						<div
							class="col-md-12 align-self-center p-static order-2 text-center">
							<h1>My Information</h1>

						</div>
						<div class="col-md-12 align-self-center order-1">
							<ul class="breadcrumb breadcrumb-light d-block text-center">
								<li><a href="#">Main</a></li>
								<li class="active">My Info</li>
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

								<form class="form-horizontal" role="form" method="post"
									action="javascript:alert( 'success!' );">

									<div class="form-group" id="divId">
										<label for="inputId" class="col-lg-2 control-label">ID
											&nbsp; </label>
										<div class="col-lg-10">
											<input type="text" class="form-control onlyAlphabetAndNumber"
												id="userid" value="${userid}" maxlength="30" disabled>
										</div>
									</div>
									<div class="form-group" id="divPassword">
										<label for="inputPassword" class="col-lg-2 control-label">PASSWORD</label>
										<div class="col-lg-10">
											<input type="password" class="form-control" id="passwd"
												name="excludeHangul" data-rule-required="true"
												placeholder="Password" maxlength="30">
										</div>
									</div>
									<div class="form-group" id="divPasswordCheck">
										<label for="inputPasswordCheck" class="col-lg-2 control-label">PASSWORD
											CHECK</label>
										<div class="col-lg-10">
											<input type="password" class="form-control" id="passwdCheck"
												data-rule-required="true" placeholder="Password Check"
												maxlength="30">
										</div>
									</div>
									<div class="form-group" id="divName">
										<label for="inputName" class="col-lg-2 control-label">NAME</label>
										<div class="col-lg-10">
											<input type="text" class="form-control onlyHangul" id="name"
												value="${dto.name}" maxlength="15" disabled>
										</div>
									</div>

									<div class="form-group" id="divNickname">
										<label for="inputNickname" class="col-lg-2 control-label">DATE
											OF BIRTH</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="birthday"
												value="${dto.birthday}" maxlength="15" disabled>
										</div>
									</div>
									<div class="form-group" id="divTel">
										<label for="inputPhoneNumber" class="col-lg-2 control-label">TEL</label>
										<div class="col-lg-10">
											<input type="tel" class="form-control onlyNumber"
												value="0${dto.tel}" id="phoneNumber"
												placeholder="Phone Number" maxlength="13">
										</div>
									</div>
									<div class="form-group" id="divEmail">
										<label for="inputEmail" class="col-lg-2 control-label">EMAIL</label>
										<div class="col-lg-10">
											<input type="email" class="form-control" id="email"
												value="${dto.email}" placeholder="Email" maxlength="40">
										</div>
									</div>


									<div class="form-group">
										<div align="right">
											<button type="submit" class="btn btn-primary">Save</button>
										</div>
									</div>
								</form>
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