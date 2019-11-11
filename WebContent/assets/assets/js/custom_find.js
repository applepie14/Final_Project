/* Write here your custom javascript codes */

function findCheck(){
	if($("#company_title").val() == ""){
		alert('제목을 입력하세요');
		$("#company_title").focus()
		return false;
	}
	if($("#start").val() == ""){
		alert('여행 시작일을 입력하세요');
		$("#start").focus()
		return false;
	}
	if($("#finish").val() == ""){
		alert('여행 종료일을 입력하세요');
		$("#finish").focus()
		return false;
	}
	if($("#theme input:radio:checked").length == 0){
		alert('테마를 선택하세요');
		return false;
	}
	if($("input:checkbox:checked").length == 0){
		alert('태그를 하나 이상 선택하세요');
		return false;
	}

	if($("#gender input:radio:checked").length == 0){
		alert('성별을 선택하세요');
		return false;
	}
	if($("#company_content").val() == ""){
		alert('여행 내용을 입력해주세요');
		$("#company_content").focus()
		return false;
	}
	$('.sky-form').submit();
}