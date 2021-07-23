//
//$(function(){
//	// 오버레이 & 버튼 클릭시 사이드바 제거
//	$('#overlay').on('click', closeOverlay);
//	$('.btn-close_sidebar').on('click', closeOverlay);
//});
//
//// 사이드바&팝업 클로즈
//function closeSidebar(e){
//	if($('.sidebar').hasClass('active')){
//        $('.sidebar').removeClass('active');
//		$('.sidebar').removeClass('active');
//		$('#overlay').removeClass('full');
//    }
//}

$.fn.serializeObject = function(){
    var obj = {};

    $.each( this.serializeArray(), function(i,o){
        var n = o.name,
        v = o.value;

        obj[n] = obj[n] === undefined ? v
            : $.isArray( obj[n] ) ? obj[n].concat( v )
            : [ obj[n], v ];
    });

    return obj;
};


