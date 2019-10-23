<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>그날, 우리의 제주</title>
<!-- Meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" />

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin' />

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="assets/css/headers/header-default.css" />
<link rel="stylesheet" href="assets/css/footers/footer-v1.css" />

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets/plugins/animate.css" />
<link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css" />
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/plugins/fancybox/source/jquery.fancybox.css" />
<link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
<link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings.css" type="text/css" media="screen" />

<!-- 리뷰글작성 -->
<link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css" />
<link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css" />

<!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom_review.css" />
<link rel="stylesheet" href="assets/css/theme-colors/orange.css" />
</head>

<body>
	<%@include file="../header.jsp"%>


	<!-- 기본 페이지 이 아래로 합치면 됨 -->

	<div class="wrapper">

		<div class="container">

			<!-- Begin Content -->
			<div class="col-md-9 reviewlist">

				<!--=== Breadcrumbs ===-->
				<div class="container reviewhead">
					<div class="headline reviewhead1">
						<h2>리뷰 수정</h2>
					</div>
				</div>
				<!--/container-->

				<!-- General Unify Forms -->
				<form method="post" action="reviewUpdatePro.do?review_no=${review.review_no }" class="sky-form">
					<fieldset>
						<section> 
							<label class="label">리뷰 제목</label> 
							<label class="input"> <input type="text" name="review_title" value="${review.review_title }"></label> 
						</section>
						<section> 
							<label class="label">위치</label> 
							<label class="input"> <input type="text" name="review_place" value="${review.review_place }"></label> 
						</section>
						<section> 
							<label class="label">사진 등록</label> 
							<label for="file" class="input input-file">
								<div class="button">
									<input type="file" id="file" onchange="this.parentNode.nextSibling.value = this.value">Browse
								</div> 
								<input type="text" readonly>
							</label> 
						</section>
					</fieldset>

					<fieldset>
						<section> 
						<label class="label">내용 입력</label> 
						<label class="textarea">
							<textarea rows="10" name="review_content" >${review.review_content }</textarea>
						</label>
						<div class="note"></div>
						</section>
					</fieldset>

					<footer>
					<button type="submit" class="btn-u">수정</button>
					<button type="button" class="btn-u btn-u-default" onclick="location.href='review.do'">취소</button>
					</footer>
				</form>
				</center>

				<!-- 기본 페이지 끝 -->
			</div>
		</div>

		<%@include file="../footer.jsp"%>
	</div>
	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="assets/plugins/jquery.parallax.js"></script>
	<script type="text/javascript" src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript" src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="assets/js/app.js"></script>
	<script type="text/javascript" src="assets/js/plugins/fancy-box.js"></script>
	<script type="text/javascript" src="assets/js/plugins/owl-carousel.js"></script>
	<script type="text/javascript" src="assets/js/plugins/revolution-slider.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
			App.initParallaxBg();
			FancyBox.initFancybox();
			OwlCarousel.initOwlCarousel();
			RevolutionSlider.initRSfullWidth();
		});
	</script>
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>