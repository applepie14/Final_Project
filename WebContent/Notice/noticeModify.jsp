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
</head>

<style>

footer { 
margin-top:100px;
margin-bottom: 50px;}
</style>

<body>    
<%@include file="../header.jsp" %>

<!-- 기본 페이지 이 아래로 합치면 됨 -->
<!-- Contacts -->
      <form action="noticeModifyPro.do?notice_no=${article.notice_no}" 
      method="post" 
      id="sky-form3" class="sky-form" 
      enctype = "multipart/form-data" >
     <input type="hidden" name="existing_file" value="${article.notice_file }" />
          <fieldset>                  
            <div class="notice-container"> 
             <div class="headline"> <h2>공지사항 수정</h2> </div>
         
              <section>
                  <label class="label">공지 제목</label>
                  <label class="input">
                      <input type="text" name="subject" id="subject" value="${article.notice_title}"/>
                  </label>
              </section>
              
              <section>
                  <label class="label">내용</label>
                  <label class="textarea">
                    
                      <textarea rows="4" name="message" id="message">${article.notice_content}</textarea>
                  </label>
              </section>
              
             <section>
                  <label class="label">파일첨부</label>
                  <label for="file" class="input input-file">
                      <div class="button">
                      <input type="file" name="file" id="file" class="file"
	                    onchange="value2(); $('#filename').val(this.value.replace(/c:\\fakepath\\/i,''))" accept="image/*"">Browse</div>
						   <input type="text" id="filename" class="filename" value="${article.notice_file}" readonly/>
                  </label>
              </section>                  
              
          <footer>
              
           <button type="button" class="button" onclick="window.history.back();">취소</button>
        <button type="submit" class="button">수정하기</button>
          </footer>
  
           </div>
                  </fieldset>
          <div class="message">
              <i class="rounded-x fa fa-check"></i>
              <p>수정되었습니다</p>
          </div>
      </form>         
      <!-- Contacts -->


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

	function value2(){
		$("#filename").val($("#file").val())
	}
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>