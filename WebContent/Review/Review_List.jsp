<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="assets/css/pages/blog_masonry_3col.css" rel="stylesheet" />
    
    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom_find.css" />
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
		<c:if test="${name != null && name != '관리자'}">
			<!--/breadcrumbs-->
			<div class="breadcrumbs">
				<div class="container">
					<ul class="pull-right breadcrumb">
						<li><a href="reviewWrite.do">리뷰 작성</a></li>
					</ul>
				</div>
				<!--/container-->
			</div>
		</c:if>

		<!--=== End Breadcrumbs ===-->

    <!--=== Content Part ===-->
    <!-- <img class="img-responsive" src="assets/review_img/${review.review_img}" alt=""> -->
    <!-- <img class="img-responsive" src="http://106.10.39.121:8080/Review_Img/${review.review_img}" alt=""> -->
		<div class="blog_masonry_3col">
			<div class="container content grid-boxes">
				<c:forEach var="review" items="${reviewList }">
				<div class="grid-boxes-in">
					<img class="img-responsive" src="assets/review_img/${review.review_img}" alt="">
						<div class="grid-boxes-caption">
							<ul class="pull-right list-inline grid-boxes-news modify">
								<c:if test ="${review.user_nickname == name }">
									<li><a href="reviewUpdate.do?review_no=${review.review_no }">수정</a></li>
									<li>|</li>
									<!-- <li><a href="javascript:void(0);" onclick="deleteCheck();">삭제</a></li> -->
									<li><a onclick="return confirm('정말로 삭제하시겠습니까?')" 
										   href="reviewDeletePro.do?review_no=${review.review_no}">삭제</a></li>

								</c:if>
							</ul>
							<h3>${review.review_title }</h3>
							<ul class="list-inline grid-boxes-news">
								<li>
									<span><img src="https://i.ibb.co/sPp54hn/1.png" width="12px"></img></span> 
									${review.review_place }</a>
								</li>
							</ul>
							<ul class="list-inline grid-boxes-news">
								<li><span>By</span> <a href="#">${review.user_nickname }</a></li>
								<li>|</li>
								<li><i class="fa fa-clock-o"></i>
									<fmt:formatDate value="${review.review_date }" 
													 timeStyle="medium"
													 pattern="yyyy-MM-dd" />
								</li>
								<li>|</li>
								<li><a href="#"><i class="fa fa-comments-o"></i>${review.review_like_count }</a></li>
							</ul>
							<p style="white-space:pre-line"><c:out value="${review.review_content}"/></p>
						</div>
				</div>
				</c:forEach>
			</div>
			</div>
			
			<form name="test" class="search" action="review.do">
					<select class="searchlist" name="search">
						<option value="Review_Title">제목</option>
						<option value="place">장소</option>
						<option value="User_Nickname">작성자</option>
					</select>
					&nbsp;
					<input type="text" class="searchtext" size="15" name="searchtext" placeholder="&nbsp;검색어를 입력하세요" />&nbsp;
					<input class="searchbutton btn-u" type="submit" value="검색"/>
			</form><p>
			<!--/container-->
			
			<!-- 페이징 처리 -->
                <div class="pagination1">
                <ul class="pagination">
                	<li>
                		<c:if test="${pgList.startPage > pgList.blockSize }">
							<a href = "review.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}" class="before_next"><font>◀</font></a>
						</c:if>
					</li>
		
					
				 <c:forEach var="i" begin="${pgList.startPage}"  end="${pgList.endPage}">
                     <c:if test="${pgList.currentPage==i }">
                        <li class="active">
                           <a href="review.do?pageNum=${i }&search=${search}&searchtext=${searchtext}" class="paging_now active">
                              <font>${i }</font>
                           </a>
                        </li>                     
                     </c:if>
                     <c:if test="${pgList.currentPage !=i }">
                        <li class="">
                           <a href="review.do?pageNum=${i }&search=${search}&searchtext=${searchtext}" class="paging_now active">
                              <font>${i }</font>
                           </a>
                        </li>                     
                     </c:if>
                  </c:forEach>
					
					
					<li>
						<c:if test="${pgList.endPage < pgList.pageCount}">
							<a href = "review.do?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}" class="before_next"><font>▶</font></a>
						</c:if>
					</li>
				</ul>
				</div>
				
				<!-- End Pagination -->
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