var Masking = function () {

    return {
        
        //Masking
        initMasking: function () {
	        $("#date1").mask('99/99/9999', {placeholder:'X'});
	        $("#user_phone").mask('999-9999-9999', {placeholder:'X'});
	        $("#card").mask('9999-9999-9999-9999', {placeholder:'X'});
	        $("#serial").mask('***-***-***-***-***-***', {placeholder:'_'});
	        $("#tax").mask('99-9999999', {placeholder:'X'});
        }

    };
    
}();