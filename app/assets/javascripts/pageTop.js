$(function() {
    var pagetop = $('#page_top');   
    pagetop.hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {  //100pxスクロールしたら表示
            pagetop.fadeIn();
        } else {
            pagetop.fadeOut();
        }
    });
    pagetop.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500); //0.5秒かけてトップへ移動
        return false;
    });

    //初回アクセス時(セッション毎)のみ表示
    if(sessionStorage.getItem('key')){
        $('#first').css({display:'none'});
    }
    add_access = $('body').addClass('access')
    window.sessionStorage.setItem('key', add_access);
});