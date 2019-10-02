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

<!-- 동행찾기 등록 -->
<link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css" />
<link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css" />

<!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom_find.css" />
<link rel="stylesheet" href="assets/css/theme-colors/orange.css" />

</head>
<body>
	<%@include file="../header.jsp"%>


	<!-- 기본 페이지 이 아래로 합치면 됨 -->

	<div class="wrapper">

		<div class="container">

			<!-- Begin Content -->
			<div class="col-md-9 findlist">

				<!--=== Breadcrumbs ===-->
				<div class="container findhead">
					<div class="headline findhead1">
						<h2>동행 찾기 등록</h2>
					</div>
				</div>
				<!--/container-->

				<!-- General Unify Forms -->
				<form action="#" class="sky-form">
				
					<!-- 동행구하기 글 제목 -->
					<fieldset>
						<section>
							<label class="label">제목</label>
							<label class="input"> <input type="text"></label> 
						</section>
					</fieldset>
				
					<!-- 여행기간 선택 -->
					<fieldset>
						<section> 
						<label class="label">여행기간</label>
						<div class="row">
							<section class="col col-6"> <label class="input">
								<i class="icon-append fa fa-calendar"></i> <input type="text" name="start" id="start" placeholder="여행 시작일">
							</section>
							<section class="col col-6"> <label class="input">
								<i class="icon-append fa fa-calendar"></i> <input type="text" name="finish" id="finish" placeholder="여행 종료일">
							</section>
						</div>
						</section>
					</fieldset>

					<!-- 여행테마 선택(중복선택X) -->
					<fieldset>
						<section> 
							<label class="label">여행테마</label> 
                            <div class="row">
                                <div class="col col-4">
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>나홀로<br>
                                    <img src="https://i.ibb.co/HPYb6g5/alone.jpg" height="80px"></img>
                                    </label>
                                    <p>
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>가족<br>
                                    <img src="https://i.ibb.co/LhmNsf2/family.jpg" height="80px"></img>
                                    </label>                        
                                </div>
                                <div class="col col-4">
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>커플<br>
                                    <img src="https://i.ibb.co/JtMSJcR/couple.jpg" height="80px"></img>
                                    </label>
                                    <p>
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>단체<br>
                                    <img src="https://i.ibb.co/5Yp2xtr/group.jpg" height="80px"></img>
                                    </label>
                                </div>
                                <div class="col col-4">                              
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>친구<br>
                                    <img src="https://i.ibb.co/zmjxWFn/friend.jpg" height="80px"></img>
                                    </label>
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>비지니스<br>
                                    <img src="https://i.ibb.co/gSF5w44/business.jpg" height="80px"></img>
                                    </label>
                                </div>
                            </div>      
							
						</section>
					</fieldset>

					<!-- 관심태그 선택(중복선택O) -->
					<fieldset>
						<section> 
							<label class="label">관심태그</label> 
							<div class="row">
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>식도락</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>취미</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>명소</label>
                                </div>
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>액티비티</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>쇼핑</label>
                                </div>
                                <div class="col col-4">
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>휴양</label>
                                    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>공연, 예술</label>                                 
                                </div>
                            </div>
						</section>
					</fieldset>
					
					<!-- 동행모집 선택(중복선택X) -->
					<fieldset>
						<section> 
							<label class="label">동행모집</label> 
							 <div class="inline-group">
                                <label class="radio"><input type="radio" name="radio-inline" checked><i class="rounded-x"></i>남</label>
                                <label class="radio"><input type="radio" name="radio-inline"><i class="rounded-x"></i>여</label>
                                <label class="radio"><input type="radio" name="radio-inline"><i class="rounded-x"></i>상관없음</label>
                            </div>
						</section>
					</fieldset>

					<!-- 내용 -->
					<fieldset>
						<section> 
							<label class="label">내용 입력</label> 
							<label class="textarea"><textarea rows="5"></textarea></label>
							<div class="note"></div>
						</section>
					</fieldset>

					<footer>
						<button type="submit" class="btn-u">등록</button>
						<button type="button" class="btn-u btn-u-default" onclick="location.href='Find_List.jsp'">취소</button>
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
	<script type="text/javascript">
    	jQuery(document).ready(function() {
        	App.init();
        	Masking.initMasking();
        	Datepicker.initDatepicker();
        	Validation.initValidation();
        });
	</script>
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>