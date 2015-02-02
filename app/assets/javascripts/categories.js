pages.categories.mobileCategories = function(){
  $('.categories-select').on('change', function(){
    var url = '/categories/' + $(this).val();
    if (url) {
      window.location.replace(url);
    }
    return false;
  });
};
