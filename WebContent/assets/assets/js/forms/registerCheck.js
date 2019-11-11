/*
#name #user_name .note.error
#email #user_email .note.error
#pw #user_password .note.error
#pw-confirm #pwdConfirm .note.error
#gender #user_gender .note.error
#birth #date .note.error
#nickname #user_nickname .note.error
#phone #user_phone .note.error
#intro #user_intro .note.error

#terms
#subscription
*/

function registerCheck(){
	var error = $('.error').text('');
	
	if($("#user_name").val() == ""){
		$('#name .error').text("이름을 입력하세요")
		$("#user_name").focus();
		return false;
	}
	if($("#user_email").val() == "") {
		$('#email .error').text("이메일을 입력하세요")
		$("#user_email").focus();
		return false;
	}
	if($("#user_password").val() == "") {
		$('#pw .error').text("비밀번호를 입력하세요")
		$("#user_password").focus();
		return false;
	}

	var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; // 표현식
	if (!regex.test($("#user_password").val())) { // test 메소드 : 특정한 필드에 입력한 값에
													// 대한 유효성을 검사
		$('#pw .error').text("비밀번호는 문자, 숫자, 특수문자 포함 8자리 이상입니다.");
		$("#user_password").focus();
		return false;
	}
	
	if($("#user_password").val() != $("#pwdConfirm").val()) {
		$('#pw-confirm .error').text("비밀번호가 일치하지 않습니다")
		$("#pwdConfirm").focus();
		return false;
	}
	
	if($("#user_gender").val() == "N") {
		$('#gender .error').text("성별을 선택하세요")
		$("#user_gender").focus();
		if($("#user_gender").val() == 'M' || $("#user_gender").val() == 'F'){
			$('#gender .error').text("")
		}
		return false;
	}

	if($("#date").val() == "") {
		$('#birth .error').text("생년월일을 입력하세요")
		$("#date").focus();
		if($('.ui-datepicker-calendar a').click(function(){
			$('#birth .error').text("")
		}))
		return false;
	}
	if($("#user_nickname").val() == "") {
		$('#nickname .error').text("별명을 입력하세요")
		$("#user_nickname").focus();
		return false;
	}
	if($("#user_phone").val() == "") {
		$('#phone .error').text("전화번호를 입력하세요")
		$("#user_phone").focus();
		return false;
	}
	if($("#user_intro").val() == "") {
		$('#intro .error').text("자기소개를 입력하세요")
		$("#user_intro").focus();
		return false;
	}
	if($('input[name=idDuplication]').val() != 'idcheck'){
		$('#email .error').text("이메일 중복검사를 하세요")
		$("#user_email").focus();
		return false;
	}
	if($('input[name=nickDuplication]').val() != 'idcheck'){
		$('#nickname .error').text("별명 중복검사를 하세요")
		$("#user_nickname").focus();
		return false;
	}
	//$("input:checkbox[id='ID']").is(":checked") == true : false  /* by ID */

	if($("input:checkbox[id='terms']").is(":checked") == false){
		$('#one').attr('aria-expanded', 'true')
		$('#collapse-One').addClass('in');
		$('#collapse-One').css('height', '300px');
		$("input:checkbox[id='terms']").focus()
		return false;
	}
	if($("input:checkbox[id='subscription']").is(":checked") == false){
		$('#two').attr('aria-expanded', 'true')
		$('#collapse-Two').addClass('in');
		$('#collapse-Two').css('height', '300px');
		$("input:checkbox[id='subscription']").focus()
		return false;
	}
	$('#sky-form').submit();
}