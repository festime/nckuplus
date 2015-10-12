App.Topics =
  indexTimeFormatUpdate: ->
    $.ajax
      url: '/topics'
      dataType: 'json'
      data: {}
      success: (timeFormatInJson) ->
        for topicId of timeFormatInJson
          topicCreatedAt = timeFormatInJson[topicId]
          currentTime = moment()

          $("#" + topicId).html(moment(topicCreatedAt).fromNow())
        return
    return

  showTimeFormatUpdate: ->
    $.ajax
      url: window.location.pathname
      dataType: 'json'
      data: {}
      success: (timeFormatInJson) ->
        for topicId of timeFormatInJson
          $("#" + topicId).html(moment(timeFormatInJson[topicId]).fromNow())
        return
    return

