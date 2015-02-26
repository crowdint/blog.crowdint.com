pages.archive.toggleOptions = function(){
  $('.js-toggle-archive-options').click(function(){
    $('.js-archive-options').toggle();
    $('.js-toggle-archive-options').toggleClass('active')
  });
}
