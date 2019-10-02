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
    <!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

	<!-- CSS Page Style -->    
    <link href="assets/css/pages/blog_masonry_3col.css" rel="stylesheet">
    
    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom_review.css" />
        <link rel="stylesheet" href="assets/css/theme-colors/orange.css" />
</head>

<body class="index-page" data-page="index">    
<%@include file="../header.jsp" %>


<!-- 기본 페이지 이 아래로 합치면 됨 -->
<div class="wrapper">

    <!--=== Breadcrumbs ===-->
    <div class="breadcrumbs-v1">
        <div class="container">
            <span>Review Page</span>
            <h1>리뷰</h1>
        </div>
        <!--/container-->
    </div>
    <!--/breadcrumbs-->
    <div class="breadcrumbs">
        <div class="container">
   	 		<ul class="pull-right breadcrumb">
        		<li><a href="Review_Write.jsp">리뷰 작성</a></li>
   			</ul>
        </div><!--/container-->
    </div>

    <!--=== End Breadcrumbs ===-->

    <!--=== Content Part ===-->
		<div class="blog_masonry_3col">
			<div class="container content grid-boxes">
				<div class="grid-boxes-in">
					<img class="img-responsive" src="Review/img/jeju1.png" alt="">
						<div class="grid-boxes-caption">
							<ul class="pull-right list-inline grid-boxes-news modify">
								<li><a href="Review_Modify.jsp">수정</a></li>
								<li>|</li>
								<li><a href="#">삭제</a></li>
							</ul>
							<h3>새별오름</h3>
							<ul class="list-inline grid-boxes-news">
								<li><span>By</span> <a href="#">hb</a></li>
								<li>|</li>
								<li><i class="fa fa-clock-o"></i>2019-08-25</li>
								<li>|</li>
								<li><a href="#"><i class="fa fa-comments-o"></i> 30</a></li>
							</ul>
							<p>제주도의 가을 새별오름의 억새밭을 거닐며 바람과 함께 
							사삭사삭거리는 억새들의 소리를 들으니 자연과 함께
							마음이 평온해지고 정말 오랜만에 힐링을 느낄 수 있었습니다. 
							제주도의 가을은 점점 더 멋있어 지는 것 같습니다!</p>
						</div>
				</div>

				<div class="grid-boxes-in">
					<img class="img-responsive" src="Review/img/jeju2.png" alt="">
						<div class="grid-boxes-caption">
							<h3>혼인지</h3>
							<ul class="list-inline grid-boxes-news">
								<li><span>By</span> <a href="#">제주</a></li>
								<li>|</li>
								<li><i class="fa fa-clock-o"></i>2019-07-23</li>
								<li>|</li>
								<li><a href="#"><i class="fa fa-comments-o"></i> 16</a></li>
							</ul>
							<p>혼인지 수국</p>
							<a herf="#" color="green">#혼인지</a> <a herf="#" color="green">#수국</a>
							<a herf="#" color="green">#혼인지수국</a>
						</div>
				</div>

				<div class="grid-boxes-in">
					<img class="img-responsive" src="Review/img/jeju3.png" alt="">
						<div class="grid-boxes-caption">
							<h3>함덕백사장 & 서우봉</h3>
							<ul class="list-inline grid-boxes-news">
								<li><span>By</span> <a href="#">고은별</a></li>
								<li>|</li>
								<li><i class="fa fa-clock-o"></i>2019-05-07</li>
								<li>|</li>
								<li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
							</ul>
							<p>5월의 제주 바다는 완전 아름답고 눈부셨어요♥ 함덕 서우봉에서 내려다 본 함덕 바다의 물빛에
								반해버렸어요. 하얀 함덕 해변 백사장에서 바라본 바다도 이뻐서 눈을 뗄수가 없었어요. ^-^ 함덕 해변가를
								따라가다보니 해녀상도 보이더라구요. 깨끗하고 푸른 바다와 어우러진 함덕 해녀상도 멋졌어요. ^-^ 아름다웠던 5월의
								제주 바다는 절대 잊지못할거에요♥</p>
							<a herf="#" color="green">#5월엔제주</a> <a herf="#" color="green">#함덕해수욕장</a>
							<a herf="#" color="green">#서우봉</a> <a herf="#" color="green">#함덕해변</a>
						</div>
				</div>

				<div class="grid-boxes-in">
					<img class="img-responsive" src="Review/img/jeju3.png" alt="">
						<div class="grid-boxes-caption">
							<h3>함덕백사장 & 서우봉</h3>
							<ul class="list-inline grid-boxes-news">
								<li><span>By</span> <a href="#">고은별</a></li>
								<li>|</li>
								<li><i class="fa fa-clock-o"></i>2019-05-07</li>
								<li>|</li>
								<li><a href="#"><i class="fa fa-comments-o"></i> 06</a></li>
							</ul>
							<p>5월의 제주 바다는 완전 아름답고 눈부셨어요♥ 함덕 서우봉에서 내려다 본 함덕 바다의 물빛에
								반해버렸어요. 하얀 함덕 해변 백사장에서 바라본 바다도 이뻐서 눈을 뗄수가 없었어요. ^-^ 함덕 해변가를
								따라가다보니 해녀상도 보이더라구요. 깨끗하고 푸른 바다와 어우러진 함덕 해녀상도 멋졌어요. ^-^ 아름다웠던 5월의
								제주 바다는 절대 잊지못할거에요♥</p>
							<a herf="#" color="green">#5월엔제주</a> <a herf="#" color="green">#함덕해수욕장</a>
							<a herf="#" color="green">#서우봉</a> <a herf="#" color="green">#함덕해변</a>
						</div>
				</div>

				<div class="grid-boxes-in">
					<img class="img-responsive" src="Review/img/jeju1.png" alt="">
						<div class="grid-boxes-caption">
							<h3>새별오름</h3>
							<ul class="list-inline grid-boxes-news">
								<li><span>By</span> <a href="#">hb</a></li>
								<li>|</li>
								<li><i class="fa fa-clock-o"></i>2019-08-25</li>
								<li>|</li>
								<li><a href="#"><i class="fa fa-comments-o"></i> 30</a></li>
							</ul>
							<p>제주도의 가을 새별오름의 억새밭을 거닐며 바람과 함께 사삭사삭거리는 억새들의 소리를 들으니 자연과 함께
								마음이 평온해지고 정말 오랜만에 힐링을 느낄 수 있었습니다. 제주도의 가을은 점점 더 멋있어 지는 것 같습니다!</p>
						</div>
				</div>

				<div class="grid-boxes-in">
					<img class="img-responsive" src="Review/img/jeju2.png" alt="">
						<div class="grid-boxes-caption">
							<h3>혼인지</h3>
							<ul class="list-inline grid-boxes-news">
								<li><span>By</span> <a href="#">제주</a></li>
								<li>|</li>
								<li><i class="fa fa-clock-o"></i>2019-07-23</li>
								<li>|</li>
								<li><a href="#"><i class="fa fa-comments-o"></i> 16</a></li>
							</ul>
							<p>혼인지 수국</p>
							<a herf="#" color="green">#혼인지</a> <a herf="#" color="green">#수국</a>
							<a herf="#" color="green">#혼인지수국</a>
						</div>
				</div>

			</div>
			<!--/container-->
		</div>
		<!--=== End Content Part ===-->
<!-- 기본 페이지 끝 -->


<%@include file="../footer.jsp" %>
</div><!--/wrapper-->

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
<script type="text/javascript" src="assets/plugins/masonry/jquery.masonry.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/plugins/fancy-box.js"></script>
<script type="text/javascript" src="assets/js/plugins/owl-carousel.js"></script>
<script type="text/javascript" src="assets/js/plugins/revolution-slider.js"></script>
<script type="text/javascript" src="assets/js/pages/blog-masonry.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
        App.initParallaxBg();
        FancyBox.initFancybox();
        OwlCarousel.initOwlCarousel();
        RevolutionSlider.initRSfullWidth();
    });
</script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>