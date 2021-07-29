<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FoodMap | Join Foodmap</title>


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
			}else{
				if(!email_check(email)){
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
	
	function userid_check() {
		var userid = $("#userid").val();
		if (userid == "") {
			alert("Please enter the userid.");
			$("#userid").focus();
			return;
		} else {
			$.ajax({
				data : {
					"userid" : userid
				},
				url : "${path}/member/useridCheck.do",
				type : "post",
				success : function(result) {
					$("#result").html(result);
				}
			});
		}
	}
</script>

</head>
<body>
	<div class="body">
		<%@ include file="../include/fm_header.jsp"%>

		<div role="main" class="main shop py-4">

			<div class="container">
				<h4
					class="color-primary font-weight-semibold text-5 text-uppercase mb-3">Join
					with us</h4>
				<form class="form-horizontal" method="post" name="form1" id="form1"
					action="${path}/member/insertMember.do">
					<!-- 아이디 -->
					<div class="form-group" id="divId">
						<label for="inputId" class="col-lg-6 control-label">Id
							&nbsp; <input type="button" value="CHECK ID"
							class="btn btn-default btn-xs" onclick="userid_check()">
							<span id="result" style="color: red;"
							class="col-lg-4 control-label"></span>
						</label>
						<div class="col-lg-10">
							<input type="text" class="form-control onlyAlphabetAndNumber"
								placeholder="Alphabet or Number" id="userid" name="userid"
								maxlength="30">
						</div>
					</div>
					<!-- 비밀번호 -->
					<div class="form-group" id="divPassword">
						<label for="inputPassword" class="col-lg-2 control-label">PASSWORD</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="password"
								name="passwd" placeholder="Password" maxlength="30">
						</div>
					</div>
					<!-- 비밀번호체크 -->
					<div class="form-group" id="divPasswordCheck">
						<label for="inputPasswordCheck" class="col-lg-2 control-label">PASSWORD
							CHECK</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="passwordCheck"
								name="passwdCheck" placeholder="Password Check" maxlength="30">
						</div>
					</div>
					<!-- 이름 -->
					<div class="form-group" id="divName">
						<label for="inputName" class="col-lg-2 control-label">NAME</label>
						<div class="col-lg-10">
							<input type="text" class="form-control onlyHangulAndNumber"
								name="name" id="name" placeholder="Name" maxlength="15">
						</div>
					</div>
					<!-- 생년월일 -->
					<div class="form-group" id="divBirthday">
						<label for="inputBirth" class="col-lg-2 control-label">DATE
							OF BIRTH</label>
						<div class="col-lg-10">
							<input type="date" class="form-control" id="birthday"
								name="birthday" placeholder="DATE_OF_BIRTH" maxlength="15">
						</div>
					</div>
					<!--핸드폰번호  -->
					<div class="form-group" id="divPhoneNumber">
						<label for="inputPhoneNumber" class="col-lg-2 control-label">TELEPHONE
							(without '-')</label>
						<div class="col-lg-10">
							<input type="text" class="form-control onlyNumber" name="tel"
								id="tel" placeholder="Phone Number" maxlength="13">
						</div>
					</div>
					<!-- 이메일 -->
					<div class="form-group" id="divEmail">
						<label for="inputEmail" class="col-lg-2 control-label">EMAIL</label>
						<div class="col-lg-10">
							<input type="email" class="form-control" id="email" name="email"
								placeholder="Email" maxlength="40">
						</div>
					</div>

					<!--  -->
					<div class="form-group">
						<button type="button" id="btnSignIn"
							class="btn btn-primary float-right">Sign in</button>
						<p class="float-right">&nbsp;</p>
						<button type="button" class="btn btn-primary float-right"
							onclick="location.href='${path}/main/login.do';">Cancel</button>
					</div>
				</form>
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