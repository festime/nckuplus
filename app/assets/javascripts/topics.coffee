# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

changeTimeFormatOfPost = (id, index, arrayOfId) ->
  target = $('#topic-' + id)
  target.html moment(target.html()).fromNow()
  return

$(document).on 'page:change', ->
  $.ajax
    url: '/topics'
    dataType: 'json'
    data: {}
    success: (timeFormatInJson) ->
      #data.toString().split(',').forEach changeTimeFormatOfPost
      for topicId of timeFormatInJson
        $("#" + topicId).html(moment(timeFormatInJson[topicId]).fromNow())
      return
  return

