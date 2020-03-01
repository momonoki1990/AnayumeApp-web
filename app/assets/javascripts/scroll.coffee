$(window).on 'scroll', ->
  scrollHeight = $(document).height()
  scrollPosition = $(window).height() + $(window).scrollTop()
  if (scrollHeight - scrollPosition) / scrollHeight <= 0.05
    # スクロールの位置が下部5%の範囲に来た場合
    $('.jscroll').jscroll
      contentSelector: '.dreamposts, .show-follows'
      nextSelector: 'span.next:last a'
    return
  return