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
    <link rel="stylesheet" href="assets/css/custom_info.css" />
    
    
</head>

<body>    
<%@include file="../header.jsp" %>
	<fildset>
	<div class="container content">
		<div class="row">

			<!-- Begin Content -->
				<div class="margin-bottom-30"></div>

				<!-- Tab v3 -->
				<div class="row tab-v3">
				<div class="col-md-3">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="#home-2" data-toggle="tab">일정</a></li>
						<li><a href="#messages-2" data-toggle="tab">임시일정</a></li>
						<li><a href="#settings-2" data-toggle="tab">동행찾기</a></li>
						<li><a href="Mypage/reviewlist.do">리뷰</a></li>
						<li class="active"><a href="infoUpdatePro.do">회원 정보 수정</a></li>
					</ul>
				</div>
				<div class="blog_masonry_3col">
					<div class="container content grid-boxes col-md-9">
						<form action="infoUpdatePro.do" method="post" id="sky-form" class="sky-form">
							<header>회원 정보 수정</header>
				
								<fieldset>					
										<section id="name">
											<label class="label">이름</label>
											<label class="input">
												<i class="icon-append fa fa-user"></i>
												<input type="text" name="user_name" id="user_name" value="${user.getUser_name()}" readonly="readonly"/>
											</label>
										</section>
										
										<section id="email">
											<label class="label">이메일</label>
											<label class="input">
												<i class="icon-append fa fa-envelope"></i>
												<input type="text" name="user_email" id="user_email" value="${user.getUser_email()}" readonly="readonly"/>
											</label>
										</section>
										
										<section id="gender">
											<label class="label">성별</label>
											<label class="input">
												<i class="icon-append fa fa-user"></i>
												<c:if test="${user.getUser_gender() == 'F'}">
													<c:set value="여자" var="gender" />
												</c:if>
												<c:if test="${user.getUser_gender() == 'M'}">
													<c:set value="남자" var="gender" />
												</c:if>
												<input type="text" name="user_gender" id="user_gender" value="${gender}" readonly="readonly"/>
											</label>
										</section>
										
										<section id="birth">						
											<label class="label">생년월일</label>
				                            <label class="input">
				                            <i class="icon-append fa fa-calendar"></i>
				                            <input type="text" name="user_birth" id="date" value="${user.getUser_birth()}"/>
				                            </label>
				                            <div class="note error"></div>
										</section>
									
				
										<section id="nickname">
											<label class="label">별명</label>
											<label class="input">
												<i class="icon-append fa fa-user"></i>
												<input type="text" name="user_nickname" id="user_nickname" value="${user.getUser_nickname()}" readonly="readonly"/>
											</label>
										</section>
										
										<section id="phone">
											<label class="label">전화번호</label>
											<label class="input">
												<i class="icon-append fa fa-mobile"></i>
												<input type="text" name="user_phone" id="user_phone" value="${user.getUser_phone()}" />
											</label>
				                            <div class="note error"></div>
										</section>
									
										<section id="intro">
											<label class="label">자기소개</label>
											<label class="textarea">
												<textarea name="user_intro" id="user_intro">${user.getUser_intro()}</textarea>
											</label>
				                            <div class="note error"></div>
										</section>
								</fieldset>
								
								<footer class="text-center">
								<button type="button" class="btn-u" onclick="updateCheck()">정보 수정</button>
								<button type="button" class="btn-u btn-brd" onclick="location.href='mypage.do'">취소</button>
								</footer>
							</form>
				
						</div>
					</div>
				</div>
			</div>
			<!-- Tab v3 -->
			</div>
			<!-- End Content -->
	</div>
	<!--/container--> 
	</fildset>

<%@include file="../footer.jsp" %>
   
<!-- JS Global Compulsory -->           
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
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
    	
	});
    function updateCheck(){
		var error = $('.error').text('');
		if($("#date").val() == "") {
			$('#birth .error').text("생년월일을 입력하세요")
			$("#date").focus();
			if($('.ui-datepicker-calendar a').click(function(){
				$('#birth .error').text("")
			}))
			return false;
		}
		if($("#user_phone").val() == "") {
			$('#phone .error').text("전화번호를 입력하세요")
			$("#user_phone").focus();
			return false;
		}
		if($("#user_intro").val() == "") {
			$('#intro .error').text("자기소개를 입력하세요")
			$("#user_intro").focus();
			return false;
		}
		$('#sky-form').submit();
	}
    
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>