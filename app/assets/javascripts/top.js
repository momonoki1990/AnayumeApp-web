$(function() {
	setTimeout(function(){
		$('.start p').fadeIn(800);
	},200);
	setTimeout(function(){
		$('.start').fadeOut(400);
	}, 1500);
	
	//初回アクセス時(セッション毎)のみ表示
    if(sessionStorage.getItem('key')){
        $('#first').css({display:'none'});
    }
    add_access = $('body').addClass('access')
    window.sessionStorage.setItem('key', add_access);
});