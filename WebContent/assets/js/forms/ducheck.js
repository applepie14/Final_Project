function emailCheck() {
	var email = $('#user_email').val();
	var hidden = $('input[name=idDuplication]');
	if(email != ''){
		$.ajax({
			url : 'emailcheck.do?user_email=' + email,
			type : 'get',
			contextType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				$('#email .error').html(data)
				if ($('#email .error span').attr('class') == 'text-green') {
					$('#emailbtn').html('사용')
					
					$('#user_email').keyup(function() {
						$('#emailbtn').html('중복확인')
					})
					$('#emailbtn').click(function() {
						if ($('#emailbtn').html() == '사용') {
							$('input[name=idDuplication]').val('idcheck')
							$('#user_email').attr('readonly', 'true')
							$('#emailbtn').remove()
							$('#user_email').blur(function() {
								$('#email .error').html('')
							})
						}
					})
				}else{
					$('#user_email').val('')
					return false;
				}
			}
		})
	}else{
		$('#email .error').text("이메일을 입력하세요")
		$("#user_email").focus();
		return false;
	}
}


function nickCheck() {
	var nickname = $('#user_nickname').val();
	var hidden = $('input[name=nickDuplication]');
	if(nickname != ''){
		$.ajax({
			url : 'nicknamecheck.do?user_nickname=' + nickname,
			type : 'get',
			contextType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(data) {
				$('#nickname .error').html(data)
				if ($('#nickname .error span').attr('class') == 'text-green') {
					$('#nickbtn').html('사용')
					
					$('#user_nickname').keyup(function() {
						$('#nickbtn').html('중복확인')
					})
					$('#nickbtn').click(function() {
						if ($('#nickbtn').html() == '사용') {
							$('input[name=nickDuplication]').val('idcheck')
							$('#user_nickname').attr('readonly', 'true')
							$('#nickbtn').remove()
							$('#user_nickname').blur(function() {
								$('#nickname .error').html('')
							})
						}
					})

				}else{
					$('#user_nickname').val('')
					return false;
				}
			}
		})		
	}else{
		$('#nickname .error').text("별명을 입력하세요")
		$("#user_nickname").focus();
		return false;
	}
}
