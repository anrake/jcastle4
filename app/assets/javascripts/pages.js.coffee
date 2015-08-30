# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#page_castle_lookup').autocomplete
    source: $('#page_castle_lookup').data('autocomplete-source')