var tabletSize = 1024;
var escapeKey = 27;
var enterKey = 13;

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
};

pages.search.toggleOptions = function(){
  $('.js-toggle-archive-options').click(function(){
    $('.js-archive-options').toggle();
    $('.js-toggle-archive-options').toggleClass('change-bg-img')
  });
};

pages.search.loadPickadate = function(){
  $('.js-date-field').pickadate({
    format: 'yyyy-mm-dd',
    formatSubmit: 'yyyy-mm-dd',
    hiddenName: true,

    onClose: function(){
      $('.js-archive-form').submit();
    }
  });
};

pages.search.sendForm = function(){
  $('.js-archive-form').keyup(function(event){
    if (event.keyCode === enterKey) {
      $(this).submit();
    }
  });
};

pages.search.selectOption = function(){
  $('.js-select-search').change(function(){
    $('.js-archive-form').submit();
  });
};

pages.search.init = function(){
  pages.search.showForm();
  pages.search.hideForm();
  pages.search.toggleOptions();
  pages.search.loadPickadate();
  pages.search.sendForm();
  pages.search.selectOption();
};
