var tabletSize = 1024;
var escapeKey = 27;

pages.search.showForm = function(){
  if ($(document).width() < tabletSize) {
    $('.js-toggle-search').click(function(){
      $('.js-search').css({ 'display': 'block', 'margin-top': '-75px' });
    });
  }
};

pages.search.hideForm = function(){
  if ($(document).width() < tabletSize) {
    $('body').keyup(function(event){
      if (event.keyCode === escapeKey){
        $('.js-search').css({ 'display': 'none', 'margin-top': '0' });
      }
    });
  }
}
