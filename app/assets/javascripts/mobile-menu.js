pages.menu.toggleMobileMenu = function() {
  $('#header').on('click', '.header-mobile-menu', function() {
    if ($('body').hasClass('is-menu-visible')) {
      $('#header, #container, #footer').addClass('is-moved-to-right');
      $('body').addClass('is-animating');
    } else {
      $('#header, #container, #footer').addClass('is-moved-to-left');
      $('body').addClass('is-animating');
    }
  });
};

pages.menu.swipeHideMenu = function() {
  $('body').swipe({
    swipeRight: function(event, direction, distance, duration, fingerCount){
      if ($('body').hasClass('is-menu-visible')) {
        $('#header, #container, #footer').addClass('is-moved-to-right');
        $('body').addClass('is-animating');
      }
    }
  });
}

pages.menu.init = function(){
  pages.menu.toggleMobileMenu();
  pages.menu.swipeHideMenu();
}
