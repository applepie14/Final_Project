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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="assets/css/headers/header-default.css" />
    <link rel="stylesheet" href="assets/css/style.css" />

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css" />
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css" />
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/plugins/fancybox/source/jquery.fancybox.css" />
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
    <link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings.css" type="text/css" media="screen" />
    <!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->
    
    
	<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom.css" />
    <link rel="stylesheet" href="assets/css/theme-colors/orange.css" />
    
    
</head>

<body>    
<%@include file="header.jsp" %>
<c:if test="${activate == 'N' }">
	<script>
		location.href="activate.do";
	</script>
</c:if>
<div class="wrapper page-option-v1">

    <!--=== Slider ===-->
    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul>
                <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 1">
                    <!-- MAIN IMAGE -->
                    <img src="assets/img/sliders/제주1.jpg"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat" />

                    <div class="tp-caption revolution-ch1 sft start"
                        data-x="center"
                        data-hoffset="0"
                        data-y="100"
                        data-speed="1500"
                        data-start="500"
                        data-easing="Back.easeInOut"
                        data-endeasing="Power1.easeIn"                        
                        data-endspeed="300">
                        한 눈에 볼 수 있는 여행 일정
                    </div>

                    <!-- LAYER -->
                    <div class="tp-caption revolution-ch2 sft"
                        data-x="center"
                        data-hoffset="0"
                        data-y="190"
                        data-speed="1400"
                        data-start="2000"
                        data-easing="Power4.easeOut"
                        data-endspeed="300"
                        data-endeasing="Power1.easeIn"
                        data-captionhidden="off"
                        style="z-index: 6">
                        간편하게 일정을 만들고, 공유하고<br/>
                        좋아요를 많이 받을 수록 좋은 일이 생겨요
                    </div>

                    <!-- LAYER -->
                    <div class="tp-caption sft"
                        data-x="center"
                        data-hoffset="0"
                        data-y="310"
                        data-speed="1600"
                        data-start="2800"
                        data-easing="Power4.easeOut"
                        data-endspeed="300"
                        data-endeasing="Power1.easeIn"
                        data-captionhidden="off"
                        style="z-index: 6">
                        <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">일정 보기</a>
                        <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">일정 세우기</a>
                    </div>
                </li>
                <!-- END SLIDE -->

                <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 2">
                    <!-- MAIN IMAGE -->
                    <img src="assets/img/sliders/제주2.jpg"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat" />

                    <div class="tp-caption revolution-ch1 sft start"
                        data-x="center"
                        data-hoffset="0"
                        data-y="100"
                        data-speed="1500"
                        data-start="500"
                        data-easing="Back.easeInOut"
                        data-endeasing="Power1.easeIn"                        
                        data-endspeed="300">
                        수 많은 리뷰들을 한번에
                    </div>

                    <!-- LAYER -->
                    <div class="tp-caption revolution-ch2 sft"
                        data-x="center"
                        data-hoffset="0"
                        data-y="190"
                        data-speed="1400"
                        data-start="2000"
                        data-easing="Power4.easeOut"
                        data-endspeed="300"
                        data-endeasing="Power1.easeIn"
                        data-captionhidden="off"
                        style="z-index: 6">
                        내가 갔던 곳에 대해 이야기하고<br/>
                        궁금했던 곳을 찾아봐요
                    </div>

                    <!-- LAYER -->
                    <div class="tp-caption sft"
                        data-x="center"
                        data-hoffset="0"
                        data-y="310"
                        data-speed="1600"
                        data-start="2800"
                        data-easing="Power4.easeOut"
                        data-endspeed="300"
                        data-endeasing="Power1.easeIn"
                        data-captionhidden="off"
                        style="z-index: 6">
                        <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">리뷰 보기</a>
                        <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">리뷰 작성</a>
                    </div>
                </li>
                <!-- END SLIDE -->

                <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000" data-title="Slide 3">
                    <!-- MAIN IMAGE -->
                    <img src="assets/img/sliders/제주3.jpg"  alt="darkblurbg"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat" />

                    <div class="tp-caption revolution-ch1 sft start"
                        data-x="center"
                        data-hoffset="0"
                        data-y="100"
                        data-speed="1500"
                        data-start="500"
                        data-easing="Back.easeInOut"
                        data-endeasing="Power1.easeIn"                        
                        data-endspeed="300">
                        혼자가기 싫은 사람들 여기 모여라, 동행찾기
                    </div>

                    <!-- LAYER -->
                    <div class="tp-caption revolution-ch2 sft"
                        data-x="center"
                        data-hoffset="0"
                        data-y="190"
                        data-speed="1400"
                        data-start="2000"
                        data-easing="Power4.easeOut"
                        data-endspeed="300"
                        data-endeasing="Power1.easeIn"
                        data-captionhidden="off"
                        style="z-index: 6">
                        2인분 이상 주문해야하는 맛집<br/>
                        여럿이서 가면 저렴해지는 게스트하우스<br/>
                    </div>

                    <!-- LAYER -->
                    <div class="tp-caption sft"
                        data-x="center"
                        data-hoffset="0"
                        data-y="310"
                        data-speed="1600"
                        data-start="2800"
                        data-easing="Power4.easeOut"
                        data-endspeed="300"
                        data-endeasing="Power1.easeIn"
                        data-captionhidden="off"
                        style="z-index: 6">
                        <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">같이가기</a>
                        <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">동행 찾기</a>
                    </div>
                </li>
                <!-- END SLIDE -->
            </ul>
            <div class="tp-bannertimer tp-bottom"></div>            
        </div>
    </div>
    <!--=== End Slider ===-->
    <!--=== Recent Posts ===-->
    <div class="container content-sm">
        <div class="headline-center-v2 headline-center-v2-dark margin-bottom-60">
            <h2>관리자 추천 여행코스</h2>
            <span class="bordered-icon"><i class="fa fa-th-large"></i></span>
            <p>한국관광공사에서 엄선한 추천코스를 여러분께 몰래 공개합니다.<br />
            여행은 가고싶은데 계획은 세우기 싫고, 시간도 없고! <br />
            바쁜 현대인들을 위한 추천코스를 테마별로 제공해드립니다.</p>
        </div><!--/Headline Center V2-->

        <div class="row">
            <div class="col-sm-4 insert-1">
                <div class="thumbnails-v1">
                    <div class="thumbnail-img">
                    
                        <img class="img-responsive"/>                            
                    </div>
                    <div class="caption">
                        <h3 class="title"><a href="#"></a></h3>
                        <p class="pboby"></p>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 insert-2">
                <div class="thumbnails-v1">
                    <div class="thumbnail-img">
                    
                        <img class="img-responsive"/>                            
                    </div>
                    <div class="caption">
                        <h3 class="title"><a href="#"></a></h3>
                        <p class="pboby"></p>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 insert-3">
                <div class="thumbnails-v1">
                    <div class="thumbnail-img">
                    
                        <img class="img-responsive"/>                            
                    </div>
                    <div class="caption">
                        <h3 class="title"><a href="#"></a></h3>
                        <p class="pboby"></p>
                    </div>
            </div>
        </div>
    </div><!--/container-->
    </div>
    <!--=== End Recent Posts ===-->

</div><!--/wrapper-->
<%@include file="footer.jsp" %>
   
<!-- JS Global Compulsory -->			
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
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
        
		// 1. url 요청문서 2. 매개변수를 전달(생략이 가능) {매개변수명:값~} 콜백함수
		$.ajax('RecommCourse.xml',{
			// data:~ - 매개변수가 없으니까 생략
			success:function(data){
				// 분리 작업(=파싱분리) parse → find() or filter()
				$(data).find('item').each(function(index){
					var divcls = ".insert-" + (index+1)
					$(divcls+" img").attr('src', $(this).find('firstimage').text())
					$(divcls+" img").attr('alt', $(this).find('title').text())
					$(divcls+" .title a").text($(this).find('title').text())
					$(divcls+" .pboby").text($(this).find('overview').text())
					// div에 결합해서 화면에 출력
				})
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