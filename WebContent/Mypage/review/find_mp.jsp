<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet"
	href="../assets/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="../assets/css/style.css" />

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="../assets/css/headers/header-default.css" />
<link rel="stylesheet" href="../assets/css/footers/footer-v1.css" />

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets/plugins/animate.css" />
<link rel="stylesheet"
	href="../assets/plugins/line-icons/line-icons.css" />
<link rel="stylesheet"
	href="../assets/plugins/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="../assets/plugins/fancybox/source/jquery.fancybox.css" />
<link rel="stylesheet"
	href="../assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
<link rel="stylesheet"
	href="../assets/plugins/revolution-slider/rs-plugin/css/settings.css"
	type="text/css" media="screen" />
<!--[if lt IE 9]><link rel="stylesheet" href="../assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

<!-- CSS Page Style -->
<link href="../assets/css/pages/blog_masonry_3col.css" rel="stylesheet" />

<!-- CSS Customization -->
<link rel="stylesheet" href="../assets/css/custom_find.css" />
<link rel="stylesheet" href="../assets/css/custom_review.css" />

<style>
.mt-5 {
	margin-top: 50px;
}
.row.tab-v3 {
    min-height: 500px;
}

</style>
</head>

<body class="index-page" data-page="index">
	<%@include file="../header.jsp"%>

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
						<li class="active"><a href="/findlist.do" data-toggle="tab">동행찾기</a></li>
						<li><a href="/reviewlist.do" data-toggle="tab">리뷰</a></li>
						<li><a href="../infoUpdatePro.do">회원 정보 수정</a></li>
					</ul>
				</div>
				<!-- <div class="col-md-9"> -->
				<!--=== Content Part ===-->
				<div class="blog_masonry_3col">
					<div class="container content col-md-9">
						<div class="row">
							<div class="col-md-4">
								<div class="find-content">
									<div class="modal-header">
										<h4 class="modal-title"></h4>
									</div>
									
									<div class="modal-body">
										<div class="modal-info">
											<ul class="list-inline grid-boxes-news">
						                        <li><span>By메롱</span></li>
						                        <li>|</li>
						                        <li><i class="fa fa-clock-o"></i>&nbsp;</li>
						                        <li>|</li>
						                        <li><i class="fa fa-comments-o"></i> </li>
						                    </ul>
						                    
						                
						        		</div> 
										
										<div class="form-group">
											<table class="modal-content-table">
												<tbody><tr>
													<td class="date">여행기간</td>
													<td width="70%">
														<span class="start"></span>
														<span class="end"></span>
													</td>
												</tr>
												
												<tr>
													<td colspan="2" height="250px" style="vertical-align:top">
													<p style="white-space:pre-line"></p>
													</td>
												</tr>
												
												<tr>
													<td colspan="2">
														<button class="btn-u btn-u-dark-blue btn-xs">
														</button>
														<button class="btn-u btn-u-yellow  btn-xs">
														</button>
													</td>
												</tr>
												<tr>
													<td colspan="2" class="padding-top-0">
														
													</td>
												</tr>
											</tbody></table>
										</div>
						
									</div>

								</div>
								<div></div>
								
							</div>
						</div>


					</div>
				</div>
			</div>
			<!-- </div> -->
			<div class="mt-5"></div>
			
			<form name="test" class="search" action="findList.do">
				<select class="searchlist" name="search">
					<option value="all">전체</option>
					<option value="Company_Title">제목</option>
					<option value="title_content">제목+본문</option>
					<option value="User_Nickname">작성자</option>
				</select>
				&nbsp;
				<input type="text" class="searchtext" size="15" name="searchtext" placeholder="&nbsp;검색어를 입력하세요" />&nbsp;
				<input class="searchbutton btn-u" type="submit" value="검색" />
			</form><p></p>
			<!--/container-->

				<!-- 페이징 처리 -->
				<div class="pagination1">
					<ul class="pagination">
						<li><c:if test="${pgList.startPage > pgList.blockSize }">
								<a	href="findlist.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}"
									class="before_next"><font>◀</font></a>
							</c:if></li>


						<c:forEach var="i" begin="${pgList.startPage}"
							end="${pgList.endPage}">
							<c:if test="${pgList.currentPage==i }">
								<li class="active">
								<a	href="findlist.do?pageNum=${i }&search=${search}&searchtext=${searchtext}"
									class="paging_now active"> <font>${i }</font>
								</a></li>
							</c:if>
							<c:if test="${pgList.currentPage !=i }">
								<li class="">
								<a href="findlist.do?pageNum=${i }&search=${search}&searchtext=${searchtext}"
									class="paging_now active"> <font>${i }</font>
								</a></li>
							</c:if>
						</c:forEach>


						<li><c:if test="${pgList.endPage < pgList.pageCount}">
								<a	href="findlist.do?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}"
									class="before_next"><font>▶</font></a>
							</c:if></li>
					</ul>
				</div>

				<!-- End Pagination -->
				<!--=== End Content Part ===-->
				<!-- 기본 페이지 끝 -->
				<!-- Tab v3 -->
				<!-- End Content -->
		</div>
	</div>
	<!--/container--> </fildset>
	<!-- 기본 페이지 이 아래로 합치면 됨 -->
	<div class="wrapper">



		<%@include file="../../footer.jsp"%>
	</div>
	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/jquery.parallax.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/masonry/jquery.masonry.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="../assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="../assets/js/app.js"></script>
	<script type="text/javascript" src="../assets/js/plugins/fancy-box.js"></script>
	<script type="text/javascript"
		src="../assets/js/plugins/owl-carousel.js"></script>
	<script type="text/javascript"
		src="../assets/js/plugins/revolution-slider.js"></script>
	<script type="text/javascript" src="../assets/js/pages/blog-masonry.js"></script>
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
    <script src="../assets/plugins/respond.js"></script>
    <script src="../assets/plugins/html5shiv.js"></script>
    <script src="../assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>