pages.search.showForm = function(){
  $('.js-toggle-search').click(function(){
    $('.js-search').css({ 'display': 'block', 'margin-top': '-75px' });
  });
};

pages.search.hideForm = function(){
  $('body').keyup(function(event){
    if (event.keyCode === 27){
      $('.js-search').css({ 'display': 'none', 'margin-top': '0' });
    }
  });
}
