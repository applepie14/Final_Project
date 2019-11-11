<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>회원가입</title>
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
    <link rel="stylesheet" href="assets/css/custom_register.css" />
    
    
</head>

<body>    
<%@include file="../header.jsp" %>
<div class="wrapper page-option-v1">
		<div class="container reg">
			<form action="registerPro.do" method="post" id="sky-form" class="sky-form">
				<header>회원가입</header>

				<fieldset>
					
						<section id="name">
							<label class="label">이름</label>
							<label class="input">
								<i class="icon-append fa fa-user"></i>
								<input type="text" name="user_name" id="user_name" />
							</label>
                            <div class="note error"></div>
						</section>
						
						<section id="email">
							<label class="label">이메일</label>
                            <label for="user_email" class="input input-file">
								<i class="icon-append fa fa-envelope"></i>
								<input type="text" name="user_email" id="user_email" />
                                <div class="button" onclick="emailCheck()" id="emailbtn">중복확인</div>
								<input type = "hidden" name="idDuplication" value="idUncheck" />
                            </label>
                            <div class="note error"></div>
						</section>

						<section id="pw">
							<label class="label">비밀번호</label>
							<label class="input">
								<i class="icon-append fa fa-lock"></i>
								<input type="password"	name="user_password" id="user_password"/>
							</label>
                            <div class="note error"></div>
						</section>
						
						<section id="pw-confirm">
							<label class="label">비밀번호 확인</label>
							<label class="input">
								<i class="icon-append fa fa-lock"></i>
								<input type="password" name="pwdConfirm" id="pwdConfirm"  />
							</label>
                            <div class="note error"></div>
						</section>
						
						<section id="gender">
							<label class="label">성별</label>
							<label class="select">
								<select name="user_gender" id="user_gender">
									<option value="N" selected readonly>성별</option>
									<option value="F">여자</option>
									<option value="M">남자</option>
								</select>
								<i></i>
							</label>
                            <div class="note error"></div>
						</section>
						
						<section id="birth">						
							<label class="label">생년월일</label>
                            <label class="input">
                            <i class="icon-append fa fa-calendar"></i>
                            <input type="text" name="user_birth" id="date" />
                            </label>
                            <div class="note error"></div>
						</section>
					

						<section id="nickname">
							<label class="label">별명</label>
                            <label for="file" class="input input-file">
								<i class="icon-append fa fa-user"></i>
								<input type="text" name="user_nickname" id="user_nickname"/>
                                <div class="button" onclick="nickCheck();" id="nickbtn">중복확인</div>
								<input type = "hidden" name="nickDuplication" value="idUncheck" />
                            </label>
                            <div class="note error"></div>
						</section>
						
						<section id="phone">
							<label class="label">전화번호</label>
							<label class="input">
								<i class="icon-append fa fa-mobile"></i>
								<input type="text" name="user_phone" id="user_phone" />
							</label>
                            <div class="note error"></div>
						</section>
					
						<section id="intro">
							<label class="label">자기소개</label>
							<label class="textarea">
								<textarea name="user_intro" id="user_intro"></textarea>
							</label>
                            <div class="note error"></div>
						</section>
				</fieldset>

				<fieldset>

					<section>
						<div class="panel panel-default">
	                        <div class="panel-heading">
	                            <h4 class="panel-title">
	                                <a class="accordion-toggle" id="one"  data-toggle="collapse" data-parent="#accordion-1" href="#collapse-One">
	                                    그날, 우리의 제주 이용약관
	                                </a>
	                            </h4>
	                        </div>
	                        <div id="collapse-One" class="panel-collapse collapse">
	                            <div class="panel-body">
	                            여러분을 환영합니다.
								그날, 우리의 제주 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 그날, 우리의 제주의 이용과 관련하여 그날, 우리의 제주를 제공하는 그날, 우리의 제주 주식회사(이하 ‘그날, 우리의 제주’)와 이를 이용하는 그날, 우리의 제주 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 그날, 우리의 제주 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
								
								그날, 우리의 제주를 이용하시거나 그날, 우리의 제주 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
								
								다양한 그날, 우리의 제주를 즐겨보세요.
								그날, 우리의 제주는 www.naver.com을 비롯한 그날, 우리의 제주 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
								여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 그날, 우리의 제주를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 그날, 우리의 제주 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.
								
								그날, 우리의 제주는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
								
								그날, 우리의 제주에는 기본적으로 본 약관이 적용됩니다만 그날, 우리의 제주가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 그날, 우리의 제주페이, V LIVE 등)가 있습니다. 그리고 그날, 우리의 제주 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.
								
								회원으로 가입하시면 그날, 우리의 제주를 보다 편리하게 이용할 수 있습니다.
								여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 그날, 우리의 제주는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 그날, 우리의 제주 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 그날, 우리의 제주에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 그날, 우리의 제주를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 그날, 우리의 제주 회원가입 방법 등에서 확인해 주세요.
	                            
	                            
								<label class="checkbox terms">
									<input type="checkbox" id="terms" />
									<i></i><span>위 약관을 읽고 동의하였습니다.</span>
								</label>
	                            </div>
	                        </div>
                  		</div>
						
						
						<div class="panel panel-default">
	                        <div class="panel-heading">
	                            <h4 class="panel-title">
	                                <a class="accordion-toggle" id="two" data-toggle="collapse" data-parent="#accordion-2" href="#collapse-Two">
	                                    개인정보 수집 및 이용에 대한 안내
	                                </a>
	                            </h4>
	                        </div>
	                        <div id="collapse-Two" class="panel-collapse collapse">
	                            <div class="panel-body">
	                            정보통신망법 규정에 따라 그날, 우리의 제주에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

								1. 수집하는 개인정보
								이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 그날, 우리의 제주 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 그날, 우리의 제주는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
								
								회원가입 시점에 그날, 우리의 제주가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
								- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
								- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
								서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
								NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
								
								2. 수집한 개인정보의 이용
								그날, 우리의 제주 및 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
	                            
	                            
	                            
								<label class="checkbox">
									<input type="checkbox" id="subscription" />
									<i></i><span>개인정보 수집 및 이용에 대한 안내에 동의하였습니다.</span>
								</label>
	                            </div>
	                        </div>
                  		</div>
					</section>
				</fieldset> <!-- 약관 확인 fieldset End -->
				
				<footer class="text-center">
				<button type="button" class="btn-u" onclick="registerCheck()">회원가입</button>
				</footer>
			</form>

		</div>
	</div><!--/wrapper-->
<%@include file="../footer.jsp" %>
   
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
<script type="text/javascript" src="assets/js/forms/registerCheck.js"></script>
<script type="text/javascript" src="assets/js/forms/ducheck.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        Masking.initMasking();
        Datepicker.initDatepicker();
        Validation.initValidation();
        
    	$('#sky-form input, textarea').keyup(function(){
    		var error = $(this).parent().parent().children('.error')
    		error.text('');
    	})
    	
    	$('#user_email').keyup(function(){
        	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	    if (regExp.test($("#user_email").val())){ 
    	    	return true;
    	    } else {
    	    	$('#email .error').text("이메일 형식에 맞지 않습니다");
    			$("#user_email").focus();
    			return false;
    	    }
    	})

		$("#user_password").keyup(function(){
    		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 표현식
    		var regex2 = /[!@#$%^&+=]/; 
    		if (!regex.test($("#user_password").val())) { // test 메소드 : 특정한 필드에 입력한 값에
    														// 대한 유효성을 검사
    			$('#pw .error').text("비밀번호는 문자, 숫자, 특수문자 포함 8자리 이상입니다.");
    			$("#user_password").focus();
    			return false;
    		}
    	})
    	
    	$("#pwdConfirm").keyup(function(){
        	if($("#user_password").val() != $("#pwdConfirm").val()){
        		$('#pw-confirm .error').text("비밀번호가 일치하지 않습니다.")
    			return false;
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