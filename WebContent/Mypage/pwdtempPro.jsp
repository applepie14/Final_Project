<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>비밀번호 찾기</title>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    
    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="assets/css/headers/header-default.css" />

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css" />
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css" />
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/plugins/fancybox/source/jquery.fancybox.css" />
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
    <link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings.css" type="text/css" media="screen" />
    <!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css" />
    
    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom_register.css" />
    
</head>

<body>    
<%@include file="../header.jsp" %>
<div class="wrapper page-option-v1">

    <!--=== Content Part ===-->
    <div class="container content">
    
    <c:if test="${info[0] != ''}">
		<div class="col-md-12 col-sm-12">
			<div class="service-block service-block-orange">
				<i class="icon-custom icon-color-light rounded-x icon-line icon-fire"></i>
					<h2 class="heading-md">임시 비밀번호 발급완료</h2>
					<a style="color:#fff;" href="login.do">로그인</a>
			</div>
		</div>
	</c:if>
    <c:if test="${info[0] == ''}">
		<div class="col-md-12 col-sm-12">
			<div class="service-block service-block-light">
				<i class="icon-custom icon-color-light rounded-x icon-line icon-fire"></i>
					<h2 class="heading-md">정보가 없습니다. 입력하신 정보를 확인해주세요</h2>
					<button class="btn btn-u" type="button" onclick="history.back()">뒤로가기</button>
			</div>
		</div>
    </c:if>
    
    
    
    </div><!--/container-->		
    <!--=== End Content Part ===-->


</div><!--/wrapper-->
<%@include file="../footer.jsp" %>
   
<!-- JS Global Compulsory -->			
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<!-- 부트스트랩  -->
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
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