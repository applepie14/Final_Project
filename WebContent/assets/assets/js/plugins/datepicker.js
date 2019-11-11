var Datepicker = function () {

    return {
        
        //Datepickers
        initDatepicker: function () {
	        // Regular datepicker
	        $('#date').datepicker({
	            dateFormat: 'yymmdd',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            showMonthAfterYear:true,
	            yearRange: "-100:+0",
	        	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	            changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	            showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
	        	currentText: '오늘', // 오늘 날짜로 이동하는 버튼 패널
	        	closeText: '닫기',  // 닫기 버튼 패널
	        	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
	        });
	        
	        // Date range
	        $('#start').datepicker({
	            dateFormat: 'yy-mm-dd',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            showMonthAfterYear:true,
	            yearRange: "-10:+20",
	        	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	            changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	            showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
	        	currentText: '오늘', // 오늘 날짜로 이동하는 버튼 패널
	        	closeText: '닫기',  // 닫기 버튼 패널
	        	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
	            onSelect: function( selectedDate )
	            {
	                $('#finish').datepicker('option', 'minDate', selectedDate);
	            }
	        });
	        $('#finish').datepicker({
	            dateFormat: 'yy-mm-dd',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            showMonthAfterYear:true,
	            yearRange: "-0:+20",
	        	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
	            changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	            showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
	        	currentText: '오늘', // 오늘 날짜로 이동하는 버튼 패널
	        	closeText: '닫기',  // 닫기 버튼 패널
	        	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	            onSelect: function( selectedDate )
	            {
	                $('#start').datepicker('option', 'maxDate', selectedDate);
	            }
	        });
	        
	        // Inline datepicker
	        $('#inline').datepicker({
	            dateFormat: 'yy-mm-dd',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>'
	        });
	        
	        // Inline date range
	        $('#inline-start').datepicker({
	            dateFormat: 'yy-mm-dd',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            onSelect: function( selectedDate )
	            {
	                $('#inline-finish').datepicker('option', 'minDate', selectedDate);
	            }
	        });
	        $('#inline-finish').datepicker({
	            dateFormat: 'yy-mm-dd',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            onSelect: function( selectedDate )
	            {
	                $('#inline-start').datepicker('option', 'maxDate', selectedDate);
	            }
	        });
        }

    };
}();