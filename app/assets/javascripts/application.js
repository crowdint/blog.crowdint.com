// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require social-likes.min
//= require jquery.stellar
//= require highlight.pack
//= require mixpanel
//= require pages
//= require mobile-menu
//= require categories
//= require error
//= require search
//= require archive

$(document).ready(function() {
  pages.menu.toggleMobileMenu();
  pages.categories.mobileCategories();
  pages.error.glassMovement();
  pages.search.showForm();
  pages.search.hideForm();
  pages.archive.toggleOptions();

  offset = $('#header').height();

  if(!/^((?!chrome).)*safari/i.test(navigator.userAgent)) {
    $.stellar({
       verticalOffset: offset
    });
  }

  $('#footer').on('transitionend webkitTransitionEnd otransitionend MSTransitionEnd', function () {
    $('body').removeClass('is-animating').toggleClass('is-menu-visible');
    $('#header, #container, #footer').removeClass('is-moved-to-left is-moved-to-right');
  });
});

