pages.categories.mobileCategories = function(){
  $('.js-categories-select').on('change', function(){
    var category = $(this).find('option:selected').text().toLowerCase();
    var url = '/categories/' +
      $(this).val() + '-' +
      category.split(' ').join('-');
    if (url) {
      window.location.replace(url);
    }
    return false;
  });
};
