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

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css" />

<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom.css" />
<link rel="stylesheet" href="assets/css/theme-ors/orange.css" />

<style>
span {
	color: gray;
	font-size: 24px;
}

.breadcrumbs-v1-MyPage h1 {
	font-size: 50px;
	line-height: 35px;
	color: gray;
}

.col-sm-3 {
	text-align: center
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>

	<!-- 기본 페이지 이 아래로 합치면 됨 -->
	<!--=== Content Part ===-->

	<fildset>
	<div class="container content">
		<div class="row">

			<!-- Begin Content -->
			<div class="col-md-9">
				<div class="margin-bottom-30"></div>

				<!-- Tab v3 -->
				<div class="row tab-v3">
				<div class="col-md-3">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="#home-2" data-toggle="tab">일정</a></li>
						<li><a href="#messages-2" data-toggle="tab">임시일정</a></li>
						<li><a href="#settings-2" data-toggle="tab">동행찾기</a></li>
						<li class="active"><a href="Mypage/reviewlist.do">리뷰</a></li>
						<li><a href="infoUpdatePro.do">회원 정보 수정</a></li>
					</ul>
				</div>
					<div class="col-sm-9">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="home-2">
								<h4>작성한 공개일정</h4>
								<!-- 공개일정테이블 -->
								<table class="table">
									<thead>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<th width="25%">글번호</th>
											<th width="50%">글제목</th>
											<th width="25%">작성일</th>
										</tr>
									</thead>
									<tbody>

										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
									</tbody>
								</table>
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

								<!-- End Pagination -->
								<!-- 공개일정테이블 -->

							</div>
							<div class="tab-pane fade in" id="profile-2">
								<h4>작성한 비공개일정</h4>
								<!-- 비공개일정테이블 -->
								<table class="table">
									<thead>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<th width="25%">글번호</th>
											<th width="50%">글제목</th>
											<th width="25%">작성일</th>
										</tr>
									</thead>
									<tbody>

										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
									</tbody>
								</table>
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
								<!-- End Pagination -->
								<!-- 비공개일정테이블 -->


							</div>
							<div class="tab-pane fade in" id="messages-2">
								<h4>임시일정보기</h4>
								<!--임시일정테이블 -->
								<table class="table">
									<thead>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<th width="25%">글번호</th>
											<th width="50%">글제목</th>
											<th width="25%">작성일</th>
										</tr>
									</thead>
									<tbody>

										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
									</tbody>
								</table>
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

								<!-- End Pagination -->
								<!-- 임시일정테이블 -->
							</div>
							<div class="tab-pane fade in" id="settings-2">

								<h4>작성한 동행찾기</h4>
								<!-- 동행찾기테이블 -->
								<table class="table">
									<thead>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<th width="25%">글번호</th>
											<th width="50%">글제목</th>
											<th width="25%">작성일</th>
										</tr>
									</thead>
									<tbody>

										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
										<tr onclick="location.href='#'" style="cursor: pointer;">
											<td>번호</td>
											<td>공지사항</td>
											<td>2019/9/21</td>
										</tr>
									</tbody>
								</table>
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

								<!-- End Pagination -->
								<!-- 동행찾기테이블 -->
							</div>
						</div>
					</div>
				</div>
				<!-- Tab v3 -->
			</div>
			<!-- End Content -->
		</div>
	</div>
	<!--/container--> 
	</fildset>
	</form>
	<!--=== End Content Part ===-->


	<%@include file="../footer.jsp"%>


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
	</script>
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>