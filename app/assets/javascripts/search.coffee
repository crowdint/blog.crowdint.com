$ ->
  $('#search_form').submit (e)->
    e.preventDefault()
    search_query = $('#q').val()
    window.location = "/search/#{search_query}"
