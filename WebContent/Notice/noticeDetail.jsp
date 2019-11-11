<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel='stylesheet' type='text/css' 
    href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin' />

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
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css" />
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css" />
    <!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

    <!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom_notice.css" />
    <link rel="stylesheet" href="assets/css/theme-colors/orange.css" />

<style>


.list-inline {
    margin-left: 80%;
    list-style: none;
}

ol, ul {
    margin-top: 0;
    margin-bottom: 0px;
}

.sky-form .row {
    margin: 0 -15px;
    margin-top: -30px;
}
 h2{
    color: #555;
    margin-top: 5px;
    margin-left: 5px;
    text-shadow: none;
    font-weight: normal;
    font-family: "Open Sans", Arial, sans-serif;
}
.sky-form fieldset {
    display: block;
    padding: 10px 50px 5px;
    border: none;
    background: rgba(255,255,255,.9);
    padding-bottom: 100px;
}
.breadcrumbs-v1-list.breadcrumbs-v1-list2  h1 {
    font-size: 50px;
    line-height: 35px;
    color:gray;
}
span {color:gray;
      font-size:24px;}

.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
    height: auto;
    padding-top: 70px;
    padding-bottom: 50px;
    width: 600px;
}

.detail-p {
    margin-top: 50px;
    margin-bottom: 0px;
}
</style>
</head>
<body>    
<%@include file="../header.jsp" %>

<!-- 기본 페이지 이 아래로 합치면 됨 -->

<!--=== Breadcrumbs v1 ===-->
 <form method="post" id="sky-form3" class="sky-form">
<div class="breadcrumbs-v1-list breadcrumbs-v1-list2">
	<div class="container">
		<span>Notic Detail</span>
		<h1>공지사항</h1>
	</div>
</div>
<!--=== End Breadcrumbs v1 ===-->

  <fieldset>
<div class="notice-container">
 <div class="row">
	<div class="col-md-12 mb-3">
		<div class="headline"><h2>공지사항</h2>
		<!--Table Bordered-->
	<ul class="pull-right breadcrumb">
	       <c:if test="${name != null && name =='관리자'}" >
      <li><a href="noticeModify.do?notice_no=${article.notice_no}">수정</a></li>		
      <li><a a onclick="return confirm('정말로 삭제하시겠습니까?')" 
          href="noticeDeletePro.do?notice_no=${article.notice_no}&pageNum=${pgList.startPage-pgList.blockSize}">삭제</a></li>
          </c:if>
      

 	</ul>
	   </div>
	</div>
</div>

  
 <h2>${article.notice_title}</h2>
   <div class="blog-post-tags">
        <ul class="list-unstyled list-inline blog-info" >
           <li><i class="fa fa-calendar"></i>${article.notice_date }</li>   
           <li><i class="fa fa-comments-o"></i>조회수</li>
         <%--   <li>${article.notice_count}</li> --%>
       </ul>
         <p class="detail-p">${article.notice_content}</p>      
       <p style="text-align:center">           
        <img class="img-responsive" src="assets/notice_upload/${article.notice_file}" alt=""/>   
       </p>
   </div>

   
   
  <button type="button" class="btn-u pull-right" onclick="location='noticeList.do'">목록</button>

</div> 
</fieldset>

</form>


	<%@include file="../footer.jsp"%>

	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="assets/plugins/jquery.parallax.js"></script>
	<script type="text/javascript"
		src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<script type="text/javascript"
		src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript"
		src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="assets/js/app.js"></script>
	<script type="text/javascript" src="assets/js/plugins/fancy-box.js"></script>
	<script type="text/javascript" src="assets/js/plugins/owl-carousel.js"></script>
	<script type="text/javascript"
		src="assets/js/plugins/revolution-slider.js"></script>
	<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
        App.initParallaxBg();
        FancyBox.initFancybox();
        OwlCarousel.initOwlCarousel();
        RevolutionSlider.initRSfullWidth();
    });
 /*    
    function modi(){
    	location.href='noticeModify.do?notice_no=${article.notice_no}'
    } */
</script>
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>