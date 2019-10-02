<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>그날, 우리의 제주</title>
<!-- Meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="widt\h=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" />

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin' />

<!-- CSS Global Compulsory -->
<link rel="stylesheet"href="assets/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="assets/css/headers/header-default.css" />
<link rel="stylesheet" href="assets/css/footers/footer-v1.css" />

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets/plugins/animate.css	" />
<link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css" />
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/plugins/fancybox/source/jquery.fancybox.css" />
<link rel="stylesheet"href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
<link rel="stylesheet"href="assets/plugins/revolution-slider/rs-plugin/css/settings.css"type="text/css" media="screen" />
<link rel="stylesheet"
	href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css" />
<link rel="stylesheet"
	href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css" />
<link rel="stylesheet" href="assets/css/pages/shortcode_timeline2.css" />
<!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom_schedule.css" />
<link rel="stylesheet" href="assets/css/theme-colors/orange.css" />
<style>
/* a:hover {
	text-decoration: none !important;
}
 */
hr {
	margin: 3px 0;
}

	
.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 40px 0;
    border-radius: 4px;
}


.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
}

.sky-form section {
    margin-bottom: 20px;
}

.label2{
	margin-bottom: 9.9px;
}
.input1 {
	padding:6px 4px 6px 10px;
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>


	<!-- 기본 페이지 이 아래로 합치면 됨 -->

	<!--=== Breadcrumbs v1 ===-->
	<form action="assets/php/demo-contacts-process.php" method="post" id="sky-form3" class="sky-form">
	<div class="breadcrumbs-v1">
		<div class="container">
			<span>schedule board</span>
			<h1>다른 일정보기 </h1>
		</div>
	</div>
	<!--=== End Breadcrumbs v1 ===-->
	
	<!--=== breadcrumbs ===-->
    <div class="breadcrumbs">
        <div class="container">
   	 		<ul class="pull-right breadcrumb">
        		<li><a href="planWrite.do">일정 등록하기</a></li>
   			</ul>
        </div><!--/container-->
    </div>
	<!--=== End breadcrumbs ===-->

		<!-- Clients Block-->
<div class="container">
	<div class="container content">
	<center>
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-md-offset-2 ">
				<!-- General Un	ify Forms -->
				<form action="#" class="sky-form">
					<header>일정 검색하기</header>
					
					<fieldset>
						<section>              
	                    <div class="input-group">
	                        <span class="input-group-addon">일정 제목</span>
	                        <input type="text" name="title" class="form-control" />
	                    </div>
						 </section>
						 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-1" href="#collapse-One">
                                   <span class="caret "></span> 자세히 검색
                                </a>
                               
					</fieldset>
					
					
					<div id="collapse-One" class="panel-collapse collapse">
					<fieldset>
						<section> 
							<label class="label">여행테마</label> 
                            <div class="row">
                                <div class="col col-ss-4 col-4">
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>나홀로<br>
                                    </label>
                                    <p>
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>가족<br>
                                    </label>                        
                                </div>
                                <div class="col col-ss-4 col-4">
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>커플<br>
                                    </label>
                                    <p>
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>단체<br>
                                    </label>
                                </div>
                                <div class="col col-ss-4 col-4">                              
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>친구<br>
                                    </label>
                                    <label class="radio"><input type="radio" name="radio"><i class="rounded-x"></i>비지니스<br>

                                    </label>
                                </div>
                            </div>      
							
						</section>

						<section> 
							<label class="label">관심태그</label> 
							<div class="row">
                                <div class="col col-ss-4 col-4">
                                    <label class="checkbox"><input type="checkbox" name="eat"><i></i>식도락</label>
                                    <label class="checkbox"><input type="checkbox" name="hobby"><i></i>취미</label>
                                    <label class="checkbox"><input type="checkbox" name="place"><i></i>명소</label>
                                </div>
                                <div class="col col-ss-4 col-4">
                                    <label class="checkbox"><input type="checkbox" name="activity"><i></i>액티비티</label>
                                    <label class="checkbox"><input type="checkbox" name="shopping"><i></i>쇼핑</label>
                                </div>
                                <div class="col col-ss-4 col-4">
                                    <label class="checkbox"><input type="checkbox" name="relex"><i></i>휴양</label>
                                    <label class="checkbox"><input type="checkbox" name="art"><i></i>공연, 예술</label>                                 
                                </div>
                                
                            </div>
						</section>


						<section> <label class="label">동행모집</label>
						
						<div class="inline-group">
							<label class="radio"><input type="radio"
								name="radio-inline" checked><i class="rounded-x"></i>남</label> 
								<label class="radio"><input type="radio" name="radio-inline">
								<i class="rounded-x"></i>여</label> <label class="radio">
								<input type="radio" name="radio-inline"><i class="rounded-x"></i>상관없음</label>

						</div>
						
						
						</section>
						<div class="row">
							
							<section class="col col-5">
								<label class="label">출발일</label>
	                            <label class="input">
		                            <i class="icon-append fa fa-calendar"></i>
		                            <input type="text" name="date" id="date" placeholder="Start date">
	                            </label>
                            </section>
	
							<section class="col col-ss-3 col-3"> 
								<label class="label2">여행기간</label>
								<br/>                       
                                <input class="input1" type="text"  size="1px"/>일
							</section>
                                                
                            <section class="col col-ss-3 col-4">
								<label class="label2">모집인원</label>
								<br/>                    
                                <input class="input1" type="text"  size="1px"/>명
                            </section>
						</div>
						
					</fieldset>
					</div>
					 <br/>
					  <br/>
					<button class="btn-u pull " type="submit">검색</button>
				</div>
				
				
				</div>
				</center>
				<br>
				<br>
				<br>
				<!-- 검색 -->
		
	<div class="col-md-offset-2 col-md-8 col-md-offset-2 ">
	  <table class="table">
	    <thead>
	      <tr>
			<th width="15%">번호</th>
			<th width="25%">여행 기간</th>
			<th width="30%">글제목</th>
			<th width="15%">작성자</th>
			<th width="15%">작성일</th>
	      </tr>
	    </thead>
	    <tbody>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	
	      <tr onclick="location.href='planDetail.do'" style="cursor:pointer;">
	    	<td>번호</td>
	    	<td><span class="start">2019-09-26</span> ~ <span class="end">2019-10-01</span></td>
	        <td>일정제목</td>
	        <td>test@naver.com</td>
	        <td>2019/9/21</td>
	     </tr>
	    </tbody>
	  </table>
		</div>
	</form>
		<!-- Pagination -->
		<div class="text-center md-margin-bottom-30">
			<ul class="pagination">
				<li><a href="#">«</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li class="active"><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">»</a></li>
			</ul>
		</div>
		</div>
		<!-- End Pagination -->

	<!--=== End Content Part ===-->

	<%@include file="../footer.jsp"%>
				<!--/wrapper-->

				<!-- JS Global Compulsory -->
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
</script>
				<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>