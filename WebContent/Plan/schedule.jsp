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
<link rel="shortcut icon" href="f	avicon.ico" />

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin' />

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css" />

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="assets/css/headers/header-default.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets/plugins/animate.css" />
<link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css" />
<link rel="stylesheet"
	href="assets/plugins/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="assets/plugins/fancybox/source/jquery.fancybox.css" />
<link rel="stylesheet"
	href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
<link rel="stylesheet"
	href="assets/plugins/revolution-slider/rs-plugin/css/settings.css"
	type="text/css" media="screen" />
<link rel="stylesheet" href="assets/css/pages/shortcode_timeline2.css"/>

	<!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->


	<script type="text/javascript"
		src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!-- CSS Customization -->
	<link rel="stylesheet" href="assets/css/custom_schedule.css" />
	<link rel="stylesheet" href="assets/css/theme-colors/orange.css" />
</head>

<body>
	<%@include file="../header.jsp"%>

	<!-- 기본 페이지 이 아래로 합치면 됨 -->
	<!--  상단 페이지 -->
	<div class="container">
		<div class="content">
			<!--Table Bordered-->
			<ul class="pull-right breadcrumb">
        		<li><a href="schedule_Modifiy.jsp">일정 수정하기</a></li>
        		<li><a href="schedule_Modifiy.jsp">일정 삭제하기</a></li>
        		<li><a href="schedule_Modifiy.jsp">쪽지 보내기</a></li>
   			</ul>
			<div class="headline">
				<h2>일정자세히보기</h2>
			</div>
		</div>
		<center>
			<div class="table">
				<table class="table">
					<tr class="name">
						<th align="center" >일정 제목</th>
						<td colspan="3" align="center" class="text-left"><font size=4pt>제주도 식도락 여행!</font>
						</td>
							
						<th>조회수</th>
						<td>45</td>
					</tr>
					<tr>

					</tr>
					<tr>
						<th>여행기간</th>
						<td>4일</td>
						<th>출발일</th>
						<td>19/10/11</td>
						<th>일정 등록일시</th>
						<td>19/09/10</td>
					</tr>

					<tr>
						<th>작성자</th>
						<td>test@naver.com</td>
						<th>태그</th>
						<td>

							<button class="btn btn-warning btn-xs">
								<i class="fa fa-pencil"></i> 식도락
							</button>
							<button class="btn btn-warning btn-xs">
								<i class="fa fa-pencil"></i> 명소
							</button>
						</td>
						<th>태마</th>
						<td><button class="btn btn-info btn-xs">가족</button></td>

					</tr>
					<tr>
						<th>모집 성별</th>
						<td><button class="btn btn-success btn-xs">여성</button></td>
						<th>모집인원
							</td>
							<td>5명</td>
							<th>좋아요</th>
							<td><button class="btn btn-info btn-xs">좋아요 1</button></td>
					</tr>
				</table>
			</div>
		</center>

		<!--End Table Bordered-->

	<center>
		<br> <br>
				<h3>일정</h3> <br> <!--=== 자세히보기===-->
					<div class="row tab-v3">
						<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
								<li>
									<a href="#map" data-toggle="tab">
										<i class="fa fa-calendar"></i> 
									map
									</a>
								</li>
								<li class="active">
									<a href="#home-2" data-toggle="tab">
										<i class="fa fa-calendar"></i>
									Day1
									</a>
								</li>
								<li><a href="#profile-2" data-toggle="tab"><i
										class="fa fa-calendar"></i> Day2</a></li>
								<li><a href="#messages-2" data-toggle="tab"><i
										class="fa fa-calendar"></i> Day3</a></li>
								<li><a href="#settings-2" data-toggle="tab"><i
										class="fa fa-calendar"></i> Day4</a></li>

							</ul>
						</div>
						
					
							
						
						
						<div class="col-sm-9">	
							<div class="tab-content">
								<!-- 지도 부분 -->
					
							<div class="tab-pane fade in " id="map" style="height:500px;">
							
							</div>				
							<!-- 지도 끝 -->	
							
								<div class="tab-pane fade in active" id="home-2">
									<h4>DAY1</h4>
									<!-- 타임라인 -->
									<div class="col-md-9">	
										<ul class="timeline-v2">
											<li><time class="cbp_tmtime" datetime="" /> <span>4/1/08</span>
												<span>January</span></time> <i
												class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Our first step</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive" src="assets/img/1.jpg" alt="" />
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
	
														</div>
													</div>
													
												</div>
												
												</li>
											<li><time class="cbp_tmtime" datetime=""> <span>7/2/09</span>
												<span>February</span></time> <i
												class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>First achievements</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
														<p>
														
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>28/6/12</span>
												<span>May</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Difficulties</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													
													</div>
												</div></li>
												
											<li><time class="cbp_tmtime" datetime=""> <span>11/3/10</span>
												<span>March</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Our Popularity</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
														
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>2/4/11</span>
												<span>April</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Back to the past</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
														
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>18/7/13</span>
												<span>June</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Unify in recent years</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
														
													</div>
												</div></li>
										</ul>
									</div>
									<!-- 타임라인 끝-->

									
								</div>
								<!--Day끝-->

								<div class="tab-pane fade" id="profile-2">
									<h4>DAY2</h4>
									<!-- 타임라인 -->
									<!-- 타임라인 -->
									<div class="col-md-9">
										<ul class="timeline-v2">
											<li><time class="cbp_tmtime" datetime=""> <span>4/1/08</span>
												<span>January</span></time> <i
												class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Our first step</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>7/2/09</span>
												<span>February</span></time> <i
												class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>First achievements</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>28/6/12</span>
												<span>May</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Difficulties</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
												
											<li><time class="cbp_tmtime" datetime=""> <span>11/3/10</span>
												<span>March</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Our Popularity</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>2/4/11</span>
												<span>April</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Back to the past</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>18/7/13</span>
												<span>June</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Unify in recent years</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
										</ul>	
									</div>
									<!-- 타임라인 끝-->

								</div>
								<!--Day끝-->
								
								
								<div class="tab-pane fade" id="messages-2">
									<h4>DAY3</h4>
									<!-- 타임라인 -->
									<div class="col-md-9">
										<ul class="timeline-v2">
											<li><time class="cbp_tmtime" datetime=""> <span>4/1/08</span>
												<span>January</span></time> <i
												class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Our first step</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>7/2/09</span>
												<span>February</span></time> <i
												class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>First achievements</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>28/6/12</span>
												<span>May</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Difficulties</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
												
											<li><time class="cbp_tmtime" datetime=""> <span>11/3/10</span>
												<span>March</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Our Popularity</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>2/4/11</span>
												<span>April</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Back to the past</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>18/7/13</span>
												<span>June</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Unify in recent years</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
										</ul>
									</div>
									<!-- 타임라인 끝-->
								</div>
								<!--Day끝-->


								<div class="tab-pane fade" id="settings-2">
									<h4>DAY4</h4>
									<!-- 타임라인 -->
									<div class="col-md-9">
										<ul class="timeline-v2">
											<li><time class="cbp_tmtime" datetime=""> <span>4/1/08</span>
												<span>January</span></time> <i
												class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Our first step</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>7/2/09</span>
												<span>February</span></time> <i
												class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>First achievements</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>28/6/12</span>
												<span>May</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Difficulties</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
												
											<li><time class="cbp_tmtime" datetime=""> <span>11/3/10</span>
												<span>March</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Our Popularity</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>2/4/11</span>
												<span>April</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Back to the past</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
											<li><time class="cbp_tmtime" datetime=""> <span>18/7/13</span>
												<span>June</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>
												<div class="cbp_tmlabel">
													<h2>Unify in recent years</h2>
													<div class="row">
														<div class="col-md-4">
															<img class="img-responsive"
																src="assets/img/main/img1.jpg" alt="">
																<div class="md-margin-bottom-20"></div>
														</div>
														<div class="col-md-8">
															<p>Winter purslane courgette pumpkin quandong
																komatsuna fennel green bean cucumber watercress. Pea
																sprouts wattle seed rutabaga okra yarrow cress avocado
																grape.</p>
															<p>Cabbage lentil cucumber chickpea sorrel gram
																garbanzo plantain lotus root bok choy squash cress
																potato.</p>
														</div>
													</div>
												</div></li>
										</ul>
									</div>
									<!-- 타임라인 끝-->
								</div>
								<!--Day끝-->
							</div>
							<!--/일정자세히보기끝-->
	</center>
		<div class="content text-center">
			<button class="btn-u" onclick="history.back();">목록으로</button>
		</div>
						
	</div>


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
	<script type="text/javascript" src="assets/js/plugins/revolution-slider.js"></script>
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b584c100fe1ae5b627bb263ca582ac0&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	      	App.init();
	        App.initParallaxBg();
	        FancyBox.initFancybox();
	        OwlCarousel.initOwlCarousel();
	        RevolutionSlider.initRSfullWidth();
	    });
	    
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.4705668076, 126.3416562839),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
        
        container.style.width = '500px';
        container.style.height = '500px';

        map.relayout();
	</script>
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>