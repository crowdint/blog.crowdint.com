var enterKey = 13;

pages.archive.toggleOptions = function(){
  $('.js-toggle-archive-options').click(function(){
    $('.js-archive-options').toggle();
    $('.js-toggle-archive-options').toggleClass('active')
  });
};

pages.archive.loadPickadate = function(){
  $('.js-date-field').pickadate({
    format: 'yyyy-mm-dd',
    formatSubmit: 'yyyy-mm-dd',
    hiddenName: true
  });
};

pages.archive.sendForm = function(){
  $('.js-archive-form').keyup(function(event){
    if (event.keyCode === enterKey) {
      $(this).submit();
    }
  });
};

pages.archive.selectOption = function(){
  $('.js-select-search').change(function(){
    $('.js-archive-form').submit();
  });
};
