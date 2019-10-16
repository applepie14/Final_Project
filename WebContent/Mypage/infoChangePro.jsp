<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>회원정보 수정</title>
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
		<div class="container reg">
			<form action="registerPro.do" method="post" id="sky-form" class="sky-form">
				<header>회원가입</header>

				<fieldset>
					
						<section id="name">
							<label class="label">이름</label>
							<label class="input">
								<i class="icon-append fa fa-user"></i>
								<input type="text" name="user_name" id="user_name" />
							</label>
                            <div class="note error"></div>
						</section>
						
						<section id="email">
							<label class="label">이메일</label>
                            <label for="user_email" class="input input-file">
								<i class="icon-append fa fa-envelope"></i>
								<input type="text" name="user_email" id="user_email" />
                                <div class="button" onclick="emailCheck()" id="emailbtn">중복확인</div>
								<input type = "hidden" name="idDuplication" value="idUncheck" />
                            </label>
                            <div class="note error"></div>
						</section>
						
						<section id="gender">
							<label class="label">성별</label>
							<label class="select">
								<select name="user_gender" id="user_gender">
									<option value="N" selected readonly>성별</option>
									<option value="F">여자</option>
									<option value="M">남자</option>
								</select>
								<i></i>
							</label>
                            <div class="note error"></div>
						</section>
						
						<section id="birth">						
							<label class="label">생년월일</label>
                            <label class="input">
                            <i class="icon-append fa fa-calendar"></i>
                            <input type="text" name="user_birth" id="date" />
                            </label>
                            <div class="note error"></div>
						</section>
					

						<section id="nickname">
							<label class="label">별명</label>
                            <label for="file" class="input input-file">
								<i class="icon-append fa fa-user"></i>
								<input type="text" name="user_nickname" id="user_nickname"/>
                                <div class="button" onclick="nickCheck();" id="nickbtn">중복확인</div>
								<input type = "hidden" name="nickDuplication" value="idUncheck" />
                            </label>
                            <div class="note error"></div>
						</section>
						
						<section id="phone">
							<label class="label">전화번호</label>
							<label class="input">
								<i class="icon-append fa fa-mobile"></i>
								<input type="text" name="user_phone" id="user_phone" />
							</label>
                            <div class="note error"></div>
						</section>
					
						<section id="intro">
							<label class="label">자기소개</label>
							<label class="textarea">
								<textarea name="user_intro" id="user_intro"></textarea>
							</label>
                            <div class="note error"></div>
						</section>
				</fieldset>
				
				<footer class="text-center">
				<button type="button" class="btn-u" onclick="registerCheck()">정보 수정</button>
				</footer>
			</form>

		</div>
	</div><!--/wrapper-->
<%@include file="../footer.jsp" %>
   
<!-- JS Global Compulsory -->           
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/plugins/masking.js"></script>
<script type="text/javascript" src="assets/js/plugins/datepicker.js"></script>
<script type="text/javascript" src="assets/js/plugins/validation.js"></script>
<script type="text/javascript" src="assets/js/forms/registerCheck.js"></script>
<script type="text/javascript" src="assets/js/forms/ducheck.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        Masking.initMasking();
        Datepicker.initDatepicker();
        Validation.initValidation();
        
    	$('#sky-form input, textarea').keyup(function(){
    		var error = $(this).parent().parent().children('.error')
    		error.text('');
    	})
    	
    	$('#user_email').keyup(function(){
        	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	    if (regExp.test($("#user_email").val())){ 
    	    	return true;
    	    } else {
    	    	$('#email .error').text("이메일 형식에 맞지 않습니다");
    			$("#user_email").focus();
    			return false;
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