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
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="assets/css/headers/header-default.css" />
<link rel="stylesheet" href="assets/css/footers/footer-v1.css" />

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
<!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css" />
<link rel="stylesheet"
	href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css" />
<link rel="stylesheet" href="assets/css/pages/shortcode_timeline2.css" />
<!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom_schedule.css" />
<style>
	.input1 {
    padding: 6px 4px;	
	}
</style>

<!-- <script text="text/javascript">
$(function() {
$("input:radio[name ='theme']:input[value='나홀로']").attr("checked", true);
});
</script> -->
</head>


<body onload='javascript:test();'>
	<%@include file="../header.jsp"%>


	<!-- 기본 페이지 이 아래로 합치면 됨 -->
	<form action="planModifyPro.do?plan_no=${article.plan_no}" class="sky-form"  method="post" id="sky-form" >
	<!--=== Content Part ===-->
	<div class="container content">
		<div class="row">
			<!-- Begin Content -->
			<div class="col-md-12">
				<!-- General Unify Forms -->
				
					<header>일정 수정하기</header>

					<fieldset>
						<section> <label class="label">일정 제목</label> <label
							class="input"> 
							
							<input class="plansubject" name="plan_title" type="text" size="50px" id="plan_title" value="${article.plan_title}">
						</label> </section>
					</fieldset>

					<fieldset>
						<section> 
	
							<label class="label">여행테마</label> 
                            <div class="row">
                                <div class="col col-ss-4 col-4">
                                    <label class="radio"><input type="radio" name="theme" value="나홀로" <c:if test="${article.plan_theme eq '나홀로'}">checked="checked"</c:if>><i class="rounded-x"></i>나홀로<br>
                                    <img src="https://i.ibb.co/HPYb6g5/alone.jpg" height="80px"></img>
                                    </label>
                                    <p>
                                    <label class="radio"><input type="radio" name="theme" value="가족" ><i class="rounded-x" ></i>가족<br>
                                    <img src="https://i.ibb.co/LhmNsf2/family.jpg" height="80px"></img>
                                    </label>                        
                                </div>
                                <div class="col col-ss-4 col-4">
                                    <label class="radio"><input type="radio" name="theme" value="커플" ><i class="rounded-x" ></i>커플<br>
                                    <img src="https://i.ibb.co/JtMSJcR/couple.jpg" height="80px"></img>
                                    </label>
                                    <p>
                                    <label class="radio"><input type="radio" name="theme" value="단체" ><i class="rounded-x" ></i>단체<br>
                                    <img src="https://i.ibb.co/5Yp2xtr/group.jpg" height="80px"></img>
                                    </label>
                                </div>
                                <div class="col col-ss-4 col-4">                              
                                    <label class="radio"><input type="radio" name="theme" value="친구" ><i class="rounded-x" ></i>친구<br>
                                    <img src="https://i.ibb.co/zmjxWFn/friend.jpg" height="80px"></img>
                                    </label>
                                    <label class="radio"><input type="radio" name="theme" value="비즈니스"><i class="rounded-x"  ></i>비지니스<br>
                                    <img src="https://i.ibb.co/gSF5w44/business.jpg" height="80px"></img>
                                    </label>
                                </div>
                            </div>      
							
						</section>

						<section> 
							<label class="label">관심태그</label> 
							<div class="row">
                                <div class="col col-ss-4 col-4">
                                    <label class="checkbox"><input type="checkbox" name="tags" value=3><i></i>식도락</label>
                                    <label class="checkbox"><input type="checkbox" name="tags" value=6><i></i>취미</label>
                                    <label class="checkbox"><input type="checkbox" name="tags" value=9><i></i>명소</label>
                                </div>
                                <div class="col col-ss-4 col-4">
                                    <label class="checkbox"><input type="checkbox" name="tags" value=4><i></i>액티비티</label>
                                    <label class="checkbox"><input type="checkbox" name="tags" value=7><i></i>쇼핑</label>
                                </div>
                                <div class="col col-ss-4 col-4">
                                    <label class="checkbox"><input type="checkbox" name="tags" value=5><i></i>휴양</label>
                                    <label class="checkbox"><input type="checkbox" name="tags" value=8><i></i>공연, 예술</label>                                 
                                </div>
                            </div>
						</section>


						<section> <label class="label">동행모집</label>
						
						<div class="inline-group">
							<label class="radio"><input type="radio"
								name="gender" value="M" ><i class="rounded-x"></i>남</label> 
								<label class="radio"><input type="radio" name="gender"  value="F" >
								<i class="rounded-x"></i>여</label> <label class="radio">
								<input type="radio" name="gender" value="N" ><i class="rounded-x"></i>상관없음</label>

						</div>
						
						
						</section>
						<div class="row">
							
							<section class="col col-5">
								<label class="label">출발일</label>
	                            <label class="input">
		                            <i class="icon-append fa fa-calendar"></i>
		                           <input type="text" name="date" id="start" placeholder="date" >
		                            
	                            </label>
                            </section>
	
							<section class="col col-ss-3 col-3"> 
								<label class="label2">여행기간</label>
								<br/>                       
                                <input class="input1" type="text"  size="1px" name="day" value=0>일
							</section>
                                                
                            <section class="col col-ss-3 col-4">
								<label class="label2">모집인원</label>
								<br/>                    
                                <input class="input1" type="text"  size="1px" name="p" value=0>명
                            </section>
						</div>
						
					</fieldset>
					
					<fieldset>
						<div class="row">

							<section class="col col-5"> <label class="toggle">
							<input type="checkbox" name="plan_public" value="off">
							<i class="rounded-4x"></i>비공개</label> </section>

							<section class="col col-5"> <label class="toggle">
							<input type="checkbox" name="plan_save"  value="on" checked>
								<i class="rounded-4x"></i>임시저장</label> </section>
						</div>
				</div>
				
				</div>
			
			
			
			<br /><br/>
				<div class="col-md-12">
						<h3>일정</h3>
						<br>
						<!--=== 자세히보기===-->
						<div class="row tab-v3">
							<div class="col-sm-2">
								<ul class="nav nav-pills nav-stacked">
									<li class="active"><a href="#home-2" data-toggle="tab"><i
											class="fa fa-calendar"></i> Day1</a></li>
									<li><a href="#profile-2" data-toggle="tab"><i
											class="fa fa-calendar"></i> Day+</a></li>

								</ul>
							</div>

									<h4>DAY1</h4>
									</center>
									<!-- 타임라인 -->
						<div class="col-md-5">
							<ul class="timeline-v2">
								<li><time class="cbp_tmtime" datetime=""> <br></br><span>4/1/08</span>
									<span>January</span></time> <i class="cbp_tmicon rounded-x hidden-xs"></i>


									<div class="cbp_tmlabel">
										<h2>Our first step</h2>
										<div class="row">
											<div class="col-md-4">
												<img class="img-responsive" src="assets/img/1.jpg" alt="">
												<div class="md-margin-bottom-20"></div>
											</div>


											<div class="col-md-8">
												<p>Winter purslane courgette pumpkin quandong komatsuna
													fennel green bean cucumber watercress. Pea sprouts wattle
													seed rutabaga okra yarrow cress avocado grape.</p>
												<p>Cabbage lentil cucumber chickpea sorrel gram garbanzo
													plantain lotus root bok choy squash cress potato.</p>

											</div>

										</div>
									</div>
								</li>
							</ul>
						</div>
						

			<!-- General Unify Forms -->
							<div class="col-md-5">	
									<div id="map" style="width: 100%; height: 400px;"></div>
									<script type="text/javascript"
										src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b584c100fe1ae5b627bb263ca582ac0"></script>
									<script>
															var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
															    mapOption = { 
															        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
															        level: 3 // 지도의 확대 레벨
															    };
															
															var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
															 
															// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
															var points = [
															    new kakao.maps.LatLng(33.452278, 126.567803),
															    new kakao.maps.LatLng(33.452671, 126.574792),
															    new kakao.maps.LatLng(33.451744, 126.572441)
															];
															
															// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
															var bounds = new kakao.maps.LatLngBounds();    
															
															var i, marker;
															for (i = 0; i < points.length; i++) {
															    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
															    marker =     new kakao.maps.Marker({ position : points[i] });
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
								</div>
						</div>
						
					</fieldset>
			
	
		</br>

		</div>
		
		<!-- End Content -->
	</div>
	<!--/container-->
	<div class="content text-center">
		<button class="btn-u" type="submit">완료</button>
		<button class="btn-u btn-u-default" onclick="history.back();">취소</button>
	</div>
	</form>
	
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
    
    function test(){
    	 
        $(document).ready(function() {
            $("input[name='theme'][value='${article.plan_theme}']").attr("checked", true);
             $("input[name='gender'][value='${article.plan_gender}']").attr("checked", true);

         
        });
    }
</script>
<c:forEach var="tag" items="${tags}">
		<script>
        $(document).ready(function() {
    		console.log('${tag }');
    		$("input[name=tags][value=${tag}]").attr("checked", true);

        });
	</script>
	</c:forEach>
				<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->
</body>
</html>