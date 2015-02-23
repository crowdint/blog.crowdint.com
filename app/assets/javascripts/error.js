pages.error.glassMovement = function(){
  if ($('body').width() > 880){
    $(document).mousemove(function(e){
      $('.error-img').css({
        'marginLeft': e.pageX/15 - 20,
        'marginTop': e.pageY/15 - 30
      });
    });
  }
};
