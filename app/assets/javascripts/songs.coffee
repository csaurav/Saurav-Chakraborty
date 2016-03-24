# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).bind 'page:change', ->
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    $("tr[id="+ data.id+"]").remove();
