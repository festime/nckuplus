App.updateTimeFormat = (url = window.location.pathname) ->
  $.ajax
    url: url
    dataType: 'json'
    data: {}
    success: (timeFormatInJson) ->
      for domId of timeFormatInJson
        createdAt = timeFormatInJson[domId]

        $("#" + domId).html(moment(createdAt).fromNow())
      return
  return

