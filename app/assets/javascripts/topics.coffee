# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.FormatTime =
  update: ->
    $.ajax
      url: '/topics'
      dataType: 'json'
      data: {}
      success: (timeFormatInJson) ->
        for topicId of timeFormatInJson
          $("#" + topicId).html(moment(timeFormatInJson[topicId]).fromNow())
        return
    return

