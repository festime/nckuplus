pageUpdater = 
  updateTimeFormat: (obj) ->
    obj.html(moment(obj.html().trim()).fromNow())

module.exports = pageUpdater

