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
        		<li><a href="planModify.do?plan_no=${article.plan_no}">일정 수정하기</a></li>
        		<li><a href="planDeletePro.do?plan_no=${article.plan_no}">일정 삭제하기</a></li>
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
						<td colspan="3" align="center" class="text-left"><font size=4pt>${article.plan_title}</font>
						</td>
							
						<th>조회수</th>
						<td>${article.plan_count}</td>
					</tr>
					<tr>

					</tr>
					<tr>
						<th>여행기간</th>
						<td>${article.plan_period}일</td>
						<th>출발일</th>
						<td>${article.plan_startdate}</td>
						<th>일정 등록일시</th>
						<td>${article.plan_date}</td>
					</tr>

					<tr>
						<th>작성자</th>
						<td>${article.user_nickname}</td>
						<th>태그</th>
						<td>
				
						<c:forEach var="i" begin="0" end="${tags.size()-1}" step="1">
						 <button class="btn btn-warning btn-xs">
						 
								<i class="fa fa-pencil"></i> ${tags.get(i)}
							</button> 
						</c:forEach>
							<!-- <button class="btn btn-warning btn-xs">
								<i class="fa fa-pencil"></i> 식도락
							</button>
							<button class="btn btn-warning btn-xs">
								<i class="fa fa-pencil"></i> 명소
							</button> -->
						</td>
						<th>태마</th>
						<td><button class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> ${article.plan_theme} </button></td>

					</tr>
					<tr>
						<th>모집 성별</th>
						<td><button class="btn btn-success btn-xs"><i class="fa fa-pencil"></i>
						<c:if test="${article.plan_gender eq 'M'}">남성</c:if>
						<c:if test="${article.plan_gender eq 'F'}">여성</c:if>
						<c:if test="${article.plan_gender eq 'N'}">상관없음</c:if>
						</button></td>
						<th>모집인원
							</td>
							<td>${article.plan_nop} 명</td>
							<th>좋아요</th>
							<td><a>&#10084;${article.plan_like_count}<a/></td>
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
								<li class="active">
									<a href="#map-1" data-toggle="tab">
										<i class="fa fa-calendar"></i> 
									map
									</a>
								</li>
								<li>
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

									<div class="tab-pane fade in active" id="map-1">
									<div id="map" style="width: 100%; height: 400px;"></div>
									<script type="text/javascript"
										src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b584c100fe1ae5b627bb263ca582ac0"></script>
									<script>
										var mapContainer = document
												.getElementById('map'), // 지도를 표시할 div 
										mapOption = {
											center : new kakao.maps.LatLng(
													33.450701, 126.570667), // 지도의 중심좌표
											level : 3
										// 지도의 확대 레벨
										};

										var map = new kakao.maps.Map(
												mapContainer, mapOption); // 지도를 생성합니다

										// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
										var points = [
												new kakao.maps.LatLng(
														33.452278, 126.567803),
												new kakao.maps.LatLng(
														33.452671, 126.574792),
												new kakao.maps.LatLng(
														33.451744, 126.572441) ];

										// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
										var bounds = new kakao.maps.LatLngBounds();

										var i, marker;
										for (i = 0; i < points.length; i++) {
											// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
											marker = new kakao.maps.Marker({
												position : points[i]
											});
											marker.setMap(map);

											// LatLngBounds 객체에 좌표를 추가합니다
											bounds.extend(points[i]);
										}

										function setBounds() {
											// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
											// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
											map.setBounds(bounds);
										}
									</script>
									</div>
									<!-- 지도 끝 -->

									<div class="tab-pane fade" id="home-2">
									<h4>DAY1</h4>
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