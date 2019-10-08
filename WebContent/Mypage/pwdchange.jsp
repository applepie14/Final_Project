<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>비밀번호 변경</title>
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
			<form action="passwordChange.do" method="post" id="sky-form" class="sky-form">
				<header class="text-center">비밀번호 변경</header>

				<fieldset>
						<section>
							<label class="label">현재 비밀번호</label>
							<label class="input">
								<i class="icon-append fa fa-lock"></i>
								<input type="password"	name="old_password" />
							</label>
                            <div class="note error"></div>
						</section>
						<section id="pw">
							<label class="label">새로운 비밀번호</label>
							<label class="input">
								<i class="icon-append fa fa-lock"></i>
								<input type="password"	name="new_password" id="new_password"/>
							</label>
                            <div class="note error"></div>
						</section>
						
						<section id="pw-confirm">
							<label class="label">새로운 비밀번호 확인</label>
							<label class="input">
								<i class="icon-append fa fa-lock"></i>
								<input type="password" name="pwdConfirm" id="pwdConfirm"  />
							</label>
                            <div class="note error"></div>
						</section>
					</fieldset>
				<footer class="text-center">
				<button type="button" class="btn-u" onclick="submit()">변경</button>
				</footer>
			</form>
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

    	
    	$("#new_password").keyup(function(){
    		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 표현식
    		if (!regex.test($("#new_password").val())) { // test 메소드 : 특정한 필드에 입력한 값에
    														// 대한 유효성을 검사
    			$('#pw .error').text("비밀번호는 문자, 숫자, 특수문자 포함 8자리 이상입니다.");
    			$("#new_password").focus();
    			return false;
    		} else {
    			$('#pw .error').text("");
    			return true;
    		}
    	})
    	
    	$("#pwdConfirm").keyup(function(){
        	if($("#new_password").val() != $("#pwdConfirm").val()){
        		$('#pw-confirm .error').text("비밀번호가 일치하지 않습니다.")
    			return false;
    		} else {
    			$('#pw-confirm .error').text("");
    			return true;
    		}
    	})
    });
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>