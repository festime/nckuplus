pageUpdater = 
  timeFormatInJson: {}
    
  update: (url = window.location.pathname) ->
    $.ajax
      url: url
      dataType: 'json'
      cache: false
      data: {}
      success: (dataJson) ->
        pageUpdater.timeFormatInJson = dataJson['time']

    setTimeout (->
      try
        for domId of pageUpdater.timeFormatInJson
          createdAt = pageUpdater.timeFormatInJson[domId]
          $("#" + domId).html(moment(createdAt).fromNow())
      catch e
        console.log(e)
      return
    ), 300

module.exports = pageUpdater

