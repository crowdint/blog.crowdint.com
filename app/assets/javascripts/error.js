pages.error.glassMovement = function(){
  if ($('body').width() > 880) {
    $('.error-img').parallax({
      yparallax: '25px',
      xparallax: '25px',
      xorigin: 0,
      yorigin: 0.9
    });
  }
  $(window).on('resize', function(){
    if ($('body').width() > 880) {
      $('.error-img').parallax({
        yparallax: '25px',
        xparallax: '25px',
        xorigin: 0,
        yorigin: 0.9 });
    } else {
      $('.error-img').parallax({ yparallax: false, xparallax: false, });
      $('.error-img').css({ 'left': '50%', 'marginLeft': '-125px' })
    }
  });
};
